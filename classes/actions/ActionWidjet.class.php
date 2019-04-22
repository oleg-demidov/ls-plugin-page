<?php
/*
 * LiveStreet CMS
 * Copyright © 2013 OOO "ЛС-СОФТ"
 *
 * ------------------------------------------------------
 *
 * Official site: www.livestreetcms.com
 * Contact e-mail: office@livestreetcms.com
 *
 * GNU General Public License, version 2:
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 *
 * ------------------------------------------------------
 *
 * @link http://www.livestreetcms.com
 * @copyright 2013 OOO "ЛС-СОФТ"
 * @author Oleg Demidov 
 *
 */

/**
 * Экшен обработки ajax запросов
 * Ответ отдает в JSON фомате
 *
 * @package actions
 * @since 1.0
 */
class PluginWidjet_ActionWidjet extends ActionPlugin{
    
    protected $oUserProfile = null;

    public function Init()
    {
        $this->oUserProfile = $this->User_GetUserByLogin(Router::GetActionEvent());
    }
    protected function RegisterEvent() {  
        
        $this->SetDefaultEvent('show');
        $this->AddEventPreg('/^show$/i','EventShow');
        $this->AddEventPreg('/^[\w_-]+$/i', '/^settings$/i', '/^[\d]*$/i', ['EventSettings', 'widjet_settings']);
        $this->AddEventPreg('/^[\w_-]+$/i', '/^add$/i', ['EventAdd', 'widjet_add']);
        $this->AddEventPreg('/^error_domain$/i', 'EventError');
        $this->AddEventPreg('/^remove-site$/i',  '/^[\d]*$/i', 'EventRemove');
    }
    
    public function EventError() {
        $this->SetTemplateAction(false);
        
    }
    
    public function EventShow() {
        $this->Component_RemoveAll();
        $this->Component_Add('widjet:widjet');   
        Config::Set('head.template', ['css' => [], 'js' => []]);
        $this->Viewer_SetHtmlHeadFiles($this->Asset_BuildHeadItems());
        
        
        if(!$oToken = $this->PluginWidjet_Widjet_GetTokenByToken(getRequest('token'))){
            return false;
        }
               
        $aParams = [];    
        foreach ($_REQUEST as $key => $sParam) {
            if(in_array($key, Config::Get('plugin.widjet.widjet.allow_params')) ){
                $aParams[$key] = $sParam;
            }
        }
        
        $aParams['domain'] = $oToken->getDomain();
        $aParams['domain_root'] = parse_url(Config::Get('path.root.web'), PHP_URL_HOST);
        
        if(!isset($aParams['url'])){
            $aParams['url'] = $oToken->getUser()->getProfileUrl();
        }
        
        $this->SetTemplateAction('widjet');
        $this->Viewer_Assign('aWidjetParams', $aParams);
        $this->Viewer_Assign('oUser', $oToken->getUser());
    }
    
    public function EventSettings() {
        if(!$this->oUserProfile ){
            return $this->EventNotFound();
        }
        
        $this->Viewer_AppendScript(Plugin::GetTemplatePath('widjet'). '/assets/js/init.js');
        
        $aTokens = $this->PluginWidjet_Widjet_GetTokenItemsByUserId($this->oUserProfile->getId());
        
        if(!$oTokenActive = $this->PluginWidjet_Widjet_GetTokenById($this->GetParam(1)) and $aTokens){
            $oTokenActive = $aTokens[0];
        }
        
        if(!$oTokenActive){
            Router::LocationAction(Config::Get('plugin.widjet.action'). '/'.$this->oUserProfile->getLogin().'/add');
        }
        
        $this->Menu_Get('settings')->setActiveItem('widjet');
        
        $aTemplates = $this->PluginWidjet_Widjet_GetTemplates();

        $this->Viewer_Assign('aTemplates', $aTemplates);
        $this->Viewer_Assign('aTokens', $aTokens);
        $this->Viewer_Assign('oTokenActive', $oTokenActive);
        $this->SetTemplateAction('settings');      
        
        
    }
    
    public function EventAdd() {
        if(!$this->oUserProfile){
            return $this->EventNotFound();
        }
        
        $oToken = Engine::GetEntity('PluginWidjet_Widjet_Token');
        
        if(isPost()){
            $oToken->_setData([
                'user_id' => $this->oUserProfile->getId(),
                'domain'  => getRequest('domain')
            ]);
            
            if($oToken->_Validate()){
                $oToken->Save();
                $this->Message_AddNotice($this->Lang_Get('common.success.save'), null, true);
                Router::LocationAction(Config::Get('plugin.widjet.action'). '/'.$this->oUserProfile->getLogin().'/settings');
            }else{
                $this->Message_AddError($oToken->_getValidateError());
            }
        }
        
        $aTokens = $this->PluginWidjet_Widjet_GetTokenItemsByUserId($this->oUserProfile->getId());
        
        $this->Menu_Get('settings')->setActiveItem('widjet');
        
        $this->Viewer_Assign('aTokens', $aTokens);
        $this->Viewer_Assign('oToken', $oToken);
        $this->SetTemplateAction('add');
    }
    
    public function EventRemove() {
        
        $this->Security_ValidateSendForm();
        
        if(!$this->oUserProfile = $this->User_GetUserCurrent()){
            return $this->EventNotFound();
        }
        
        $oToken = $this->PluginWidjet_Widjet_GetTokenById($this->GetParam(0));
        
        if(!$oToken){
            $this->Message_AddError($this->Lang_Get('plugin.widjet.widjet.notices.token_not_found'), null, true);
        }else{
            if($oToken->Delete()){
                $this->Message_AddNotice($this->Lang_Get('common.success.remove'), null, true);
            }
        }
        
        Router::LocationAction(Config::Get('plugin.widjet.action'). '/' . $this->oUserProfile->getLogin(). '/settings');
        
        $this->SetTemplate(false);
    }
    
    
    public function EventShutdown() {
        $this->Viewer_Assign('oUserProfile', $this->oUserProfile);
    }
}
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
        $this->AddEventPreg('/^[\w_-]+$/i', '/^ajax-add$/i', 'EventAjaxAdd');
        $this->AddEventPreg('/^error_domain$/i', 'EventError');
    }
    
    public function EventError() {
        $this->SetTemplateAction(false);
        
    }
    
    public function EventShow() {
        $this->Component_RemoveAll();
        $this->Component_Add('widjet:widjet');   
        Config::Set('head.template', ['css' => [], 'js' => []]);
        $this->Viewer_SetHtmlHeadFiles($this->Asset_BuildHeadItems());
        $this->SetTemplateAction('widjet');
        
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
        
        $this->Viewer_Assign('aWidjetParams', $aParams);
    }
    
    public function EventSettings() {
        if(!$this->oUserProfile ){
            return $this->EventNotFound();
        }
        
        $aTokens = $this->PluginWidjet_Widjet_GetTokenItemsByUserId($this->oUserProfile->getId());
        
        if(!$oTokenActive = $this->PluginWidjet_Widjet_GetTokenById($this->GetParam(1)) and $aTokens){
            $oTokenActive = $aTokens[0];
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
                Router::LocationAction('widjet/'.$this->oUserProfile->getLogin().'/settings');
            }else{
                $this->Message_AddError($oToken->_getValidateError());
            }
        }
        
        $this->Menu_Get('settings')->setActiveItem('widjet');
        
        $this->Viewer_Assign('oToken', $oToken);
        $this->SetTemplateAction('add');
    }
    
    
    public function EventAjaxAdd() {
        if(!$this->oUserProfile ){
            return $this->EventNotFound();
        }
        
//        if(!$oKey = $this->PuginWidjet_Widjet_GetTokenByUserId($oUserProfile->getId())){
//            $oKey = Engine::GetEntity('PuginWidjet_Widjet_Token', [
//                'user_id' => $oUserProfile->getId(),
//                'token' => md5(Config::Get('plugin.widjet.key') . (new DateTime())->format('YmdHis') . $oUserProfile->getDateCreate())
//            ]);
//            $oKey->Save();
//        }
        
        $this->Menu_Get('settings')->setActiveItem('widjet');
        
        $this->Viewer_Assign('oKey', $oKey);
        $this->SetTemplateAction('add');
    }
    
    public function EventShutdown() {
        $this->Viewer_Assign('oUserProfile', $this->oUserProfile);
    }
}
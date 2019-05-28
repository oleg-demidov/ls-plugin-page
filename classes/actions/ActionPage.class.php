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
class PluginPage_ActionPage extends ActionPlugin{
    

    public function Init()
    {
    }
    protected function RegisterEvent() {  
        
        $this->AddEventPreg( '/^([\w_-]+)?$/i', ['EventShow', 'page']);
       
    }
    
    public function EventShow() {
        $oPage = $this->PluginPage_Page_GetPageByUrl($this->sCurrentEvent);
        
        if(!$oPage){
            return $this->EventNotFound();
        }
        
        $this->Viewer_SetHtmlKeywords($oPage->getKeywords());
        $this->Viewer_SetHtmlDescription($oPage->getDescription());
        $this->Viewer_SetHtmlTitle($oPage->getTitle());
        
        $this->Viewer_Assign('oPage', $oPage);
        $this->SetTemplateAction('page');
    }
    
    public function EventShutdown() {
    }
}
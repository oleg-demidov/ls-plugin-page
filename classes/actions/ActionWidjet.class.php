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
    
    public function Init()
    {
        
    }
    protected function RegisterEvent() {  
        
        $this->SetDefaultEvent('show');
        $this->AddEventPreg('/^show$/i','EventShow');
        $this->AddEventPreg('/^[\w_-]+$/i', '/^settings$/i', ['EventSettings', 'widjet_settings']);
    }
    
    public function EventShow() {
        
        $this->SetTemplateAction('widjet');
    }
    
    public function EventSettings() {
        
        $this->Menu_Get('settings')->setActiveItem('widjet');
        $this->SetTemplateAction('settings');
    }
}
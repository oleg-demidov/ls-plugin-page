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
        
        $this->AddEventPreg(
            '/^([\w_-]+)?$/i', 
            '/^([\w_-]+)?$/i', 
            '/^([\w_-]+)?$/i', 
            '/^([\w_-]+)?$/i', 
            '/^([\w_-]+)?$/i', 
            '/^([\w_-]+)?$/i', 
            '/^([\w_-]+)?$/i', 
            '/^([\w_-]+)?$/i', 
            'EventShow');
       
    }
    
    public function EventShow() {
        $this->SetTemplateAction('page');
    }
    
    public function EventShutdown() {
    }
}
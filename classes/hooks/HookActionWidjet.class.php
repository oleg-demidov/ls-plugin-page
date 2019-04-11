<?php

class PluginWidjet_HookActionWidjet extends Hook {
    
    /**
     * Регистрируем хуки
     */
    public function RegisterHook() {
        $this->AddHook('engine_init_complete', 'RemoveInitJs');
    }

    public function RemoveInitJs($aParams) { 
        
        if(Router::GetAction() != "widjet"){
            return;
        }
        
        
    }
}
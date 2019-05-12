<?php

class PluginPage_HookAction extends Hook {
    
    /**
     * Регистрируем хуки
     */
    public function RegisterHook() {
        $this->AddHook('start_action', 'ActionPage');
    }

    public function ActionPage($aParams) { 
        
        $sUrlRequest = '';
        if (Router::GetAction()) {
            $sUrlRequest .= Router::GetAction();
        }
        if (Router::GetActionEvent()) {
            $sUrlRequest .= '/' . Router::GetActionEvent();
        }
        if (Router::GetParams()) {
            $sUrlRequest .= '/' . join('/', Router::GetParams());
        }
                
        $funcMakePreg = function ($sUrl) {
            $sUrl = preg_quote(trim($sUrl, '/ '));
            return strtr($sUrl, Config::Get('plugin.page.url_preg'));
        };
        $aMaches=[];
        $sPreg = $funcMakePreg(Config::Get('plugin.page.url'));
        echo $sUrlRequest;
        if (preg_match('@^' . $sPreg . '$@iu', $sUrlRequest, $aMaches)) {
            Router::SetAction(Router::getInstance()->Rewrite('page'));
            Router::SetActionEvent(array_shift($aMaches));
            Router::SetParams($aMaches);
            
        }
        
        
    }
}
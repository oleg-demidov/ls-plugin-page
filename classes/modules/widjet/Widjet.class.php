<?php

class PluginWidjet_ModuleWidjet extends ModuleORM
{
    
    protected $aTemplates = [];

    public function Init() {
        parent::Init(); 
    }
    
    public function GetTemplate($sName) {
        if($sName == '' or $sName === null){
            return null;
        }
        
        if( !isset($this->aTemplates[$sName]) ){
            $this->aTemplates[$sName] = Engine::GetEntity('PluginWidjet_Widjet_Template');
        }
        
        return $this->aTemplates[$sName];
    }
    
    public function AddTemplate( $oWidjet) {
       
        if( !isset($this->aTemplates[$oWidjet->getName()]) ){
            $this->aTemplates[$oWidjet->getName()] = $oWidjet;
        }
        
        return $this;
    }
    
    public function GetTemplates() {
        return $this->aTemplates;
    }
}
<?php

class PluginWidjet_ModuleWidjet_EntityTemplate extends Entity
{
    
    public function getQueryParams() {
        return http_build_query($this->getParams());
    }
    
    public function getParams() {
        return parent::getParams()?parent::getParams():[];
    }
    public function getParam($sName) {
        return isset($this->getParams()[$sName])?$this->getParams()[$sName]:'';
    }
}
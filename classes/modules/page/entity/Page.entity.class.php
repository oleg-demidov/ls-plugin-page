<?php

class PluginPage_ModulePage_EntityPage extends EntityORM
{
    protected $aRelations = array(
        'content' => array(self::RELATION_TYPE_BELONGS_TO, 'PluginPage_ModulePage_EntityContent', 'content_id')
    );
    
    protected $aValidateRules = [
        ['title', 'string', 'min' => 10, 'max' => 200],
        ['text', 'string', 'min' => 100, 'max' => 5000],
        ['url', 'string', 'min' => 10, 'max' => 200]
    ];


    protected $aBehaviors = array(
        /**
         * Дополнительные поля
         */
        'category' => [
            'class' => 'ModuleCategory_BehaviorEntity',
            'target_type' => 'page'
        ]
    );
    
    public function beforeSave() {
        
        if(!$bResult = parent::beforeSave()){
            return $bResult;
        }
        
        $oContent = Engine::GetEntity('PluginPage_ModulePage_EntityContent');
        $oContent->setText($this->getText());
        
        $aData = [];
        if(is_string($this->getDescription())){
            $aData['description'] = $this->getDescription();
        }
        if(is_string($this->getKeywords())){
            $aData['keywords'] = $this->getKeywords();
        }
        $oContent->setData($aData);
        
        if($bResult = $oContent->Save()){
            $this->setContentId($oContent->getId());
        }
        
        return $bResult;
    }
    
    public function getContentOne($sKey) {
        if(!$this->getContent()){
            return null;
        }
        
        return $this->getContent()->_getDataOne($sKey);
    }
    
    public function getDescription() {
        if($mResult = $this->getContentOne('data')){
            if(!isset($mResult['description'])){
                return null;
            }
            return $mResult['description'];
        }
        return parent::getDescription();
    }
    
    public function getText() {
        if($mResult = $this->getContentOne('text')){
            return $mResult;
        }
        return parent::getText();
    }
    
    public function getKeywords() {
        if($mResult = $this->getContentOne('data')){
            if(!isset($mResult['keywords'])){
                return null;
            }
            return $mResult['keywords'];
        }
        return parent::getKeywords();
    }
}
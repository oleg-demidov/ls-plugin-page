<?php

class PluginPage_ModulePage_EntityPage extends EntityORM
{
    protected $aRelations = array(
        'content' => array(self::RELATION_TYPE_HAS_ONE, 'PluginPage_ModulePage_EntityContent', 'content_id')
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
            'target_type' => 'page',
            'label' => 'Категория:'
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
            $aData['descripton'] = $this->getDescription();
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
}
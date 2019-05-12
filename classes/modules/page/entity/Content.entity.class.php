<?php

class PluginPage_ModulePage_EntityContent extends EntityORM
{
    protected $aValidateRules = [
        [
            'text', 'string'
        ]
    ];
    
    protected $aRelations = array(
        'page' => array(self::RELATION_TYPE_BELONGS_TO, 'PluginPage_ModulePage_EntityPage', 'content_id')
    );
    
    
    
}
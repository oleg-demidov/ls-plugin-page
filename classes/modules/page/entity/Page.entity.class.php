<?php

class PluginPage_ModulePage_EntityPage extends EntityORM
{
    protected $aRelations = array(
        'content' => array(self::RELATION_TYPE_HAS_ONE, 'PluginPage_ModulePage_EntityContent', 'content_id')
    );
    
}
<?php

class PluginWidjet_ModuleWidjet_EntityToken extends EntityORM
{
    protected $aValidateRules = [
        [
            'domain', 
            'regexp', 
            'pattern' => '/[a-zA-Z0-9А-Яа-я]+\.[a-zA-Z0-9А-Яа-я]+/u', 
            'allowEmpty' => false,
            'label' => 'Домен'
        ],
        [
            'domain', 
            'token'
        ],
        [
            'user_id',
            'user_exists'
        ]
    ];
    
    protected $aRelations = array(
        'user' => array(self::RELATION_TYPE_BELONGS_TO, 'ModuleUser_EntityUser', 'user_id')
    );
    
    
    public function ValidateUserExists($sValue) {
        if((int)$sValue === 0 ){
            return true;
        }
        if(!$this->User_GetUserById($sValue)){
            return $this->Lang_Get('common.error.error').' user not found';
        }
        return true;
    }
    
    public function ValidateToken($sValue) {
        if($oToken = $this->PluginWidjet_Widjet_GetTokenByDomain($sValue)){
            return $this->Lang_Get('plugin.widjet.widjet.notices.error_validate_exists');
        }
        
        $this->setToken(md5(
            Config::Get('plugin.widjet.key') . 
            (new DateTime())->format('YmdHis') . 
            $this->getDomain())
        );
        return true;
    }
}
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
        $this->setToken(md5(
            Config::Get('plugin.widjet.key') . 
            (new DateTime())->format('YmdHis') . 
            $this->getDomain())
        );
        return true;
    }
}
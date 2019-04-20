<?php
/**
 * Таблица БД
 */
$config['$root$']['db']['table']['widjet_widjet_token'] = '___db.table.prefix___widjet_token';

$config['key'] = 'jdnlskvdrjng5iga8hwiv-q324hfg';
$config['list'] = [
    'widjet', 
    'vertical'
];
$config['widjet'] = [
    
    'allow_params' => [
        'showCumber',
        'showCount',
        'text',
        'textColor',
        'template',
        'starWidth'
    ]
];

/**
 * Роутинг
 */
$config['$root$']['router']['page']['widjet'] = 'PluginWidjet_ActionWidjet';

$config['$root$']['block']['settingsWidjet'] = array(
    'action' => array(
        'widjet' => [
            '{widjet_settings}', '{widjet_add}'
        ]
    ),
    'blocks' => array(
        'left' => array(
            'menuSettings'     => array('priority' => 100)
            
        )
    )
);

return $config;
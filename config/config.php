<?php
/**
 * Таблица БД
 */
$config['$root$']['db']['table']['widjet_widjet'] = '___db.table.prefix___widjet';
$config['$root$']['db']['table']['widjet_token'] = '___db.table.prefix___widjet_token';

/**
 * Роутинг
 */
$config['$root$']['router']['page']['widjet'] = 'PluginWidjet_ActionWidjet';

$config['$root$']['block']['settingsWidjet'] = array(
    'action' => array(
        'widjet' => [
            '{widjet_settings}'
        ]
    ),
    'blocks' => array(
        'left' => array(
            'menuSettings'     => array('priority' => 100)
            
        )
    )
);

return $config;
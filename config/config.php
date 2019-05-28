<?php
/**
 * Таблица БД
 */
$config['$root$']['db']['table']['page_page'] = '___db.table.prefix___page';
$config['$root$']['db']['table']['page_page_content'] = '___db.table.prefix___page_content';

$config['action'] = 'page';

$config['$root$']['router']['page'][$config['action']] = 'PluginPage_ActionPage';

return $config;
<?php
/**
 * Таблица БД
 */
$config['$root$']['db']['table']['page_page'] = '___db.table.prefix___page';
$config['$root$']['db']['table']['page_page_content'] = '___db.table.prefix___page_content';


$config['$root$']['router']['page']['page'] = 'PluginPage_ActionPage';

/**
 * Настройка ЧПУ URL 
 * Допустимы шаблоны:
 * %year% - год  (2010)
 * %month% - месяц (08)
 * %day% - день (24)
 * %hour% - час (17)
 * %minute% - минуты (06)
 * %second% - секунды (54)
 * %login% - логин автора топика (admin)
 * %id% - id  (325)
 * %url% - url  (325)
 * %title% - заголовок топика в транслите 
 *
 * В шаблоне обязательно должен быть %id% или %title%, это необходимо для точной идентификации топика
 */
$config['url'] = '%url%.html';
/**
 * Список регулярных выражений для частей URL топика
 * Без необходимых навыков лучше этот параметр не менять
 */
$config['url_preg'] = array(
    '%year%' => '(\d{4})',
    '%month%' => '(\d{2})',
    '%day%' => '(\d{2})',
    '%hour%' => '(\d{2})',
    '%minute%' => '(\d{2})',
    '%second%' => '(\d{2})',
    '%login%' => '([\w\-\_]+)',
    '%id%' => '(\d+)',
    '%title%' => '([\w\-\_]+)',
    '%url%' => '([\w\-\_]+)',
);

return $config;
<?php
/**
 * Таблица БД
 */
$config['$root$']['jevix']['page'] = [
    // Разрешённые теги
    'cfgAllowTags'          => array(
        // вызов метода с параметрами
        array(
            array(
                'p', 'br', 'span', 'div', 'a', 'img', 'b', 'i', 'u', 's', 'del', 
                'em', 'strong', 'sup', 'sub', 'hr', 'font', 'ul', 'ol', 'li', 'table', 
                'tbody', 'thead', 'tfoot', 'tr', 'td', 'th', 'h1', 'h2', 'h3', 'h4', 'h5', 
                'h6', 'pre', 'code', 'blockquote', 'video', 'audio', 'youtube', 'facebook', 
                'object', 'param', 'embed', 'iframe'
            ),
        ),
    ),
    // Коротие теги типа
    'cfgSetTagShort'        => array(
        array(
            array('br', 'img', 'hr', 'embed')
        ),
    ),
    

    // Разрешённые параметры тегов
    'cfgAllowTagParams'     => array(
        [
            'a', 
            array('href' => '#link', 'name' => '#text', 'target' => '#text', 'class' => '#text')
        ],
        [
            'img', 
            array('src', 'style' => '#text', 'alt' => '#text', 'title' => '#text', 'align' => array('right', 'left', 'center'), 'width' => '#int', 'height' => '#int', 'hspace' => '#int', 'vspace' => '#int', 'class' => '#text')
        ],
        [
            'span', 
            array('style' => '#text')
        ],
        [
            'object', 
            array('width' => '#int', 'height' => '#int', 'data' => array('#domain' => array('youtube.com', 'rutube.ru', 'vimeo.com', 'vk.com')), 'type' => '#text')
        ],
        [
            'param', 
            array('name' => '#text', 'value' => '#text')
        ],

        [
            'embed', 
            array('src' => array('#domain' => array('youtube.com', 'rutube.ru', 'vimeo.com', 'vk.com')), 'type' => '#text', 'allowscriptaccess' => '#text', 'allowfullscreen' => '#text', 'width' => '#int', 'height' => '#int', 'flashvars' => '#text', 'wmode' => '#text')
        ],
        [
            'iframe', 
            array('width' => '#int', 'height' => '#int', 'style' => '#text', 'frameborder' => '#int', 'allowfullscreen' => '#text', 'src' => array('#domain' => array('youtube.com', 'rutube.ru', 'vimeo.com', 'vk.com', 'my.mail.ru', 'facebook.com')))
        ],
        [
            'table', 
            array('width' => '#int', 'height' => '#int', 'cellpadding' => '#int', 'cellspacing' => '#int', 'border' => '#int', 'style' => '#text', 'align' => '#text', 'valign' => '#text')
        ],
        [
            'td', 
            array('width' => '#int', 'height' => '#int', 'style' => '#text', 'align' => '#text', 'valign' => '#text', 'colspan' => '#int', 'rowspan' => '#int')
        ],
        [
            'th', 
            array('width' => '#int', 'height' => '#int', 'style' => '#text', 'align' => '#text', 'valign' => '#text', 'colspan' => '#int', 'rowspan' => '#int')
        ]
    ),
    // Параметры подставляемые автоматически к тегам
    'cfgSetTagParamDefault'     => array(
        array(
            'a',
            'target',
            '_blank',
            true
        ),
        array(
            'a',
            'rel',
            'noreferrer noopener',
            true
        ),
    )
    
];

return $config;
<?php

return [
    'settings' => [
        'title' => 'Настройка виджета',
        'btn_add' => [
            'text' => 'Добавить виджет'
        ]
    ],
    'widjet' => [
        'menu_settings' => [
            'text' => 'Виджет'
        ],
        'add' => [
            'title' => 'Создать виджет',
            'form' => [
                'domain' => [
                    'label' => 'Домен вашего сайта:',
                    'placeholder' => 'site.ru'
                ]
            ]
        ],
        'notices' => [
            'error_validate_exists' => 'Вы уже подписаны на "%%event_name%%"',
            'add' => 'Вы подписались на "%%event_name%%"',
            'remove' => 'Вы отписались от "%%event_name%%"'
        ]
    ]
];
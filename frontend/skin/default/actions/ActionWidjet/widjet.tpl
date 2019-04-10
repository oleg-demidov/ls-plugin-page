{extends "../../layouts/layout.widjet.tpl"}

{block 'layout_body'}
    {component "widjet" template=$aWidjetParams['template'] params=$aWidjetParams}
{/block}
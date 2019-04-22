{extends "component@widjet:layout.layout"}

{block 'layout_body'}
    <a href="{$aWidjetParams['url']}" style="text-decoration: none;" target="_blank">
    {component "widjet" template=$aWidjetParams['template'] params=$aWidjetParams}
    </a>
{/block}
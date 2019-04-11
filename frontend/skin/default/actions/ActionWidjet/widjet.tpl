{extends "component@widjet:layout.layout"}

{block 'layout_body'}
    {component "widjet" template=$aWidjetParams['template'] params=$aWidjetParams}
{/block}
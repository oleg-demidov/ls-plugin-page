{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    <h1 class="page-header">
        {$oPage->getTitle()}
    </h1>
{/block}

{block 'layout_content'}
    {$oPage->getContentText()}
{/block}
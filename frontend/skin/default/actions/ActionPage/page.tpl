{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    <h1 class="page-header">
        {$oPage->getTitle()} 
        {if $oUserCurrent and $oUserCurrent->isAdmin()}
            {component "bs-button" 
                classes = "btn-edit d-inline"
                com     = "link"
                url     = $oPage->getUrlEdit()
                text    = {component "bs-icon" icon="edit"}
                popover = [content => $aLang.common.edit] }
        {/if}
    </h1> 
        
{/block}

{block 'layout_content'}
    {$oPage->getContentText()}
{/block}
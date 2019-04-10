{**
 * Тестовая страница
 *}
{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    <h2>
        {$aLang.plugin.widjet.settings.title}
    </h2>
{/block}

{block 'layout_content'}
    
    {$items = []}
    {foreach $aTokens as $oToken}
        {$items[] = [
            text => $oToken->getDomain(),
            name => $oToken->getId(),
            url => {router page="widjet/{$oUserProfile->getLogin()}/settings/{$oToken->getId()}"}
        ]}
    {/foreach}
    
    {component "bs-button"
        classes = ""
        text = $aLang.plugin.widjet.settings.btn_add.text
        bmods = "success"
        url  = {router page="widjet/{$oUserProfile->getLogin()}/add"}
    }
    
    {if $aTokens}
        {component "bs-nav"
            classes = "mt-3"
            activeItem = $oTokenActive->getId()
            items   = $items
            bmods   = "tabs"
        }
    {/if}

    {foreach Config::Get('plugin.widjet.widjet.list') as $item}
       {$item}
    {/foreach}


    
{/block}



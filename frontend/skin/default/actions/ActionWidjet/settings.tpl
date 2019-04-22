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
    {foreach $aTokens as $oToken name="tokens"}
        {$items[] = [
            text => $oToken->getDomain(),
            name => $oToken->getId(),
            url => {router page="widjet/{$oUserProfile->getLogin()}/settings/{$oToken->getId()}"}
        ]}
    {/foreach}
    
    {*
        Последний пункт табов добавить сайт
    *}
    {$items[] = [
        text => $aLang.plugin.widjet.settings.btn_add.text,
        name => 'form',
        active => {!$aTokens},
        url  => {router page="widjet/{$oUserProfile->getLogin()}/add"}
    ]}
    
    
    {if $aTokens}
        {component "bs-nav"
            classes = "mt-3"
            activeItem = $oTokenActive->getId()
            items   = $items
            bmods   = "tabs"
        }
    {/if}


    {$items = []}
    {foreach $aTemplates as $oTemplate name="templates"}

        {capture name="pane"}

            {capture name="val_code"}{strip}
                    <iframe  {cattr list=$oTemplate->getAttributes()}  src="{router page="widjet/?template={$oTemplate->getTemplate()}&token={$oTokenActive->getToken()}&{$oTemplate->getQueryParams()}"}" frameborder="0"></iframe>
            {/strip}{/capture}

            <div 
                {if $oTemplate->getParam('settingsBackground')}
                    style="background: {$oTemplate->getParam('settingsBackground')};" 
                {/if}
                class="js-container-widjet  d-flex justify-content-center p-3">
                {$smarty.capture.val_code}</div>

            {component "bs-form.textarea" 
                classes = "js-to-widjet"
                label = $aLang.plugin.widjet.settings.code.label
                value = $smarty.capture.val_code}

        {/capture}

        {if $smarty.foreach.templates.first}
            {$sActiveItem = $oTemplate->getName()}
        {/if}

        {$items[] = [
            text => $oTemplate->getTitle(),
            name => $oTemplate->getName(),
            content => $smarty.capture.pane
        ]}


    {/foreach}

    {*
        Форма удаления сайта
    *}
    {capture name="remove"}
        <div class="d-flex justify-content-center">
            {component "bs-button"
                classes = ""
                bmods   = "danger lg"
                text    = "{$aLang.common.remove} {$oTokenActive->getDomain()}"
                url     = {router page="widjet/remove-site/{$oTokenActive->getId()}?security_ls_key={$LIVESTREET_SECURITY_KEY}"}
            }
        </div>
    {/capture}

    {$items[] = [
        text => $aLang.common.remove,
        name => 'remove',
        content => $smarty.capture.remove
    ]}

    {if $aTemplates}
        <div class="d-flex">
            {component "bs-tabs"
                activeItem = $sActiveItem
                classes = "mt-3  flex-column"
                items   = $items
                bmods   = "pills"
                classesPanes = "p-3 js-show-widjet w-75"
            }
        </div>
    {/if}

    
{/block}



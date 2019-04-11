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

    {$items = []}
    {foreach $aTemplates as $oTemplate}
        {capture name="pane"}
            <iframe src="{router page="widjet/?template={$oTemplate->getTemplate()}&token={$oTokenActive->getToken()}"}" frameborder="0"></iframe><br>
            {component "bs-form.textarea" 
                label = $aLang.plugin.widjet.settings.code.label
                value = "&lt;iframe src=&quot;{router page="widjet/?template={$oTemplate->getTemplate()}"} 
frameborder=&quot;0&quot;&gt;&lt;/iframe&gt;"}
            
        {/capture}

        {$items[] = [
            text => $oTemplate->getTitle(),
            name => $oTemplate->getName(),
            content => $smarty.capture.pane
        ]}
    {/foreach}
    
    {if $aTemplates}
        <div class="d-flex">
            {component "bs-tabs"
                classes = "mt-3  flex-column"
                items   = $items
                bmods   = "pills"
                classesPanes = "p-3"
            }
        </div>
    {/if}

    
{/block}



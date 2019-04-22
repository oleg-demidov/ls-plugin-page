{**
 * Тестовая страница
 *}
{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    <h2>
        {$aLang.plugin.widjet.widjet.add.title}
    </h2>
{/block}

{block 'layout_content'}
  
    {*
        Отображения табов с доменами
    *}
    {$items = []}
    {foreach $aTokens as $oToken}
        
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
        active => true,
        url  => {router page="widjet/{$oUserProfile->getLogin()}/add"}
    ]}
    
    {component "bs-nav"
        classes = "mt-3"
        items   = $items
        bmods   = "tabs"
    }
    
    <form method="post" class="mt-3">
        {component "bs-form.text" 
            label = $aLang.plugin.widjet.widjet.add.form.domain.label
            placeholder = $aLang.plugin.widjet.widjet.add.form.domain.placeholder
            name = 'domain'
        }

        {component "bs-button"
            type = "sumbit"
            bmods = "primary"
            text = $aLang.common.save
        }
    </form>
    
{/block}



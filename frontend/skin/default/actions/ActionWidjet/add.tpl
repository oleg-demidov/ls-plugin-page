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
  
    <form method="post">
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



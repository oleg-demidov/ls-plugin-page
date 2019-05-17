<h3>Добавить/редактировать страницу</h3>


<form method="POST" action="{Router::GetPathWebCurrent() }"> 
    
    {component "bs-form.text"
        name = 'page[title]'
        label = "Заголовок:"
    }
    
    {component "bs-form.text" name = 'page[url]' label = 'Url:'}
    
    {capture name="meta"}
        {component "bs-form.textarea"
            name = 'page[description]'
            label = "Meta Description:"
        }
        {component "bs-form.textarea"
            name = 'page[keywords]'
            label = "Meta Keywords:"
        }
    {/capture}
    
    {component 'bs-collapse.accordion'
        classes = "mb-3"
        items=[
            
            [   
                text => 'SEO',
                content => $smarty.capture.meta
            ]
        ]}
        
    {component "tinymce" name="page[text]" label="Текст:"}
    
    {insert name='block' block='fieldCategory' params=[ 'target' => $oPage, 'label' => 'Катеория:', 'entity' => 'PluginPage_ModulePage_EntityPage' ]}
    
    {component "bs-button" type="submit" text=$aLang.common.save bmods="success"}
</form>

<h3>Добавить/редактировать страницу</h3>


<form action="{Router::GetPathWebCurrent() }"> 
    {component "bs-form.text"
        name = 'page[url]'
        label = "Url:"
    }
    {component "bs-form.text"
        name = 'page[title]'
        label = "Заголовок:"
    }
    
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
    
    {component "bs-collapse" text="Meta"  content=$smarty.capture.meta}
    
    {insert name='block' block='fieldCategory' params=[ 'target' => $oPage, 'entity' => 'PluginPage_ModulePage_EntityPage' ]}
    
    {component "bs-button" text=$aLang.common.save bmods="success"}
</form>

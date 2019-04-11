{**
 * Layout
 *
 * @param string $sHtmlTitle
 * @param string $sHtmlDescription
 * @param string $sHtmlKeywords
 * @param array  $aHtmlHeadFiles
 *}
<!doctype html>

{$component = 'layout'}
{component_define_params params=[ 'mods', 'classes', 'attributes' ]}

{block 'layout_options'}
    {$rtl = ( Config::Get('view.rtl') ) ? 'dir="rtl"' : ''}
    {$lang = Config::Get('lang.current')}
{/block}

<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="{$lang}" {$rtl}> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="{$lang}" {$rtl}> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="{$lang}" {$rtl}> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="{$lang}" {$rtl}> <!--<![endif]-->

<head prefix="og: https://ogp.me/ns# article: https://ogp.me/ns/article#">
    {block 'layout_head'}
        
        {**
         * Стили
         * CSS файлы подключаются в конфиге шаблона (ваш_шаблон/settings/config.php)
         *}
        {block 'layout_head_styles'}
            {* Подключение стилей указанных в конфиге *}
            {$aHtmlHeadFiles.css}
        {/block}


        <script>
            {strip}
            var domain_root = "{$aWidjetParams['domain_root']}";
            var secrity_host = "{$aWidjetParams['domain']}";
            var aRouter = [];
            {foreach $aRouter as $sPage => $sPath}
                aRouter['{$sPage}'] = '{$sPath}';
            {/foreach}
            {/strip}
        </script>

        {block 'layout_head_scripts'}{/block}
    {/block}

</head>



<body class="{$component} {cmods name=$component mods=$mods} {$classes}" {cattr list=$attributes}>
    {block 'layout_body'}{/block}

    

    {**
     * JavaScript файлы
     * JS файлы подключаются в конфиге шаблона (ваш_шаблон/settings/config.php)
     *}
    {block 'layout_body_end'}
        {* Подключение скриптов указанных в конфиге *}
        {$aHtmlHeadFiles.js}

       
    {/block}


    {$sLayoutAfter}
</body>
</html>
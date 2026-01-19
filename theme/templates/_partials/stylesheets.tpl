{**
 * Stylesheets partial
 *}
{if isset($stylesheets.external)}
  {foreach $stylesheets.external as $stylesheet}
    <link rel="stylesheet" href="{$stylesheet.uri}" type="text/css" media="{$stylesheet.media}">
  {/foreach}
{/if}

{if isset($stylesheets.inline)}
  {foreach $stylesheets.inline as $stylesheet}
    <style>
      {$stylesheet.content}
    </style>
  {/foreach}
{/if}

{* Theme CSS *}
<link rel="stylesheet" href="{$urls.theme_assets}css/theme.css" type="text/css" media="all">

{**
 * JavaScript partial
 *}
{if isset($javascript.external)}
  {foreach $javascript.external as $js}
    <script type="text/javascript" src="{$js.uri}" {if isset($js.attribute)}{$js.attribute}{/if}></script>
  {/foreach}
{/if}

{if isset($javascript.inline)}
  {foreach $javascript.inline as $js}
    <script type="text/javascript">
      {$js.content nofilter}
    </script>
  {/foreach}
{/if}

{* Theme JavaScript *}
<script type="text/javascript" src="{$urls.theme_assets}js/theme.js"></script>

{if isset($vars)}
  <script type="text/javascript">
    var prestashop = {$vars nofilter};
  </script>
{/if}

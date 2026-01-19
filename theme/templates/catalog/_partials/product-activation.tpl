{**
 * Product activation partial
 *}
{if $page.admin_notifications}
  <div class="alert alert-warning" role="alert">
    <ul>
      {foreach $page.admin_notifications item=notif}
        <li>{$notif.message nofilter}</li>
      {/foreach}
    </ul>
  </div>
{/if}

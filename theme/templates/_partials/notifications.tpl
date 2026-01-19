{**
 * Notifications partial
 *}
{if $notifications}
  <aside id="notifications">
    <div class="container">
      {if $notifications.error}
        {foreach $notifications.error as $notif}
          <div class="notification notification-error" role="alert">
            {$notif}
          </div>
        {/foreach}
      {/if}

      {if $notifications.warning}
        {foreach $notifications.warning as $notif}
          <div class="notification notification-warning" role="alert">
            {$notif}
          </div>
        {/foreach}
      {/if}

      {if $notifications.success}
        {foreach $notifications.success as $notif}
          <div class="notification notification-success" role="alert">
            {$notif}
          </div>
        {/foreach}
      {/if}

      {if $notifications.info}
        {foreach $notifications.info as $notif}
          <div class="notification notification-info" role="alert">
            {$notif}
          </div>
        {/foreach}
      {/if}
    </div>
  </aside>
{/if}

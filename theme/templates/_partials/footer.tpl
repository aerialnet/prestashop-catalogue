{**
 * Footer template
 *}
<div class="footer-container">
  <div class="container">
    <div class="row">
      <div class="col-md-3 footer-block">
        <h3>{l s='About' d='Shop.Theme.Global'}</h3>
        <p>{$shop.name}</p>
        {if $shop.address}
          <p>{$shop.address}</p>
        {/if}
      </div>
      
      <div class="col-md-3 footer-block">
        <h3>{l s='Contact' d='Shop.Theme.Global'}</h3>
        {hook h='displayFooter'}
      </div>
      
      <div class="col-md-3 footer-block">
        <h3>{l s='Information' d='Shop.Theme.Global'}</h3>
        <ul>
          <li><a href="{$urls.pages.cms}?id_cms=1">{l s='Delivery' d='Shop.Theme.Catalog'}</a></li>
          <li><a href="{$urls.pages.cms}?id_cms=2">{l s='Legal Notice' d='Shop.Theme.Catalog'}</a></li>
          <li><a href="{$urls.pages.cms}?id_cms=3">{l s='Terms and conditions' d='Shop.Theme.Catalog'}</a></li>
          <li><a href="{$urls.pages.cms}?id_cms=4">{l s='About us' d='Shop.Theme.Catalog'}</a></li>
        </ul>
      </div>
      
      <div class="col-md-3 footer-block">
        <h3>{l s='Follow Us' d='Shop.Theme.Global'}</h3>
        {hook h='displaySocialFollow'}
      </div>
    </div>
  </div>
</div>

<div class="footer-bottom">
  <div class="container">
    <p>&copy; {$shop.name} {date('Y')} - {l s='All rights reserved' d='Shop.Theme.Global'}</p>
  </div>
</div>

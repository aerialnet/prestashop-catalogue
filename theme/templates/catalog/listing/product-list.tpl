{**
 * Product listing page
 *}
{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
  <section id="products" class="products-section">
    {if isset($listing.rendered_facets)}
      <div id="search_filters_wrapper" class="hidden-sm-down">
        {$listing.rendered_facets nofilter}
      </div>
    {/if}

    <div id="js-product-list-top" class="products-selection">
      <div class="row">
        <div class="col-md-12">
          <h1 class="section-title">
            {if $category.name}
              {$category.name}
            {else}
              {l s='Products' d='Shop.Theme.Catalog'}
            {/if}
          </h1>
        </div>
      </div>

      {if isset($listing.pagination.total_items)}
        <div class="row">
          <div class="col-md-12">
            <div class="showing">
              {l s='Showing %from%-%to% of %total% item(s)' 
                 d='Shop.Theme.Catalog' 
                 sprintf=['%from%' => $listing.pagination.items_shown_from,
                          '%to%' => $listing.pagination.items_shown_to,
                          '%total%' => $listing.pagination.total_items]}
            </div>
          </div>
        </div>
      {/if}
    </div>

    <div id="js-product-list">
      {if $listing.products|count}
        <div class="products row">
          {foreach from=$listing.products item="product"}
            {include file="catalog/_partials/miniatures/product.tpl" product=$product}
          {/foreach}
        </div>

        {if !empty($listing.rendered_pagination)}
          <div class="pagination">
            {$listing.rendered_pagination nofilter}
          </div>
        {/if}
      {else}
        <div id="js-product-list-top" class="text-center">
          <p>{l s='No products found.' d='Shop.Theme.Catalog'}</p>
        </div>
      {/if}
    </div>

    <div id="js-product-list-bottom">
      {if !empty($listing.rendered_pagination)}
        <div class="pagination">
          {$listing.rendered_pagination nofilter}
        </div>
      {/if}
    </div>
  </section>
{/block}

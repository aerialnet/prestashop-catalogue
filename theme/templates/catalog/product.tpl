{**
 * Product detail page
 *}
{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
  <section id="main" itemscope itemtype="http://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row">
      <div class="col-md-6">
        {block name='product_cover'}
          <div class="product-cover">
            <img 
              src="{$product.cover.large.url}" 
              alt="{$product.cover.legend}" 
              title="{$product.cover.legend}"
              itemprop="image"
            >
          </div>
        {/block}

        {block name='product_images'}
          <div class="product-images">
            {if $product.images|count > 1}
              <div class="images-container">
                {foreach from=$product.images item=image}
                  <div class="thumb-container">
                    <img 
                      src="{$image.bySize.small_default.url}" 
                      alt="{$image.legend}"
                      data-image-large-src="{$image.large.url}"
                      loading="lazy"
                    >
                  </div>
                {/foreach}
              </div>
            {/if}
          </div>
        {/block}
      </div>

      <div class="col-md-6">
        <div class="product-information">
          {block name='page_header'}
            <h1 class="product-name" itemprop="name">{$product.name}</h1>
          {/block}

          {block name='product_reference'}
            {if $product.reference}
              <div class="product-reference">
                <label>{l s='Reference' d='Shop.Theme.Catalog'}: </label>
                <span itemprop="sku">{$product.reference}</span>
              </div>
            {/if}
          {/block}

          {block name='product_description_short'}
            <div id="product-description-short" class="product-description-full" itemprop="description">
              {$product.description_short nofilter}
            </div>
          {/block}

          {if $product.is_customizable && count($product.customizations.fields)}
            {block name='product_customization'}
              <section class="product-customization">
                <h3>{l s='Product customization' d='Shop.Theme.Catalog'}</h3>
                {foreach from=$product.customizations.fields item="field"}
                  <div class="product-customization-item">
                    <label>{$field.label} {if $field.required}*{/if}</label>
                    {if $field.type == 'text'}
                      <input type="text" name="customization[{$field.id_customization_field}]" {if $field.required}required{/if}>
                    {elseif $field.type == 'file'}
                      <input type="file" name="customization[{$field.id_customization_field}]" {if $field.required}required{/if}>
                    {/if}
                  </div>
                {/foreach}
              </section>
            {/block}
          {/if}

          {block name='product_additional_info'}
            <div class="product-additional-info">
              {hook h='displayProductAdditionalInfo' product=$product}
            </div>
          {/block}
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        {block name='product_tabs'}
          <div class="tabs">
            <ul class="nav nav-tabs" role="tablist">
              {if $product.description}
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">
                    {l s='Description' d='Shop.Theme.Catalog'}
                  </a>
                </li>
              {/if}
              {if $product.features}
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#product-details" role="tab" aria-controls="product-details">
                    {l s='Product Details' d='Shop.Theme.Catalog'}
                  </a>
                </li>
              {/if}
            </ul>

            <div class="tab-content" id="tab-content">
              {if $product.description}
                <div class="tab-pane fade in active" id="description" role="tabpanel">
                  <div class="product-description">
                    {$product.description nofilter}
                  </div>
                </div>
              {/if}

              {if $product.features}
                <div class="tab-pane fade" id="product-details" role="tabpanel">
                  <section class="product-features">
                    <dl>
                      {foreach from=$product.features item=feature}
                        <dt>{$feature.name}</dt>
                        <dd>{$feature.value}</dd>
                      {/foreach}
                    </dl>
                  </section>
                </div>
              {/if}
            </div>
          </div>
        {/block}
      </div>
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories">
          <h2 class="section-title">{l s='You might also like' d='Shop.Theme.Catalog'}</h2>
          <div class="products">
            {foreach from=$accessories item="product_accessory"}
              {include file="catalog/_partials/miniatures/product.tpl" product=$product_accessory}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}
  </section>
{/block}

{**
 * Product miniature for grid display
 * No prices shown
 *}
<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
  <div class="thumbnail-container">
    <div class="product-thumbnail">
      <a href="{$product.url}" class="thumbnail product-thumbnail">
        <img
          src="{$product.cover.bySize.home_default.url}"
          alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
          data-full-size-image-url="{$product.cover.large.url}"
          loading="lazy"
        >
      </a>
    </div>

    <div class="product-description">
      <h3 class="product-title" itemprop="name">
        <a href="{$product.url}">{$product.name|truncate:50:'...'}</a>
      </h3>

      {if $product.description_short}
        <div class="product-description-short" itemprop="description">
          {$product.description_short|strip_tags|truncate:100:'...' nofilter}
        </div>
      {/if}

      {* Product flags (new, sale, etc) - optional *}
      {if $product.flags}
        <ul class="product-flags">
          {foreach from=$product.flags item=flag}
            <li class="product-flag {$flag.type}">{$flag.label}</li>
          {/foreach}
        </ul>
      {/if}
    </div>

    {* Hidden meta for structured data *}
    <meta itemprop="url" content="{$product.url}">
  </div>
</article>

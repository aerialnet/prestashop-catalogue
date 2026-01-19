{**
 * Category listing page
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name='content'}
  <section id="products" class="products-section">
    {if $category.description}
      <div class="category-description">
        {$category.description nofilter}
      </div>
    {/if}

    {if $subcategories|count}
      <div class="subcategories">
        <h2 class="section-title">{l s='Subcategories' d='Shop.Theme.Catalog'}</h2>
        <div class="products">
          {foreach from=$subcategories item=subcategory}
            <article class="product-miniature">
              <div class="thumbnail-container">
                <div class="product-thumbnail">
                  <a href="{$subcategory.url}">
                    {if $subcategory.image}
                      <img src="{$subcategory.image.medium.url}" alt="{$subcategory.name}">
                    {/if}
                  </a>
                </div>
                <div class="product-description">
                  <h3 class="product-title">
                    <a href="{$subcategory.url}">{$subcategory.name}</a>
                  </h3>
                </div>
              </div>
            </article>
          {/foreach}
        </div>
      </div>
    {/if}

    {* Call parent block for products *}
    {$smarty.block.parent}
  </section>
{/block}

{**
 * Homepage
 *}
{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
  <section id="content" class="page-home">
    {block name='hook_home'}
      {hook h='displayHome'}
    {/block}

    {* Featured products section *}
    <section class="products-section featured-products">
      <h2 class="section-title">{l s='Featured Products' d='Shop.Theme.Catalog'}</h2>
      
      <div class="products">
        {* This will be populated by PrestaShop's featured products module *}
        {hook h='displayHomeProducts'}
      </div>
    </section>

    {* Categories overview *}
    {if isset($categories) && $categories}
      <section class="categories-section">
        <h2 class="section-title">{l s='Categories' d='Shop.Theme.Catalog'}</h2>
        
        <div class="products">
          {foreach from=$categories item=category}
            {if $category.id != 1 && $category.id != 2}
              <article class="product-miniature">
                <div class="thumbnail-container">
                  <div class="product-thumbnail">
                    <a href="{$category.url}">
                      {if isset($category.image) && $category.image}
                        <img src="{$category.image.medium.url}" alt="{$category.name}" loading="lazy">
                      {/if}
                    </a>
                  </div>
                  <div class="product-description">
                    <h3 class="product-title">
                      <a href="{$category.url}">{$category.name}</a>
                    </h3>
                    {if isset($category.description) && $category.description}
                      <div class="product-description-short">
                        {$category.description|strip_tags|truncate:100:'...' nofilter}
                      </div>
                    {/if}
                  </div>
                </div>
              </article>
            {/if}
          {/foreach}
        </div>
      </section>
    {/if}

    {* Additional home content *}
    <section class="home-content">
      {block name='page_content'}
        {if isset($page.content) && $page.content}
          <div class="rte">
            {$page.content nofilter}
          </div>
        {/if}
      {/block}
    </section>
  </section>
{/block}

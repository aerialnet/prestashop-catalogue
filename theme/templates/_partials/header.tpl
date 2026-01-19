{**
 * Header with logo, search, and dual-row menu
 *}
<div class="header-top">
  <div class="container">
    <div class="row">
      <div class="col-md-2 col-sm-12">
        {if $shop.logo}
          <a href="{$urls.base_url}" class="header-logo">
            <img src="{$shop.logo}" alt="{$shop.name}" class="logo">
          </a>
        {else}
          <a href="{$urls.base_url}" class="header-logo">
            {$shop.name}
          </a>
        {/if}
      </div>
      
      <div class="col-md-8 col-sm-12">
        {hook h='displayTop'}
      </div>
      
      <div class="col-md-2 col-sm-12">
        <div class="header-nav">
          {hook h='displayNav'}
        </div>
      </div>
    </div>
  </div>
</div>

{* Main Category Menu - Row 1 *}
<div class="main-menu-wrapper">
  <div class="container">
    <nav class="main-menu" role="navigation" aria-label="Main navigation">
      {if isset($categories) && $categories}
        {foreach from=$categories item=category}
          {if $category.id != 1 && $category.id != 2}
            <div class="main-menu-item" data-category-id="{$category.id}">
              <a href="{$category.url}" class="main-menu-link {if isset($current_category) && $current_category == $category.id}active{/if}">
                {$category.name}
              </a>
            </div>
          {/if}
        {/foreach}
      {else}
        {* Fallback menu items *}
        <div class="main-menu-item" data-category-id="3">
          <a href="#" class="main-menu-link active">Category 1</a>
        </div>
        <div class="main-menu-item" data-category-id="4">
          <a href="#" class="main-menu-link">Category 2</a>
        </div>
        <div class="main-menu-item" data-category-id="5">
          <a href="#" class="main-menu-link">Category 3</a>
        </div>
        <div class="main-menu-item" data-category-id="6">
          <a href="#" class="main-menu-link">Category 4</a>
        </div>
        <div class="main-menu-item" data-category-id="7">
          <a href="#" class="main-menu-link">Category 5</a>
        </div>
      {/if}
    </nav>
  </div>
</div>

{* Subcategory Menu - Row 2 (Always visible) *}
<div class="submenu-wrapper">
  <div class="container">
    <nav class="submenu" role="navigation" aria-label="Subcategory navigation">
      {if isset($subcategories) && $subcategories}
        {foreach from=$subcategories item=subcategory}
          <a href="{$subcategory.url}" 
             class="submenu-item {if isset($current_subcategory) && $current_subcategory == $subcategory.id}active{/if}"
             data-parent-category="{$subcategory.id_parent}">
            {$subcategory.name}
          </a>
        {/foreach}
      {else}
        {* Fallback subcategory items *}
        <a href="#" class="submenu-item active" data-parent-category="3">Subcategory 1</a>
        <a href="#" class="submenu-item" data-parent-category="3">Subcategory 2</a>
        <a href="#" class="submenu-item" data-parent-category="3">Subcategory 3</a>
        <a href="#" class="submenu-item" data-parent-category="3">Subcategory 4</a>
      {/if}
    </nav>
  </div>
</div>

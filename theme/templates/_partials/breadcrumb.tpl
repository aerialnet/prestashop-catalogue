{**
 * Breadcrumb navigation
 *}
{if isset($breadcrumb.links) && $breadcrumb.links}
  <nav class="breadcrumb" aria-label="Breadcrumb">
    <ol itemscope itemtype="http://schema.org/BreadcrumbList">
      {foreach from=$breadcrumb.links item=path name=breadcrumb}
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
          {if !$smarty.foreach.breadcrumb.last}
            <a itemprop="item" href="{$path.url}">
              <span itemprop="name">{$path.title}</span>
            </a>
            <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
            <span class="breadcrumb-separator">/</span>
          {else}
            <span itemprop="name">{$path.title}</span>
            <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
          {/if}
        </li>
      {/foreach}
    </ol>
  </nav>
{/if}

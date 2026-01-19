{**
 * CMS page template
 *}
{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
  <section id="content" class="page-content page-cms">
    {block name='cms_content'}
      <div class="rte">
        {$cms.content nofilter}
      </div>
    {/block}
  </section>
{/block}

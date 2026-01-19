{**
 * Layout - Full width with header, content, and footer
 * @var array $page
 *}
<!doctype html>
<html lang="{$language.iso_code}">

<head>
  {block name='head'}
    {include file='_partials/head.tpl'}
  {/block}
</head>

<body id="{$page.page_name}" class="{$page.body_classes|classnames}">

  {hook h='displayAfterBodyOpeningTag'}

  <main>
    {block name='product_activation'}
      {include file='catalog/_partials/product-activation.tpl'}
    {/block}

    <header id="header">
      {block name='header'}
        {include file='_partials/header.tpl'}
      {/block}
    </header>

    {block name='notifications'}
      {include file='_partials/notifications.tpl'}
    {/block}

    <section id="wrapper">
      <div class="container">
        {block name='breadcrumb'}
          {include file='_partials/breadcrumb.tpl'}
        {/block}

        <div id="content-wrapper" class="js-content-wrapper">
          {hook h="displayContentWrapperTop"}
          {block name='content_wrapper'}
            {block name='content'}
              <p>Hello world! This is HTML5 Boilerplate.</p>
            {/block}
          {/block}
          {hook h="displayContentWrapperBottom"}
        </div>
      </div>
    </section>

    <footer id="footer">
      {block name='footer'}
        {include file='_partials/footer.tpl'}
      {/block}
    </footer>

  </main>

  {hook h='displayBeforeBodyClosingTag'}

  {block name='javascript_bottom'}
    {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
  {/block}

</body>

</html>

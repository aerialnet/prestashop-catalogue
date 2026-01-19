{**
 * Microdata JSON-LD
 *}
{if isset($page.meta.jsonld)}
  <script type="application/ld+json">
    {$page.meta.jsonld nofilter}
  </script>
{/if}

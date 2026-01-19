# Theme Customization Guide

## Overview
This guide explains how to customize the Minimalist Catalogue theme for PrestaShop.

## Theme Structure

```
theme/
├── config/
├── assets/
│   ├── img/          # Images (logo, icons, etc.)
│   └── fonts/        # Custom fonts
├── css/
│   └── theme.css     # Main stylesheet
├── js/
│   └── theme.js      # Theme JavaScript
├── modules/          # Module overrides
├── templates/
│   ├── _partials/    # Reusable template parts
│   ├── catalog/      # Product and category templates
│   ├── cms/          # CMS page templates
│   ├── customer/     # Customer account templates
│   ├── layouts/      # Page layouts
│   └── index.tpl     # Homepage
└── theme.yml         # Theme configuration
```

## Customizing Colors

### Using CSS Variables
The theme uses CSS variables for easy color customization. Edit `theme/css/theme.css`:

```css
:root {
  --color-primary: #000000;      /* Main color (black) */
  --color-secondary: #ffffff;    /* Background (white) */
  --color-text: #333333;         /* Text color */
  --color-text-light: #666666;   /* Light text */
  --color-border: #e0e0e0;       /* Borders */
  --color-hover: #f5f5f5;        /* Hover states */
}
```

### Example: Change to Gray Theme
```css
:root {
  --color-primary: #2c3e50;      /* Dark gray */
  --color-secondary: #ecf0f1;    /* Light gray background */
  --color-text: #2c3e50;         /* Dark gray text */
  --color-text-light: #7f8c8d;   /* Medium gray */
  --color-border: #bdc3c7;       /* Gray borders */
  --color-hover: #d5dbdb;        /* Light gray hover */
}
```

## Customizing Typography

### Change Fonts
```css
:root {
  --font-primary: 'Your Font', 'Helvetica Neue', Arial, sans-serif;
  --font-size-base: 16px;
  --font-size-small: 14px;
  --font-size-large: 18px;
  --font-size-xlarge: 24px;
}
```

### Using Custom Fonts
1. Add font files to `theme/assets/fonts/`
2. Add @font-face declarations in `theme.css`:

```css
@font-face {
  font-family: 'CustomFont';
  src: url('../assets/fonts/customfont.woff2') format('woff2'),
       url('../assets/fonts/customfont.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

:root {
  --font-primary: 'CustomFont', sans-serif;
}
```

## Customizing Spacing

```css
:root {
  --spacing-xs: 0.5rem;    /* 8px */
  --spacing-sm: 1rem;      /* 16px */
  --spacing-md: 1.5rem;    /* 24px */
  --spacing-lg: 2rem;      /* 32px */
  --spacing-xl: 3rem;      /* 48px */
}
```

## Customizing the Menu

### Change Menu Layout
Edit `theme/templates/_partials/header.tpl`:

```smarty
{* Adjust menu items per row *}
<div class="main-menu">
  {* Your menu code *}
</div>
```

### Modify Menu Styles
In `theme/css/theme.css`:

```css
.main-menu {
  gap: var(--spacing-lg);        /* Space between items */
  padding: var(--spacing-sm) 0;  /* Top/bottom padding */
}

.main-menu-link {
  font-size: var(--font-size-base);
  letter-spacing: 1px;           /* Character spacing */
  text-transform: uppercase;     /* Text style */
}
```

### Subcategory Menu Customization
```css
.submenu {
  background-color: var(--color-hover);  /* Background */
  min-height: 50px;                      /* Height */
}

.submenu-item {
  font-size: var(--font-size-small);
  padding: var(--spacing-xs) var(--spacing-sm);
}
```

## Customizing Product Grid

### Change Grid Columns
In `theme/css/theme.css`:

```css
/* Desktop - change from 4 to 3 columns */
.products {
  grid-template-columns: repeat(3, 1fr);
  gap: var(--spacing-lg);
}

/* Tablet - change from 2 to 3 columns */
@media (max-width: 1024px) {
  .products {
    grid-template-columns: repeat(3, 1fr);
  }
}
```

### Modify Product Card Style
```css
.product-miniature {
  background-color: var(--color-secondary);
  border: 1px solid var(--color-border);  /* Add border */
  padding: var(--spacing-sm);             /* Add padding */
}

.product-thumbnail {
  aspect-ratio: 1;           /* Square images */
  /* or */
  aspect-ratio: 4/3;         /* 4:3 ratio */
  /* or */
  aspect-ratio: 16/9;        /* 16:9 ratio */
}
```

## Customizing Templates

### Homepage Template
Edit `theme/templates/index.tpl`:

```smarty
{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
  {* Add custom homepage content *}
  <section class="hero-section">
    <h1>Welcome to Our Catalogue</h1>
    <p>Custom content here</p>
  </section>
  
  {* Featured products *}
  {$smarty.block.parent}
{/block}
```

### Product Listing Template
Edit `theme/templates/catalog/listing/product-list.tpl`:

```smarty
{* Customize product listing display *}
{block name='content'}
  {* Add filters, sorting, etc. *}
  {$smarty.block.parent}
{/block}
```

### Product Detail Template
Edit `theme/templates/catalog/product.tpl`:

```smarty
{* Customize product page layout *}
{block name='content'}
  {* Modify product information display *}
  {$smarty.block.parent}
{/block}
```

## Adding Custom CSS

### Method 1: Directly in theme.css
Add your styles at the end of `theme/css/theme.css`:

```css
/* Custom Styles */
.my-custom-class {
  color: red;
  font-weight: bold;
}
```

### Method 2: Separate CSS File
1. Create `theme/css/custom.css`
2. Add to `theme/templates/_partials/stylesheets.tpl`:

```smarty
<link rel="stylesheet" href="{$urls.theme_assets}css/custom.css" type="text/css" media="all">
```

## Adding Custom JavaScript

### Method 1: Directly in theme.js
Add your code to `theme/js/theme.js`:

```javascript
// Custom JavaScript
function myCustomFunction() {
  // Your code here
}

document.addEventListener('DOMContentLoaded', function() {
  myCustomFunction();
});
```

### Method 2: Separate JS File
1. Create `theme/js/custom.js`
2. Add to `theme/templates/_partials/javascript.tpl`:

```smarty
<script type="text/javascript" src="{$urls.theme_assets}js/custom.js"></script>
```

## Customizing the Header

### Add Logo
1. Upload logo to `theme/assets/img/logo.png`
2. Update in PrestaShop Admin: **Design > Theme & Logo**
3. Or edit `theme/templates/_partials/header.tpl`:

```smarty
<a href="{$urls.base_url}" class="header-logo">
  <img src="{$urls.theme_assets}img/logo.png" alt="{$shop.name}">
</a>
```

### Modify Header Layout
Edit `theme/templates/_partials/header.tpl`:

```smarty
<div class="header-top">
  {* Rearrange header elements *}
  <div class="logo">...</div>
  <div class="search">...</div>
  <div class="nav">...</div>
</div>
```

## Customizing the Footer

Edit `theme/templates/_partials/footer.tpl`:

```smarty
<div class="footer-container">
  {* Add/remove footer columns *}
  <div class="footer-block">
    <h3>Custom Section</h3>
    <p>Your content here</p>
  </div>
</div>
```

## Responsive Design Customization

### Modify Breakpoints
In `theme/css/theme.css`:

```css
/* Tablet breakpoint */
@media (max-width: 1024px) {
  /* Tablet styles */
}

/* Mobile breakpoint */
@media (max-width: 768px) {
  /* Mobile styles */
}

/* Small mobile breakpoint */
@media (max-width: 480px) {
  /* Small mobile styles */
}
```

### Mobile Menu Customization
In `theme/js/theme.js`, modify the `initMobileMenu()` function:

```javascript
function initMobileMenu() {
  // Customize mobile menu behavior
}
```

## Showing/Hiding Prices

### Hide Prices (Current Default)
Prices are hidden by default with CSS:

```css
.product-price-and-shipping,
.product-price,
.price,
.current-price {
  display: none !important;
}
```

### Show Prices
To show prices, comment out or remove the above CSS:

```css
/* Commented out to show prices
.product-price-and-shipping,
.product-price,
.price,
.current-price {
  display: none !important;
}
*/
```

## Advanced Customizations

### Override Module Templates
1. Create directory: `theme/modules/{module_name}/views/templates/`
2. Copy module template from `modules/{module_name}/views/templates/`
3. Modify the copied template

### Add Custom Hooks
In `theme/theme.yml`:

```yaml
hooks:
  displayCustomHook:
    - custom_module
```

### Create Custom Page Layout
1. Create `theme/templates/layouts/custom-layout.tpl`
2. Use in page template:

```smarty
{extends file='layouts/custom-layout.tpl'}
```

## Testing Changes

### Clear Cache
After making changes:
1. In PrestaShop Admin: **Advanced Parameters > Performance > Clear cache**
2. Or via command line:
```bash
docker exec -it prestashop_app bash
rm -rf /var/www/html/var/cache/*
```

### Browser Cache
- Hard refresh: `Ctrl+F5` (Windows) or `Cmd+Shift+R` (Mac)
- Or open in incognito/private window

## Best Practices

1. **Backup**: Always backup before making changes
2. **Test**: Test changes in development environment first
3. **Version Control**: Use Git to track changes
4. **Comments**: Add comments to explain custom code
5. **Mobile First**: Design for mobile, then desktop
6. **Performance**: Optimize images and minimize CSS/JS
7. **Accessibility**: Maintain proper semantic HTML and ARIA labels
8. **Browser Testing**: Test in multiple browsers

## Common Customization Scenarios

### Scenario 1: Different Category Menu Style
```css
.main-menu {
  justify-content: space-between;  /* Spread items */
  background-color: #f8f8f8;       /* Light background */
  border-top: 3px solid #000;      /* Top border */
}
```

### Scenario 2: Product Card with Border
```css
.product-miniature {
  border: 2px solid var(--color-border);
  border-radius: 8px;
  padding: var(--spacing-md);
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}
```

### Scenario 3: Larger Product Images
```css
.product-thumbnail {
  aspect-ratio: 3/4;  /* Portrait orientation */
}
```

## Troubleshooting

### Changes Not Appearing
1. Clear PrestaShop cache
2. Clear browser cache
3. Check file permissions
4. Verify file path is correct

### CSS Not Loading
1. Check file path in template
2. Verify file exists
3. Check browser console for errors

### JavaScript Not Working
1. Check browser console for errors
2. Verify script is loaded after jQuery (if needed)
3. Check syntax errors

## Resources

- PrestaShop Theme Documentation: https://devdocs.prestashop.com/1.7/themes/
- Smarty Documentation: https://www.smarty.net/docs/en/
- CSS Grid Guide: https://css-tricks.com/snippets/css/complete-guide-grid/
- Responsive Design: https://web.dev/responsive-web-design-basics/

## Support

For theme customization help:
1. Review PrestaShop documentation
2. Check theme source code
3. Test changes incrementally
4. Consult PrestaShop community forums

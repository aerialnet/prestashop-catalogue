# Minimalist Catalogue Theme

This is the PrestaShop theme directory for the Minimalist Catalogue.

## Installation

### Automatic (via Docker)
The theme is automatically mounted when using docker-compose. No additional steps needed.

### Manual Installation
1. Copy this entire `theme` directory to your PrestaShop installation:
   ```
   /var/www/html/themes/minimalist_catalogue/
   ```

2. Set proper permissions:
   ```bash
   chown -R www-data:www-data /var/www/html/themes/minimalist_catalogue
   chmod -R 755 /var/www/html/themes/minimalist_catalogue
   ```

3. In PrestaShop Admin:
   - Go to **Design > Theme & Logo**
   - Find "Minimalist Catalogue"
   - Click **"Use this theme"**
   - Clear cache

## Theme Structure

```
theme/
├── config/
│   └── theme.xml          # Theme metadata
├── assets/
│   ├── img/               # Theme images
│   └── fonts/             # Custom fonts
├── css/
│   └── theme.css          # Main stylesheet
├── js/
│   └── theme.js           # Theme JavaScript
├── modules/               # Module template overrides
├── templates/
│   ├── _partials/         # Reusable components
│   │   ├── header.tpl     # Dual-row navigation
│   │   ├── footer.tpl
│   │   ├── head.tpl
│   │   └── ...
│   ├── catalog/           # Product templates
│   │   ├── product.tpl    # Product detail page
│   │   ├── listing/
│   │   │   ├── product-list.tpl
│   │   │   └── category.tpl
│   │   └── _partials/
│   │       └── miniatures/
│   │           └── product.tpl  # Product card
│   ├── cms/               # CMS pages
│   ├── layouts/           # Page layouts
│   │   └── layout-full-width.tpl
│   └── index.tpl          # Homepage
└── theme.yml              # Theme configuration
```

## Key Features

- **Dual-Row Navigation**: Categories on row 1, subcategories on row 2
- **Responsive Grid**: 4 columns (desktop), 2 (tablet), 1 (mobile)
- **No Prices**: Catalogue mode with prices hidden
- **Minimalist Design**: Clean black and white aesthetic
- **CSS Variables**: Easy color and typography customization
- **Mobile-First**: Responsive design for all devices

## Customization

See [THEME_CUSTOMIZATION.md](../THEME_CUSTOMIZATION.md) for detailed customization instructions.

### Quick Customization

**Colors** (in `css/theme.css`):
```css
:root {
  --color-primary: #000000;
  --color-secondary: #ffffff;
}
```

**Grid Columns** (in `css/theme.css`):
```css
.products {
  grid-template-columns: repeat(4, 1fr);
}
```

## Files You Might Want to Edit

- `templates/_partials/header.tpl` - Navigation menu
- `templates/catalog/_partials/miniatures/product.tpl` - Product cards
- `templates/catalog/product.tpl` - Product detail page
- `templates/index.tpl` - Homepage
- `css/theme.css` - All styles
- `js/theme.js` - JavaScript functionality

## Template Variables

### Product Object
```smarty
{$product.name}
{$product.description_short}
{$product.description}
{$product.cover.large.url}
{$product.url}
```

### Category Object
```smarty
{$category.name}
{$category.description}
{$category.url}
```

### Shop Object
```smarty
{$shop.name}
{$shop.logo}
{$urls.base_url}
```

## Hooks Used

- `displayHeader` - Additional header content
- `displayTop` - Top navigation area
- `displayNav` - Navigation elements
- `displayHome` - Homepage content
- `displayFooter` - Footer content
- `displayContentWrapperTop` - Before content
- `displayContentWrapperBottom` - After content

## Browser Support

- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile browsers

## Requirements

- PrestaShop 1.7.0.0 or higher
- PHP 7.1 or higher
- Modern web browser

## Support

- Documentation: See main repository README.md
- Issues: GitHub Issues
- Customization Guide: THEME_CUSTOMIZATION.md

## License

MIT License - Free to use and modify

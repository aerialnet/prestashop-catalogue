# Architecture Overview

## System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         USER ACCESS                              │
│                   http://your-domain.com                         │
└──────────────────────────────┬──────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                      NGINX (Port 80/443)                         │
│  • Reverse Proxy                                                 │
│  • SSL Termination                                               │
│  • Static File Caching (30 days)                                │
│  • Gzip Compression                                              │
│  • Security Headers                                              │
└──────────────────────────────┬──────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                   PRESTASHOP (Port 8080)                         │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │                   Minimalist Theme                          │ │
│  │  • Dual-Row Navigation                                     │ │
│  │  • Responsive Product Grid (4/2/1 columns)                │ │
│  │  • No Prices Display                                       │ │
│  │  • Mobile-First Design                                     │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                   │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │                   PrestaShop Core                           │ │
│  │  • Product Management                                      │ │
│  │  • Category System                                         │ │
│  │  • Image Processing                                        │ │
│  │  • Search Engine                                           │ │
│  │  • Admin Panel                                             │ │
│  └────────────────────────────────────────────────────────────┘ │
└──────────────────────────────┬──────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                      MySQL 5.7 (Internal)                        │
│  • Product Data                                                  │
│  • Category Structure                                            │
│  • Configuration                                                 │
│  • User Data                                                     │
│  • Persistent Volume Storage                                    │
└─────────────────────────────────────────────────────────────────┘
```

## Theme Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         LAYOUT SYSTEM                            │
│                   layout-full-width.tpl                          │
│  ┌────────────┬──────────────────────────────┬───────────────┐  │
│  │   HEAD     │        HEADER                │   JavaScript  │  │
│  │ head.tpl   │      header.tpl              │javascript.tpl │  │
│  │            │  ┌─────────────────────────┐ │               │  │
│  │ • Meta     │  │   Logo | Search | Nav   │ │ • jQuery      │  │
│  │ • CSS      │  └─────────────────────────┘ │ • theme.js    │  │
│  │ • SEO      │  ┌─────────────────────────┐ │ • Modules     │  │
│  │            │  │  Category Menu (Row 1)  │ │               │  │
│  │            │  │   Cat1 Cat2 Cat3 Cat4   │ │               │  │
│  │            │  └─────────────────────────┘ │               │  │
│  │            │  ┌─────────────────────────┐ │               │  │
│  │            │  │ Subcategory Menu (Row 2)│ │               │  │
│  │            │  │ Sub1 Sub2 Sub3 Sub4...  │ │               │  │
│  │            │  └─────────────────────────┘ │               │  │
│  └────────────┴──────────────────────────────┴───────────────┘  │
│                                                                   │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │                     CONTENT AREA                             │ │
│  │                                                              │ │
│  │  ┌──────────────────────────────────────────────────────┐  │ │
│  │  │              Breadcrumb Navigation                    │  │ │
│  │  └──────────────────────────────────────────────────────┘  │ │
│  │                                                              │ │
│  │  ┌──────────────────────────────────────────────────────┐  │ │
│  │  │              Page Content (Blocks)                    │  │ │
│  │  │                                                        │  │ │
│  │  │  Options:                                             │  │ │
│  │  │  • index.tpl (Homepage)                              │  │ │
│  │  │  • product-list.tpl (Category/Listing)               │  │ │
│  │  │  • product.tpl (Product Detail)                      │  │ │
│  │  │  • page.tpl (CMS Pages)                              │  │ │
│  │  │                                                        │  │ │
│  │  └──────────────────────────────────────────────────────┘  │ │
│  └─────────────────────────────────────────────────────────────┘ │
│                                                                   │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │                        FOOTER                                │ │
│  │                      footer.tpl                              │ │
│  │  ┌──────────┬──────────┬──────────┬──────────┐              │ │
│  │  │  About   │ Contact  │  Info    │  Social  │              │ │
│  │  └──────────┴──────────┴──────────┴──────────┘              │ │
│  │              Copyright & Credits                             │ │
│  └─────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘
```

## Product Grid Layout (Responsive)

```
Desktop (>1024px) - 4 Columns
┌─────────────────────────────────────────────────────────────────┐
│  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐               │
│  │ [IMG]  │  │ [IMG]  │  │ [IMG]  │  │ [IMG]  │               │
│  │Product1│  │Product2│  │Product3│  │Product4│               │
│  │  Desc  │  │  Desc  │  │  Desc  │  │  Desc  │               │
│  └────────┘  └────────┘  └────────┘  └────────┘               │
│  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐               │
│  │ [IMG]  │  │ [IMG]  │  │ [IMG]  │  │ [IMG]  │               │
│  │Product5│  │Product6│  │Product7│  │Product8│               │
│  │  Desc  │  │  Desc  │  │  Desc  │  │  Desc  │               │
│  └────────┘  └────────┘  └────────┘  └────────┘               │
└─────────────────────────────────────────────────────────────────┘

Tablet (768-1024px) - 2 Columns
┌─────────────────────────────────────┐
│  ┌─────────────┐  ┌─────────────┐  │
│  │   [IMG]     │  │   [IMG]     │  │
│  │  Product1   │  │  Product2   │  │
│  │ Description │  │ Description │  │
│  └─────────────┘  └─────────────┘  │
│  ┌─────────────┐  ┌─────────────┐  │
│  │   [IMG]     │  │   [IMG]     │  │
│  │  Product3   │  │  Product4   │  │
│  │ Description │  │ Description │  │
│  └─────────────┘  └─────────────┘  │
└─────────────────────────────────────┘

Mobile (<768px) - 1 Column
┌─────────────────────┐
│  ┌───────────────┐  │
│  │   [IMAGE]     │  │
│  │               │  │
│  │  Product 1    │  │
│  │  Description  │  │
│  │  Text here... │  │
│  └───────────────┘  │
│                     │
│  ┌───────────────┐  │
│  │   [IMAGE]     │  │
│  │               │  │
│  │  Product 2    │  │
│  │  Description  │  │
│  │  Text here... │  │
│  └───────────────┘  │
└─────────────────────┘
```

## Docker Services Network

```
┌──────────────────────────────────────────────────────────────┐
│                   Docker Host Machine                         │
│                                                               │
│  ┌────────────────────────────────────────────────────────┐  │
│  │            prestashop_network (bridge)                  │  │
│  │                                                          │  │
│  │  ┌─────────────┐  ┌──────────────┐  ┌──────────────┐  │  │
│  │  │   nginx     │  │ prestashop   │  │   mysql      │  │  │
│  │  │   :80       │→→│   :8080      │→→│   :3306      │  │  │
│  │  │             │  │              │  │              │  │  │
│  │  │ Serves      │  │ PHP/Apache   │  │ Database     │  │  │
│  │  │ Static      │  │ PrestaShop   │  │ Storage      │  │  │
│  │  │ Files       │  │ Application  │  │              │  │  │
│  │  └─────────────┘  └──────────────┘  └──────────────┘  │  │
│  │         │                 │                  │         │  │
│  │         ▼                 ▼                  ▼         │  │
│  │  ┌─────────────────────────────────────────────────┐  │  │
│  │  │              Docker Volumes                      │  │  │
│  │  │  • nginx.conf (config)                          │  │  │
│  │  │  • prestashop_data (persistent)                 │  │  │
│  │  │  • db_data (persistent)                         │  │  │
│  │  │  • theme/ (mounted from host)                   │  │  │
│  │  └─────────────────────────────────────────────────┘  │  │
│  └────────────────────────────────────────────────────────┘  │
│                                                               │
│  Port Mapping:                                                │
│  • Host :80 → nginx :80                                      │
│  • Host :8080 → prestashop :80                               │
│  • mysql :3306 (internal only)                               │
└──────────────────────────────────────────────────────────────┘
```

## Data Flow

```
1. User Request Flow:
   Browser → Nginx → PrestaShop → MySQL → PrestaShop → Nginx → Browser

2. Static Files:
   Browser → Nginx (direct, cached) → Browser

3. Product Display:
   User clicks category
     ↓
   PrestaShop loads category.tpl
     ↓
   Fetches products from MySQL
     ↓
   Renders product-list.tpl
     ↓
   Loops through products using product.tpl (miniature)
     ↓
   Displays in responsive grid
     ↓
   User sees products (no prices)

4. Navigation Flow:
   Page loads
     ↓
   header.tpl renders dual-row menu
     ↓
   JavaScript initializes (theme.js)
     ↓
   User clicks category
     ↓
   JavaScript updates active state
     ↓
   Subcategories display for selected category
     ↓
   User clicks subcategory
     ↓
   Loads category page with filtered products
```

## CSS Architecture

```
theme.css Structure:
├── CSS Variables (:root)
│   ├── Colors (primary, secondary, text, etc.)
│   ├── Spacing (xs, sm, md, lg, xl)
│   ├── Typography (fonts, sizes)
│   └── Layout (max-width, border-radius, transitions)
│
├── Global Reset & Base
│   ├── Box-sizing reset
│   ├── Body styles
│   └── Typography defaults
│
├── Layout
│   ├── Container
│   ├── Header
│   └── Footer
│
├── Navigation
│   ├── Main Menu (Row 1)
│   ├── Submenu (Row 2)
│   └── Mobile Menu
│
├── Product Display
│   ├── Product Grid
│   ├── Product Cards
│   ├── Product Details
│   └── Hover Effects
│
├── Responsive Breakpoints
│   ├── Tablet (max-width: 1024px)
│   ├── Mobile (max-width: 768px)
│   └── Small Mobile (max-width: 480px)
│
└── Utilities
    ├── Spacing helpers
    ├── Text alignment
    └── Accessibility (sr-only)
```

## JavaScript Modules

```
theme.js Structure:
├── Menu Management
│   ├── initMenu() - Initialize dual-row menu
│   ├── updateSubcategories() - Show/hide subcategories
│   └── previewSubcategories() - Hover preview
│
├── Search
│   └── initSearch() - Search widget functionality
│
├── Mobile
│   └── initMobileMenu() - Toggle mobile menu
│
├── Enhancement
│   ├── initSmoothScroll() - Smooth anchor scrolling
│   └── initLazyLoading() - Lazy load images
│
└── Event Listeners
    ├── DOMContentLoaded - Initialize all
    ├── Window resize - Responsive adjustments
    └── User interactions - Click, hover, etc.
```

## Deployment Flow

```
1. Server Setup
   └→ Install Docker & Docker Compose

2. Repository Clone
   └→ git clone repository

3. Configuration
   └→ Copy .env.example to .env
   └→ Edit environment variables

4. Start Services
   └→ docker-compose up -d
   └→ Wait for health checks

5. PrestaShop Installation
   └→ Access via browser
   └→ Complete installation wizard
   └→ Configure database

6. Theme Installation
   └→ Login to Admin Panel
   └→ Navigate to Design > Theme
   └→ Activate Minimalist Catalogue
   └→ Clear cache

7. Content Setup
   └→ Create categories (10)
   └→ Create subcategories (~10 each)
   └→ Import products (CSV)
   └→ Upload images

8. Production Optimization
   └→ Enable SSL/HTTPS
   └→ Configure caching
   └→ Set up backups
   └→ Monitor performance

9. Go Live!
   └→ Update DNS
   └→ Test all functionality
   └→ Monitor logs
```

## File Relationships

```
docker-compose.yml
  ├── References: .env (environment variables)
  ├── Mounts: nginx.conf
  ├── Mounts: theme/ directory
  └── Creates: volumes (prestashop_data, db_data)

theme/theme.yml
  ├── Defines: theme metadata
  ├── References: templates/
  └── Configures: PrestaShop hooks

templates/layouts/layout-full-width.tpl
  ├── Includes: _partials/head.tpl
  ├── Includes: _partials/header.tpl
  ├── Includes: _partials/footer.tpl
  ├── Includes: _partials/breadcrumb.tpl
  └── Block: content (overridden by child templates)

templates/catalog/listing/product-list.tpl
  ├── Extends: layouts/layout-full-width.tpl
  ├── Includes: catalog/_partials/miniatures/product.tpl
  └── Loops: products array

css/theme.css
  ├── Referenced by: templates/_partials/stylesheets.tpl
  └── Applied to: all pages

js/theme.js
  ├── Referenced by: templates/_partials/javascript.tpl
  └── Executed on: all pages
```

This architecture provides a clear separation of concerns, maintainability, and scalability for the PrestaShop catalogue solution.

# PrestaShop Minimalist Catalogue

A complete, production-ready PrestaShop catalogue solution featuring a minimalist design, dual-row category navigation, responsive product grid, and Docker-based deployment.

## Features

- ✨ **Minimalist Design**: Clean white/black aesthetic with modern typography
- 📱 **Fully Responsive**: 4 columns on desktop, 2 on tablet, 1 on mobile
- 🎯 **Dual-Row Navigation**: Categories on top row, subcategories on second row (always visible)
- 📦 **Docker-Based**: Complete Docker Compose setup for easy deployment
- 🚫 **No Prices**: Catalogue mode with prices hidden
- ⚡ **Performance Optimized**: Nginx reverse proxy, caching, and optimization
- 🎨 **Easy Customization**: CSS variables and well-structured templates

## Quick Start

### Prerequisites
- Docker (version 20.10+)
- Docker Compose (version 1.29+)
- 2GB RAM minimum
- 10GB disk space

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/aerialnet/prestashop-catalogue.git
   cd prestashop-catalogue
   ```

2. **Configure environment**
   ```bash
   cp .env.example .env
   # Edit .env with your settings
   nano .env
   ```

3. **Start services**
   ```bash
   docker-compose up -d
   ```

4. **Access PrestaShop**
   - Frontend: `http://localhost:8080`
   - Follow the installation wizard
   - Database settings:
     - Server: `db`
     - Database: `prestashop_db`
     - User: `prestashop`
     - Password: `prestashop_pass`

5. **Install the theme**
   - After installation, go to Admin Panel
   - Navigate to **Design > Theme & Logo**
   - Select "Minimalist Catalogue" theme
   - Click **"Use this theme"**
   - Clear cache: **Advanced Parameters > Performance > Clear cache**

6. **Remove installation directory**
   ```bash
   docker exec -it prestashop_app rm -rf /var/www/html/install
   ```

## Project Structure

```
prestashop-catalogue/
├── theme/                      # Minimalist theme
│   ├── css/
│   │   └── theme.css          # Main stylesheet with CSS variables
│   ├── js/
│   │   └── theme.js           # Theme JavaScript for menu interactions
│   ├── templates/
│   │   ├── _partials/         # Header, footer, etc.
│   │   ├── catalog/           # Product and category templates
│   │   ├── layouts/           # Page layouts
│   │   └── index.tpl          # Homepage
│   ├── assets/                # Images and fonts
│   └── theme.yml              # Theme configuration
├── docker-compose.yml          # Docker services configuration
├── nginx.conf                  # Nginx configuration
├── .env.example               # Environment variables template
├── DEPLOYMENT.md              # Production deployment guide
├── THEME_CUSTOMIZATION.md     # Theme customization guide
└── README.md                  # This file
```

## Theme Features

### Dual-Row Menu
- **Row 1**: Main categories (horizontally centered, always visible)
- **Row 2**: Subcategories for active category (horizontally centered, always visible)
- Responsive: Collapses to mobile menu on small screens
- JavaScript-powered dynamic subcategory switching

### Product Grid
- **Desktop**: 4 columns with hover effects
- **Tablet**: 2 columns
- **Mobile**: 1 column
- Clean product cards with image, title, and description
- No prices displayed
- Lazy loading for images

### Minimalist Design
- Clean lines and ample whitespace
- Modern sans-serif typography
- High contrast (black on white)
- Smooth transitions and hover effects
- Mobile-first responsive design

## Configuration

### Environment Variables
Edit `.env` file to configure:

```env
# Database
MYSQL_ROOT_PASSWORD=root_pass
MYSQL_DATABASE=prestashop_db
MYSQL_USER=prestashop
MYSQL_PASSWORD=prestashop_pass

# PrestaShop
PS_DOMAIN=localhost:8080
PS_PORT=8080
ADMIN_MAIL=admin@example.com
ADMIN_PASSWD=admin123

# Development (set to 0 for production)
PS_DEV_MODE=0
```

### Category Structure
The theme is designed for:
- **10 main categories** (displayed in row 1)
- **~10 subcategories per category** (displayed in row 2)
- **~500 products** total

To set up categories:
1. Go to **Catalog > Categories** in Admin
2. Create main categories
3. For each category, create subcategories
4. Upload category images (optional)

### Import Products
1. Prepare CSV file with product data
2. Go to **Advanced Parameters > Import**
3. Select "Products" entity
4. Map CSV columns to PrestaShop fields
5. Import products

Sample CSV structure:
```csv
ID,Name,Description,Category,Image URL
1,Product 1,Description text,Category Name,https://example.com/image.jpg
```

## Customization

### Colors
Edit `theme/css/theme.css`:

```css
:root {
  --color-primary: #000000;      /* Black */
  --color-secondary: #ffffff;    /* White */
  --color-text: #333333;         /* Text color */
  --color-border: #e0e0e0;       /* Borders */
}
```

### Typography
```css
:root {
  --font-primary: 'Helvetica Neue', Arial, sans-serif;
  --font-size-base: 16px;
}
```

### Product Grid Columns
```css
.products {
  grid-template-columns: repeat(4, 1fr);  /* Change 4 to desired columns */
}
```

For detailed customization instructions, see [THEME_CUSTOMIZATION.md](THEME_CUSTOMIZATION.md)

## Docker Services

### Services Overview
- **prestashop**: PrestaShop application (port 8080)
- **db**: MySQL 5.7 database
- **nginx**: Nginx reverse proxy (port 80)

### Useful Commands

```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# View logs
docker-compose logs -f

# Restart specific service
docker-compose restart prestashop

# Access PrestaShop container
docker exec -it prestashop_app bash

# Access database
docker exec -it prestashop_db mysql -u prestashop -p

# Backup database
docker exec prestashop_db mysqldump -u root -proot_pass prestashop_db > backup.sql

# Restore database
docker exec -i prestashop_db mysql -u root -proot_pass prestashop_db < backup.sql
```

## Production Deployment

For production deployment with SSL, monitoring, and optimization, see [DEPLOYMENT.md](DEPLOYMENT.md)

Key production considerations:
- Use strong passwords
- Enable HTTPS with SSL certificate
- Configure firewall
- Set up regular backups
- Enable caching and optimization
- Monitor resources and logs

## Performance

The setup includes several performance optimizations:
- Nginx reverse proxy with caching
- Gzip compression
- Static file caching (30 days)
- Image lazy loading
- CSS/JS minification (in PrestaShop settings)
- Database optimization

## Maintenance

### Clear Cache
```bash
# Via Admin Panel
Advanced Parameters > Performance > Clear cache

# Via command line
docker exec -it prestashop_app rm -rf /var/www/html/var/cache/*
```

### Backup
```bash
# Backup script (recommended to run daily)
./backup.sh  # Create this script based on DEPLOYMENT.md
```

### Updates
```bash
# Update Docker images
docker-compose pull
docker-compose up -d
```

## Troubleshooting

### Services won't start
```bash
# Check logs
docker-compose logs

# Check ports
sudo netstat -tulpn | grep :80
sudo netstat -tulpn | grep :8080

# Restart services
docker-compose restart
```

### Theme not loading
```bash
# Fix permissions
docker exec -it prestashop_app chown -R www-data:www-data /var/www/html/themes/minimalist_catalogue

# Clear cache
docker exec -it prestashop_app rm -rf /var/www/html/var/cache/*
```

### Database connection error
- Verify database credentials in `.env`
- Check if database container is running: `docker-compose ps`
- Check database logs: `docker-compose logs db`

## Browser Support

- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

## Documentation

- [DEPLOYMENT.md](DEPLOYMENT.md) - Production deployment guide
- [THEME_CUSTOMIZATION.md](THEME_CUSTOMIZATION.md) - Theme customization guide
- [PrestaShop Documentation](https://doc.prestashop.com/)

## License

This project is open source and available under the MIT License.

## Support

For issues, questions, or contributions:
- Open an issue on GitHub
- Check existing documentation
- Review PrestaShop community forums

## Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Credits

- Built with [PrestaShop](https://www.prestashop.com/)
- Theme developed by Aerial Net
- Docker configuration optimized for self-hosting

## Changelog

### Version 1.0.0
- Initial release
- Minimalist theme with dual-row navigation
- Responsive product grid (4/2/1 columns)
- Docker-based deployment
- Complete documentation
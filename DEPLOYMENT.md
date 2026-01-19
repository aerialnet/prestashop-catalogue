# PrestaShop Minimalist Catalogue - Deployment Guide

## Overview
This guide covers deploying the PrestaShop Minimalist Catalogue to a production server using Docker.

## Prerequisites
- A server with Docker and Docker Compose installed
- Domain name (optional, but recommended)
- SSL certificate (recommended for production)
- Minimum server requirements:
  - 2 GB RAM
  - 2 CPU cores
  - 20 GB disk space

## Pre-Deployment Steps

### 1. Server Setup
```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add user to docker group
sudo usermod -aG docker $USER
newgrp docker
```

### 2. Clone Repository
```bash
git clone https://github.com/aerialnet/prestashop-catalogue.git
cd prestashop-catalogue
```

### 3. Configure Environment
```bash
# Copy environment file
cp .env.example .env

# Edit configuration
nano .env
```

Update the following variables in `.env`:
```env
# Use strong passwords in production
MYSQL_ROOT_PASSWORD=your_strong_root_password
MYSQL_PASSWORD=your_strong_db_password
ADMIN_PASSWD=your_strong_admin_password

# Set your domain
PS_DOMAIN=yourdomain.com

# Admin email
ADMIN_MAIL=your_email@yourdomain.com

# For production, disable dev mode
PS_DEV_MODE=0

# If using SSL (recommended)
PS_ENABLE_SSL=1
```

## Deployment

### 1. Start Services
```bash
# Start all services in detached mode
docker-compose up -d

# Check service status
docker-compose ps

# View logs
docker-compose logs -f
```

### 2. Initial PrestaShop Installation
1. Open your browser and navigate to `http://your-domain.com:8080` (or configured port)
2. Follow the PrestaShop installation wizard:
   - Select language
   - Accept terms
   - Check system requirements
   - Configure database (use values from .env file):
     - Database server: `db`
     - Database name: value of `MYSQL_DATABASE`
     - Database user: value of `MYSQL_USER`
     - Database password: value of `MYSQL_PASSWORD`
   - Create admin account
   - Complete installation

### 3. Install Minimalist Theme
```bash
# The theme is automatically mounted at /var/www/html/themes/minimalist_catalogue

# Access PrestaShop container
docker exec -it prestashop_app bash

# Set proper permissions
chown -R www-data:www-data /var/www/html/themes/minimalist_catalogue
chmod -R 755 /var/www/html/themes/minimalist_catalogue

exit
```

Then in PrestaShop Admin Panel:
1. Go to **Design > Theme & Logo**
2. Find "Minimalist Catalogue" theme
3. Click **"Use this theme"**
4. Clear cache: **Advanced Parameters > Performance > Clear cache**

### 4. Remove Installation Directory
```bash
docker exec -it prestashop_app bash
rm -rf /var/www/html/install
exit
```

## SSL/HTTPS Setup (Recommended)

### Using Let's Encrypt with Certbot
```bash
# Install Certbot
sudo apt install certbot python3-certbot-nginx -y

# Stop nginx temporarily
docker-compose stop nginx

# Obtain certificate
sudo certbot certonly --standalone -d yourdomain.com

# Update nginx configuration to use SSL
# Edit nginx.conf to add SSL configuration
```

### Update docker-compose.yml for SSL
Add to nginx service:
```yaml
volumes:
  - ./nginx.conf:/etc/nginx/conf.d/default.conf:ro
  - /etc/letsencrypt:/etc/letsencrypt:ro
  - prestashop_data:/var/www/html:ro
ports:
  - "80:80"
  - "443:443"
```

## Post-Deployment Configuration

### 1. Configure PrestaShop Settings
In Admin Panel:
- **Shop Parameters > General**: Configure shop details
- **Shop Parameters > Traffic & SEO**: Enable friendly URLs
- **Design > Theme & Logo**: Upload logo
- **International > Localization**: Set timezone, currency

### 2. Configure Categories
1. Go to **Catalog > Categories**
2. Create your main categories (10 categories as per requirements)
3. For each category, create subcategories (~10 subcategories)
4. Upload category images

### 3. Import Products
1. Go to **Catalog > Products**
2. Use **Import** feature or create manually
3. Ensure products have:
   - Name
   - Description
   - Images
   - Category assignment

### 4. Hide Prices
The theme already hides prices via CSS. To ensure prices don't show:
1. The `theme.css` includes: `.product-price-and-shipping { display: none !important; }`
2. Verify in Product page templates

## Maintenance

### Backup
```bash
# Backup database
docker exec prestashop_db mysqldump -u root -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} > backup_$(date +%Y%m%d).sql

# Backup volumes
docker run --rm -v prestashop_data:/data -v $(pwd):/backup ubuntu tar czf /backup/prestashop_backup_$(date +%Y%m%d).tar.gz /data
```

### Updates
```bash
# Pull latest images
docker-compose pull

# Restart services
docker-compose down
docker-compose up -d
```

### View Logs
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f prestashop
docker-compose logs -f db
docker-compose logs -f nginx
```

### Restart Services
```bash
# Restart all
docker-compose restart

# Restart specific service
docker-compose restart prestashop
```

## Performance Optimization

### 1. Enable Caching
In PrestaShop Admin:
- **Advanced Parameters > Performance**
- Enable Smarty cache
- Enable CSS/JS optimization
- Set appropriate cache lifetimes

### 2. Optimize Database
```bash
docker exec -it prestashop_db mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "OPTIMIZE TABLE ${MYSQL_DATABASE}.*"
```

### 3. Configure Nginx Caching
Update `nginx.conf` with appropriate cache headers (already included in provided config)

## Troubleshooting

### Container Won't Start
```bash
# Check logs
docker-compose logs

# Check disk space
df -h

# Verify ports are not in use
sudo netstat -tulpn | grep :80
sudo netstat -tulpn | grep :8080
```

### Database Connection Issues
```bash
# Verify database is running
docker-compose ps db

# Check database logs
docker-compose logs db

# Test database connection
docker exec -it prestashop_db mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}
```

### Permission Issues
```bash
# Fix permissions
docker exec -it prestashop_app bash
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
```

### Theme Not Loading
```bash
# Clear PrestaShop cache
docker exec -it prestashop_app bash
rm -rf /var/www/html/var/cache/*
```

## Security Best Practices

1. **Change Default Passwords**: Use strong, unique passwords for all accounts
2. **Enable SSL/HTTPS**: Always use HTTPS in production
3. **Regular Updates**: Keep Docker images and PrestaShop updated
4. **Firewall**: Configure firewall to allow only necessary ports
5. **Admin Folder**: Rename admin folder after installation
6. **Backups**: Maintain regular backups
7. **Monitoring**: Set up monitoring and alerts

## Monitoring

### Health Checks
```bash
# Check service health
docker-compose ps

# Check resource usage
docker stats
```

### Set Up Monitoring (Optional)
Consider using monitoring tools like:
- Prometheus + Grafana
- Datadog
- New Relic

## Scaling (Optional)

For high traffic, consider:
1. Load balancing with multiple PrestaShop instances
2. Database replication
3. CDN for static assets
4. Redis/Memcached for caching

## Support

For issues or questions:
1. Check PrestaShop documentation: https://doc.prestashop.com/
2. Review Docker logs
3. Check GitHub issues
4. Contact support team

## Additional Resources

- PrestaShop Documentation: https://doc.prestashop.com/
- Docker Documentation: https://docs.docker.com/
- Nginx Documentation: https://nginx.org/en/docs/

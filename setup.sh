# PrestaShop Minimalist Catalogue
# Configuration Helper Script

echo "==================================="
echo "PrestaShop Catalogue Setup Helper"
echo "==================================="
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    echo "Visit: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    echo "Visit: https://docs.docker.com/compose/install/"
    exit 1
fi

echo "✅ Docker and Docker Compose are installed"
echo ""

# Check if .env file exists
if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp .env.example .env
    echo "✅ .env file created. Please edit it with your configuration."
    echo ""
fi

# Display current configuration
if [ -f .env ]; then
    echo "📋 Current Configuration:"
    echo "------------------------"
    grep -E "^PS_DOMAIN=|^PS_PORT=|^MYSQL_DATABASE=" .env | sed 's/^/  /'
    echo ""
fi

echo "🚀 Available Commands:"
echo "----------------------"
echo "  docker-compose up -d          # Start all services"
echo "  docker-compose down           # Stop all services"
echo "  docker-compose logs -f        # View logs"
echo "  docker-compose restart        # Restart services"
echo "  docker-compose ps             # Check service status"
echo ""

echo "📚 Documentation:"
echo "-----------------"
echo "  README.md                     # Getting started guide"
echo "  DEPLOYMENT.md                 # Production deployment"
echo "  THEME_CUSTOMIZATION.md        # Customize the theme"
echo "  PRODUCT_IMPORT.md             # Import products"
echo ""

echo "🌐 Access URLs (after starting):"
echo "--------------------------------"
source .env 2>/dev/null || true
PS_PORT=${PS_PORT:-8080}
echo "  Frontend: http://localhost:${PS_PORT}"
echo "  Admin:    http://localhost:${PS_PORT}/admin"
echo ""

echo "💡 Next Steps:"
echo "--------------"
echo "1. Review and edit .env file if needed"
echo "2. Run: docker-compose up -d"
echo "3. Wait for services to start (2-3 minutes)"
echo "4. Access PrestaShop and complete installation"
echo "5. Install the Minimalist Catalogue theme"
echo ""

read -p "Do you want to start the services now? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🚀 Starting services..."
    docker-compose up -d
    echo ""
    echo "✅ Services started! Please wait 2-3 minutes for PrestaShop to initialize."
    echo "📱 Access: http://localhost:${PS_PORT}"
    echo ""
    echo "📊 Checking service status..."
    sleep 5
    docker-compose ps
fi

# PrestaShop Catalogue

## Overview
This project is a comprehensive catalogue solution built on PrestaShop, intended to streamline product management and enhance e-commerce engagement.

## Setup Instructions for Docker Deployment
To run the PrestaShop Catalogue using Docker, follow these steps:

1. **Install Docker and Docker Compose**: Make sure you have Docker and Docker Compose installed on your system. You can download them from the official Docker website.

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/aerialnet/prestashop-catalogue.git
   cd prestashop-catalogue
   ```

3. **Create a `docker-compose.yml` File**: Create a file named `docker-compose.yml` in your project root directory with the following content:
   ```yaml
   version: '3.8'
   services:
     prestashop:
       image: prestashop/prestashop:latest
       restart: always
       ports:
         - "8080:80"
       environment:
         PS_DEV_MODE: '1'
         DB_HOST: db
         DB_USER: prestashop
         DB_PASSWORD: your_password_here
         DB_NAME: prestashop
       volumes:
         - prestashop_data:/var/www/html
     db:
       image: mysql:5.7
       restart: always
       environment:
         MYSQL_ROOT_PASSWORD: your_password_here
         MYSQL_DATABASE: prestashop
         MYSQL_USER: prestashop
         MYSQL_PASSWORD: your_password_here
       volumes:
         - db_data:/var/lib/mysql
   volumes:
     prestashop_data:
     db_data:
   ```

4. **Build and Run the Docker Containers**:
   ```bash
   docker-compose up -d
   ```

5. **Access the Application**: Once the containers are running, you can access the PrestaShop application in your web browser at `http://localhost:8080`. Follow the on-screen instructions to complete the setup.

## Customization Guide
To customize your PrestaShop Catalogue:
- You can find all configuration files in the `config/` directory.
- To change themes or modules, navigate to the `themes/` and `modules/` directories respectively.
- For more advanced customizations, refer to the official PrestaShop documentation.

## Contribution
Feel free to contribute to this project by forking the repository and submitting pull requests. Make sure to follow the coding standards outlined in the project's documentation.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

# PrestaShop Minimalist Theme Setup Instructions

## Overview
This repository contains a minimalist PrestaShop theme, featuring a dual-row category menu, responsive product grid, and a Docker setup.

## Requirements
Make sure you have installed the following:
- Docker
- Docker Compose
- PrestaShop compatible with this theme

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/aerialnet/prestashop-catalogue.git
   ```
2. Navigate to the project directory:
   ```bash
   cd prestashop-catalogue
   ```
3. Build the Docker image:
   ```bash
   docker build -t prestashop-minimalist .
   ```
4. Run Docker Compose:
   ```bash
   docker-compose up
   ```
5. Access PrestaShop at `http://localhost:8000`
6. Install the theme in your PrestaShop admin panel.

## Deployment
Follow the instructions in `DEPLOYMENT.md` for deploying on a production server.
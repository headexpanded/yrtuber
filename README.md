# yrtuber

A full-stack application built with Laravel 12 backend and Quasar 2 frontend.

## Architecture

- **Backend**: Laravel 12 (PHP 8.3)
- **Frontend**: Quasar 2 (Vue 3 + TypeScript)
- **Web Server**: Nginx
- **Database**: MySQL 8.4
- **Containerization**: Docker & Docker Compose

## Prerequisites

- Docker
- Docker Compose
- Git

## Quick Start

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd yrtuber
   ```

2. **Set up environment variables**
   ```bash
   cp env.example .env
   # Edit .env file with your preferred values
   ```

3. **Build and start the containers**
   ```bash
   docker compose up -d --build
   ```

4. **Access the applications**
    - Backend API: http://localhost:8000
    - Frontend: http://localhost:8080
    - MySQL: localhost:3306

## Services

### Backend (Laravel)
- **Port**: 8000
- **Database**: MySQL 8.0
- **PHP Version**: 8.3
- **Framework**: Laravel 12

### Frontend (Quasar)
- **Port**: 8080
- **Framework**: Vue 3 + TypeScript
- **UI Framework**: Quasar 2

### Database (MySQL)
- **Port**: 3306
- **Version**: 8.4
- **Data Persistence**: Docker volume

## Environment Variables

Create a `.env` file in the root directory with the following variables:

```env
# Database Configuration
DB_DATABASE=yrtuber
DB_USERNAME=laravel
DB_PASSWORD=password
DB_HOST=mysql
DB_PORT=3306

# MySQL Root Password
MYSQL_ROOT_PASSWORD=root_password

# Laravel Configuration
APP_ENV=local
APP_DEBUG=true
APP_KEY=
APP_NAME="yrtuber"
APP_URL=http://localhost:8000

# Frontend Configuration
FRONTEND_URL=http://localhost:8080
```

## Docker Commands

### Start services
```bash
docker compose up
```

### Start services in background
```bash
docker compose up -d
```

### Stop services
```bash
docker compose down
```

### Rebuild containers
```bash
docker compose up -d --build
```

### View logs
```bash
docker compose logs -f
```

### Access container shell
```bash
# Backend
docker compose exec php-fpm bash

# Frontend
docker compose exec frontend sh

# Database
docker compose exec mysql mysql -u root -p
```

## Development

### Backend Development
The Laravel application is mounted as a volume, so changes are reflected immediately.

### Frontend Development
The Quasar application is mounted as a volume with hot reload enabled.

### Database
- Data is persisted in a Docker volume
- To reset the database: `docker-compose down -v && docker-compose up`

## Troubleshooting

### Common Issues

1. **Port conflicts**
    - Ensure ports 8000, 8080, and 3306 are available
    - Change ports in `docker-compose.yaml` if needed

2. **Permission issues**
    - The backend container runs as user `www` (UID 1000)
    - Ensure proper file permissions on the host

3. **Database connection issues**
    - Wait for MySQL to fully start (health check)
    - Verify environment variables in `.env`

4. **Frontend not accessible**
    - Check if Quasar dev server is running
    - Verify port 8080 is not blocked

### Health Checks
All services include health checks to ensure proper startup order:
- MySQL: Checks if database is accepting connections
- PHP-FPM: Validates PHP-FPM configuration
- Frontend: Verifies Quasar dev server is responding

## Production Deployment

For production deployment:
1. Use production-ready images
2. Set `APP_ENV=production`
3. Configure proper SSL certificates
4. Use environment-specific `.env` files
5. Consider using Docker Swarm or Kubernetes

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with Docker
5. Submit a pull request 

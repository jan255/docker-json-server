# Docker JSON Server Project

## Overview
This project provides a lightweight Docker container running [json-server](https://github.com/typicode/json-server), which creates a full fake REST API from a JSON file with zero coding required.

## Architecture

### Core Components
- **Base Image**: Node.js 10 Alpine (lightweight Linux distribution)
- **Main Tool**: json-server (npm package installed globally)
- **Container Port**: 3000
- **Data Volume**: `/data` directory mounted from host

### Key Files
- `Dockerfile` - Container build configuration
- `db.json` - Sample JSON database with posts, comments, and profile data
- `data/db.json` - Additional example database file
- `README.md` - Basic usage instructions

## How It Works

1. Docker container exposes port 3000
2. Local directory containing JSON files is mounted to `/data` in the container
3. json-server watches the specified JSON file and creates REST endpoints automatically
4. Access the API at `http://localhost:3000`

## Usage

### Building the Image
```bash
docker build -t json-server .
```

### Running the Container
```bash
docker run -p 3000:3000 -v /path/to/your/data:/data json-server --watch db.json
```

Replace `/path/to/your/data` with the path to your local directory containing JSON files.

### Available Endpoints
Based on `db.json`, the following endpoints are automatically created:
- `GET /posts` - List all posts
- `GET /posts/:id` - Get specific post
- `POST /posts` - Create new post
- `PUT /posts/:id` - Update post
- `DELETE /posts/:id` - Delete post
- Similar CRUD operations for `/comments` and `/profile`

## Development Notes

### Docker Configuration
- Entrypoint is set to `json-server --host 0.0.0.0` to bind to all interfaces
- NPM is removed after installation to reduce image size
- Volume mount at `/data` allows persistent data storage
- Working directory is set to `/data`

### JSON Database Structure
The sample database (`db.json`) contains:
- **posts**: Array of post objects with id, title, and author
- **comments**: Array of comment objects with id, body, and postId
- **profile**: Single object with user profile information

## Important Conventions
- Always mount your data directory with the `-v` flag
- Specify the JSON file to watch with the `--watch` flag
- The container expects JSON files in the mounted `/data` directory
- Port 3000 is exposed by default

## Custom Commands
- `/build` - Build the Docker image for the json-server project

# Docker CI Automation

> Automation is the cornerstone of DevOps practices

This repository demonstrates a simple CI pipeline using Docker with a basic Express.js API application.

## Overview

This example showcases a minimalist Express.js API with health check endpoints, containerized using Docker. It serves as a practical demonstration of implementing continuous integration practices with Docker.

## Prerequisites

- Node.js (v16 or higher)
- Docker
- Git

## Getting Started

### Installation

1. Install dependencies:

```bash
npm install
```

### Running Locally

Start the server:

```bash
npm start
```

The server will be available at `http://localhost:3000`

### Environment Variables

The application supports the following environment variables:

- `PORT`: Server port (default: 3000)

## API Endpoints

### Root Endpoint

```
GET /
```

Returns a welcome message.

**Response**: Status 200

```
"this is docker automation ci pipeline examples!"
```

### Health Check

```
GET /health
```

Returns the API health status.

**Response**: Status 200

```json
{
  "status": "OK"
}
```

## Docker Support

### Building the Image

```bash
docker build -t docker-ci-demo .
```

### Running the Container

```bash
docker run -p 3000:3000 docker-ci-demo
```

## Code Example

```javascript
// src/app.js
import express from "express";

const app = express();
const serverPort = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({ extends: false }));

app.get("/", (req, res) => {
  res.status(200).send("this is docker automation ci pipeline examples!");
});

app.get("/health", (req, res) => {
  res.status(200).json({
    status: "OK",
  });
});

app.listen(3000, () => {
  console.log(`The Server is up and running on http://localhost:${serverPort}`);
});
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

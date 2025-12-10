# Testing - Performance & Integration Tests

This folder contains all testing configurations used across levels.

## Structure

```
testing/
└── performance/          # K6 load testing scripts
    ├── .env             # Configuration (BASE_URL)
    ├── load_test.js     # Basic health check test
    └── mesh-distribution-test.js  # Error distribution test (Level 4)
```

## Usage

### Running Tests

```bash
cd testing/performance
k6 run load_test.js
```

### Configuration

Edit `.env` file to change target URL:
```bash
BASE_URL=http://els-server.local/_health
```

## Test Scripts

- **load_test.js**: Simple health check, 10 concurrent users, 1.5 minutes
- **mesh-distribution-test.js**: Error distribution testing (runs inside Kubernetes)

## Notes

- All test scripts are designed for production environments
- Tests use internal service URLs when run inside cluster
- Learning guides for testing are in `level-4/`

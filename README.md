# Reactivated Example Project

A development environment using Docker Compose that's fully compatible with GitHub Codespaces.

## Getting Started

- Activate python virtual environment: `source .venv/bin/activate`
- Start django dev server: `npm run dev`
- Build Reactivated app: `npm run build`

## Environment

### App Specifications

- **Python**: 3.12.1
- **Node.js**: 18.18.2
- **uv**: 0.7.10
- **PostgreSQL**: 15.7
- **Reactivated**: 0.47.0

### Env Vars

- **8787**: Django development server
- Other environment details available in `.env`

### VS Code Extensions (Auto-installed in Codespaces)

- **Python Support**: Full Python development with mypy type checking
- **Black Formatter**: Python code formatting
- **Flake8**: Python linting
- **Autoflake**: Remove unused imports
- **Prettier**: JavaScript/TypeScript formatting
- **ESLint**: JavaScript/TypeScript linting

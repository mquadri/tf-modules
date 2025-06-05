## Using Docker Compose for Testing

This document explains how to use the provided `docker-compose.test.yml` file to set up and manage services required for testing your application.

### Overview

The `docker-compose.test.yml` file defines a set of services that can be easily started and stopped for testing purposes. This ensures a consistent and isolated environment for your tests.

The defined services are:

*   **`postgres_db`**: A PostgreSQL database instance.
    *   Accessible on `localhost:5432`.
    *   Credentials: `testuser`/`testpassword`.
    *   Database name: `testdb`.
*   **`redis_cache`**: A Redis cache instance.
    *   Accessible on `localhost:6379`.

### Typical Workflow

Here's how a developer would typically use this Docker Compose setup:

1.  **Start the Services:**
    Before running tests, navigate to the directory containing the `docker-compose.test.yml` file in your terminal and execute the following command:

    ```bash
    docker-compose -f docker-compose.test.yml up -d
    ```

    *   `docker-compose -f docker-compose.test.yml`: This tells Docker Compose to use the specified YAML file.
    *   `up`: This command creates and starts the containers defined in the YAML file.
    *   `-d`: This flag runs the containers in detached mode, meaning they run in the background.

    This command will download the necessary images (if not already present) and start the PostgreSQL and Redis containers.

2.  **Configure Your Application:**
    Your application (whether it's running locally on your host machine or as another container) needs to be configured to connect to these services. Since the services are mapped to fixed ports on your `localhost`, you would typically configure your application as follows:

    *   **PostgreSQL Connection:**
        *   Host: `localhost`
        *   Port: `5432`
        *   Username: `testuser`
        *   Password: `testpassword`
        *   Database: `testdb`
    *   **Redis Connection:**
        *   Host: `localhost`
        *   Port: `6379`

    If your application is also containerized (like the commented-out `app` service in `docker-compose.test.yml`), you would use the service names (`postgres_db`, `redis_cache`) as hostnames for inter-container communication, and Docker Compose's internal DNS will resolve them.

3.  **Run Your Tests:**
    With the services running and your application configured, you can now execute your test suite. Your tests will interact with the PostgreSQL database and Redis cache running in the Docker containers.

4.  **Stop the Services:**
    After your tests are complete, you should stop and remove the containers to free up resources. To do this, run the following command from the same directory:

    ```bash
    docker-compose -f docker-compose.test.yml down
    ```

    *   `down`: This command stops and removes the containers, networks, and volumes created by `up`. If you want to preserve the data in the volumes (e.g., `postgres_data`, `redis_data`), you can omit the `-v` flag (which is not used here by default, so data is preserved unless volumes are explicitly removed).

### Benefits

*   **Isolation:** Services run in isolated containers, preventing conflicts with local installations or other projects.
*   **Consistency:** Ensures all developers and CI/CD environments use the same service versions and configurations.
*   **Ease of Use:** Simplifies the setup and teardown of complex testing environments.
*   **Cleanliness:** Keeps your local development machine clean, as services are managed within Docker.

This setup provides a robust and reproducible environment for running application tests that depend on external services like databases and caches.

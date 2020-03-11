# Calendar

Name to be determined — what if we could add a URL to a calendar event for RSVPing?

## Running in development

Use [Docker](https://www.docker.com/) to run the application in development.

Once Docker is installed, run:

```bash
# Build the docker images
docker-compose build

# Create the databases
docker-compose run web rake db:create

# Run migrations
docker-compose run web rake db:migrate

# Boot the application
docker-compose up
```

Then, the application is available at http://localhost:3000/.

Use <kbd>Control</kbd> + <kbd>C</kbd> to shutdown the app.

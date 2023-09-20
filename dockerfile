FROM docker:stable



# Create a directory for your scripts
WORKDIR /app
ADD main.sh cleanup.sh ./

# Set an environment variable for the cron frequency (in seconds)
ENV FREQUENCY 300


ENTRYPOINT [ "/app/main.sh" ]

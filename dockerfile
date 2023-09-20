FROM docker:stable

# Install cron and any other necessary tools
RUN apk --no-cache add dcron

# Create a directory for your scripts
WORKDIR /app
ADD main.sh cleanup.sh ./

# Set an environment variable for the cron frequency (in seconds)
ENV FREQUENCY 300

# Add a cron job to the crontab
RUN echo "*/5 * * * * /bin/sh -c '/app/cleanup.sh'" >> /etc/crontabs/root

# Start the cron service when the container runs
CMD ["crond", "-f"]

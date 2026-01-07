# Base Node image
FROM node:lts-alpine

# Install Chromium and minimal system dependencies
RUN apk add --no-cache \
    chromium   

RUN apk update --all && apk upgrade --all


# Set working directory
WORKDIR /usr/src/app

# Copy project files (if any)
COPY . .


# Set environment variables for Chrome
ENV CHROME_PATH=/usr/bin/chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Default command — you can override this in derived images
CMD ["node", "--version"]

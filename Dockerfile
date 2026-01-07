# Base Node image
FROM node:lts-alpine

# Install Chromium and minimal system dependencies
RUN apk add --no-cache chromium glob

# Set working directory
WORKDIR /usr/src/app

# Install latest glob package
RUN npm install -g glob@latest

# Copy project files (if any)
COPY . .


# Set environment variables for Chrome
ENV CHROME_PATH=/usr/bin/chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Default command — you can override this in derived images
CMD ["node", "--version"]

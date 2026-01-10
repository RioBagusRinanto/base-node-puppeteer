FROM node:lts-alpine

# Install Chromium and required fonts in a single layer
# Keep packages to a minimum for smaller images
RUN apk add --no-cache \
    chromium \
    ttf-freefont \
    msttcorefonts-installer

# App directory
WORKDIR /usr/src/app

# Copy project files
COPY . .

# Puppeteer/Chrome settings
ENV CHROME_PATH=/usr/bin/chromium \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Default command (inspect node version by default)
CMD ["node", "--version"]

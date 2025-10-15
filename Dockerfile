# Base Node image (Debian-based for apt support)
FROM node:trixie-slim

# Install Chromium and minimal system dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    lsb-release \
    wget \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*


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

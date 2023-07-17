FROM ghcr.io/puppeteer/puppeteer:20.8.0

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

WORKDIR /usr/server/index

COPY package*.json ./
COPY yarn.lock ./
RUN npm ci
COPY . .
CMD ["node", "run start-server"]
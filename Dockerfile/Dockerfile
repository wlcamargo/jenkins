FROM jenkins/jenkins:jdk17

USER root

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    libnss3 \
    libgconf-2-4 \
    wget \
    unzip \
    curl \
    gnupg \
    file  # Adiciona o comando 'file'

# Instalar Google Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable

# Instalar chromedriver
RUN CHROMEDRIVER_VERSION=$(curl -sS https://chromedriver.storage.googleapis.com/LATEST_RELEASE) \
    && wget -q "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
    && unzip chromedriver_linux64.zip \
    && mv chromedriver /usr/local/bin/chromedriver \
    && chmod +x /usr/local/bin/chromedriver \
    && rm chromedriver_linux64.zip

# Configure o Jenkins para usar o usuário padrão
USER jenkins

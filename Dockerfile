FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-full \
    build-essential \
    curl \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

COPY requirements.txt .

# Create and activate virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install requirements in the virtual environment
RUN pip install --no-cache-dir -r requirements.txt

USER jenkins

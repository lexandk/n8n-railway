FROM n8nio/n8n:1.107.2-debian

USER root

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    python3 python3-pip \
    poppler-utils \
    ghostscript \
    ffmpeg \
    fonts-noto-color-emoji \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    markdown-it-py \
    pdfminer.six \
    PyPDF2 \
    pandas numpy \
    openpyxl \
    pillow

USER node

FROM n8nio/n8n:1.107.2

USER root
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base

RUN pip3 install --no-cache-dir \
    markdown-it-py \
    pdfminer.six \
    PyPDF2 \
    pandas \
    numpy \
    openpyxl \
    pillow

USER node

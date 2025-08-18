# --- Base n8n (pin ke versi stabil) ---
FROM n8nio/n8n:1.107.2

# --- Install tools & libs umum ---
USER root
# Catatan: Image n8n terbaru berbasis Debian/Ubuntu. Gunakan apt-get.
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    python3 python3-pip \
    poppler-utils \            # pdftotext, pdfimages (buat parsing PDF)
    ghostscript \              # util PDF tambahan
    ffmpeg \                   # olah audio/video (kadang perlu)
    fonts-noto-color-emoji \   # supaya render emoji gak kotak
    build-essential \          # kompiler buat native node modules
    && rm -rf /var/lib/apt/lists/*

# --- Python packages sering dipakai ---
RUN pip3 install --no-cache-dir \
    markitdown[all] \          # convert doc/html/pdf -> markdown/text (lightweight)
    pdfminer.six \             # parser PDF berbasis text
    PyPDF2 \                   # util PDF sederhana (merge/split/read)
    pandas numpy \             # olah tabel/CSV
    openpyxl \                 # baca/tulis Excel
    pillow                     # olah gambar dasar

# Kembali ke user default n8n
USER node

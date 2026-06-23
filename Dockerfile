FROM quay.io/lyfe00011/md:beta

# 1. Install missing Linux utilities (fixes 'spawn ps ENOENT')
RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/lyfe00011/levanter.git /root/LyFE/
WORKDIR /root/LyFE/
RUN yarn install

# 2. Block the internal update loop causing the database crash
ENV AUTOVN=false

CMD ["npm", "start"]

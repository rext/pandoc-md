FROM pandoc/latex

RUN apk --no-cache add \
    python2 \
    py2-pip \
    msttcorefonts-installer \
    font-misc-cyrillic && \
    update-ms-fonts && \
    fc-cache -f && \
    pip install MarkdownPP && \
    tlmgr update --self && \
    tlmgr install mdframed \
       etoolbox \
       needspace \
       titling \
       pagecolor \
       adjustbox \
       collectbox && \
    wget https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v1.2.4/Eisvogel-1.2.4.tar.gz && \
    mkdir -p eisvogel /root/.pandoc/templates && \
    tar xzf Eisvogel-1.2.4.tar.gz -C eisvogel && \
    mv eisvogel/eisvogel.tex /root/.pandoc/templates/eisvogel.latex && \
    rm -rf eisvogel && \
    rm Eisvogel-1.2.4.tar.gz
    
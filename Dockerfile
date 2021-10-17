FROM ubuntu

RUN apt-get update

RUN apt-get install -y \
    python3 python3-pip

# Install python-docx for editing the docx files
RUN pip3 install python-docx

# Install Arial fonts (docx files use arial fonts)
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt-get install -y --no-install-recommends \
    fontconfig \
    ttf-mscorefonts-installer
RUN fc-cache -f -v

# Install libreoffice to convert docx to pdf
ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ=Europe/Paris
RUN apt-get install -y --no-install-recommends \
    libreoffice

FROM rocker/rstudio:4.4.2

RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*
    
RUN R -e "install.packages('remotes', repos='https://cloud.r-project.org')"
RUN R -e "remotes::install_version('cowsay', version='0.8.0', repos='http://cran.rstudio.com/')"

COPY . /home/rstudio/
WORKDIR /home/rstudio
EXPOSE 8787

CMD ["/usr/lib/rstudio-server/bin/rserver"]
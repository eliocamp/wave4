# get the base image, the rocker/verse has R, RStudio and pandoc
FROM rocker/verse:4.0.3

# required
MAINTAINER Elio Campitelli <elio.campitelli@cima.fcen.uba.ar>

RUN R -e "devtools::install_github('r-hub/sysreqs')"  

 # install dependencies (copy only description as to not invalidate cache)

COPY ./system-deps.txt /wave4/system-deps.txt
RUN R -e "system(paste('sudo apt update && sudo apt install -y ', paste0(readLines('/wave4/system-deps.txt'), collapse = ' '), collapse = ' '))" 

RUN R -e "install.packages('renv')"  

COPY . /wave4/renv/
COPY ./renv.lock /wave4/renv.lock
RUN R -e "renv::restore('/wave4')"

COPY . /wave4/
RUN R -e "devtools::install('/wave4', dependencies = FALSE)"
RUN R -e "rmarkdown::render('/wave4/analysis/paper/paper.Rmd')"


FROM chendaniely/rstudio_lab:latest

COPY mds-python.sh mds-python.sh
RUN bash mds-python.sh

COPY mds-r.R mds-r.R
RUN Rscript mds-r.R

# install qvm for quarto

RUN wget https://github.com/dpastoor/qvm/releases/download/v0.3.0/qvm_Linux_x86_64.tar.gz -O /tmp/qvm.tar.gz \
    tar xzf /tmp/qvm.tar.gz qvm \
    mv qvm /usr/local/bin/qvm \
    chmod +x /usr/local/bin/qvm

RUN qvm install latest \
    qvm use latest

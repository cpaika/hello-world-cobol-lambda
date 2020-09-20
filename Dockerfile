FROM amazonlinux:2
# Install GNUCobol dependencies
RUN yum install tar gzip wget gcc make libdb-dev libncurses5-dev libgmp-dev gmp gmp-devel autoconf -y

# Install GNUCobol
RUN wget -O gnu-cobol.tar.gz https://sourceforge.net/projects/gnucobol/files/gnucobol/2.2/gnucobol-2.2.tar.gz/download
RUN tar zxf gnu-cobol.tar.gz
WORKDIR gnucobol-2.2
RUN ./configure --without-db
RUN make
RUN make install

WORKDIR /app
RUN mkdir /app/lib

# Need to copy the dynamically linked library
RUN cp /usr/local/lib/libcob.so.4 \
       /app/lib

# Copy and compile the COBOL program
COPY hello.cob .
RUN cobc -x hello.cob
RUN rm hello.cob
FROM amazonlinux:2
RUN yum install tar gzip wget gcc make libdb-dev libncurses5-dev libgmp-dev gmp gmp-devel autoconf -y

RUN wget -O gnu-cobol.tar.gz https://sourceforge.net/projects/gnucobol/files/gnucobol/2.2/gnucobol-2.2.tar.gz/download
RUN tar zxf gnu-cobol.tar.gz

#ENV LD_LIBRARY_PATH=/usr/local/lib
#ENV COB_LDFLAGS='-Wl,--no-as-needed'
WORKDIR gnucobol-2.2
RUN ./configure --without-db
RUN make
RUN make install

WORKDIR /app
RUN mkdir /app/lib
RUN cp /usr/local/lib/libcob.so.4 \
       /app/lib

COPY hello.cob .
RUN echo "Cob: $COB_CFLAGS"
RUN COB_CFLAGS=$(cob-config --cflags) 
RUN COB_LDFLAGS=$(cob-config --libs)
RUN cobc -x hello.cob
RUN rm hello.cob
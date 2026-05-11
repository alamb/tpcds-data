# Run like
# docker build -t tpcdsgen .
# docker run tpcdsgen

FROM rust:1-slim-bullseye

RUN apt update && apt install -y zip gcc make flex bison byacc git

# copy tools directory into container
COPY tools /opt/tools

WORKDIR /opt/tools
# Fix bad UTF-8 char
RUN iconv -f ISO-8859-14 -t UTF-8 tpcds.dst > tpcds.dst2
RUN mv tpcds.dst2 tpcds.dst

# compile with flags to handle multiple definitions
RUN make CC="gcc -fcommon -O3"

# Copy and make gen.sh executable
COPY gen.sh /usr/local/bin/gen.sh
RUN chmod +x /usr/local/bin/gen.sh

ENTRYPOINT ["/bin/bash"]
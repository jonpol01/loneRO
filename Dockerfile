# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

# Set the working directory
WORKDIR /app

# Update the package lists and install prerequisites
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y build-essential zlib1g-dev wget git cmake make gcc g++ gdb zlib-dev mariadb-dev ca-certificates valgrind netcat-openbsd nano && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone rAthena repository
RUN git clone https://github.com/rathena/rathena.git

# Copy sql-files to a new directory
RUN cp -r /app/rathena/sql-files /sql-files

RUN wget https://raw.githubusercontent.com/eficode/wait-for/v2.2.2/wait-for -O /bin/wait-for && chmod +x /bin/wait-for

# Change to the rAthena directory
WORKDIR /app/rathena

ENTRYPOINT [  ]
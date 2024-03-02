FROM ubuntu:latest

# Install updates
RUN apt-get update -y

# Install build tools
RUN apt-get install -y build-essential gdb

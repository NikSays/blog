FROM ubuntu:latest
LABEL authors="ns"

ENTRYPOINT ["top", "-b"]

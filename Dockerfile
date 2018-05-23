FROM python:3

# to use stable release
# RUN pip install netconan

# to use frontline release
RUN pip install git+https://github.com/intentionet/netconan.git

# used to keep /conf/netconan.cfg separated from this container image 
# as well as certain confidential outputs, i.e. ip_map_file, defined in /cconf/netconan.cfg
VOLUME /conf

# input/output in /conf/netconan.cfg, need to be in sync.  TBD in future.
VOLUME /orig
VOLUME /data

CMD netconan \
	-c /conf/netconan.cfg

# to build it:
#     docker build -t netconan .
#
# to run it:
# on Linux:
#     docker run -it --rm -v $PWD/data:/data -v $PWD/orig:/orig -v $PWD/conf:/conf netconan:latest
# on Windows
#     docker run -it --rm -v %CD%/data:/data -v %CD%/orig:/orig -v %CD%/conf:/conf netconan:latest
#
# final anonymized configs are under $PWD/data (Linux) or %CD%/data (Windows) directory.
#
# To Do: 
# 1. aggregate all volumes into one to simplify command line.
# 2. remove sync requirements between in/out volumes and netconan.cfg (depends on #1?)

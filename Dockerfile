FROM python:3

RUN pip install netconan

# following are used as input/output dirs in netconan.config
VOLUME /data
VOLUME /orig
VOLUME /conf

CMD netconan \
	-c /conf/netconan.cfg

# to build it:
# docker build -t netconan .

# to run it:
# docker run -it --rm -v $PWD/data:/data -v $PWD/orig:/orig -v $PWD/conf:/conf netconan:latest
# final anonymized configs are under $PWD/data directory.

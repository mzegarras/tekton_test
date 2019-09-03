FROM openjdk:11-jre-slim

VOLUME /tmp
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    && apt-get install tzdata \
    && apt-get install -y procps \
	   && rm -rf /var/lib/apt/lists/*; \
	    echo America/Lima > /etc/timezone; \
    rm /etc/localtime; \
	dpkg-reconfigure -fnoninteractive tzdata

ADD ./theshire-mocks-app-*.jar app.jar
ADD ./entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

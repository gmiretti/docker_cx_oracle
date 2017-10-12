FROM jupyter/base-notebook

ENV ORACLE_HOME /opt/oracle/instantclient_12_1
ENV LD_RUN_PATH=$ORACLE_HOME

USER root

COPY instantclient/* /tmp/

RUN \
    apt-get update && apt-get install -y unzip python3-pip  libaio1 && rm -rf /var/lib/apt/lists/* && \
	mkdir -p /opt/oracle && \
	unzip "/tmp/instantclient*.zip" -d /opt/oracle && \
	ln -s $ORACLE_HOME/libclntsh.so.12.1 $ORACLE_HOME/libclntsh.so && \
	sh -c "echo $ORACLE_HOME > /etc/ld.so.conf.d/oracle-instantclient.conf"  && \
	ldconfig && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
	pip install --upgrade pip && \
    pip install cx_Oracle


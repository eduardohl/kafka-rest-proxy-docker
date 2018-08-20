FROM centos:7

RUN yum update -y
RUN yum install -y java-1.8.0-openjdk-headless java-1.8.0-openjdk-devel git wget unzip which curl
ENV JAVA_HOME=/usr/lib/jvm/java

ADD confluent.repo /etc/yum.repos.d/confluent.repo
RUN rpm --import https://packages.confluent.io/rpm/3.2/archive.key
RUN yum install confluent-platform-oss-2.11 -y
RUN yum clean all -y

ADD kafka-rest.properties /etc/kafka-rest/kafka-rest.properties
ADD kafka-rest-start /usr/bin/kafka-rest-start
RUN chmod 700 /usr/bin/kafka-rest-start

EXPOSE 8082

CMD [ "/usr/bin/kafka-rest-start", "/etc/kafka-rest/kafka-rest.properties" ]

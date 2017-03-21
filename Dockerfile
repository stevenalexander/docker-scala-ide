FROM java:8-jdk

MAINTAINER NGINX Steven Alexander "steven.william.alexander@googlemail.com"

# Update for new versions
ENV SCALA_VERSION 2.11.7
ENV SBT_VERSION 0.13.8

# Scala
RUN curl -O -L http://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz
RUN tar xzvf scala-${SCALA_VERSION}.tgz
RUN rm scala-${SCALA_VERSION}.tgz

ENV SCALA_HOME /scala-${SCALA_VERSION}
ENV PATH ${SCALA_HOME}/bin:$PATH

# SBT
RUN curl -O -L https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/${SBT_VERSION}/sbt-launch.jar
RUN mv sbt-launch.jar /bin/sbt-launch.jar
COPY sbt /bin/sbt
RUN chmod u+x /bin/sbt

# Get SBT to pull base libraries
RUN sbt info

# scala-ide
RUN curl -O -L http://downloads.typesafe.com/scalaide-pack/4.1.0-vfinal-luna-211-20150525/scala-SDK-4.1.0-vfinal-2.11-linux.gtk.x86_64.tar.gz
RUN tar xzvf scala-SDK-4.1.0-vfinal-2.11-linux.gtk.x86_64.tar.gz
RUN rm scala-SDK-4.1.0-vfinal-2.11-linux.gtk.x86_64.tar.gz

WORKDIR /eclipse

CMD /eclipse/eclipse

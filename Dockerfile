FROM dockiran/kubuntu
ARG APP='simple-mobile-app-mv'
ARG HOME='/root'
RUN mkdir -p $HOME/$APP
RUN apt-get -y update && \
    apt-get -y install curl && \
    apt-get -y install unzip && \
    apt-get -y install less && \
    curl -o $HOME/$APP/openjdk-13.0.2_linux-x64_bin.tar.gz https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz && \
    tar xvfz $HOME/$APP/openjdk-13.0.2_linux-x64_bin.tar.gz -C $HOME/$APP
ENV JAVA_HOME=/root/simple-mobile-app-mv/jdk-13.0.2/bin/java
RUN ln -s $JAVA_HOME /usr/bin/java
RUN java -version && \
    curl --version && \
    curl -o $HOME/$APP/sonarqube-8.1.0.31237.zip https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.1.0.31237.zip \
&& unzip $HOME/$APP/sonarqube-8.1.0.31237.zip -d $HOME/$APP
RUN cd $HOME/$APP/sonarqube-8.1.0.31237/bin/linux-x86-64
RUN ./sonar.sh start
RUN $HOME/$APP/sonarqube-8.1.0.31237/bin/linux-x86-64/sonar.sh status


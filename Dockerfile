from jenkins/jenkins:lts-jdk11
 
USER root
RUN curl https://get.docker.com/ > dockerinstall && chmod 777 dockerinstall && ./dockerinstall
RUN usermod -a -G docker jenkins
RUN usermod -u 1002 jenkins
USER jenkins

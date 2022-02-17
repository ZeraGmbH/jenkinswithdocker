# Jenkins Docker image with internal Docker support

The jenkins user id matches the autobuilder needs.

## UPDATE

```
docker pull jenkins:lts-jdk11
docker build -t $COMPANY/jenkinswithdocker .
docker push $COMPANY/jenkinswithdocker
ssh jenkins@s-zera-build02
docker pull $COMPANY/jenkinswithdocker
```
In case jenkins is running

```
docker kill jenkins
docker rm jenkins
```

content of start-jenkins.sh
```
docker run -d  \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock:rw \
-v /home/jenkins/.netrc:/var/jenkins_home/.netrc \
-v /home/jenkins/.ssh:/var/jenkins_home/.ssh \
-p 8080:8080 -p 50000:50000 \
--name jenkins \
bhamacher/jenkinswithdocker:latest
```




#Setting up SSH Server from the Ubuntu:16.04 base image
FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]


#FROM openjdk:7
#RUN mkdir /usr/assignment/
#Copying the Java source code from our host into the container
#COPY . /usr/assignment/
#WORKDIR /usr/assignment/
#Compiling our java file
#RUN javac SieveOfEratosthenes.java
#Starting our java program in the foreground
#ENTRYPOINT ["javac", "SieveOfEratosthenes.java"]

FROM centos:7

#uncomment this to use docker-ce
#RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo\
# && yum -y install docker-ce iptables\
# && groupadd dockerroot\

RUN yum -y install docker-ce iptables\
 && useradd -M -s /bin/false dockremap\
 && echo "dockremap:524288:65536" >> /etc/subuid\
 && echo "dockremap:524288:65536" >> /etc/subgid\
 && curl -o "/usr/local/bin/dind" "https://raw.githubusercontent.com/docker/docker/master/hack/dind"\
 && curl -o "/usr/local/bin/dockerd-entrypoint.sh" "https://raw.githubusercontent.com/docker-library/docker/master/dockerd-entrypoint.sh"\
 && chmod +x \
    /usr/local/bin/dockerd-entrypoint.sh\
    /usr/local/bin/dind

ADD rootfs /

VOLUME /var/lib/docker
EXPOSE 2375 2376

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []

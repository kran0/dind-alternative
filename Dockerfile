FROM centos:7

ARG DOCKER_PACKAGES=docker
# yum list docker --showduplicates
# 1.13.1-75.git8633870
# 1.13.1-84.git07f3374
# 1.13.1-88.git07f3374
# 1.13.1-91.git07f3374
# 1.13.1-94.gitb2f74b2
# 1.13.1-96.gitb2f74b2

# Yes this Dockerfile works well with docker-ce.
# But docker:dind alpine based image is way better choice.

RUN yum -y install docker iptables openssl\
 && yum clean all && rm -rf /var/cache/yum\
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

FROM ubuntu:14.04
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
# install sshd
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:seecha888'|chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN apt-get install -y git-core build-essential libssl-dev libncurses5-dev unzip
RUN apt-get install -y subversion mercurial
RUN apt-get install -y build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core gettext libssl-dev
RUN mkdir -p /works/git
RUN cd /works/git/
RUN git clone https://git.oschina.net/wenchangshou/openwrt.git /works/git/


EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]

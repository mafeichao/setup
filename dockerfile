FROM centos:centos7

#install basics
RUN yum update -y && \
yum install wget which net-tools.x86_64 gcc gcc-c++ lsof initscripts.x86_64 openssh-server patch unzip -y

#config sshd
##https://www.jianshu.com/p/1b1e56a2ec4f
#yum install openssh-server -y
#vim /etc/ssh/sshd_config
#去掉#Port 22、PermitRootLogin（开启远程登陆） PasswordAuthentication
#RUN echo -e 'Port 22\nPermitRootLogin yes\nPasswordAuthentication yes' >> /etc/ssh/sshd_config && \
#service sshd start

#install git 2.x
##https://www.csdn.net/tags/MtzaYgxsMDAxMy1ibG9n.html
RUN yum -y install http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm && \
yum -y install git

#install cmake 3.x
##https://www.jianshu.com/p/1b71d8048da2
RUN yum -y install epel-release && \
yum install -y cmake3

#install miniconda3
#RUN mkdir /apps && cd /apps
WORKDIR /apps
##https://www.csdn.net/tags/NtzaEgwsNDM1ODItYmxvZwO0O0OO0O0O.html
RUN wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
##https://blog.csdn.net/tcliuwenwen/article/details/108430275
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda && \
$HOME/miniconda/bin/conda init $(echo $SHELL | awk -F '/' '{print $NF}')
#RUN exec bash
##set py36 as default
RUN yes | $HOME/miniconda/bin/conda create -n py36 python===3.6.8
#RUN $HOME/miniconda/bin/conda activate py36
RUN echo "conda activate py36" >> ~/.bashrc && \
yes | $HOME/miniconda/envs/py36/bin/pip install numpy===1.18.5 && \
yes | $HOME/miniconda/envs/py36/bin/pip install keras_preprocessing

#install devtoolset-v8
##https://www.zhangfangzhou.cn/centos7-devtoolset8-gcc.html
RUN yum install centos-release-scl -y && \
yum install devtoolset-8 -y && \
echo "source /opt/rh/devtoolset-8/enable" >> ~/.bashrc
#RUN scl enable devtoolset-8 bash

#install vim8.1
##https://www.cnblogs.com/brooksj/p/10428705.html
RUN yum install ruby ruby-devel lua lua-devel luajit \
luajit-devel ctags git python python-devel \
python36 python36-devel tcl-devel \
perl perl-devel perl-Extutils-ParseXS \
perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
perl-ExtUtils-Embed libX* ncurses-devel gtk2-devel -y
RUN git clone https://github.com/vim/vim.git && \
cd vim && git checkout v8.1.2424 && \
./configure --with-features=huge \
--enable-multibyte \
--enable-gtk3-check \
--enable-rubyinterp=yes \
--with-python3-command=python3 \
--enable-python3interp=yes \
--enable-perlinterp=yes \
--enable-luainterp=yes \
--enable-cscope && \
make -j && make install

#install ycm
##https://blog.csdn.net/zhouguoqionghai/article/details/106160195
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
#RUN cd ~/.vim/bundle/YouCompleteMe
#WORKDIR ~/.vim/bundle/YouCompleteMe
WORKDIR /root/.vim/bundle/YouCompleteMe
RUN git submodule update --init --recursive && \
source ~/.bashrc && python ./install.py --clang-completer
ADD vimrc /root/.vimrc
RUN vim +PluginInstall +qall && \
ln -s -f $HOME/miniconda/envs/py36/lib/libstdc++.so.6.0.28 /lib64/libstdc++.so.6

#install bazel
WORKDIR /apps
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel-0.26.1-installer-linux-x86_64.sh && \
sh bazel-0.26.1-installer-linux-x86_64.sh

#set workdir
WORKDIR /work

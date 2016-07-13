FROM centos

MAINTAINER que01 <que01@foxmail.com>

RUN yum install -y --nogpgcheck vim git zsh python-devel cmake  && yum groupinstall --nogpgcheck -y "Development tools" && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
echo "export TERM='xterm-256color'" >> ~/.zshrc && \
git clone https://github.com/que01/vimrc ~/.vim_runtime && cd ~/.vim_runtime && \
sh install_awesome_vimrc.sh && git submodule init && git submodule update && \
cd ~/.vim_runtime/sources_non_forked/YouCompleteMe && git submodule update --init --recursive && \
curl --silent --location https://rpm.nodesource.com/setup_4.x | bash - && yum -y --nogpgcheck install nodejs && \
./install.py --tern-completer && \
yum remove -y cmake libarchive lzo gcc cpp glibc-devel glibc-headers kernel-headers libgomp libmpc mpfr \
autoconf automake bison byacc cscope ctags diffstat doxygen elfutils flex gcc-c++ gcc-gfortran gettext \
indent intltool libtool make patch patchutils rcs redhat-rpm-config rpm-build rpm-sign subversion swig \
systemtap apr  apr-util avahi-libs  boost-system boost-thread bzip2 dwz dyninst emacs-filesystem file gdb \
gettext-common-devel gettext-devel gettext-libs gnutls kernel-devel libcroco libdwarf libgfortran libmodman \
libproxy libquadmath libunistring m4 mokutil neon nettle pakchois trousers unzip zip libquadmath-devel \
libstdc++-devel perl-Test-Harness perl-Data-Dumper perl-Thread-Queue perl-XML-Parser perl-srpm-macros \
subversion-libs systemd-sysv systemtap-client systemtap-devel systemtap-runtime && \
yum clean all && cd ~/.vim_runtime && find . -name ".git" | xargs rm -Rf

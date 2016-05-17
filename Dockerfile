FROM fedora:23
MAINTAINER Luit van Drongelen <luit@luit.eu>

RUN yum install -y rpm-build rpmdevtools

RUN useradd makerpm
WORKDIR /home/makerpm

ONBUILD COPY SOURCES/* /home/makerpm/rpmbuild/SOURCES/
ONBUILD RUN chown -R makerpm /home/makerpm/rpmbuild

ONBUILD USER makerpm
ONBUILD ADD *.spec /home/makerpm/
ONBUILD RUN rpmdev-setuptree

CMD rpmbuild -ba *.spec

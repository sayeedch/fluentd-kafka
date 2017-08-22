FROM registry.access.redhat.com/openshift3/logging-fluentd:latest

# On RHEL, enable RHSCL repository for you system:
RUN yum-config-manager --enable rhel-server-rhscl-7-rpms

# Install Ruby 2.3
RUN yum install -y scl-utils rh-ruby23 rh-ruby23-ruby-devel 

# list all 
RUN yum list available ruby\*


# Start using software collections:
RUN scl enable rh-ruby23 bash

# Install fluentd kafka plugin
ENV LD_LIBRARY_PATH /opt/rh/rh-ruby23/root/usr/lib64
RUN scl enable rh-ruby23 'gem update --system --no-document' && \
RUN scl enable rh-ruby23 'gem install --no-document fluent-plugin-kafka -v 0.4.2' && \
    ln -s /opt/rh/rh-ruby23/root/usr/local/bin/* /usr/bin


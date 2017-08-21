FROM registry.access.redhat.com/openshift3/logging-fluentd:latest

# Install Ruby via rbenv
ADD install_ruby.sh /tmp/
RUN /tmp/install_ruby.sh
RUN ruby -v

# Install fluentd kafka plugin
RUN gem install -N --conservative --minimal-deps fluent-plugin-kafka

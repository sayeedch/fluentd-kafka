FROM registry.access.redhat.com/openshift3/logging-fluentd:latest

# Install Ruby via rbenv
RUN curl -L get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
RUN rvm install 2.1.8

# Install fluentd kafka plugin
RUN gem install -N --conservative --minimal-deps fluent-plugin-kafka

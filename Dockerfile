FROM registry.access.redhat.com/openshift3/logging-fluentd:3.6.1

RUN gem install -N --conservative --minimal-deps fluent-plugin-kafka

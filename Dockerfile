FROM registry.access.redhat.com/openshift3/logging-fluentd:latest

RUN gem install -N --conservative --minimal-deps fluent-plugin-kafka

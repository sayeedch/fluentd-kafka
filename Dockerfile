FROM registry.access.redhat.com/openshift3/logging-fluentd:latest

# Install Ruby via rbenv
RUN git clone https://github.com/sstephenson/rbenv.git  ~/.rbenv
RUN echo 'export PATH="/root/.rbenv/bin:$PATH"' >> /etc/profile.d/rbenv
ENV PATH /root/.rbenv/bin:$PATH
RUN git clone https://github.com/sstephenson/ruby-build.git  ~/.rbenv/plugins/ruby-build
RUN source /etc/profile
RUN rbenv install 2.1.5
ENV PATH /root/.rbenv/versions/2.1.5/bin:$PATH

# Update rubygems and don't install docs
RUN gem update --system --verbose
RUN echo "gem: --no-document" >> ~/.gemrc

# Install fluentd kafka plugin
RUN gem install -N --conservative --minimal-deps fluent-plugin-kafka

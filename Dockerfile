FROM fabric8/fluentd

MAINTAINER sayeedch

# Install fluentd plugins   
RUN touch /var/lib/rpm/* && yum install -y gcc-c++ && yum clean all

RUN scl enable rh-ruby23 'gem install --no-document fluent-plugin-kubernetes_metadata_filter -v 0.26.2' && \
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-elasticsearch -v 1.9.5' && \
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-rewrite-tag-filter -v 1.5.6' && \
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-secure-forward -v 0.4.5' && \
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-systemd -v 0.3.0' && \
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-viaq_data_model -v 0.0.5' && \    
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-kafka -v 0.4.2' && \
    scl enable rh-ruby23 'gem cleanup fluentd'

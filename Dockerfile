FROM registry.redhat.io/openjdk/openjdk-11-rhel8:latest

LABEL \
    MAINTAINER='mkikyotani' \
    org.jboss.product="openjdk"  \
    org.jboss.product.openjdk.version="11.0"  \
    org.jboss.product.version="11.0" \
    io.openshift.s2i.destination="/tmp"  \
    io.openshift.s2i.scripts-url="image:///usr/local/s2i"  \
    org.jboss.container.deployments-dir="/deployments" \
    io.fabric8.s2i.version.maven="3.5" \
    io.fabric8.s2i.version.jolokia="1.6.2-redhat-00002"  \
    com.redhat.component="openjdk-11-rhel8-container"  \
    description="Source To Image (S2I) image for Red Hat OpenShift providing OpenJDK 11"  \
    io.cekit.version="3.6.0"  \
    io.k8s.description="Platform for building and running plain Java applications (fat-jar and flat classpath)"  \
    io.k8s.display-name="Java Applications"  \
    io.openshift.tags="builder,java"  \
    maintainer="Red Hat OpenJDK <openjdk@redhat.com>"  \
    name="openjdk/openjdk-11-rhel8"  \
    summary="Source To Image (S2I) image for Red Hat OpenShift providing OpenJDK 11"  \
    usage="https://access.redhat.com/documentation/en-us/red_hat_jboss_middleware_for_openshift/3/html/red_hat_java_s2i_for_openshift/"  \
    version="1.2" 

USER root

RUN curl -LJO -s https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
    && mv ./jq-linux64 /usr/local/bin/jq \
    && chmod -R ug+rwx /usr/local/* \
    && chown -R ${APP_USER}:root /usr/local/*

EXPOSE 8080 8443
USER 185
WORKDIR /home/jboss
CMD ["/usr/local/s2i/run"]
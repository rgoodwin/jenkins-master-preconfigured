FROM jenkins/jenkins:latest

RUN /usr/local/bin/install-plugins.sh git matrix-auth \
    swarm performance kubernetes dashboard-view credentials-binding\
    workflow-aggregator docker-workflow blueocean build-monitor-plugin

ENV JENKINS_ADMIN_USERNAME admin
ENV JENKINS_ADMIN_PASSWORD admin

# skip jenkins setup wizzard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY configure-build-executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY setup-admin-user.groovy /usr/share/jenkins/ref/init.groovy.d/


VOLUME /var/jenkins_home
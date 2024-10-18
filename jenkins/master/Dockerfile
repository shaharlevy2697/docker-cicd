# Start with the official Jenkins base image
FROM jenkins/jenkins:lts

# Download the install-plugins.sh script
RUN curl -fsSL https://raw.githubusercontent.com/jenkinsci/docker/master/install-plugins.sh -o /usr/local/bin/install-plugins.sh
RUN chmod +x /usr/local/bin/install-plugins.sh

# Install required Jenkins plugins
RUN /usr/local/bin/install-plugins.sh git matrix-auth workflow-aggregator docker-workflow blueocean credentials-binding

# Set environment variables for Jenkins admin user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip the Jenkins setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false -Dhudson.security.csrf.DefaultCrumbIssuer.EXCLUDE_SESSION_ID=true

# Copy Groovy scripts for setting up executors and default user
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# Define the volume for Jenkins data
VOLUME /var/jenkins_home

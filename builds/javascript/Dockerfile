FROM ericsage/studio

# Installs the latest 8.x release of Node with the bundled 5.x npm

# Install node 8.x from nodesource
RUN \
curl -sL https://rpm.nodesource.com/setup_8.x | bash - && \
dnf install -y nodejs && \
npm completion >> /root/.bashrc

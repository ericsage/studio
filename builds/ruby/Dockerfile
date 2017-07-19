FROM ericsage/studio

# Installs the latest version of Ruby from source

# Download the latest stable Ruby source
RUN \
curl -L https://cache.ruby-lang.org/pub/ruby/stable-snapshot.tar.gz > ruby.tar.gz && \
tar -xzf ruby.tar.gz

# Switch to the Ruby source
WORKDIR stable-snapshot

# Build and install Ruby
RUN \
./configure && \
make && make install && \
mv ruby /usr/bin

# Restore the starting directory for the studio
WORKDIR /root/Code/src/github.com/ericsage

#  Clean up
RUN rm -rf stable-snapshot ruby.tar.gz

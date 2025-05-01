# Use the existing SBCL image as the base
FROM clfoundation/sbcl

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create the SSH directory
RUN mkdir /var/run/sshd

# Set a password for the root user (optional, for testing purposes)
RUN echo 'root:password' | chpasswd

# Allow root login (optional, for testing purposes)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Start the SSH service
CMD ["/usr/sbin/sshd", "-D"]

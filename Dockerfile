# Robert Lane
# PerlCGI Development Container
# Written for use with JavaScript for Web Warriors 7th Ed
# ISBN: 978-0-357-63800-2
#
# note - libcgi-pm-perl used by Web Warrior scripts

# Pull latest apache2 image
FROM httpd:2.4

# Update and install packages
RUN apt-get update
RUN apt-get install -y \
  libcgi-pm-perl

# Clean and remove update files
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Enable CGI modules
RUN sed -i '/mod_cgid.so/s/^\t#/\t/g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/mod_cgi.so/s/^\t#/\t/g' /usr/local/apache2/conf/httpd.conf


# Copy scripts from the books
COPY --chmod=0755 scripts /usr/local/apache2/cgi-bin

# Set executable bit
WORKDIR /usr/local/apache2/cgi-bin


#Expose port (no ssl)
EXPOSE 80

# please keep this list sorted!
# we need to install linux-image-extra-.. to get aufs!
# see https://github.com/zalando-stups/taupage/issues/84
pkgs="
auditd
iproute
libruby1.9.1
libyaml-0-2
linux-image-extra-$(uname -r)
docker-engine=1.9.1-0~trusty
mdadm
ntp
python3-pip
python3-requests
python3-yaml
python3-jinja2
python-setuptools
rkhunter
rsyslog-gnutls
ruby
unhide.rb
unzip
apt-transport-https
ca-certificates
"

echo "Installing packages..."

apt-get install -y -q --no-install-recommends -o Dpkg::Options::="--force-confold" $pkgs >>install.log

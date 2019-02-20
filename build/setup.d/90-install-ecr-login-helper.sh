# Install docker-credential-ecr-login
mv /tmp/build/bin/docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login

# Create config file
mkdir /root/.docker
cat <<EOF > /root/.docker/config.json
{
  "credsStore": "ecr-login"
}
EOF
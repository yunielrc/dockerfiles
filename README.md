# dockerfiles

A collection of Dockerfiles.

## Continuous Delivery

Execute the commands below on your CD server:

```sh
cd ~
docker login  # set your credentials and test a docker push to docker hub
git clone https://github.com/yunielrc/dockerfiles.git
echo 'REPO_OWNER=<your_docker_user>' >~/dockerfiles/.env
cat <<-EOF | sudo tee /etc/docker-files-deliver-all.env
DF_USER=$USER
DF_DIR=/home/${USER}/dockerfiles
EOF
sudo install -v -m 554 ~/dockerfiles/scripts/dockerfiles-deliver-all /etc/cron.daily/
```

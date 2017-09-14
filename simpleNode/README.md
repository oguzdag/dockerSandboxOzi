## Command to build
### build command
docker image build -t XXXXX/nodesimple:latest .

### run command
docker container run -d -p 8080:8080 --name deneme1 XXXXX/nodesimple:latest

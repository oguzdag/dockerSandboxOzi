## Command to build
### build command
docker image build -t oguzdag/nodesimple:latest .

### run command
docker container run -d -p 8080:8080 --name deneme1 oguzdag/nodesimple:latest

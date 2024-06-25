# Hello World

## Localhost teps

- clone
- open in visual studio <= 2022
- Run
- Test

```
curl http://localhost:7234/api/Hello
```

## Azure Steps

With this steps you will be able to deploy your function into a real azure subscription.

**Requirements**

- docker
- azure account


```
docker run -it -v $(pwd):/sandbox jrichardsz/azure-cli-terraform:apine-3.19.1-azcli-2.61.0

az login

cd /sandbox

cd terraform

terraform init

terraform plan

terraform apply
```

If no errors you will see these in your azure web console

![alt text](docs/image.png)

The public url of your function should be: https://func-linux-poc-dev.azurewebsites.net

![alt text](docs/image-1.png)

Then if you perform a get request (with curl or a web browser) to this url `https://func-linux-poc-dev.azurewebsites.net/api/Hello` you will get this as response:

![alt text](docs/image-2.png)

### :warning: Destroy :warning:

```
terraform apply -destroy
```
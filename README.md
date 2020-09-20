## Hello World Cobol Lambda
This repository contains a hello world COBOL program tht you can execute on AWS Lambda

### Running Locally
1. Install [GnuCOBOL](https://sourceforge.net/projects/gnucobol/)
On MacOS, you can use [Homebrew](https://brew.sh/):
` brew install gnu-cobol`
1. Build the application:
```bash
cobc -x hello.cob
```
1. Run the application:
```bash
./hello
```

### Deploying and running on AWS
1. Follow [these instructions](https://www.serverless.com/framework/docs/providers/aws/guide/credentials/) to setup your Serverless AWS Credentials.
1. Build the deployable artifacts:
```bash
./build.sh
```
1. Deploy the artifact:
```bash
sls deploy
```
1. Navigate to the API Gateway console and find the domain for your API Gateway
1. Hit the endpoint to see the response:
```bash
curl --silent https://<your api gateway id>.us-east-1.amazonaws.com/dev/
```



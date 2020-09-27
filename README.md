## Hello World Cobol with AWS Lambda
This repository contains a 'Hello World' COBOL program that can deploy and run on AWS Lambda, fronted by an API Gateway.

### Prerequisites
We need the following tools to run and deploy this application: [GnuCOBOL](https://sourceforge.net/projects/gnucobol/), [Serverless Framework](https://www.serverless.com/), and [Docker](https://www.docker.com/)

On MacOS you can use [Homebrew](https://brew.sh/) to install them:
1.  `brew install gnu-cobol`
1.  `brew install docker`
1.  `brew install serverless`

### Running Locally
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

### Cleanup
To cleanup your AWS resources run:
`serverless remove`

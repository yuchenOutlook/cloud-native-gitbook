# Lab Instructions

## Task List

You have been tasked with deploying some basic infrastructure on AWS to host a proof of concept environment. The architecture needs to include both public and private subnets and span multiple Availability Zones to test failover and disaster recovery scenarios. You expect to host Internet-facing applications. Additionally, you have other applications that need to access the Internet to retrieve security and operating system updates.

- **Task 1:** Create a new VPC in your account in the US-East-1 region
- **Task 2:** Create public and private subnets in three different Availability Zones
- **Task 3:** Deploy an Internet Gateway and attach it to the VPC
- **Task 4:** Provision a NAT Gateway (a single instance will do) for outbound connectivity
- **Task 5:** Ensure that route tables are configured to properly route traffic based on the requirements
- **Task 6:** Delete the VPC resources
- **Task 7:** Prepare files and credentials for using Terraform to deploy cloud resources
- **Task 8:** Set credentials for Terraform deployment
- **Task 9:** Deploy the AWS infrastructure using Terraform
- **Task 10:** Delete the AWS resources using Terraform to clean up our AWS environment

## Desired state

![Desired State](./img/desired%20state.png)

## how to complete Task 1 - 6 through Terraform?

1.  Setup your own AWS access key:

2.  export your key, here is how to [setup environment variable](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

```bash
$ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
$ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

3. check the [main.tf](main.tf) and [variable.tf](variables.tf) scripts which describe all the components we need to deploy into AWS.

4. Run the command to initialize and configure all the necessary plugins and configs.

```bash
terraform init
```

5. Run the plan command to determin what resources that needs to be changed before apply.

```
terraform plan
```

Results in this case:
![results](./img/terraform%20plan%20results.png)

6. Run apply command to actually deploy the infrastructures, and here are the results.

```
terraform apply
```

![results](./img/terraform%20apply%20demo%20results.png)

7. Go to the AWS account to check the actual infrastructure, VPCs, subnets and NAT Gateways. They are all successfully created!

![Nat Gateways](./img/Nat%20Gateways.png)
![Vpc](./img/VPCs%20created.png)

8. Last but not least, when you need to destroy your resources, just run

```bash
terraform destory -auto-approve
```

Then everything will be destoyed and nothing will be left behind. Amazing isn't it!

![destroy](./img/terraform%20destroy.png)

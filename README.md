
# Step 1: Create a Provider Configuration
1. Create a new directory for your project.
2. Inside the project directory, create a file named provider.tf.
3. Configure the AWS provider with your desired region. .
Save the file.
4. This configuration sets up the AWS provider to work in your specified region.

# Step 2: Create a Virtual Private Cloud (VPC)
In this step, we will create the Virtual Private Cloud (VPC) for our project. Follow these instructions:

In your project directory, create a new file named vpc.tf
* Open vpc.tf in a text editor and paste the content of vpc.tf in the file. 

# Step 3: Create a Load Balancer
In this step, we'll set up a Load Balancer (ALB) to distribute traffic to our EC2 instances. Follow these instructions:


* Create a new  loadbalancer.tf file. 
* You have provided the Load Balancer configuration. Now, you'll need to create the other necessary components in the same file:
* Create Target Group Configuration, Target Group Attachment Configuration and Listener Configuration

# Step 4: Create Security Groups Using Terraform
In this step, you'll set up security groups for your Load Balancer and EC2 instances using Terraform. Follow these high-level instructions:

## Load Balancer Security Group:

Refer to the Terraform AWS documentation for creating a security group resource.
Define a security group resource for your Load Balancer that allows incoming traffic on port 80 (HTTP) from anywhere (0.0.0.0/0).
## EC2 Instance Security Group:

Refer to the Terraform AWS documentation for creating a security group resource.
Define a security group resource for your EC2 instances that allows incoming traffic on port 80 (HTTP) from the security group associated with the Load Balancer.

# Step 5: Create EC2 Instances Using Terraform
In this step, you will create EC2 instances using the provided Terraform code. Follow these instructions:

## EC2 Instances:

Use the provided Terraform code for creating EC2 instances. The code defines the instance type, security group, subnet, and user data for customization.
Make sure to adjust the count parameter in the code to specify the desired number of instances you want to create.
Ensure that the ami (Amazon Machine Image) ID in the code corresponds to the operating system you want to use for your instances. You can find AMI IDs in the AWS Console.

# Step 6: Create Output Definitions
In this step, you will define the outputs for your Terraform configuration, which will display essential information after the infrastructure is provisioned. Follow these instructions:

## Output Definitions:

Use the provided Terraform code to create output definitions.
These outputs will provide valuable information about your infrastructure.
The alb_dns_name output will display the DNS name of your Application Load Balancer (ALB).
The instance_ips output will display the public IP addresses of your EC2 instances.
By adding these output definitions, you can easily retrieve important information about your AWS resources after provisioning. This will be useful for verifying that your infrastructure has been successfully created.

# Step 7 Verifying our Setup 

Step 7 involves testing and verifying the setup by accessing the load balancer's DNS name in a web browser, observing the instance content, and checking if the load balancer successfully distributes traffic among instances.

* Access the Load Balancer: Open a web browser and enter the DNS name of the load balancer, which should be available as an output (e.g., alb_dns_name) from your Terraform deployment.

* Refresh the Page: Keep refreshing the web page. With every refresh, the load balancer should route your request to a different EC2 instance. You'll notice the public IP displayed on the webpage will change accordingly, indicating that traffic is being distributed among instances.

## Debugging: If there are any issues or errors, students can check the following:
* Security Groups: Verify that the security groups associated with the EC2 instances and the load balancer allow traffic on port 80 (HTTP) and that the instances can communicate with the load balancer.

* Load Balancer Configuration: Ensure that the load balancer's target group and listener are correctly configured to route traffic to the instances.

# Step 8  Submission
Step 8 involves pushing all the Terraform configuration code to a GitHub repository and sharing the repository link with the instructor, along with the DNS name of the load balancer.
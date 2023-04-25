Sign in to the AWS Management Console and navigate to the IAM console.

In the left navigation pane, click on "Roles".

Click the "Create role" button.

Choose "AWS service" as the trusted entity and select "EC2" as the service that will use this role.

Click "Next: Permissions".

On the "Attach permissions policies" page, search for and select the following policies:

AmazonSSMManagedInstanceCore
AmazonEC2RoleforSSM
Note: These policies allow the EC2 instances to communicate with AWS Systems Manager, which is used to manage and configure Windows instances.

Click "Next: Tags". You can add tags to help organize your resources, but they are not required for this setup.

Click "Next: Review".

On the "Review" page, give the role a descriptive name (e.g. "Ansible-Windows-Role").

Review the role's policies and make sure they grant the required permissions.

Click "Create role".

Note the ARN of the newly created IAM role, which you will use to assign it to the Linux instance that will act as the Ansible control node.

Now that you have created the IAM role, you can proceed to assign it to the Linux instance that will act as the Ansible control node. To do this, follow these steps:

Navigate to the EC2 console in the AWS Management Console.

Select the Linux instance that you want to use as the Ansible control node.

Click on "Actions" and then "Instance Settings".

Click on "Attach/Replace IAM Role".

In the "Attach IAM Role" dialog box, select the IAM role that you created earlier.

Click "Apply".

The IAM role is now assigned to the Linux instance, and Ansible will be able to use the IAM role to access the Windows Server 2019 instance.

# Create AWS IAM Role

### Sign in to the AWS Management Console and navigate to the IAM console.

1. In the left navigation pane, click on "Roles".
2. Click the "Create role" button.
3. Choose "AWS service" as the trusted entity and select "EC2" as the service that will use this role.
4. Click "Next: Permissions".
5. On the "Attach permissions policies" page, search for and select the following policies:

```
AmazonSSMManagedInstanceCore
AmazonEC2RoleforSSM
```

> **Note: These policies allow the EC2 instances to communicate with AWS Systems Manager, which is used to manage and configure Windows instances.**

6. Click "Next: Tags". You can add tags to help organize your resources, but they are not required for this setup.
7. Click "Next: Review".
8. On the "Review" page, give the role a descriptive name (e.g. "Ansible-Windows-Role").
9. Review the role's policies and make sure they grant the required permissions.
10. Click "Create role".

> **Note the ARN of the newly created IAM role, which you will use to assign it to the Linux instance that will act as the Ansible control node.**

11. Now that you have created the IAM role, you can proceed to assign it to the Linux instance that will act as the Ansible control node. To do this, follow these steps:
12. Navigate to the EC2 console in the AWS Management Console.
13. Select the Linux instance that you want to use as the Ansible control node.
14. Click on "Actions" and then "Instance Settings".
15. Click on "Attach/Replace IAM Role".
16. In the "Attach IAM Role" dialog box, select the IAM role that you created earlier.
17. Click "Apply".

**The IAM role is now assigned to the Linux instance, and Ansible will be able to use the IAM role to access the Windows Server 2019 instance.**

# **AWS DevOps Automation: EC2, S3, and CloudWatch with Terraform & Shell Scripting**

## **Project Overview**
This project demonstrates how to automate AWS infrastructure provisioning using **Terraform** and **Shell Scripting**. It includes:
- 🚀 **EC2 Instance Deployment** with automated Apache setup.
- 📦 **S3 Bucket Management** with access control.
- 📊 **CloudWatch Monitoring** for EC2 instance logs.
- 🔐 **IAM Role & Policies** to manage permissions securely.

This guide provides a **step-by-step walkthrough** of setting up the infrastructure, deploying a web application, and automating tasks.

---

## **Prerequisites**
Ensure you have the following installed before starting:
- ✅ [AWS CLI](https://aws.amazon.com/cli/) (Configured with valid AWS credentials)
- ✅ [Terraform](https://developer.hashicorp.com/terraform/downloads)
- ✅ SSH key pair for EC2 access
- ✅ Basic knowledge of AWS services (EC2, S3, IAM, CloudWatch)

---

## **Project Structure**
```
AWS-DevOps-Automation/
│                      # Terraform Infrastructure Code
│   ├── main.tf                     # AWS Provider & VPC Setup
│   ├── ec2.tf                       # EC2 Configuration
│   ├── iam.tf                       # IAM Role & Policies
│   ├── s3.tf                        # S3 Bucket Creation
│   ├── index.html                
│                   
│── scripts/
│   ├── install.sh                    # EC2 User Data Script
│── .gitignore                        # Ignoring Unnecessary Files
│── README.md                         # Project Documentation
```

---

## **Step 1: Clone the Repository**
```bash
🐙 git clone https://github.com/Mupparaju19/AWS-DevOps-Automation.git
📂 cd AWS-DevOps-Automation
```

---

## **Step 2: Configure Terraform**
Initialize Terraform and download required providers:
```bash
🔧 cd AWS-DevOps-Automation
terraform init
```

To preview changes before applying:
```bash
🔍 terraform plan
```

Apply changes to create resources:
```bash
🚀 terraform apply -auto-approve
```

After deployment, Terraform will output:
- 🌐 **EC2 Public IP**
- 🗄️ **S3 Bucket Name**

---

## **Step 3: Access the Deployed Application**
Once Terraform completes, retrieve the **EC2 Public IP**:
```bash
📡 terraform output
```
Visit in browser:
```
🌍 http://<EC2-PUBLIC-IP>
```
If everything is working correctly, you should see a **custom web page**!

---

## **Step 4: Verify S3 Bucket Upload**
Login to the EC2 instance and test S3 file upload:
```bash
🔑 ssh -i my-key.pem ubuntu@<EC2-PUBLIC-IP>
📝 echo "Hello from EC2" > test.txt
📤 aws s3 cp test.txt s3://<your-bucket-name>/
```
Check the **AWS S3 Console** to confirm the file upload.

---

## **Step 5: Check CloudWatch Logs**
To verify logs are being sent to CloudWatch:
```bash
📊 sudo systemctl status awslogs
```
Navigate to **AWS Console → CloudWatch → Log Groups** and look for logs.

---

## **Step 6: Destroy the Infrastructure**
If you want to remove all resources:
```bash
💣 terraform destroy -auto-approve
```

---

## **Troubleshooting**
✅ **Cannot SSH into EC2?**
- 🔐 Ensure **Security Group** allows SSH (Port 22):
  ```bash
  sudo ufw allow 22/tcp
  ```
- 🔍 Check if **EC2 has a public IP** assigned.

✅ **Website Not Loading?**
- 🔄 Restart Apache:
  ```bash
  sudo systemctl restart apache2
  ```
- 🌐 Ensure **port 80 is open** in Security Groups.

✅ **S3 Upload Fails?**
- 🔑 Verify IAM role has **S3 permissions**.
- ⚙️ Check AWS CLI configuration:
  ```bash
  aws configure list
  ```

✅ **Terraform Apply Fails Due to S3 Bucket Name?**
- 📛 Ensure bucket name is **globally unique** by modifying `s3.tf`:
  ```hcl
  bucket = "devops-bucket-${random_string.bucket_suffix.result}"
  ```

---

## **Best Practices**
✅ **Use `.gitignore` to Exclude Unnecessary Files**
```bash
📄 echo ".terraform/" >> .gitignore
📄 echo "terraform.tfstate" >> .gitignore
📌 git add .gitignore
📝 git commit -m "Added .gitignore for Terraform"
```


✅ **Secure IAM Policies**
Restrict EC2 IAM roles **only to required permissions**.

---

## **Future Enhancements**
🚀 Add **CI/CD with GitHub Actions** for auto-deployment.
🚀 Use **Terraform Modules** to structure code better.

---

## **Contributing**
Feel free to **fork the repository** and contribute! Open an **issue** for bugs or suggestions.

---

## **License**
This project is **MIT Licensed**. See `LICENSE` for details.

---

🚀 **Happy DevOps Automation!** 😊



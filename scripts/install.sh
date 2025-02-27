#!/bin/bash
# Update and install Apache
apt update -y && apt install apache2 -y
systemctl start apache2
systemctl enable apache2

# Write CloudWatch Logs Agent Config
cat <<EOF > /etc/awslogs.conf
[general]
state_file = /var/awslogs/state/agent-state

[/var/log/syslog]
file = /var/log/syslog
log_group_name = devops-log-group
log_stream_name = ec2-instance-logs
EOF

# Install and Start CloudWatch Agent
apt install -y awslogs
systemctl start awslogs
systemctl enable awslogs

# Test S3 Upload
echo "This is a test file" > /tmp/test.txt
aws s3 cp /tmp/test.txt s3://devops-bucket/

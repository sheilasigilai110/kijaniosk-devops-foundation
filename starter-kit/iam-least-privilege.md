
# IAM Least Privilege Design

## Task: Application Log Management
**Objective:** Allow an EC2 instance or Lambda function to manage logs in a specific S3 bucket without granting administrative rights.

## Policy Definition (JSON)
\`\`\`json
{
    "Version": "2026-03-22",
    "Statement": [
        {
            "Sid": "AllowListBucket",
            "Effect": "Allow",
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::kijaniosk-logs"
        },
        {
            "Sid": "AllowReadWriteLogs",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
            "Resource": "arn:aws:s3:::kijaniosk-logs/*"
        }
    ]
}
\`\`\`



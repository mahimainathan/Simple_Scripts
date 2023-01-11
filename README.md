# Simple_Scripts 001  AWS_RDS_Mysqldump Backup


One of the best ways to backup a MySQL RDS instance using mysqldump is to use the mysqldump command in a shell script that runs on a schedule. Here's an example of a simple shell script that you can use to backup a MySQL RDS instance:

You can then use cron to schedule this script to run at a specific interval.

Here are some points to keep in mind when using mysqldump to backup RDS databases:

    * mysqldump creates a consistent backup by temporarily locking tables. So, while the backup is running, it might cause some inconvenience for writes to the database.
    * Large table can cause the dump process to run for a long time, depending on the size of the table and available memory, also it may cause high CPU or I/O loads on the RDS instance.
    * If your database is large, you might want to split the dump into smaller chunks to reduce the impact on your RDS instance and make sure that the dump process completes within the maintenance window.
    * To minimize the impact on production load, you should perform the backups during periods of low database activity.

AWS RDS also provides a built-in method to take backup of your RDS instance by creating a point-in-time snapshots of your RDS instances, which can be automated and scheduled as per your requirements.


# Simple_Scripts 002
=========================

Simple Python script that will check the disk usage on a Linux system and send an email alert if the usage exceeds a certain threshold:

Note : if you use gmail as mail server to send email, then need to enable "less secure apps" in your google account

The script first defines two functions: check_disk_usage and send_alert_email. check_disk_usage takes a path and a threshold as arguments and uses the os.statvfs function to get information about the file system at that path. It then calculates the percentage of the disk that is in use, and returns True if the usage exceeds the threshold, and False otherwise. The send_alert_email function uses the smtplib library to connect to an SMTP server (in this case, gmail) and send an email alerting the user to high disk usage.

Finally, the script calls check_disk_usage and passes it the root filesystem '/' and a threshold of 90%. If the disk usage exceeds 90%, it sends an email using send_alert_email function.


# Simple_Scripts 003  
=========================

Simple script in Python that you can use to monitor a Docker container and restart it if it exits:

In this script, the container_name variable is set to the name of the container you want to monitor. The script then enters an infinite loop, in which it uses the subprocess.run() function to run the docker ps command with the -f and -q options to check the status of the container. If the container is running, the script prints its status and sleeps for 5 seconds before checking again. If the container is not running, the script uses subprocess.run() to run the docker start command to start the container again and print a message to indicate that it has been restarted.

You can customize this script to suit your needs. For example, You can set up sleep_time as a variable and change the command to use docker inspect command instead of docker ps to check container status. You can also add additional checks to handle scenarios such as container crashed or unable to restart after certain number of attempts.

# Simple_Scripts 004 
=========================

Simple Bash script that uses the AWS CLI to start and stop an EC2 instance:

In this script, the PROFILE variable is set to the name of the AWS profile you want to use and the INSTANCE_ID variable is set to the ID of the EC2 instance you want to start or stop. The script then uses the aws ec2 describe-instances command to check the current status of the instance, and based on that status, it uses the aws ec2 start-instances or aws ec2 stop-instances command to start or stop the instance.

Make sure that the aws CLI has been configured and authorized, also you can use the --region option to specify the region where your instance is located, this can be helpful if you have multiple AWS accounts.

# Simple_Scripts 005
=========================

Simple Bash script that uses the Cloudflare API to clear the cache for a specific zone:

In this script, the AUTH_EMAIL and AUTH_KEY variables are set to your Cloudflare account email and API key, respectively. The ZONE_ID variable is set to the ID of the zone for which you want to clear the cache. The script then uses the curl command to make a DELETE request to the Cloudflare API to clear the cache for the specified zone. The request includes the authentication headers and a JSON payload with the value {"purge_everything":true} to purge all files.

Note that Cloudflare API has a rate limit, you should check it before using this script in a production environment.

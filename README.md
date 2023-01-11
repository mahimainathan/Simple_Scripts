# Simple_Scripts 001  AWS_RDS_Mysqldump Backup


One of the best ways to backup a MySQL RDS instance using mysqldump is to use the mysqldump command in a shell script that runs on a schedule. Here's an example of a simple shell script that you can use to backup a MySQL RDS instance:

You can then use cron to schedule this script to run at a specific interval.

Here are some points to keep in mind when using mysqldump to backup RDS databases:

    * mysqldump creates a consistent backup by temporarily locking tables. So, while the backup is running, it might cause some inconvenience for writes to the database.
    * Large table can cause the dump process to run for a long time, depending on the size of the table and available memory, also it may cause high CPU or I/O loads on the RDS instance.
    * If your database is large, you might want to split the dump into smaller chunks to reduce the impact on your RDS instance and make sure that the dump process completes within the maintenance window.
    * To minimize the impact on production load, you should perform the backups during periods of low database activity.

AWS RDS also provides a built-in method to take backup of your RDS instance by creating a point-in-time snapshots of your RDS instances, which can be automated and scheduled as per your requirements.


# Simple_Scripts 002  Python Scripty to check disk usage monitoring

Simple Python script that will check the disk usage on a Linux system and send an email alert if the usage exceeds a certain threshold:

Note : if you use gmail as mail server to send email, then need to enable "less secure apps" in your google account

The script first defines two functions: check_disk_usage and send_alert_email. check_disk_usage takes a path and a threshold as arguments and uses the os.statvfs function to get information about the file system at that path. It then calculates the percentage of the disk that is in use, and returns True if the usage exceeds the threshold, and False otherwise. The send_alert_email function uses the smtplib library to connect to an SMTP server (in this case, gmail) and send an email alerting the user to high disk usage.

Finally, the script calls check_disk_usage and passes it the root filesystem '/' and a threshold of 90%. If the disk usage exceeds 90%, it sends an email using send_alert_email function.

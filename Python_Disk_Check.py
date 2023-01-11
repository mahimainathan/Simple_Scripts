import os
import smtplib

def check_disk_usage(path, threshold):
    """Return True if the disk usage at path exceeds threshold, False otherwise."""
    total, used, free = os.statvfs(path)
    percent_used = (used / total) * 100
    return percent_used > threshold

def send_alert_email(email, password, recipient, usage):
    """Send an email alerting the user to high disk usage."""
    message = f"Subject: Disk Usage Alert\n\nThe disk usage at path exceeds {usage} percent."
    mail_server = smtplib.SMTP('smtp.gmail.com', 587)
    mail_server.starttls()
    mail_server.login(email, password)
    mail_server.sendmail(email, recipient, message)
    mail_server.quit()

if check_disk_usage('/', 90):
    send_alert_email('your_email@example.com', 'your_email_password', 'recipient@example.com', 90)

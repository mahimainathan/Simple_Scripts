import subprocess
import time

container_name = "mycontainer"

while True:
    # Use the "docker ps" command to check the status of the container
    output = subprocess.run(["docker", "ps", "-f", "name="+container_name, "-q"], capture_output=True)
    container_id = output.stdout.decode("utf-8").strip()

    if container_id:
        # If the container is running, print its status and sleep for 5 seconds
        print(f"{container_name} is running with ID {container_id}")
        time.sleep(5)
    else:
        # If the container is not running, start it again
        subprocess.run(["docker", "start", container_name])
        print(f"{container_name} has been restarted")

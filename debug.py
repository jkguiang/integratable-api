import os
import sys

if __name__ == "__main__":
    arg = sys.argv[1]
    c_id = open("temp.txt", "r").read().split("\n")[1].split(" ")[0]
    if arg == "open":
        print("Opening {0}".format(c_id))
        os.system("docker exec -ti {0} /bin/bash".format(c_id))
    elif arg == "logs":
        print("Fetching {0} logs".format(c_id))
        os.system("docker logs {0}".format(c_id))

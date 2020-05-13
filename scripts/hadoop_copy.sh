
#!/bin/bash

# sudo ./hadoop_copy.sh
# copy to hadoop to /
rsync -r /exports/hadoop /hadoop
chown -R ubuntu /hadoop
echo "hadoop copied to /."

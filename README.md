This is the output of the log file:
![image](https://github.com/alberto-d1as/empty_content/assets/82539821/d9cceeea-d95b-4ea9-b596-c63c9e1288e0)

The rotate is organizing it this way:
![image](https://github.com/alberto-d1as/empty_content/assets/82539821/181183d9-2456-4508-94fa-9da595158b04)

This script was created to check the content of .CSV files that were occasionally empty and could not be sent in this way.

The script transfers the most recent file from each manager to another directory, thus keeping the origin intact. And then unzip the .tar format files and analyze whether the extracted .csv has more than one line. Stores the result in a log file. And finally, clean the verification directory so as not to accumulate files.

I created a log rotate so that each file is separated by day and so that they are compressed so as not to overload the disk.

Both scripts called by crontab.

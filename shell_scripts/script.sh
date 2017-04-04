#!/bin/sh

# Changing directory to the directory the script will function in

cd ~/projects/playground/shell_scripts

# Create a folder

mkdir testdir

# Change in to directory that was created

cd testdir/

# Create a shell script

touch test.sh

# Adding text to file

echo "#!/bin/sh" >> test.sh
 
# Change permissions so the script can be executed

chmod 755 test.sh

# Display the script

cat test.sh

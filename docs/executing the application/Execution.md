the application is launched via the execution of _three shell scripts_
    * run.sh 
    * exec.sh
    * build.sh 

these scripts need to be executed in the following order
    1. ./build.sh
    2. ./run.sh
    3. ./exec.sh

## Shell Commands/Shell Scripting

Commands | Function
---------|----------
pwd      | print/present working directory
cd       | change directory
         | with this command - because we have to pass an argument (the path to the directory we wish to change to)
         | this invites two different ways to specify the path we wish to change to
         | *aboslute path* describes the path from the root directory(slash /) any path that begins with / implies root directory
         | *relative path* - this command describes the path from where you are _currently_ 
         _shortcuts_
         | cd . -> current directory you are in
         | cd .. -> outer/parent/encapsulating directory
         | cd ~ -> home directory
         | cd - -> previous directory that you were in 
ls       |list directories in the current directory or within the directory you pass to it as argument
         | -l show file names in long format and other detailed information like permissions, owner name etc
         | -a reveals hidden (all) files 
         | for exampe: la -la
         | -r to recursively list directory contents
         | -la list all hidded files in long format which includes additional information like links, owner name, owner file size
touch    | create new empty file in the directory that you are currently in or update the time stamp on the file if it already exists
file     | provides a brief description of the file's contents
cat      | abbreviated form of concatenate i.e displays contents of the file passed as argument 
         | can also combine multiple txt files showing you their output - not ideal for viewing large files
less     | ironically provides profuse amounts of detail and conversely the 'more' command provides more concise levels of detail 
history  | look through previously entered commands. This is quite useful when you want to find and run a command you used previously without actually typing it again.
clear    | clear the display   
cp       | copy and paste the file for example cp myfile /home/Evan/Documents/mydocs copies the file myfile from the current directory over into the mydocs directory
wildcards | represent a pattern based selection providing greater flexibility with searching
          | * the wildcard of wildcards, it's used to represent all single characters or any string.
          | ? is a wildcard that can represent one single character
          | [] can capture any character within the brackets
rm  filename      | remove file with the specified filename that you're currently in 
rm dir    |
> cp myfile /home/Evan/Documents/mydocs

myfile is the file you want to copy and /home/Evan/Documents/mydocs is where you are copying the file to.

> examples
$ cp *.jpg /home/pete/Pictures
this command will copy all files in your current directory that have a .jpg ending (that is to say: jpeg files) into the /home/pete/Pictures directory

another useful command that can be paired with this operation is the -r flag - this specifies a recursive copying 
this is useful when you want to copy over all the subdirectories and enclosed files 
for example cp -r Pumpkin/ /home/pete/documents

importantly, if you're copying over a file that has the same name as another file that already exists within the directory you are copying the file into, this file will be overwritten 

this command will prompt you before overwriting that file

$ cp -i myfile /home/Evan/Pictures

> **mv (Move)**
useful for renaming as well as moving files 
for example mv oldfile newfile renames oldfile to newfile
Or you can actually move a file to a different directory:
mv main.sh /home/Evan/Documents 
can also move multiple files for example 
mv file_1 file_2 /somedirectory
also mv allows you to rename old directories 
for example: mv directory1 directory2 will rename the directory directory1 to directory2
be careful of overriding files with the same name in the directory you are moving into 
Let’s say you did want to mv a file to overwrite the previous one. You can also make a backup of that file and it will just rename the old version with a ~.
>   $ mv -b directory1 directory2

>mkdir make directory can also create multiple directories with the one command 
for example mkdir books paintings

You can also create subdirectories at the same time with the -p (parent flag).

>$ mkdir -p books/hemmingway/favorites

>rm remove directory
for example rm file1 
note once a file has been rm'd it is gone for good and cannot be revived

*flags that can be used with rm*
-f flag 
-f or force option tells rm to remove all files, whether they are write protected or not, without prompting the user (as long as you have the appropriate permissions).
-i injects interactivity - that is to say 
Adding the -i flag like many of the other commands, will give you a prompt on whether you want to actually remove the files or directories.
rm -r directory is necessary to remove all files and subdirectories that a directory may have 
alternatively rmdir will remove any directory specified


## run.sh 


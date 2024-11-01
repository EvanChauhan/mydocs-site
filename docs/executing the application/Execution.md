the application is launched via the execution of _three shell scripts_
    * run.sh
    * exec.sh
    * build.sh 

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
wildcards | 





## run.sh 


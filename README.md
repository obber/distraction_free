# Distraction_Free
Simple Distraction Free Mode (Linux &amp; OS X)

## Install
To install, simply place the distraction_free.sh script inside of a directory of your choice and chmod it to 755.  

For the information below, I will assume you put it inside of a directory called 'scripts' inside of your $HOME directory. Adjust any file paths as needed if you place it elsewhere.

## Customize Which Sites to Disable
To customize the sites, open distraction_free.sh in a text editor and replace facebook and youtube or append to the variable.

## To Run
To turn it on:
~/scripts/distraction_free.sh on  

To turn it off:
~/scripts/distraction_free.sh off

(The 'on/off' argument is required.)

## Recommendations
Set an alias in your .bash_profile by adding something like:
'''
alias dfree='sudo ~/scripts/distraction_free.sh'
'''
which will allow you to run:
'''
dfree on
'''

Enjoy!
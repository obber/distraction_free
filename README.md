# Distraction_Free
Stay focused on the task at hand. Turn on/off access to distracting sites with a single command in your terminal. (Linux &amp; OS X)

## Install
To install, download and place the distraction_free.sh script inside of a directory of your choice and chmod it to 755. I will assume that you are inside of a directory called "scripts" inside of your user's $HOME directory.
    
    curl -O "https://raw.githubusercontent.com/obber/distraction_free/master/distraction_free.sh"
    chmod 755 distraction_free.sh  

If you download the file elsewhere, adjust any file paths as needed for the instructions below.

## Customize Which Sites to Disable
To customize, open distraction_free.sh in a text editor and replace facebook and youtube or append to the variable with whatever tickles your fancy.

## To Run
To turn it on:

    ~/scripts/distraction_free.sh on  

To turn it off:

    ~/scripts/distraction_free.sh off

(The 'on/off' argument is required.)

## Recommendations
Set an alias in your .bash_profile by adding something like:

    alias dfree='sudo ~/scripts/distraction_free.sh'

which will allow you to run this instead:

    dfree on

Enjoy!
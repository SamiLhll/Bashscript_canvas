# Bashscript_canvas
Create the skeleton of a new bash script with arguments in one command line 

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Installation

```{bash}

# download :
wget https://github.com/SamiLhll/Bashscript_canvas/archive/refs/tags/v0.1.1.tar.gz

# uncompress :
tar -xzf v0.1.1.tar.gz


### OPTIONAL :
# you can an add alias to your ~/.bashrc so you can run the script by typing Bashscript_canvas in the terminal.   
# to do it type the following command, replacing <path to Bashscript_canvas.sh> 
# by the actual path of this file on your machine :
echo "alias Bashscript_canvas=\"./<path to Bashscript_canvas.sh>\"" | tee -a ~/.bashrc
# and finally :
source ~/.bashrc

```

# Dependencies

None to declare

# Usage :

### All arguments :

-a Author name   
-t Title of the script   
-o option names separated by "," as in "opt1,opt2,...,optn"   
-h prints this message and exit   

### Example :

By typing the following in your terminal :

```{bash}

Bashscript_canvas -a "Sami El Hilali" -t "New_bash_script" -o "option1,option2,option3"

```

You end up with the following in your stdout (that you can redirect in a file using ">")

```{bash}

#!/usr/bin/env bash

#######################################################
# New_bash_script
# Sami El Hilali
# 2023_May_04
#######################################################

# DESCRIPTION OF THE SCRIPT

####### PARSE parameters

Help(){
	 echo "New_bash_script - usage :";
	 echo "-x option1";
	 echo "-x option2";
	 echo "-x option3";
}

while getopts x:x:x:h option
do
	case "${option}"
	in
	x) option1=${OPTARG};;
	x) option2=${OPTARG};;
	x) option3=${OPTARG};;
	h) Help;
	   exit;;
	?) Help;
	   exit;;
	esac
done
#########################
# exit if a command fails
set -e
########
######################### RUN

######################### DONE

```


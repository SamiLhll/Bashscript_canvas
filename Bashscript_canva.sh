#!/usr/bin/env bash

#######################################################
# Bashscript_canva v0.0.1
# Sami El Hilali
# 2022_may_27
#######################################################

# This script creates canvas for new bashscripts.

####### PARSE parameters
Help() {
  echo "Bashscript_canva - usage :";
  echo "-a Author name";
  echo "-t Title of the script";
  echo "-o option names separated by \",\" as in \"opt1,opt2,...,optn\"";
  echo "-h prints this message and exit";
}

while getopts a:t:o:h option
do
	case "${option}"
	in
	a) Author=${OPTARG};;
	t) Title=${OPTARG};;
	o) Options=${OPTARG};;
	h) Help;
	   exit;;
	?) Help;
	   exit;;
	esac
done


# Header :

echo -e "#!/usr/bin/env bash\n"

echo "#######################################################"
echo "# $Title"
echo "# $Author"
# print the date :
DATE=($(date '+ %Y_%B_%d'))
echo "# $DATE"
echo "#######################################################"

echo -e "\n# DESCRIPTION OF THE SCRIPT\n"

# Options :
IFS=',' read -r -a array <<< "$Options"
echo -e "####### PARSE parameters\n"
echo -e "Help(){"
echo -e "\t echo \"$Title - usage :\";"
for element in "${array[@]}"
do
    echo -e "\t echo \"-x $element\";"
done
echo -e "}\n"

Letters=($(echo "$Options" | awk -F "," '{for (i = 1; i <= NF; i++) {print "x:"}}'| tr -d "\n" | awk '{print $0"h"}'))
echo -e "while getopts $Letters option\ndo\n\tcase \"\${option}\"\n\tin"

# divide the string into an array
IFS=',' read -r -a array <<< "$Options"
# iterate on the array to write a line per option
for element in "${array[@]}"
do
    echo -e "\tx) $element=\${OPTARG};;"
done

# write h)
echo -e "\th) Help;"
echo -e "\t   exit;;"

# write ?)
echo -e "\t?) Help;"
echo -e "\t   exit;;"

echo -e "\tesac\ndone"


# Body :

echo "#########################"
echo -e "# exit if a command fails\nset -e\n########"
echo -e "######################### RUN\n\n######################### DONE"

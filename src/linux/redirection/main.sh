# Declare variable

# Declare function

# Execute Script
echo "--------- case 1 : redirect stdout, new file and write information ---------"
ls > /tmp/output
cat /tmp/output
echo "--------- case 2 : redirect stdout, if file exist, append to file ---------"
ls >> /tmp/output
cat /tmp/output
echo "--------- case 3 : redirect stdout can not redirect error message ---------"
ls nonexistfile > /tmp/output
wc -l /tmp/output
echo "--------- case 4 : redirect stdout and stderr to different file ---------"
ls nonexistfile 1> /tmp/output 2> /tmp/error
wc -l /tmp/output
wc -l /tmp/error
echo "--------- case 5 : redirect stdout to file, and stderr redirect to stdout ---------"
ls nonexistfile 1> /tmp/output 2>&1
wc -l /tmp/output
echo "--------- case 6 : redirect file to variable with stdin ---------"
echo "input 1" > /tmp/in
cat < /tmp/in

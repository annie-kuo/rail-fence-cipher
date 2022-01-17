#!/bin/bash

echo "============================================================"
# PRELIMINARY CHECKS
# check if there is a cipher.c in the current directory
echo "CHECKING IF cipher.c IS IN THE CURRENT DIRECTORY"
if [[ ! -f cipher.c ]]
then
	echo "cipher.c was not found in the current directory."
	echo "=======================END=OF=TESTING======================="
	exit
fi
echo "cipher.c was found in the current directory."

# compile the file and check if the executable file is built
gcc -o cipher cipher.c
if [[ ! -f cipher ]]
then
	echo "The executable cipher file has not been built."
	echo "=======================END=OF=TESTING======================="
	exit
fi
echo "The executable cipher file has been built."



echo "============================================================"
# VALID ARGUMENT TESTS
echo "TESTING FOR VALID ARGUMENTS"

# test 1.1
echo "TEST 1.1: incorrect number of arguments passed"
echo "$ ./cipher"
./cipher
status=$?
echo -e "$ echo \$?"
echo "$status"
echo "--------------------"

# test 1.2
echo "TEST 1.2: incorrect number of arguments passed"
echo "$ ./cipher -e"
./cipher -e
status=$?
echo -e "$ echo \$?"
echo "$status"
echo "--------------------"

# test 1.3
echo "TEST 1.3: invalid first argument"
echo "$ ./cipher -k 5 HELLOTHERE"
./cipher -k 5 HELLOTHERE
status=$?
echo -e "$ echo \$?"
echo "$status"
echo "--------------------"

# test 1.4
echo "TEST 1.4: invalid second argument"
echo "$ ./cipher -e 4.r HELLOTHERE"
./cipher -e 4.r HELLOTHERE
status=$?
echo -e "$ echo \$?"
echo "$status"
echo "--------------------"

# test 1.5
echo "TEST 1.5: second argument out of bound"
echo "$ ./cipher -e 11 HELLOTHERE"
./cipher -e 11 HELLOTHERE
status=$?
echo -e "$ echo \$?"
echo "$status"



echo "============================================================"
# ENCRIPTION TESTS
echo "TESTING FOR ENCRYPTIONS"

# test 2.1
echo "TEST 2.1: encryption 1"
echo " $ ./cipher -e 3 THISISASECRETMESSAGE"
./cipher -e 3 THISISASECRETMESSAGE
status=$?
echo -e "$ echo \$?"
echo "$status"
echo "--------------------"

# test 2.2
echo "TEST 2.2: encryption 2 (empty message)"
echo "$ ./cipher -e 3 \"\""
./cipher -e 3 ""
status=$?
echo -e "$ echo \$?"
echo "$status"
echo "--------------------"

# test 2.3
echo "TEST 2.3: encryption 3"
echo "$ ./cipher -e 5 THISISASECRETMESSAGE"
./cipher -e 5 THISISASECRETMESSAGE
status=$?
echo -e "$ echo \$?"
echo "$status"
echo "--------------------"

# test 2.4
echo "TEST 2.4: encryption 4"
echo "$ ./cipher -e 9 CANYOUENCRYPTTHIS"
./cipher -e 9 CANYOUENCRYPTTHIS
status=$?
echo -e "$ echo \$?"
echo "$status"


echo "============================================================"
# DECRYPTION TESTS
echo "TESTING FOR DECRYPTIONS"

# test 3.1
echo "TEST 3.1: decryption1"
echo "$ ./cipher -d 3 THISISASECRETMESSAGE"
./cipher -d 3 THISISASECRETMESSAGE
status=$?
echo -e "$ echo \$?"
echo "$status"



echo "=======================END=OF=TESTING======================="

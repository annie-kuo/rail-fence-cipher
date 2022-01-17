/*
 Program to implement a text cipher
 ***************************************************************
 * Author	Dept.		Date		Notes
 ***************************************************************
 * Annie K	Comp. Science.	Mar 17 2021	Initial version
 * Annie K	Comp. Science.	Mar 17 2021	Added input validation
 * Annie K	Comp. Science.	Mar 18 2021	Add encryption algorithm
 */

#include <stdio.h>
int main (int argc, char *argv[]) {
	// INPUT VALIDATION
	/* argv[1] is the mode
	 * argv[2] is the key
	 * argv[3] is the message */

	// check if the program is passed 3 arguments
	if (argc != 4) {
		printf("Usage: ./cipher [-e|-d] <key> <MESSAGE>\n");
		return 1;
	}
	
	// check if the first argument is valid
	if (argv[1][0] != '-' || (argv[1][1] != 'd' && argv[1][1] != 'e')) {
		printf("Error %s is not a valid option\n", argv[1]);
		return 1;
	}

	// check if the second argument is valid
	if ((argv[2][0] < 50 || argv[2][0] > 10) && argv[2][1] != '\0') {
		printf("Error %s is not a valid key\n", argv[2]);
		return 1;
	}
	

	// ENCRYPTION ALGORITHM
	if (argv[1][1] == 'e') {
		int key = argv[2][0]-'0';
		int step1 = (key - 1)*2; // first step size for the first level
		int step2 = 0; // second step size for the first level
		int initial = 0; // initial position for the first level

		// figure out the length of the message
		int length = 0;
		for (int i = 0; argv[3][i] != '\0' ; i++) {
			length++;
		}

		// use the step-size to iterate through the message
		for (int level = 1; level <= key ; level++) {
			// keep track of which step size to use
			// if turn  is 0 -> use step1
			// otherwise -> use step2
			int  turn = 0;

			for (int position = initial; position < length; position=position ) {
				// print each letter in the corresponding level
				if (!turn) {
					printf("%c",argv[3][position]);
					// update position
					if (step1 != 0) {
						position += step1;
					} else {
						position += step2;
					}
					turn = 1;
				} else {
					printf("%c",argv[3][position]);
					if (step2 != 0) {
						position += step2;
					} else {
						position += step1;
					}
					turn = 0;
				}
			}
			
			// update the new step sizes and initial position for the next level
			step1 -= 2;
			step2 += 2;
			initial +=1;
		}
		printf("\n");
	}

	// DECRYPTION ALGORITHM
	else if (argv[1][1] == 'd') {
		return 0;
	}




}

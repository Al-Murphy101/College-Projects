/* 

Program by Alan Murphy 

This program allows the user to choose from 6 options. Option 1 allows the user to choose 1 out of 2 options.
They can enter the 4 digit code manually or create a randomally generated 4 diget code. Option 2 allows the user
to encrypt the 4 diget code using an encryption algorithm. Option 3 allows the user to compare the encrypted
code matches the default authorised access code.Option 4 allows the user to decrypt the 4 digit code entered.
Option 5 allows the user to display the number of times the encrypted 4 digit code is correct/wrong. Option 6
will allow the user to exit the program */

/*Library headers*/
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*Symbolic Naming*/
#define SIZE1 4

/*Structures*/
struct codeCount
{
	int correctCode;
	int wrongCode;
};

/*Function Signature*/
void enterCode(int[], bool*, bool*, bool*, bool*);
void encryptCode(int[], bool*, bool*, bool*);
void accessCode(int[], struct codeCount *attempt, bool*, bool*);
void decryptCode(int[], bool*, bool*);
void entryAttempt(struct codeCount *attempt);
void end();

/*Start Main*/
int main()
{
	int option;
    int userCode[SIZE1];
	bool option1, option2, option3, option4;
	struct codeCount attempt;

	/*Set values for attempts to 0*/
	attempt.correctCode = 0;
	attempt.wrongCode = 0;

	/*Start Do While to loop the menu until an option is chosen*/
	do
	{

		/*Main Menu*/
		printf("\n**Main Menu**\n");
		printf("\nPlease choose an option from the Main Menu\n");
		printf("1. Enter a 4 digit code.\n");
		printf("2. Encrypt a 4 digit code.\n");
		printf("3. Check a 4 digit code.\n");
		printf("4. Decrypt 4 digit code entered.\n");
		printf("5. Display number of times encrypted was correct/wrong.\n");
		printf("6. Exit program.\n");

        scanf("%d", &option);

		/*Start switch case*/
		switch(option)
		{
            /*Start first case*/
			case 1:
			{
				/*Jumps to enterCode function*/
				enterCode(userCode, &option1, &option2, &option3, &option4);
				break;
			} /*end first case*/

			/*Start second case*/
			case 2:
			{
				/*Jumps to encryptCode function*/
				encryptCode(userCode, &option2, &option3, &option4);
				break;
			} /*end second case*/

			/*Start third case*/
			case 3:
			{
				/*Jumps to accessCode function*/
				accessCode(userCode, &attempt, &option1, &option3);
				break;
			} /*end third case*/

			/*Start fourth case*/
			case 4:
			{
				/*Jumps to decryptCode function*/
				decryptCode(userCode, &option2, &option4);
				break;
			} /*end fourth case*/

			/*Start fifth case*/
			case 5:
			{
				/*Jumps to entryAttempt function*/
				entryAttempt(&attempt);
				break;
			} /*end fifth case*/

			/*Start sixth case*/
			case 6:
			{
				/*Jumps to exit function*/
				end();
				break;
			} /*end fifth case*/

			/*Start default case*/
			default:
			{
				printf("Please try again or restart the program!\n");
			}/*end default case*/

		} /*end switch case*/

	} /*end do while*/
	while(1);

return 0;
} /*end main*/

/*Start function. This function allows the user to enter in the 4 diget code*/
void enterCode(int userCode[], bool *option1, bool *option2, bool *option3, bool *option4)
{
	int i;

		/*for loop to allow user to enter 4 diget code*/
		for(i = 0; i < SIZE1; i++)
		{
			printf("Please enter diget %d of %d and press enter!\n", i+1, SIZE1);
			scanf("%d", &*(userCode+i));
		} /*end for*/
}

/*Start function. This function allows the user to encrypt the 4 diget code*/
void encryptCode(int userCode[], bool *option2, bool *option3, bool *option4)
{
    int i;
	int temp;

	/*if statement checks if previous code entered has been encrypted*/
	if(*option2 == false && *option3 == true)
	{
		/*Lets user know the code has already been encrypted*/
		printf("You have already encrypted this code!\n");
	} /*end if*/

	/*start else if*/
	else if(option2 == false)
	{
		/*lets user know they have to enter a 4 digit code*/
		printf("Please enter a 4 digit code!\n");
	} /*end else if*/

	/*start else*/
	else
	{
		printf("Your 4 digit code is now being encrypted!\n");

        /*for loop to begin encrypting user code*/
		for(i = 0; i < SIZE1/2; i++)
		{
			temp = *(userCode+i);

			*(userCode + i) = *(userCode + (i + (SIZE1/2)));
			*(userCode + (i + (SIZE1/2))) = temp;
		} /*end for*/

		/*for loop to add 1 to each digit and reorganise the code*/
		for(i = 0; i < SIZE1; i++)
		{
			*(userCode + i) = *(userCode + i) + 1;

			/*if statement to change 10, if entered, to 0*/
			if(*(userCode + i) == 10)
			{
				*(userCode + i) = 0;
			} /*end if*/

		} /*end for*/

		/*option 3 and 4 set to true so user check if code in encrypted*/
		*option3 = *option4 = true;

		/*option 2 set to false. Allows user to encyrpt code again*/
		*option2 = false;

	} /*end if*/

} /*end encryptCode function*/

/*Start function. This function allows the user to check if they have entered the correct code*/
void accessCode(int userCode[], struct codeCount *attempt, bool *option1, bool *option3)
{
	const int accessCodes[] = {4, 5, 2, 3};
	int i = 0;

        /*Do while to check if code is correct*/
		do
		{

            /*if statement to check code entered is correct*/
			if(*(userCode + i) == *(accessCodes + i))
			{
				i++;
			} /*end if*/

		} /*end do while*/
		while(i < SIZE1 && *(userCode + i) == *(accessCodes + i));

        /*If staement to check code*/
		if(i == 4)
		{
            /*print to screen*/
			printf("The code you entered is correct!\n");

			/*increase attempts made*/
			attempt->correctCode++;
		} /*end if*/

		/*start else*/
		else
		{
			/*print to screen*/
			printf("The code you entered is incorrect!\n");

			/*increase attempts made*/
			attempt->wrongCode++;
		} /*end else*/

} /*end accessCode function*/


/*Start function. This function allows the user to decrypt the code*/
void decryptCode(int userCode[], bool *option2, bool *option4)
{
	int temp;

	/*start if*/
	if(*option4 == false)
	{
		/*print to screen*/
		printf("Please enter a code and encrypt it to decrypt it!\n");
	} /*end if*/

	/*start else*/
	else
	{
		/*for statement to take away 1 from each digit in order to decrypt the code*/
		for(int i = 0; i < SIZE1; i++)
		{
			*(userCode + i) = *(userCode + i) - 1;

			/*checks if a number is -1*/
			if(*(userCode + i) == -1)
			{
				/*changes -1 to 9*/
				*(userCode + i) = 9;
			} /*end if*/

		} /*end for*/

		/*for statement to swap numbers*/
		for(int i = 0; i < SIZE1/2; i++)
		{
			/*store number in temp*/
			temp = *(userCode+i);

			/*swaps code number*/
			*(userCode + i) = *(userCode + (i + (SIZE1/2)));
			*(userCode + (i + (SIZE1/2))) = temp;
		} /*end for*/

		/*print to screen*/
		printf("Your code is now decrypted!\n");

		/*option 2 set to true to encrypt code*/
		*option2 = true;

		/*option 4 set to false to decrypt code*/
		*option4 = false;

	} /*end else*/

} /*end decryptCode function*/


/*Start function. This function allows the user to view correct/incorrect attaempts made*/
void entryAttempt(struct codeCount *attempt)
{

	/*print to screen*/
	printf("You have made %d correct attempts!\n", attempt -> correctCode);

	/*print to screen*/
	printf("You have made %d incorrect attempts!\n", attempt -> wrongCode);

} /*end entryAttempt function*/

/*Start function. This function allows the user to exit the program*/
void end()
{

	int option2;

	/*print to screen*/
	printf("Do you want to exit the program?\n Press 1 to exit! \n Press 2 to stay!\n");
	scanf("%d", &option2);

	/*if statement to check users choice*/
	if(option2 == 1)
	{

		/*print to screen*/
		printf("Exiting program now! Good bye!");

		exit(0);

		} /*end if*/

		/*start else*/
		else
		{

			/*print to screen*/
			printf("You decided to go again! Let's go again!\n");

		} /*end else*/

} /*end exit function*/


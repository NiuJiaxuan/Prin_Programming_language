Author: Jiaxuan Niu niu.235

New files:
memory.c
I add three new methods in this file, which are void addReferenceCount( ); void decreaseReferenceCount( ); and int getReferenceCount( ); I have wrote comments on each methods. 
Also, I add one variable on the frame strcuture, which is used to count the reference number in the current frame

executor.c
I wrote several lines of code to deal with special case, like while. 

Special feature: 
I used the project 4 from professor.

design of the interpreter:

I passed all the test cases. 
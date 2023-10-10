# Prin_Programming_language
This program includes a sanner, parser, interpreter, function processor and garbage collecter. 

## Scanner:
Reads an ASCII text file and outputs a stream of tokens based on the core.h enumeration.
Implement functions: scanner open, scanner close, currentToken, nextToken, getId, and getConst.
Can read the entire file or tokenize on-demand.
Returns EOS (End Of Stream) after scanning the entire file.
## CORE Parser:
Build a parser for the Core language.
The main procedure (main.c) instantiates the scanner, generates a parse tree using recursive descent, performs semantic checks, and prints the Core program from the parse tree.
Input is the same as the scanner project.
Generates a parse tree for the input program using recursive descent.
## CORE Interpreter:
Build an interpreter for the Core language.
The main procedure (main) initializes the scanner, parses, and executes the input program.
Executor should execute the Core program by walking over the parse tree.
Simulate memory for variables.
Input consists of a .code file (program) and a .data file (integer constants).
Each Core out statement outputs the integer value of the expression to stdout.
## Function Calls:
Modify the Core interpreter to handle function definitions and function calls.
Functions will only accept record variables as parameters.
Parameter passing is done with call by sharing.
Supports recursion, which requires a call stack.
Input and output same as the previous interpreter project.
## Garbage Collection:
Modify the Core interpreter to handle garbage collection.
Implement reference counting for record objects.
Each record object should have a "reference count".
Garbage collector produces output each time the number of reachable objects changes.

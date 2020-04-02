# Mod-ELF-Symbol
replace or modify symbol names in elf object files (relocatable and executable)

## SETUP
In your Terminal:

	$> git clone https://github.com/j-h-k/Mod-ELF-Symbol.git
	$> make

## USAGE/HOW TO

### ![#f03c15](https://placehold.it/15/f03c15/000000?text=+) Append to symbol foo
**foo** \-\-\> **foobar**  

	$> ./mod-elf-symbol -o main.o -s foo --singlestr=bar > /dev/zero

![image of HOWTOAPPEND](/images/HOWTO_APPEND.gif)

### ![#c5f015](https://placehold.it/15/c5f015/000000?text=+) Replace symbol foo
**foo** \-\-\> **bar**  

	$> ./mod-elf-symbol -o main.o -c foo --completestr=bar > /dev/zero

![image of HOWTOREPLACE](/images/HOWTO_REPLACE.gif)

### ![#1589F0](https://placehold.it/15/1589F0/000000?text=+) Number symbol foo
**foo** \-\-\> **foo__1**

	$> ./mod-elf-symbol -o main.o -k foo --keepnumstr=__ > /dev/zero 

### Examples with Makefile

	$> make <run_append | run_replace | run_number>  


## TEMPLATES TO USE
![#f03c15](https://placehold.it/15/f03c15/000000?text=+) Append to symbol(s):  
**foo** \-\-\> **foo\<string_to_append\>**

	$> ./mod-elf-symbol -o file1.o [more files.o ...] \
	-s symbol1 symbol2 symbol3 [more symbols ...] \
	--singlestr=<string_to_append>

![#c5f015](https://placehold.it/15/c5f015/000000?text=+) Replace symbol(s):  
**foo** \-\-\> **\<new_symbol\>**  

	$> ./mod-elf-symbol -o file1.o [more files.o ...] \
	-c symbol1 [more symbols ...] \
	--completestr=<new_symbol>

![#1589F0](https://placehold.it/15/1589F0/000000?text=+) Number symbols(s):  
**foo** \-\-\> **foo\<string_inbetween\>\<number\>**  

	$> ./mod-elf-symbol -o file1.o [more files.o ...] \
	-k symbol1 symbol2 symbol3 [more symbols ...] \
	--keepnumstr=<string_inbetween>


## SPECIAL FLAGS

## IMPORTANT RULES
'\-\-singlestr and \-\-keepnumstr and \-\-compeltestr can only be used once per program execution.'  



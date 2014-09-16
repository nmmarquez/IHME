* there are five different numeric data types
* byte, int, long, float, double

* compress command converts variables to most efficient possible
help compress

* Missing is denoted by a period (or period with letter like .a)
* Missing is considered infinitely large (stupid)

* using stata as a calculator
display 2 + 2 // add
display 2 - 2 // subtract
display 2 * 2 // multiply
display 3/2 // divide
display 3^2 // exponentiate
display "2+2" // string
display 3 == 3 // equate
display 3 == 2 // equate
display 3 != 2 // equate

* for all files
*Header*
*Boilerplate*
* clear everything in memory
clear all

* so you dont have to click through results always do!!!!
set more off

* Closes a log file
capture log close

* capture tries to run code but continues even if it cant

* create a log version of your session
log using filename.smcl // create log
log close // close log
log off // Temp usupend logging
log on // Resume log
log using filename , append smcl // comma means options are to follow
capture log off

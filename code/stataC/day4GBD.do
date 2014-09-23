* Today is for loops, while loops, and flow control
clear all
set more off
cd "J:/temp/bootCamp/stataWorkshop/data"
use "GBD+WorldBank.dta", clear

* we create local macros using forvalues
forvalues x = 1970/2010 { // what to loop through
	display `x' // display year
	summarize under5MR if year==`x' // the task to do
}

forvalues x = 1970(2)2010 {
	display `x'
	summarize under5MR if year==`x'
}

forvalues x = 1970/2010 {
	quietly summarize under5MR if year==`x'
	display "`x': `r(mean)' (`r(sd)')" // using r local variables
}

clear all

forvalues x = 1970/2010 {
	append using "full_`x'.dta" // laod and append a shit ton of data together
}
* now we can use foreach
* 
foreach name in bob joe sally {
	display "`name'"
}
local names bob joe sally

foreach name of local names {
	display "`name'"
}

foreach x of varlist *mr {
	regress birthattend `x'
}

foreach x of varlist *mr {
	graph twoway (scatter birthattend `x', color("red")), name(`x',replace)
}
* while loops
local count = 1
while `count'<=10{
	display `count'
	local ++count
}
levelsof region
* local option will store results in a local
levelsof region, local(regions)
* clean option will store everything with out adding quotes
levelsof region,local(regions) clean

levelsof country, local(countrys)
foreach name of local countrys {
	quietly summarize under5mr if country=="`name'"
	display "`name': `r(mean)' (`r(sd)')"
}

forvalues x = 1/10 {
	if mod(`x',2)==0 {
		display "even"
	}
	else {
		display "odd"
	}
}

* exercise
clear all
local count = 1
forvalues x = 1970/2010 {
	if `count'==1 {
		tempfile appendTemp
		import delimited using "full_`x'.csv",clear
		save `appendTemp'
	}
	else {
		import delimited using "full_`x'.csv", clear
		append using `appendTemp'
		save `appendTemp', replace
	}
	local ++count
}

foreach var of varlist *deaths {
	local sumCmd `sumCmd' sum `var' = `var'
	local cCmd `cCmd' count `var' = `var'
}


local fn rarea rbar rspike rcap
foreach f of local fn {
	graph twoway `f' (under5upper under5lower year) if country=="Mexico", ///
	name(`f',replace)
	graph combine "rarea" "rbar" "rspike" "rcap"
	display "`f'"
}



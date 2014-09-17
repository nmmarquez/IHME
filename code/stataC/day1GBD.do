* Training with mortality data
clear all
set more off // change the display to more off
cd "J:/temp/bootCamp/stataWorkshop/data" // change directory
use "gbdChildMortalitydata.dta", clear // load data

* you can use the <browse> CMD to scope out the data
describe // gives some info on your data in file
codebook // more detailed info on each variable
inspect // another summary tool but only for numerics, builds shitty histogram

inspect year neoMR // only inspects the named variables
inspect *MR // wildcard can be used here like unix
inspect u~MR // wildcard with someting never use the tilda
inspect ne?MR // ? is single character wild card unix esque again
inspect iso - year // looks at the neoMR through ageMR summaries

codebook under5* // all the under5
codebook *Deaths // all the Death variables
inspect *neo* // all the neo variables

summarize neoMR, detail

tabulate region // 1 way freq table
tabulate region income // 2 way freq table

tabulate region, missing // 1 way freq table with missing data
tabulate region income, missing // 2 way freq table with missing data

tabstat neoMR, by(income) stat(n mean sd min p25 p50 p75 max) // stat table

* if statements
summarize neoMR if country=="Afghanistan"
summarize under5MR if region=="Sout Asia" | ///
region=="East Asia & Pacific"

* in statements
inspect neoMR in 1/20

* by statements
by region: summarize neoMR // if your data is already sorted
sort region // or you can sort first
by region: summarize neoMR // then do the by funcion
bysort region: summarize neoMR // all in one function

* now lets combine functions
bysort region: summarize neoMR if year >= 2000

* crazy combo
bysort region: tabstat neoMR if year >= 2000, by (year) stat (n mean sd)

* general structure of a command
* [by varlist:] command [varlist] [=exp] [if exp] [in exp] [weight] [, options]

list country iso if region == "Sub-Saharan Africa" & year == 2010
count if region == "Sub-Saharan Africa" & year == 2010

* make sure vgcolormap is installed!!!
histogram under5MR // histogram!!! check out the options with help histogram
histogram under5MR, frequency color (maroon) // change color and use freq
histogram under5MR, bin(10) // change bins

* graph exercise
use "GBD+WorldBank.dta", clear // new data
hist beds // simple hist
hist beds, frequency // change to freq
hist beds, width (1) // change width
hist beds, color (red) fintensity (80) // change color
hist beds, title("Cool Title") // change title

graph box beds
graph hbox beds
graph box beds, over (highIncome)
graph hbox under5MR, over (income)
graph box under5MR, over (income, label (labsize (medsmall) angle (45)) ///
sort(1) descending)

* Training with mortality data
clear all
set more off // change the display to more off
cd "J:/temp/bootCamp/stataWorkshop/data" // change directory
use "GBD+WorldBank.dta", clear // load data

line under5MR year if country=="Swaziland" //

graph twoway (scatter gini under5MR, color("red") /// plot gini against under5MR
title("Really Cool Title")) (lfit gini under5MR, color("blue")) // + more stuff

graph hbox beds, over(highIncome) name(bedsByIncome) // save the graph in mem

* loading dta is the easiest way to load data, see above

* delimted data is a little trickier but we can deal
import delimited "worldBankCountryInfo.csv", varnames(1) delimiters(",") clear

sort iso // sort by iso ascending
gsort -region +iso // descending region ascending iso
 
* variable creation
generate x = 1
generate highIncome = 1 if ///
income == "High income: OECD" | income == "High income: nonOECD"
replace highIncome = 0 if missing(highIncome) & !missing(income)

* new data
import delimited "worldBankCountryIndicators.csv", varnames(1) ///
case(preserve) clear

* lets make new data
generate gdp2005PerCap = gdp2005/pop
generate gdpCurrPerCap = gdpCurrent/pop

generate allSchool = 0 if enrollAll < 99 // remember missing is considered inf
replace allSchool = 1 if missing(allSchool) & !missing(enrollAll)

drop allSchool

generate allSchool = enrollAll>=99 if !missing(enrollAll)

* drop will allow you to remove observations or variables
* keep will do the opposite

drop hExp* oop* // drop all health expenditures and out of pocket vars
keep if (year>=2000 & year<=2010) // only take years if they are within range

* Check out variable labels!
label variable beds "Beds per some amount of people"
label variable pop "Population, total"
label variable pop0_14 "Population ages 0-14 (% of Total)"
label variable pop15_64 "Population ages 15-64 (% of Total)"
label variable pop65 "Population ages 65+ (% of Total)"
label variable popFemale "Population Female (% of Total)"

* Now Value labels
tabulate allSchool
label define allSchool 0 "Enrollment <99%" 1 "Enrollment 99%+"
label values allSchool allSchool
tabulate allSchool

* test
generate catNIG = 0 if (natIncomeGrowth >= -1 & natIncomeGrowth <= 1)
replace catNIG = -1 if natIncomeGrowth < -1
replace catNIG = 1 if natIncomeGrowth > 1 & !missing(natIncomeGrowth)

tabulate catNIG, missing
label define catNIG 0 "Stable" 1 "Positive" -1 "Negative"
label values catNIG catNIG catNIG
tabulate catNIG, missing

* Recode will recode to a catagorical variable
recode natIncomeGrowth (-1/1=2 "Stable") (min/-1=-1 "Negative") ///
(1/max=3 "Positive"), gen(natIncomeGrowthCat)
tab natIncomeGrowthCat, missing

* know merge (merge) vs appened (rbind)
append using ""

* kinds of merges are 1:1, 1:m, m:1, m:m
merge 1:1 iso year using "hExp+oop.dta"

* merge in 5 child mortality data sets
clear all
append using "gbdChildMortality_1970s.dta" "gbdChildMortality_1980s.dta" ///
"gbdChildMortality_1990s.dta" "gbdChildMortality_2000s.dta" ///
"gbdChildMortality_2010s.dta"

merge 1:1 iso year using "worldBankCountryIndicators.dta"
drop _merge
merge m:1 iso using "worldBankCountryInfo.dta"
drop _merge

* export delimited using "worldBankInfo.dta", replace
mkdir realdealneal
cd realdealneal
save "mergedChildMort.dta", replace
export delimited using "mergedChildMort.csv", replace

* tostring and destring with possible option force need either gen or replace
* encode will convert a variable to a labeled numeric

* statistical inference
clear all
set more off
cd "J:/temp/bootCamp/stataWorkshop/data"
use "GBD+WorldBank.dta", clear

ttest natIncomeGrowth == 0 if year==2010 // one sample ttest
ttest neoMR, by(highIncome)

ttest under5MR if year == 2010, by (completeEnroll)

* ci gets ci for mean proportion and count
ci completeEnroll if year==2010, binomial wilson
ci under5MR if year==2010

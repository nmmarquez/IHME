clear all
set more off
cd "J:/temp/bootCamp/stataWorkshop/data"
use "GBD+WorldBank.dta", clear


egen totunder5Death = total(under5Death)
egen misAllHealth = rmiss(hExp*)

display lower("United KinGDOM")
display subinstr("Let's replace the spaces", " ", "_", .)

gen asia = strmatch(gbdRegion, "Asia*") if !missing(gbdRegion)
gen highIncomeTemp = strmatch(lower(income),"*high*") if !missing(income)
gen regionL = lower(region)
gen regionUS = subinstr(regionL, " ", "_", .)

gen natIncomeGrowthCat = sign(int(natIncomeGrowth))
gen n = _n
gen N = _N

bysort country (year): gen countryIndex = _n
bysort country: gen countryN = _N

tab countryN if countryN==countryIndex
bysort country (year): gen firstYear = _n==1


bysort country: egen cDeath = total(under5Death)
replace cDeath = . if countryN!=41

* DF of deaths in each age catagory and mean MR by country
preserve
collapse (sum) *Deaths (mean) *MR, by(country)
restore
preserve
collapse (sum) *Deaths (mean) *MR if year>1999 & year<2010, by(gbdRegion)
restore

use "countryIndicatorsLongForm.dta", clear
preserve
reshape wide data, i(countrycode  year) j(indicator)
restore

use "GBD+WorldBank.dta", clear
regress neoMR gdpCurrentPerCap gini if year==2010
regress neoMR year
encode region, gen(region2)
regress neoMR year i.region2
regress neoMR year ib5.region2 // change the baseline or intercept

* Macros! they are kina like scalars 2 types
* Local Only exists where created
* Global Exists everywhere throughout session
* check out help macro

local a 4
local b 9
local c "to the power of"
local d "equals"
display "`b' `c' `a' `d' " `b'^`a'

* locals that are created by Stata fal into either r-class and e-class
* R-class
summarize pop
display `r(N)'
display `r(mean)'
display `r(max)'

* E-class
regress neoMR year i.region2
matrix list e(b)

* supress output
quietly summarize pop
quietly summarize birthRate if year == 2010
display "The mean birth rate in 2010 was `r(mean)' (SD = `r(sd)')"

local x: variable label pop65
local y = wordcount("`x'")
display "The label for pop65 is `x' and it contains `y' words."

*===============================================================================
*
* Willmott, Matsuura & Collaborators' Global Climate Resources
* Air Temperature and Precipitation Data 1900-2014
* URL: http://climate.geog.udel.edu/~climate/
* 
* Author	:	Nicolas Dominguez
* Last mod	: 	August 29th 2018
* Version	:	Stata 13.1
*
*===============================================================================

version 13.1
clear all
set more off

********Directory (DB)
glo id	"C:\Users\ndominguez\Dropbox\Databases\UDEL"
glo dt	"$id\Databases"
glo t14	"$id\2014\Terrestrial-Air-Temperature\Monthly-Series"
glo p14	"$id\2014\Terrestrial-Precipitation\Monthly-Series"
glo t17	"$id\2017\Terrestrial-Air-Temperature\Monthly-Series"
glo p17	"$id\2017\Terrestrial-Precipitation\Monthly-Series"

*===============================================================================
* Air Temperature & Precipitation (from *.txt to *.csv)
*===============================================================================

*===============================================================================
* 1900-2014 (June 2018)
*===============================================================================

timer clear 1
timer on 1
local	lista1	"t p"
local	lista2	"air_temp precip"
forval name=1/2 {
	local	11: word `name' of `lista1'
	local	22: word `name' of `lista2'
	forval y=1900/2014 {
		cd		"${`11'14}\TXT"
		if (`name'==1&(`y'!=2001&`y'!=2003))|(`name'==2&(`y'!=2003))  {
			import delimited using "`22'_`y'.txt", delimiters(" ", collapse) clear /* 'collapse' treats many single spaces together as a single one */
			forvalues i=1/14 {
				local	g=`i'+1
				gen		x`i'=v`g'
			}
			forvalues i=14(-1)1 {
				replace	v`i'=x`i' if v1==.
			}
			drop	v15-x14
		}
		else if (`name'==1&(`y'==2001|`y'==2003))|(`name'==2&(`y'==2003))  {
			import delimited using "`22'_`y'.txt", delimiters(tab) clear /* 'collapse' treats many single spaces together as a single one */
		}
		gsort	v1 -v2
		gen		id_coord=_n
		order	id_coord
		rename	(v1 v2) (lon lat)
		cd		"${`11'14}\CSV"
		export delimited using "`22'_`y'", replace /* export delimited saves in *.csv format w/o specifications */
		
		import delimited "`22'_`y'", clear case(lower)
		rename	(v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14) ///
				(`11'_`y'_01 `11'_`y'_02 `11'_`y'_03 `11'_`y'_04 `11'_`y'_05 `11'_`y'_06 ///
				 `11'_`y'_07 `11'_`y'_08 `11'_`y'_09 `11'_`y'_10 `11'_`y'_11 `11'_`y'_12)
		tempfile x`11'_`y'
		di	"`x`11'_`y''"
		save "`x`11'_`y''", replace
	}
	use	"`x`11'_1900'", clear
	forval y=1901(1)2014 {
		mer 1:1 id_coord using "`x`11'_`y''", nogen
	}
	save "$dt\\`22'_2014", replace
}
timer off 1
timer list // 14.26'

*===============================================================================
* 1900-2017 (August 2018)
*===============================================================================

timer clear 1
timer on 1
local	lista1	"t p"
local	lista2	"air_temp precip"

forval name=1/2 {
	local	11: word `name' of `lista1'
	local	22: word `name' of `lista2'
	forval y=1900/2017 {
		cd		"${`11'17}\TXT"
		import delimited using "`22'_`y'.txt", delimiters(" ", collapse) clear /* 'collapse' treats many single spaces together as a single one */
		forvalues i=1/14 {
			local	g=`i'+1
			gen		x`i'=v`g'
		}
		forvalues i=14(-1)1 {
			replace	v`i'=x`i' if v1==.
		}
		drop	v15-x14
		gsort	v1 -v2
		gen		id_coord=_n
		order	id_coord
		rename	(v1 v2) (lon lat)
		cd		"${`11'17}\CSV"
		export delimited using "`22'_`y'", replace /* export delimited saves in *.csv format w/o specifications */
		
		import delimited "`22'_`y'", clear case(lower)
		rename	(v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14) ///
				(`11'_`y'_01 `11'_`y'_02 `11'_`y'_03 `11'_`y'_04 `11'_`y'_05 `11'_`y'_06 ///
				 `11'_`y'_07 `11'_`y'_08 `11'_`y'_09 `11'_`y'_10 `11'_`y'_11 `11'_`y'_12)
		tempfile x`11'_`y'
		di	"`x`11'_`y''"
		save "`x`11'_`y''", replace
	}
	use	"`x`11'_1900'", clear
	forval y=1901(1)2017 {
		mer 1:1 id_coord using "`x`11'_`y''", nogen
	}
	save "$dt\\`22'_2017", replace
}
timer off 1
timer list // 14.84'


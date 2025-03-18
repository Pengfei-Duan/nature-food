
*Figures 1c and 1d can be obtained using the data file.



use "F:\Desktop\data.dta",clear

******Fig 1 c d

**sheep
histogram sheep_weight  ,d  frequency  width(1) ylabel(0(500)2000 ,nogrid) xlabel(15 (5)90,nogrid ) fcolor("125 164 148") lcolor(gs6) graphregion(ifcolor(white)) ytitle("Number of sheep(heads)")xtitle("Distribution of sheep weight(kg)")subtitle("n= 69,272", position(1)) ylabel(,tposition(inside) nogrid) xlabel(, tposition(inside) nogrid)  plotregion(lpattern(blank)) ylabel(, angle(0)) 


**cattle
histogram cattle_weight ,d  frequency  width(10) ylabel(0(100)400,nogrid) xlabel(100(100)800,nogrid) fcolor("125 164 148") lcolor(gs6) graphregion(ifcolor(white)) ytitle("Number of cattle(heads)")xtitle("Distribution of cattle weight(kg)")subtitle("n= 12,945", position(1)) ylabel(,tposition(inside) nogrid) xlabel(, tposition(inside) nogrid)  plotregion(lpattern(blank)) ylabel(, angle(0))



*****Appendix 1 Figure*****************************************************************

sort sheep_weight 

gen sheep_group=1 if sheep_weight>=15&sheep_weight<20
replace sheep_group=2  if sheep_weight>=20&sheep_weight<25
replace sheep_group=3  if sheep_weight>=25&sheep_weight<30
replace sheep_group=4  if sheep_weight>=30&sheep_weight<35
replace sheep_group=5  if sheep_weight>=35&sheep_weight<40
replace sheep_group=6  if sheep_weight>=40&sheep_weight<45
replace sheep_group=7  if sheep_weight>=45&sheep_weight<50
replace sheep_group=8  if sheep_weight>=50&sheep_weight<75



bysort sheep_group:egen ch4ef_sheep_mean=mean(ch4ef)
bysort sheep_group:egen ch4mm_sheep_mean=mean(ch4mm)
bysort sheep_group:egen n2omm_sheep_mean=mean(n2omm)

label define sheep 1"15-20" 2"20-25" 3"25-30" 4"30-35" 5"35-40" 6"40-45" 7"45-50" 8"50-75"
label values sheep_group sheep



*****sheep
 #delimit ;

gr box ch4ef, o(sheep_group)

bar(1,color(228 227 191)  lcolor(black))
ylabel(, tposition(inside) nogrid)
plotregion(lpattern(blank))
ytitle("CH{sub:4} emission from enteric fermentation " "(kg CO{sub:2}e head{sup:-1} year{sup:-1})" )   
plotregion(margin(0))
ylabel(,angle(0) nogrid)  
ylabel(0(150)600) 
title("Sheep Weight (kg)",size(medium+2) position(6))

 ;
  #delimit cr

graph save "F:\Desktop\graph2.gph",replace



*****************
 #delimit ;

gr box ch4mm, o(sheep_group )  

bar(1,color(215 160 193) lcolor(black))
ylabel(, tposition(inside) nogrid)
plotregion(lpattern(blank))
ytitle("CH{sub:4} emission from manure management " "(kg CO{sub:2}e head{sup:-1} year{sup:-1})" )   
plotregion(margin(0))
ylabel(,angle(0) nogrid)   
title("Sheep Weight (kg)",size(medium+2) position(6))
ylabel(0(3)12) 
 ;
  #delimit cr
graph save "F:\Desktop\graph4.gph",replace



*********************
#delimit ;
 

gr box n2omm, o(sheep_group )  
bar(1, color(110 143 178)  lcolor(black))
ylabel(, tposition(inside) nogrid)
plotregion(lpattern(blank))
ytitle("N{sub:2}O emission from manure management " "(kg CO{sub:2}e head{sup:-1} year{sup:-1})" )   
plotregion(margin(0))
ylabel(,angle(0) nogrid)    
title("Sheep Weight (kg)",size(medium+2) position(6))
ylabel(0(15)60)  
 ;
  #delimit cr
graph save "F:\Desktop\graph6.gph",replace


********************************************************************************
*************cattle*****************************************************************
********************************************************************************

sort cattle_weight 
gen cattle_group=1 if cattle_weight>=100&cattle_weight<150
replace cattle_group=2  if cattle_weight>=150&cattle_weight<200
replace cattle_group=3  if cattle_weight>=200&cattle_weight<250
replace cattle_group=4  if cattle_weight>=250&cattle_weight<300
replace cattle_group=5  if cattle_weight>=300&cattle_weight<350
replace cattle_group=6  if cattle_weight>=350&cattle_weight<400
replace cattle_group=7  if cattle_weight>=400&cattle_weight<450
replace cattle_group=8  if cattle_weight>=450&cattle_weight<750

label define cattle 1"100-150" 2"150-200" 3"200-250" 4"250-300" 5"300-350" 6"350-400" 7"400-450" 8"450-750"
label values cattle_group cattle



#delimit ;

gr box ch4ef, o(cattle_group)

bar(1,color(228 227 191)  lcolor(black))
ylabel(, tposition(inside))
ylabel(, angle(0))

plotregion(lpattern(blank))
ytitle("CH{sub:4} emission from enteric fermentation" "(kg CO{sub:2}e head{sup:-1} year{sup:-1})" )   
plotregion(margin(0))
ylabel(,angle(0) nogrid)    
title("Cattle Weight (kg)",size(medium+2) position(6))
ylabel(0(1000)4000)

 ;
#delimit cr
graph save "F:\Desktop\graph1.gph",replace 



********************************************************************************

#delimit ;

gr box ch4mm, o(cattle_group)  
bar(1,color(215 160 193) lcolor(black))
ylabel(, tposition(inside) nogrid)
plotregion(lpattern(blank))
ytitle("CH{sub:4} emission from manure management " "(kg N{sub:2}0 head{sup:-1} year{sup:-1})" )   
plotregion(margin(0))
ylabel(,angle(0) nogrid)    
title("Cattle Weight (kg)",size(medium+2) position(6))
ylabel(0(25)100)
 ;
#delimit cr
graph save "F:\Desktop\graph3.gph",replace 



#delimit ;
gr box n2omm, o(cattle_group )  
bar(1,color(110 143 178) lcolor(black))
ylabel(, tposition(inside) nogrid)
plotregion(lpattern(blank))
ytitle("N{sub:2}O emission from manure management " "(kg CO{sub:2}e head{sup:-1} year{sup:-1})" )   
plotregion(margin(0))
ylabel(,angle(0) nogrid)    
title("Cattle Weight (kg)",size(medium+2) position(6))
 ;
#delimit cr
graph save "Desktop\graph5.gph",replace 

# EX: pink background resulted in 40% purchase rate with 500 visitors while the black background resulted in a 30% purchase rate with 550 visitors

site1 = c(.40, 500) # pink
site2 = c(.30, 550) # black

abtestfunc <- function(ad1, ad2){
      sterror1 = sqrt( ad1[1] * (1-ad1[1]) / ad1[2] )
      sterror2 = sqrt( ad2[1] * (1-ad2[1]) / ad2[2] )
      minmax1 = c((ad1[1] - 1.28*sterror1) * 100, (ad1[1] + 1.28*sterror1) * 100)
      minmax2 = c((ad2[1] - 1.28*sterror2) * 100, (ad2[1] + 1.28*sterror2) * 100)
      print( round(minmax1,2) )
      print( round(minmax2,2) )
}

abtestfunc(site1, site2)

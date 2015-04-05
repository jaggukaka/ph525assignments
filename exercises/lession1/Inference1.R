












#inference assignment 1

babies = read.table("babies.txt", header=TRUE)

bwt.nonsmoke = babies$bwt[babies$smoke==0]
bwt.smoke = babies$bwt[babies$smoke==1]

mean(bwt.nonsmoke)-mean(bwt.smoke)
sd(bwt.nonsmoke)
sd(bwt.smoke)

bwtns_30 = bwt.nonsmoke[1:30]
bwts_30 = bwt.smoke[1:30]
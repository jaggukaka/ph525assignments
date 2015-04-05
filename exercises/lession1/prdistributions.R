population = read.csv("../../dagdata/inst/extdata/femaleControlsPopulation.csv")
dat = read.csv("../../dagdata/inst/extdata/femaleMiceWeights.csv")


n = 10000

null = vector("numeric", n)

for (i in 1:n) {
  control = sample(population[,1], 12)
  treatment = sample(population[,1], 12)
  null[i] = mean(treatment) - mean(control)
  
}

diff = mean(dat[13:24, 2]) - mean(dat[1:12, 2])

mean (null > diff)

mean (population[,1])

population = population[,1]

sampleMean = replicate(10000, mean(sample(population, 12)))
head(sampleMean)

plot(sampleMean)

null = replicate(10000, mean(sample(population, 12)) - mean(sample(population, 12)))

plot(null)

hist(null)
abline(v=diff, col="red")

abline(v=-diff, col="red")

mean(-diff > null) + mean (null > diff)

mean((-diff  > null ) | (null > diff))


# Probability distribution 2

x <- split(gapminder$lifeExp, gapminder$year)[['1952']]

mean(x <= 40)

mean(x <= 60) - mean(x <= 40)

qs = seq(from=min(x), to=max(x), length=20)

props = sapply(qs, function(q) mean(x <= q))

plot(qs, props)

plot(ecdf(x))

pop <- split(gapminder$pop, gapminder$year)[['1952']]

lpop <- log10(pop)
hist (lpop)

sdlpop = sd(lpop)
mlpop = mean(lpop)

qqnorm(lpop)

z = (lpop - mlpop)/sdlpop

qqnorm(z)
abline(0,1)

max(z)


F = function(q) pnorm(q, mean=mean(lpop), sd=sd(lpop))
nc = length(lpop)

nc*(F(7) - F(6))

sum (lpop >6 & lpop<=7)

head(pnorm(z))


sort(z)[1]
ps = ((1:nc) - 0.5)/nc

plot(qnorm(ps), sort(z))


#t test, t-statistic

treatment = dat[13:24, 2]
control = dat[1:12, 2]

t.test(treatment, control)





# A análise deverá ser baseada no ajuste de um modelo log-linear de Poisson. Modelos de
# regressão alternativos, como a regressão com resposta binomial negativa e modelos de 
# quaseverossimilhança deverão ser considerados para acomodar possível superdispersão.

require(tidyverse)
require(msme)
require(corrplot)

data(medpar)
dados <- medpar[c("los", "hmo", "white", "age80", "type")]
dados$hmo <- as.factor(dados$hmo)
dados$white <- as.factor(dados$white)
dados$age80 <- as.factor(dados$age80)
dados$type <- as.factor(dados$type)



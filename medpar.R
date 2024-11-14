### Instruções ====================================================================================
# A análise deverá ser baseada no ajuste de um modelo log-linear de Poisson. Modelos de regressão 
# alternativos, como a regressão com resposta binomial negativa e modelos de quaseverossimilhança deverão
# ser considerados para acomodar possível superdispersão.

#  Definição do problema e descrição resumida dos dados e das variáveis consideradas;
#  Análise descritiva/exploratória;
#  Especificação do modelo ajustado;
#  Resumo dos resultados do modelo ajustado;
#  Diagnóstico do ajuste (análise de resíduos, observações atípicas, multicolinearidade e teste da 
# qualidade do ajuste);
#  Interpretação/discussão dos efeitos das preditores na resposta;
#  Análise da capacidade preditiva do modelo, se o objetivo for preditivo;
#  Conclusão do trabalho, apresentando o fechamento da análise, as limitações encontradas e possíveis
# investigações futuras.

require(tidyverse)
require(msme)
require(GGally)

### Definição do problema e descrição resumida dos dados e das variáveis consideradas =============
data(medpar)
dados <- medpar[c("los", "hmo", "white", "age80", "type")]
# A base consiste em informações hospitalares do Arizona, referentes a uma parcela de pacientes de um grupo
# de diagnóstico específico. As variáveis consistem em:
# - los: duração da estadia no hospital;
# - hmo: se o paciente pertence a uma organização de manutenção de saúde; 0 = pertence, 1 = não pertence
# - white: se o paciente é caucasiano; 0 = não, 1 = sim
# - age80: se o paciente possui 80 anos ou mais ou menos de 80 anos; 0 = <80, 1 = >=80;
# - type: tipo de admissão; (variável categórica)

### Análise descritiva/exploratória ===============================================================
dados$hmo <- as.factor(dados$hmo)
dados$white <- as.factor(dados$white)
dados$age80 <- as.factor(dados$age80)
dados$type <- as.factor(dados$type)

ggpairs(dados) + theme_bw()
# Podemos ver que as variáveis explicativas são bastante desbalanceadas. 

### Especificação do modelo ajustado ==============================================================
# Ajuste do modelo Poisson com ligação log
mod1 <- glm(los ~ hmo + white + age80 + type, family = poisson(link = 'log'), data = dados)
coefficients(mod1)

### Resumo dos resultados do modelo ajustado ======================================================
summary(mod1)

### Diagnóstico do ajuste =========================================================================
# Análise de Resíduos
resid_panel(mod1, plots = c("resid", "qq", "ls", "cookd"), qqbands = TRUE, nrow = 2)
# Matriz de Covariância
vcov(mod1)

### Interpretação/discussão dos efeitos das preditores na resposta ================================


### Análise da capacidade preditiva do modelo =====================================================
predict(ajuste2, newdata = data.frame(idade = 30, usop = 'Estrada', 
                                      sexo = 'Masc', anosest = 10))
# Por default, o R retorna a predição na escala do preditor. 

predict(ajuste2, newdata = data.frame(idade = 30, usop = 'Estrada', sexo = 'Masc', 
                                      anosest = 10), type = 'response')
# Agora na escala da média (resposta).

# Podemos realizar predições para toda uma base de novos indivíduos. Uma pequena ilustração:
dpred <- data.frame(idade = c(30,30,60,60),
                    usop = c('Estrada','Cidade','Estrada','Cidade'),
                    sexo = c('Masc', 'Fem', 'Fem', 'Masc'),
                    anosest = c(5, 7, 12, 15))
dpred
mu_est <- predict(ajuste2, newdata = dpred, type = 'response')
dpred$mu <- mu_est
rownames(dpred) <- c('Perfil 1', 'Perfil 2', 'Perfil 3', 'Perfil 4')
dpred

### Conclusão do trabalho =========================================================================
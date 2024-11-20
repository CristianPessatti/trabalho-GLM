### Instruções ================================================================================================
# Não é necessário selecionar todas as variáveis da base para a análise. Recomenda-se limitar a análise a cinco
# a oito variáveis. O modelo final, no entanto, pode ser composto por um número menor de variáveis após processo 
# de seleção ou remoção de variáveis não significativas. A análise deverá ser baseada no ajuste de modelos de 
# regressão logística.

# - Definição do problema e descrição resumida dos dados e das variáveis consideradas;
# - Análise descritiva/exploratória;
# - Especificação do modelo ajustado;
# - Resumo dos resultados do modelo ajustado;
# - Diagnóstico do ajuste (análise de resíduos, observações atípicas, multicolinearidade e teste da 
# qualidade do ajuste);
# - Interpretação/discussão dos efeitos das preditores na resposta;
# - Análise da capacidade preditiva do modelo, se o objetivo for preditivo;
# - Conclusão do trabalho, apresentando o fechamento da análise, as limitações encontradas e possíveis
# investigações futuras.

require(tidyverse)
require(AppliedPredictiveModeling)

data(schedulingData)
schedulingData

dados_tratados <- schedulingData %>% 
  mutate(class = ifelse(Class %in% c("F", "VF"), 1, 2)) %>% 
  select(-Class)

### Definição do problema e descrição resumida dos dados e das variáveis consideradas ==========================

# Esses dados consistem em informações de 4.331 empregos em um ambiente computacional de alto desempenho. As
# variáveis são:
# - Protocol (tipo de computação);
# Compounds (número de pontos de dados para cada trabalho); 
# InputFields (número de características que estão sendo estimadas);
# Iterations (máximo número de iterações para os cálculos);
# NumPending (o número de outros trabalhos pendentes no hora de lançamento);
# Hour (hora decimal do dia para a hora de lançamento);
# Day (da hora de lançamento);
# class: 1 (VF-Very Fast ou F-Fast), 2 (M-Moderate ou L-Long).

### Análise descritiva/exploratória ============================================================================

### Especificação do modelo ajustado ===========================================================================

### Resumo dos resultados do modelo ajustado ===================================================================

### Diagnóstico do ajuste ======================================================================================

### Interpretação/discussão dos efeitos das preditores na resposta =============================================

### Análise da capacidade preditiva do modelo ==================================================================

### Conclusão do trabalho ======================================================================================
# ☢️ Césio-137: Análise Epidemiológica do Maior Acidente Radiológico das Américas

![Python](https://img.shields.io/badge/Python-3.10+-blue?style=flat-square&logo=python)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange?style=flat-square&logo=jupyter)
![Pandas](https://img.shields.io/badge/Pandas-2.0+-green?style=flat-square&logo=pandas)
![Status](https://img.shields.io/badge/Status-Conclu%C3%ADdo-brightgreen?style=flat-square)

> **Análise estatística e epidemiológica do acidente radiológico de Goiânia (1987),
> o maior acidente com material radioativo das Américas e o segundo maior do mundo em número de pessoas contaminadas.**

---

## ⚠️ Nota sobre os Dados

Os **dados agregados** deste projeto (n total de contaminados, internações e óbitos) são **reais**, extraídos de fontes primárias (AIEA, 1988; Brandão-Mello et al., 1991; CNEN, 1988).

Os **dados individuais** das 249 vítimas são **simulados sinteticamente** com base nas distribuições estatísticas reportadas pela literatura:
- Doses individuais: distribuição log-normal com parâmetros de Brandão-Mello et al. (1991) — dose mediana para exposição alta ≈ 4,5 Gy
- Probabilidade de internação: baseada nos 57 internados reais (22,9% dos contaminados)
- Probabilidade de óbito: baseada nos 4 óbitos reais (7% dos internados)

Esta abordagem tem **valor didático e metodológico** legítimo: análises de sobrevivência baseadas em distribuições da literatura são amplamente usadas em epidemiologia quando dados individuais não estão disponíveis. As conclusões inferenciais devem ser interpretadas como validações do modelo, não como afirmações sobre indivíduos reais.

---

## 📖 Contexto Histórico

Em **13 de setembro de 1987**, em Goiânia (GO), dois catadores encontraram um aparelho de radioterapia abandonado numa clínica desativada. Sem saber do perigo, abriram o equipamento e encontraram uma cápsula de **Cloreto de Césio-137** — um material altamente radioativo que brilhava com uma luz azul intensa.

Nos dias seguintes, a cápsula foi passada de mão em mão, levada para casas, desmontada em pedaços e distribuída entre curiosos. O resultado foi uma das maiores tragédias radiológicas da história civil mundial.

| Dado | Número |
|------|--------|
| Pessoas triadas no total | ~112.000 |
| Pessoas com contaminação detectável | 249 |
| Pessoas internadas | 57 |
| Óbitos confirmados (SAR) | 4 |
| Imóveis contaminados | 42 |
| Pontos críticos de contaminação | 7 |
| Área urbana afetada | ~100 km² |
| Césio-137 disperso | 19,26 g (50 TBq) |

---

## 🎯 Objetivos do Projeto

1. **Análise Epidemiológica** — caracterizar o perfil das vítimas, correlacionar dose de radiação com desfecho clínico, métricas clássicas (CFR, taxa de ataque, incidência por grupo) e curvas de sobrevivência
2. **Análise Espacial** — mapear a dispersão da contaminação pelos bairros de Goiânia e identificar padrões geográficos
3. **Comparativo Internacional** — posicionar o acidente de Goiânia frente a Chernobyl (1986) e Fukushima (2011) em métricas padronizadas e normalizadas

---

## 📊 Principais Análises

### 1. Análise Epidemiológica
- Distribuição de doses recebidas (mSv) por grupo de exposição
- Métricas clássicas: Taxa de Ataque, CFR, Incidência por grupo
- Curva de Kaplan-Meier de **hospitalização** por faixa de dose (n=57 eventos)
- Perfil demográfico das vítimas (idade, sexo, tempo de exposição)
- Evolução temporal dos casos — da descoberta ao controle

### 2. Análise Espacial
- Mapa interativo (Folium) com intensidade de contaminação por ponto
- Raio de dispersão a partir do ponto zero (Rua 57, Setor Central)
- Correlação entre distância do epicentro e nível de contaminação
- IDW (Inverse Distance Weighting) para interpolação de contaminação

### 3. Modelagem Estatística

> **Desfecho principal: hospitalização (n=57)**. Com apenas 4 óbitos, modelos de sobrevivência sobre óbito teriam poder estatístico insuficiente (regra prática: ≥10 eventos/covariável). A hospitalização oferece poder adequado e é clinicamente relevante.

| Modelo | Desfecho | Adequação |
|--------|----------|-----------|
| Kaplan-Meier + Log-Rank | Hospitalização | ✅ Excelente |
| Regressão Logística | P(internação \| dose) | ✅ Adequado |
| Cox PH | Hospitalização | ✅ Adequado |
| Cox PH | Óbito | ⚠️ Exploratório (n=4 eventos) |

### 4. Comparativo Internacional

> **Nota metodológica:** Os três acidentes são de **naturezas distintas** (Goiânia: fonte órfã/radiológico; Chernobyl e Fukushima: acidentes nucleares com liberação de reator). A comparação é **instrutiva, mas não direta** — as métricas abaixo precisam ser interpretadas com essa ressalva.

| Métrica | Goiânia (1987) | Chernobyl (1986) | Fukushima (2011) |
|---------|---------------|-----------------|------------------|
| Tipo de acidente | Fonte órfã (radiológico) | Falha de reator (nuclear) | Desastre natural → nuclear |
| Contaminados diretos¹ | 249 | ~134 (SAR grave) | ~170 (>100 mSv)² |
| Óbitos agudos | 4 | 31 | 1 |
| Área contaminada | ~100 km² | ~150.000 km² | ~600 km² |
| Atividade liberada | 50 TBq (Cs-137) | ~5.200 PBq (total) | ~520 PBq (total) |
| CFR (óbitos/contaminados) | 1,6% | 23,1% | 0,6% |
| Óbitos / 1.000 km² contaminados | ~40 | ~0,21 | ~1,7 |
| Tempo até contenção | ~15 dias | ~10 dias | ~9 meses |

> ¹ Critério de "contaminado direto" varia entre acidentes — ver nota metodológica completa no notebook 06.
> ² Fukushima: 170 trabalhadores com exposição acima de 100 mSv; evacuados totais foram ~154.000 pessoas.

---

## 🗂️ Estrutura do Projeto

```
cesio137-analise/
│
├── 📁 data/
│   ├── raw/                  # Dados brutos das fontes primárias
│   │   ├── vitimas.csv       # Dados epidemiológicos das vítimas (SINTÉTICOS)
│   │   ├── locais.csv        # Coordenadas dos pontos contaminados (REAIS)
│   │   └── dosimetria.csv    # Doses registradas por indivíduo (SINTÉTICOS)
│   └── processed/            # Dados limpos e prontos para análise
│
├── 📁 notebook/
│   ├── 01_coleta_dados.ipynb           # Consolidação e geração dos dados
│   ├── 02_limpeza_exploracao.ipynb     # EDA e limpeza
│   ├── 03_analise_epidemiologica.ipynb # Perfil das vítimas + métricas epidemiológicas
│   ├── 04_analise_espacial.ipynb       # Mapas e geoanálise
│   ├── 05_modelagem_estatistica.ipynb  # Kaplan-Meier, Cox e regressão logística
│   └── 06_visualizacoes_finais.ipynb   # Visualizações e gráficos finais
│
├── 📁 reports/
│   └── figures/              # Gráficos exportados
│
├── index.html                # Dashboard interativo (Chart.js)
├── requirements.txt
└── README.md
```

---

## 🔬 Metodologia

### Fontes de Dados Primárias
| Fonte | Descrição | Tipo |
|-------|-----------|------|
| AIEA — TECDOC-1009 (1988) | Relatório técnico oficial internacional | Dados agregados reais |
| CNEN (1988) | Relatório oficial brasileiro | Dados agregados reais |
| OPAS/OMS (1988) | Dados epidemiológicos consolidados | Dados agregados reais |
| Brandão-Mello et al. (1991) | Artigo médico com dosimetria — parâmetros de distribuição | Base para simulação |

### Geração dos Dados Sintéticos
Os dados individuais foram gerados no notebook `01_coleta_dados.ipynb` usando:
- `np.random.seed(42)` para reprodutibilidade
- Doses: `np.random.lognormal(mean, sigma)` com parâmetros extraídos de Brandão-Mello et al. (1991)
- Internação: probabilidade condicional à dose, calibrada para reproduzir os 57 internados reais

### Pipeline de Análise
```
Coleta/Simulação → Limpeza → EDA → Métricas Epidemiológicas → Modelagem → Visualização
```

### Técnicas Estatísticas Aplicadas
- **Análise Descritiva** — distribuições, medidas de tendência central e dispersão
- **Métricas Epidemiológicas** — Taxa de Ataque, CFR, Incidência por grupo
- **Kaplan-Meier** — curva de sobrevivência por grupo de dose (desfecho: hospitalização)
- **Log-Rank Test** — comparação estatística entre grupos
- **Cox PH** — modelo multivariado com C-index
- **Regressão Logística** — P(hospitalização) com AUC-ROC, Brier Score e AP Score
- **Folium + IDW** — análise espacial e mapa interativo

---

## 🚀 Como Executar

```bash
# Clone o repositório
git clone https://github.com/DestroyerIG/cesio137-analise.git
cd cesio137-analise

# Crie o ambiente virtual
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

# Instale as dependências
pip install -r requirements.txt

# Execute os notebooks em ordem
jupyter notebook
# 01 → 02 → 03 → 04 → 05 → 06

# Ou abra o dashboard diretamente no navegador
python -m http.server 8080
# Acesse: http://localhost:8080/index.html
```

> **Atenção:** Execute o notebook `01_coleta_dados.ipynb` primeiro para gerar os arquivos em `data/processed/` que os demais notebooks dependem.

---

## 📌 Principais Resultados

- [x] Distribuição de doses por grupo de exposição
- [x] Métricas epidemiológicas: Taxa de Ataque, CFR, Incidência por grupo
- [x] Curva de Kaplan-Meier finalizada (desfecho: hospitalização)
- [x] Mapa interativo de contaminação de Goiânia
- [x] Comparativo internacional com métricas normalizadas (Chernobyl e Fukushima)
- [x] Dashboard epidemiológico interativo (ZoomCharts Dark)

---

## 📚 Referências

- INTERNATIONAL ATOMIC ENERGY AGENCY. **The Radiological Accident in Goiânia**. Vienna: IAEA, 1988.
- BRANDÃO-MELLO, C. E. et al. Clinical and hematological aspects of <sup>137</sup>Cs: the Goiânia radiation accident. *Health Physics*, v. 60, n. 1, p. 31–39, 1991.
- COMISSÃO NACIONAL DE ENERGIA NUCLEAR (CNEN). **Relatório do acidente radiológico de Goiânia**. Brasília, 1988.
- ORGANIZAÇÃO PAN-AMERICANA DA SAÚDE (OPAS). **Accidente radiológico de Goiânia**. Washington, 1988.

---

## 👨‍💻 Autor

**Ítallo Gonçalves**  
Estudante de Engenharia de Software & Estatística

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Ítallo%20Gonçalves-blue?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/itallo-gonçalves-3406a119a/)
[![GitHub](https://img.shields.io/badge/GitHub-DestroyerIG-black?style=flat-square&logo=github)](https://github.com/DestroyerIG)
[![Email](https://img.shields.io/badge/Email-igitallogabriel13@gmail.com-red?style=flat-square&logo=gmail)](mailto:igitallogabriel13@gmail.com)

---

<p align="center">
  Desenvolvido com 🔬 estatística, 🐍 Python e propósito.<br/>
  <i>"Dados têm o poder de transformar tragédias em aprendizado."</i>
</p>

# ☢️ Césio-137: Análise Epidemiológica do Maior Acidente Radiológico das Américas

![Python](https://img.shields.io/badge/Python-3.10+-blue?style=flat-square&logo=python)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange?style=flat-square&logo=jupyter)
![Pandas](https://img.shields.io/badge/Pandas-2.0+-green?style=flat-square&logo=pandas)
![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow?style=flat-square)

> **Análise estatística e epidemiológica do acidente radiológico de Goiânia (1987),
> o maior acidente com material radioativo das Américas e o segundo maior do mundo em número de pessoas contaminadas.**

---

## 📖 Contexto Histórico

Em **13 de setembro de 1987**, em Goiânia (GO), dois catadores encontraram um aparelho de radioterapia abandonado numa clínica desativada. Sem saber do perigo, abriram o equipamento e encontraram uma cápsula de **Cloreto de Césio-137** — um material altamente radioativo que brilhava com uma luz azul intensa.

Nos dias seguintes, a cápsula foi passada de mão em mão, levada para casas, desmontada em pedaços e distribuída entre curiosos. O resultado foi uma das maiores tragédias radiológicas da história civil mundial.

| Dado | Número |
|------|--------|
| Pessoas expostas à radiação | 249 |
| Pessoas internadas | 49 |
| Óbitos confirmados | 4 |
| Imóveis contaminados | 42 |
| Pontos críticos de contaminação | 7 |
| Área urbana afetada | ~100 km² |
| Césio-137 disperso | 19,26 g (50 TBq) |

---

## 🎯 Objetivos do Projeto

Este projeto tem três objetivos principais:

1. **Análise Epidemiológica** — caracterizar o perfil das vítimas, correlacionar dose de radiação recebida com desfecho clínico e construir curvas de sobrevivência
2. **Análise Espacial** — mapear a dispersão da contaminação pelos bairros de Goiânia e identificar padrões geográficos
3. **Comparativo Internacional** — posicionar o acidente de Goiânia frente a Chernobyl (1986) e Fukushima (2011) em métricas padronizadas

---

## 📊 Principais Análises

### 1. Análise Epidemiológica
- Distribuição de doses recebidas (mSv) por grupo de exposição
- Curva de Kaplan-Meier de sobrevivência por faixa de dose
- Perfil demográfico das vítimas (idade, sexo, tempo de exposição)
- Evolução temporal dos casos — da descoberta ao controle

### 2. Análise Espacial
- Mapa de calor de Goiânia com intensidade de contaminação por bairro
- Raio de dispersão a partir do ponto zero (Rua 57, Setor Central)
- Correlação entre distância do epicentro e nível de contaminação

### 3. Modelagem Estatística
- Regressão logística: probabilidade de hospitalização em função da dose
- Análise de sobrevivência com método de Kaplan-Meier
- Teste de Log-Rank comparando grupos de exposição

### 4. Comparativo Internacional
| Métrica | Goiânia (1987) | Chernobyl (1986) | Fukushima (2011) |
|--------|---------------|-----------------|-----------------|
| Contaminados diretos | 249 | ~600.000 | ~170 |
| Óbitos agudos | 4 | 31 | 1 |
| Área contaminada | ~100 km² | ~150.000 km² | ~600 km² |
| Tipo | Radiológico | Nuclear | Nuclear |
| Origem | Negligência | Falha operacional | Desastre natural |

---

## 🗂️ Estrutura do Projeto

```
cesio137-analise/
│
├── 📁 data/
│   ├── raw/                  # Dados brutos das fontes primárias
│   │   ├── vitimas.csv       # Dados epidemiológicos das vítimas
│   │   ├── locais.csv        # Coordenadas dos pontos contaminados
│   │   └── dosimetria.csv    # Doses registradas por indivíduo
│   └── processed/            # Dados limpos e prontos para análise
│
├── 📁 notebooks/
│   ├── 01_coleta_dados.ipynb           # Consolidação das fontes
│   ├── 02_limpeza_exploracao.ipynb     # EDA e limpeza
│   ├── 03_analise_epidemiologica.ipynb # Perfil das vítimas
│   ├── 04_analise_espacial.ipynb       # Mapas e geoanálise
│   ├── 05_modelagem_estatistica.ipynb  # Kaplan-Meier e regressão
│   └── 06_comparativo_global.ipynb     # Chernobyl e Fukushima
│
├── 📁 reports/
│   ├── figures/              # Gráficos exportados
│   └── dashboard/            # Dashboard interativo (Plotly Dash)
│
├── 📁 references/            # PDFs dos relatórios oficiais
│   ├── AIEA_1988_report.pdf
│   └── CNEN_relatorio_oficial.pdf
│
├── requirements.txt
└── README.md
```

---

## 🔬 Metodologia

### Fontes de Dados
| Fonte | Descrição | Acesso |
|-------|-----------|--------|
| AIEA — TECDOC-1009 (1988) | Relatório técnico oficial internacional | Público |
| CNEN | Relatório oficial brasileiro | Público |
| OPAS/OMS | Dados epidemiológicos consolidados | Público |
| DATASUS | Internações hospitalares Goiânia 1987-1990 | Público |
| Brandão et al. (1988) | Artigo médico com dosimetria individual | Acadêmico |

### Pipeline de Análise
```
Coleta → Limpeza → EDA → Modelagem → Visualização → Narrativa
```

### Técnicas Estatísticas Aplicadas
- **Análise Descritiva** — distribuições, medidas de tendência central e dispersão
- **Kaplan-Meier** — curva de sobrevivência por grupo de dose
- **Log-Rank Test** — comparação estatística entre grupos
- **Regressão Logística** — probabilidade de desfecho grave por dose recebida
- **Geopandas + Folium** — análise espacial e mapas interativos

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

# Abra os notebooks
jupyter notebook
```

---

## 📦 Dependências

```txt
pandas==2.1.0
numpy==1.25.0
matplotlib==3.7.0
seaborn==0.12.0
plotly==5.15.0
geopandas==0.13.0
folium==0.14.0
lifelines==0.27.0
scikit-learn==1.3.0
jupyter==1.0.0
```

---

## 📌 Principais Resultados

> ⚠️ *Seção atualizada conforme análises são concluídas*

- [ ] Distribuição de doses por grupo de exposição
- [ ] Curva de Kaplan-Meier finalizada
- [ ] Mapa interativo de contaminação de Goiânia
- [ ] Comparativo internacional publicado

---

## 📚 Referências

- INTERNATIONAL ATOMIC ENERGY AGENCY. **The Radiological Accident in Goiânia**. Vienna: IAEA, 1988.
- BRANDÃO-MELLO, C. E. et al. Clinical and hematological aspects of <sup>137</sup>Cs: the Goiânia radiation accident. *Health Physics*, v. 60, n. 1, p. 31-39, 1991.
- COMMISION NACIONAL DE ENERGIA NUCLEAR (CNEN). **Relatório do acidente radiológico de Goiânia**. Brasília, 1988.
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

import streamlit as st
import pandas as pd
import plotly.express as px
from streamlit_option_menu import option_menu
from query import conexao

# ***** Primeira Consulta / Atualização de dados ******

# consultad os dados
query = "SELECT * FROM tb_carro"

# Carregar os dados
df = conexao(query)

# Botao para atualizar
if st.button("Atualizar Dados"):
    df = conexao(query)

# ****** Estrutura lateral de filtros ******
st.sidebar.header("Selecione o Filtro")
#marca
marca = st.sidebar.multiselect("Marca Selecionada" #nome do seletor
                               ,options = df['marca'].unique() # Opções disponívels no nosso df
                               ,default = df["marca"].unique() # Todas opções previamente selecionadas
                               )
#modelo 
modelo = st.sidebar.multiselect("Modelo Selecionado" #nome do seletor
                               ,options = df['modelo'].unique() # Opções disponívels no nosso df
                               ,default = df["modelo"].unique() # Todas opções previamente selecionadas
                               )
#ano 
ano = st.sidebar.multiselect("Ano Selecionado" #nome do seletor
                               ,options = df['ano'].unique() # Opções disponívels no nosso df
                               ,default = df["ano"].unique() # Todas opções previamente selecionadas
                               )
#Valor 
valor = st.sidebar.multiselect("Valor Selecionado" #nome do seletor
                               ,options = df['valor'].unique() # Opções disponívels no nosso df
                               ,default = df["valor"].unique() # Todas opções previamente selecionadas
                               )
#cor 
cor = st.sidebar.multiselect("Cor Selecionada" #nome do seletor
                               ,options = df['cor'].unique() # Opções disponívels no nosso df
                               ,default = df["cor"].unique() # Todas opções previamente selecionadas
                               )
# numero_vendas
numero_vendas = st.sidebar.multiselect("Qtd de Vendas Selecionado" #nome do seletor
                               ,options = df['numero_vendas'].unique() # Opções disponívels no nosso df
                               ,default = df["numero_vendas"].unique() # Todas opções previamente selecionadas
                               )
# Aplicar os filtros selecionados
df_selecionado = df[
    (df['marca'].isin(marca)) &
    (df['modelo'].isin(modelo)) &
    (df['ano'].isin(ano)) &
    (df['valor'].isin(valor)) &
    (df['cor'].isin(cor)) &
    (df['numero_vendas'].isin(numero_vendas))
]

# ********* Exibir Valores - Estatistica ***********
def home():
    with st.expander("Tabela"): #Cria uma caixa expans[vel com expeansivel com titulo
        mostrarDados = st.multiselect('Filter: ', df_selecionado.columns, default =[])

        # mostrarDados :
        if mostrarDados:
            st.write(df_selecionado[mostrarDados])
    
    if not df_selecionado.empty:
        venda_total= df_selecionado["numero_vendas"].sum()
        venda_media = df_selecionado["numero_vendas"].mean()
        venda_mediana = df_selecionado["numero_vendas"].median()

        total1, total2, total3 = st.columns(3, gap= "large")

        with total1:
            st.info("Qtd Total de Vendas dos Carros", icon = '📌')
            st.metric(label="Total",value=f"{venda_total:,.0f}")
        with total2:
            st.info("Valor médio da qtd de carros", icon='📌')
            st.metric(label="Média", value=f"{venda_media:,.0f}")
        with total3:
            st.info("Valor Mediano da qtd de carros", icon='📌')
            st.metric(label="Mediana", value=f"{venda_mediana:,.0f}")
    else:
        st.warning("Nenhum dado disponível com os filtros selecionados")
    
    #inserir uma linha divisoria para separar as sessões
    st.markdown("""-------""")

def graficos(df_selecionado):
    # verifica se o dataframe filtrado esta vazio
    if df_selecionado.empty:
        st.warning("Nenhum dado disponível para gerar gráficos")
        # interrompe a funcao, poqru nao motivo para continuar executando se nao tem dado
        return
    # Criacao de graficos
    # 4 abas -> graficos de barras, linha, pizza e dispersao
    
    graf1, graf2, graf3, graf4, graf5 = st.tabs(["Gráfico de Barras"
                                                 ,"Gráfico de Linhas"
                                                 , "Gráfico de Pizza"
                                                 ,"Gráfico de dispersao"
                                                 ,"Gráfico de area"])

    with graf1:
        st.write("Gráfico de Barras") # Título

        investimento = df_selecionado.groupby("marca").count()[["valor"]].sort_values(by="valor", ascending=False)
        #Agrupa pela mrca e conta o numero de ocrorrencias da coluna valor. Depois oredena o resultado de forma decrescente
        
        fig_valores = px.bar(investimento #Dataframe que contem o valor das variaveis
                             ,x = investimento.index
                             ,y = "valor"
                             ,orientation="v"
                             ,title= "<b>Valores de Carros</b>"
                             ,color_discrete_sequence = ["#0083b3"] )
        # Exibe  a figura e ajusta na tela para ocupar tora a largura disponivel.
        st.plotly_chart(fig_valores, use_container_with=True)
    with graf2:
        st.write("Gráfico de linhas")
        dados = df_selecionado.groupby("marca").count()[["valor"]]
        fig_valores2=px.line(dados
                             ,x= dados.index
                             ,y = "valor"
                             ,title= "<b>Valores por marca</b>"
                             ,color_discrete_sequence= ["#0083b3"])
        st.plotly_chart(fig_valores2, use_container_width= True)
    with graf3:
        st.write("Gráfico de pizza")
        dados2 = df_selecionado.groupby("marca").sum()[["valor"]]
        fig_valores3=px.pie(dados2
                             ,values= "valor"
                             ,names= dados2.index
                             ,title="<b>Distribuição de valores por marca</b>")
        st.plotly_chart(fig_valores3, use_container_width= True)
    with graf4:
        st.write("Gráfico de dispersão")
        dados3 = df_selecionado.melt(id_vars=["marca"], value_vars=["valor"])

        fig_valores4 = px.scatter(dados3
                                  ,x= "marca"
                                  ,y= "value"
                                  ,color="variable"
                                  ,title= "<b>Dispersão de valores por marca</b>")
        st.plotly_chart(fig_valores4, use_container_width= True)
    with graf5:
        st.write("Gráfico de area")
        dados4 = df_selecionado.groupby("marca").count()[["cor"]]
        fig_valores5= st.area_chart(dados4)


 # *********************** Barra de Progresso *****************
def barraprogresso():
    valorAtual = df_selecionado["numero_vendas"].sum()
    objetivo =  200000
    percentual = round((valorAtual/objetivo *100))
    

    if percentual > 100:
        st.subheader=("Valores Atingidos !!!! ")
    else:
        st.write(f"{percentual}% atingido da meta de {objetivo}. Segue adiante")
        
        mybar = st.progress(0)
        for percentualCompleto in range(percentual):
            mybar.progress(percentualCompleto + 1, text="Alvo %")

# *********************** Menu Lateral **************
def menuLateral():
    with st.sidebar:
        selecionado = option_menu(menu_title= "Menu"
                                  ,options=["Home","Progresso"]
                                  ,icons=["house","eye"]
                                  ,menu_icon="cast"
                                  ,default_index=0)
    if selecionado == "Home":
        st.subheader(f"Página:{selecionado}")
        home()
        graficos(df_selecionado)
    if selecionado == "Progresso":
        st.subheader(f"Página:{selecionado}")
        barraprogresso()
        graficos(df_selecionado)

menuLateral()

#------------------- Ajustar o CSS ----------------------


 
#!/bin/bash
#Autor: Alberto Dias
#2023-08-30


#Diretório onde está o status.log
DIR=/tmp

#Diretório onde está o arquivos .tar que deverá ser analisado
origem=/var/gerencia/EAQ/reports/sent/

#Diretório onde será descompactado os arquivos para verificação do conteúdo 
verifica=/tmp/verifica

# Gestores
gestores=("GERENTE_SFR_MA" "GERENTE_CTR_RR" "GERENTE_SPO_IB2" "GERENTE_SPO_IB" "GERENTE_AFP_AM" "GERENTE_PIE_PA" "GERENTE_FLA_CE" "GERENTE_RCE_PE" "GERENTE_TCS_BA" "GERENTE_CCC_MT" "GERENTE_CPL_MS" "GERENTE_TCO_DF" "GERENTE_LUE_MG" "GERENTE_BAR_RJ" "GERENTE_MSJ_RJ" "GERENTE_NIT_RJ" "GERENTE_CTP_SP" "GERENTE_VIV_SP" "GERENTE_SEF_SP" "GERENTE_JGR_SP" "GERENTE_CTA_PR" "GERENTE_FNS_SC" "GERENTE_IND_RS" "GERENTE_CEN_SP")

# Procura pelo arquivo GERENCIA*.tgz mais recente para o gestor atual e armazena na variável $arquivo
for gestor in "${gestores[@]}"; do   
   arquivo=$(ls -t $origem | grep -i "GERENCIA.*$gestor" 2>/dev/null | head -1)

   target=$origem$arquivo

   cp $target $verifica/$arquivo

   cd $verifica
    extracted_csv=`tar -xzvf  "$arquivo"`
    
    # Verifica se o arquivo CSV tem dados além da primeira linha
    if [ $(tail -n +2 $extracted_csv | wc -l) -gt 0 ]; then
        echo "$(date +'%Y-%m-%d %H:%M:%S') - $arquivo: OK" >>"$DIR/status.log"
    else
        echo "$(date +'%Y-%m-%d %H:%M:%S') - $arquivo: PROBLEMAS COM O ARQUIVO" >>"$DIR/status.log"
    fi
    # limpa o dir /verifica, para não acumular
       rm -f *

done


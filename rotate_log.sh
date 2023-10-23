#!/bin/bash
log_dir="/tmp"
log_file="status.log"
rotate_dir="/tmp/logs"

# Verifica se o diretório de rotação existe; se não, cria o diretório
if [ ! -d "$rotate_dir" ]; then
 mkdir -p "$rotate_dir"
fi

# Move o arquivo de log para o diretório de rotação com um carimbo de data e hora e compacta-o em formato .gz
timestamp=$(date +'%Y%m%d')
mv "$log_dir/$log_file" "$rotate_dir/$log_file.$timestamp"
gzip "$rotate_dir/$log_file.$timestamp"

touch "$log_dir/$log_file"

#!/bin/bash

# Optimized Malandro.sh with GNU Parallel and file lock
# Requires: keepassxc-cli, GNU Parallel

version="1.3 (Optimized with File Lock)"
echo -e "Malandro.sh $version by Dgmtnz (Optimized with File Lock)"
echo -e "https://github.com/Dgmtnz/Malandro.sh\n"

if [ $# -ne 2 ]; then
  echo "Usage $0 <kdbx-file> <wordlist>"
  exit 2
fi

dep="keepassxc-cli"
command -v $dep >/dev/null 2>&1 || { echo >&2 "Error: $dep not installed. Aborting."; exit 1; }

n_total=$(wc -l < "$2")
start_time=$(date +%s)
export n_total start_time

# Limpiar el archivo de bloqueo y el archivo de salida si existen
rm -f password_encontrada.lock password_encontrada.txt

# Define a function for checking each password
function check_password() {
  local line="$1"

  # Verificar si otro proceso ya encontró la contraseña
  if [ -f password_encontrada.lock ]; then
    exit 0
  fi

  # Intentar abrir la base de datos con la contraseña actual
  if echo "$line" | keepassxc-cli open "$2" &> /dev/null; then
    echo "[*] Password found: $line"
    echo "$line" > password_encontrada.txt  # Guardar la contraseña en un archivo
    touch password_encontrada.lock  # Crear el archivo de bloqueo para detener otros procesos
    exit 0
  fi
}

export -f check_password

# Use GNU Parallel to read passwords from the wordlist file
parallel --bar check_password {} "$1" :::: "$2"

# Verificar si la contraseña fue encontrada
if [ -f password_encontrada.txt ]; then
  echo "Password encontrada y guardada en password_encontrada.txt"
  exit 0
else
  echo "[!] Wordlist exhausted, no match found"
  exit 3
fi

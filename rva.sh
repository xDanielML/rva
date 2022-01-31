#!/bin/sh
# rva: Lea la Palabra de Dios desde su terminal, ahora en español
# Licencia: Dominio público

SELF="$0"

get_data() {
	sed '1,/^#EOF$/d' < "$SELF" | tar xz -O "$1"
}

if [ -z "$PAGER" ]; then
	if command -v less >/dev/null; then
		PAGER="less"
	else
		PAGER="cat"
	fi
fi

show_help() {
	exec >&2
	echo "uso: $(basename "$0") [flags] [referencia...]"
	echo
	echo "  -l      listar libros"
	echo "  -W      sin envoltura de líneas"
	echo "  -h      mostrar ayuda"
	echo
	echo "  Tipos de referencias:"
	echo "      <Libro>"
	echo "          Libro individual"
	echo "      <Libro>:<Capítulo>"
	echo "          Capítulo individual de un libro"
	echo "      <Libro>:<Capítulo>:<Versículo>[,<Versículos>]..."
	echo "          Versículo(s) individual(es) de un capítulo específico de un libro."
	echo "      <Libro>:<Capítulo>-<Capítulo>"
	echo "          Rango de capítulos en un libro"
	echo "      <Libro>:<Capítulo>:<Versículo>-<Versículo>"
	echo "          Rango de capítulos y versículos en un libro"
	echo "      <Libro>:<Capítulo>:<Verse>-<Capítulo>:<Verse>"
	echo "          Rango de capítulos y versos en un libro"
	echo
	echo "      /<Búsqueda>"
	echo "          Todos los versículos que coinciden con un patrón"
	echo "      <Libro>/<Búsqueda>"
	echo "          Todos los versículos en un libro que coinciden con un patrón"
	echo "      <Libro>:<Capítulo>/<Búsqueda>"
	echo "          Todos los versículos en un capítulo de un libro que coinciden con un patrón"
	exit 2
}

while [ $# -gt 0 ]; do
	isFlag=0
	firstChar="${1%"${1#?}"}"
	if [ "$firstChar" = "-" ]; then
		isFlag=1
	fi

	if [ "$1" = "--" ]; then
		shift
		break
	elif [ "$1" = "-l" ]; then
		# List all book names with their abbreviations
		get_data rva.tsv | awk -v cmd=list "$(get_data rva.awk)"
		exit
	elif [ "$1" = "-W" ]; then
		export RVA_NOLINEWRAP=1
		shift
	elif [ "$1" = "-h" ] || [ "$isFlag" -eq 1 ]; then
		show_help
	else
		break
	fi
done

cols=$(tput cols 2>/dev/null)
if [ $? -eq 0 ]; then
	export RVA_MAX_WIDTH="$cols"
fi

if [ $# -eq 0 ]; then
	if [ ! -t 0 ]; then
		show_help
	fi

	# Interactive mode
	while true; do
		printf "rva> "
		if ! read -r ref; then
			break
		fi
		get_data rva.tsv | awk -v cmd=ref -v ref="$ref" "$(get_data rva.awk)" | ${PAGER}
	done
	exit 0
fi

get_data rva.tsv 2>/dev/null | awk -v cmd=ref -v ref="$*" "$(get_data rva.awk)" 2>/dev/null | ${PAGER}

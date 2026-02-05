# MagicOS Makefile

.PHONY: build clean distclean help

# Default target
help:
	@echo "🪄 MagicOS Build System"
	@echo ""
	@echo "Comandos disponíveis:"
	@echo "  make build      - Gera a ISO (requer sudo)"
	@echo "  make clean      - Remove as pastas de trabalho (work e out)"
	@echo "  make distclean  - Limpeza profunda para novos builds"
	@echo ""

# Build the ISO
build:
	@echo "🚀 Iniciando build da MagicOS..."
	sudo mkarchiso -v -C pacman.conf -L work -o out .

# Clean work and out directories
clean:
	@echo "🧹 Limpando arquivos temporários..."
	sudo rm -rf work/

# Complete cleanup including ISOs
distclean:
	@echo "🧨 Realizando limpeza profunda (work e out)..."
	sudo rm -rf work/ out/
	@echo "✅ Limpeza concluída."

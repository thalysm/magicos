.PHONY: build clean distclean help

help:
	@echo "🪄 MagicOS Build System"
	@echo ""
	@echo "Comandos disponíveis:"
	@echo "  make build      - Gera a ISO (requer sudo)"
	@echo "  make clean      - Remove a pasta work"
	@echo "  make distclean  - Remove work e out"

build:
	@echo "🧹 Garantindo ambiente limpo..."
	-sudo umount -l work/x86_64/airootfs/proc 2>/dev/null || true
	-sudo umount -l work/x86_64/airootfs/sys 2>/dev/null || true
	-sudo umount -l work/x86_64/airootfs/dev 2>/dev/null || true
	-sudo umount -R work 2>/dev/null || true
	-sudo chattr -R -i work 2>/dev/null || true
	@echo "🚀 Iniciando build da MagicOS..."
	sudo mkarchiso -v -C pacman.conf -w work -o out .


clean:
	@echo "🧹 Desmontando pseudo-filesystems e limpando work/..."
	-sudo umount -l work/x86_64/airootfs/proc 2>/dev/null || true
	-sudo umount -l work/x86_64/airootfs/sys 2>/dev/null || true
	-sudo umount -l work/x86_64/airootfs/dev 2>/dev/null || true
	-sudo umount -R work 2>/dev/null || true
	-sudo chattr -R -i work 2>/dev/null || true
	sudo rm -rf work


distclean:
	@echo "🧨 Limpeza profunda..."
	-sudo umount -R work/x86_64/airootfs/proc 2>/dev/null || true
	-sudo umount -R work/x86_64/airootfs/sys 2>/dev/null || true
	-sudo umount -R work/x86_64/airootfs/dev 2>/dev/null || true
	-sudo umount -R work/x86_64/airootfs/run 2>/dev/null || true
	-sudo umount -R work 2>/dev/null || true
	-sudo chattr -R -i work 2>/dev/null || true
	sudo rm -rf work out
	@echo "✅ Limpeza concluída."

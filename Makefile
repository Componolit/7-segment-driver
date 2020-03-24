
all: src/generated/crt0.S src/generated/link.ld runtime

src/generated:
	mkdir -p src/generated

src/generated/link.ld: ada-runtime/platform/stm32f0/stm32f0.gpr src/generated
	startup-gen -P $< -l $@

src/generated/crt0.S: ada-runtime/platform/stm32f0/stm32f0.gpr src/generated
	startup-gen -P $< -s $@

runtime:
	make -C ada-runtime stm32f0

.PHONY: clean

clean:
	rm -rf src/generated
	make -C ada-runtime clean

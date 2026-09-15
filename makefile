.PHONY: build

all: release

checkrust:
	@command -v cargo >/dev/null 2>&1 || { \
		echo "Instalando o Rust..."; \
		curl --proto '=https' --tlv1.2 -sSf https://rustup.rs | sh -s -- -y; \
		export PATH="$$HOME/.cargo/bin:$$PATH"; \
		. "$$HOME/.cargo/env"; \
	}

release: checkrust
	cargo build --release
	@if [ -f target/release/liberis.so ]; then cp target/release/liberis.so components/; fi
	@if [ -f target/release/eris.dll ]; then cp target/release/eris.dll components/; fi

debug: checkrust
	cargo build
	@if [ -f target/debug/liberis.so ]; then cp target/debug/liberis.so components/; fi
	@if [ -f target/debug/eris.dll ]; then cp target/debug/eris.dll components/; fi

clean:
	cargo clean
	rm -f components/liberis.so components/eris.dll

.PHONY: build

all: release

release:
	cargo build --release
	@if [ -f target/release/liberis.so ]; then cp target/release/liberis.so components/; fi
	@if [ -f target/release/eris.dll ]; then cp target/release/eris.dll components/; fi

debug:
	cargo build
	@if [ -f target/debug/liberis.so ]; then cp target/debug/liberis.so components/; fi
	@if [ -f target/debug/eris.dll ]; then cp target/debug/liberis.dll components/; fi

clean:
	cargo clean
	rm -f components/liberis.so components/eris.dll
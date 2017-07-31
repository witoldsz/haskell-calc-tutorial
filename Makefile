default: run

run:
	@stack build --verbosity error --exec haskell-calc-exe

watch:
	@stack build --file-watch --verbosity error --exec haskell-calc-exe

clean:
	rm -rf .stack-work
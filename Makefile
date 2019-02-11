build:
	npm run build
example:
	npm run example
repl:
	npm run repl
release:
	npm run docs
	npm run bump -- ${v}
	npm run release
clean:
	npm run clean
reset:
	npm run reset

.PHONY: build example repl release clean reset


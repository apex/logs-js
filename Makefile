
all: dist dist.browser

dist: logs.ts
	@tsc --declaration -p tsconfig.json

dist.browser: logs.ts
	@tsc --declaration -p tsconfig.browser.json

logs.ts: $(SCHEMA)
	@echo "==> create $@"
	@rpc-ts-client \
		-schema $(SCHEMA) \
	  > $@

test:
	@ts-node -O '{ "target": "es6" }' test.ts
	@deno run --allow-net --allow-env test.deno.ts
.PHONY: test

clean:
	@rm -f logs.ts
	@rm -fr dist.browser
	@rm -fr dist
.PHONY: clean

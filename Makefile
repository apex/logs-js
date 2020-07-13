
all: dist dist.browser

dist: index.ts
	@tsc --declaration -p tsconfig.json

dist.browser: index.ts
	@tsc --declaration -p tsconfig.browser.json

index.ts: $(SCHEMA)
	@echo "==> create $@"
	@rpc-ts-client \
		-schema $(SCHEMA) \
	  > $@

test:
	@ts-node -O '{ "target": "es6" }' test.ts
	@deno run --allow-net --allow-env test.deno.ts
.PHONY: test

clean:
	@rm -f index.ts
	@rm -fr dist.browser
	@rm -fr dist
.PHONY: clean

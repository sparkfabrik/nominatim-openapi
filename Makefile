SWAGGER_UI_VERSION ?= v5.4.2
SWAGGER_ED_VERSION ?= next-v5-unprivileged
SWAGGER_UI_PORT ?= 8091
SWAGGER_ED_PORT ?= 8092

ui:
	echo "Swagger UI running at http://localhost:$(SWAGGER_UI_PORT)"
	docker run --rm -p $(SWAGGER_UI_PORT):8080 -v $(PWD)/docs/nominatim.openapi.json:/tmp/nominatim.openapi.json -e SWAGGER_JSON=/tmp/nominatim.openapi.json swaggerapi/swagger-ui:$(SWAGGER_UI_VERSION)
	echo "Shutdown Swagger UI"

editor:
	echo "Swagger Editor running at http://localhost:$(SWAGGER_ED_PORT)"
	docker run --rm -p $(SWAGGER_ED_PORT):8080 -v $(PWD)/docs/nominatim.openapi.json:/tmp/nominatim.openapi.json -e SWAGGER_FILE=/tmp/nominatim.openapi.json swaggerapi/swagger-editor:$(SWAGGER_ED_VERSION)
	echo "Shutdown Swagger Editor"

hooks:
	echo "Installing git hooks"
	cp .githooks/* .git/hooks/

checksum:
	echo "Compute spec checksum"
	.githooks/pre-commit

verify:
	.githooks/pre-push && echo "Checksum ok"

validate:
	echo "Validating Nominatim OpenAPI spec"
	npx -y @apidevtools/swagger-cli validate docs/nominatim.openapi.json

bundle:
	echo "Building the Nominatim OpenAPI spec bundle (no external references)"
	npx -y @apidevtools/swagger-cli bundle docs/nominatim.openapi.json | npx -y pretty-mini-json -o docs/nominatim.openapi.min.json
	npx -y json-dereference-cli -s docs/geocodejson.schema.json -o docs/geocodejson.schema.min.json

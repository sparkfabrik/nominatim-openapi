SWAGGER_UI_VERSION ?= v5.4.2
SWAGGER_ED_VERSION ?= next-v5-unprivileged
SWAGGER_CLI_VERSION ?= 4.0.4
PRETTY_MINI_JSON_VERSION ?= 1.1.4
JSON_DEREFERENCE_CLI_VERSION ?= 0.1.2
HTTP_SERVER_VERSION ?= 14.1.1
HTTP_SERVER_PORT ?= 8080
SWAGGER_UI_PORT ?= 8091
SWAGGER_ED_PORT ?= 8092

ui:
	echo "Swagger UI running at http://localhost:$(SWAGGER_UI_PORT)"
	docker run --rm -p $(SWAGGER_UI_PORT):8080 -v $(PWD)/src/nominatim.openapi.json:/tmp/nominatim.openapi.json -v $(PWD)/src/geocodejson.schema.json:/tmp/geocodejson.schema.json -e SWAGGER_JSON=/tmp/nominatim.openapi.json swaggerapi/swagger-ui:$(SWAGGER_UI_VERSION)
	echo "Shutdown Swagger UI"

editor:
	echo "Swagger Editor running at http://localhost:$(SWAGGER_ED_PORT)"
	docker run --rm -p $(SWAGGER_ED_PORT):8080 swaggerapi/swagger-editor:$(SWAGGER_ED_VERSION)
	echo "Shutdown Swagger Editor"

serve:
	echo "Serving playground at http://localhost:$(HTTP_SERVER_PORT)"
	npx -y http-server@$(HTTP_SERVER_VERSION) -p $(HTTP_SERVER_PORT) ./docs

hooks:
	echo "Installing git hooks"
	cp .githooks/* .git/hooks/

checksum:
	echo "Computing spec checksum"
	.githooks/pre-commit

verify:
	.githooks/pre-push && echo "Checksum ok"

validate:
	echo "Validating Nominatim OpenAPI spec"
	npx -y @apidevtools/swagger-cli@$(SWAGGER_CLI_VERSION) validate src/nominatim.openapi.json

bundle:
	echo "Building the Nominatim OpenAPI spec bundle"
	npx -y @apidevtools/swagger-cli@$(SWAGGER_CLI_VERSION) bundle src/nominatim.openapi.json | npx -y pretty-mini-json@$(PRETTY_MINI_JSON_VERSION) -o docs/nominatim.openapi.json
	npx -y json-dereference-cli@$(JSON_DEREFERENCE_CLI_VERSION) -s src/geocodejson.schema.json -o docs/geocodejson.schema.json

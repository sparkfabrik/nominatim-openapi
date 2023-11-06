# Nominatim OpenAPI Specification

Unofficial OpenAPI Specification (OAS) for Nominatim API provided by OpenStreetMap project (OSM).

<p align="center"><img src="./docs/logo-square.png" width="50%" /></p>

## Getting started

Open [sparkfabrik.github.io/nominatim-openapi](https://sparkfabrik.github.io/nominatim-openapi/) in a browser.
Choose the endpoint you are interested in and click on "Try it out".
Fill all needed options and click on "Execute", you can see query and results under the "Responses" section.

You can download the formal API specification from here: [sparkfabrik.github.io/nominatim-openapi/nominatim.openapi.json](https://sparkfabrik.github.io/nominatim-openapi/nominatim.openapi.json).

## Context and motivations

Nominatim by OpenStreetMap is one of the best FOSS alternative for geolocation tasks, both as a service and self-hosted.

Exposed API is well documented by the [official documentation](https://nominatim.org/release-docs/develop/),
but it lacks a [formal specification such as the well-known OpenAPI](https://github.com/osm-search/Nominatim/issues/1697) (a de-facto standard for REST API).

Some drawbacks of actual API implementation (waiting for version 2, see the [planning board](https://github.com/osm-search/Nominatim/projects/1)) can not be represented by OpenAPI and JSON Schema specifications,
but we think that also a partial description can be very useful for end-users and developers (think about [code generators for client and server](https://openapi-generator.tech/docs/generators/)).

This project aims to fill the hole and offer to community a robust, modern, and machine-readable description of the Nominatim API.

## How to use

### Playground

Getting started section shows how to use the [official interactive playground]((https://sparkfabrik.github.io/nominatim-openapi/)) hosted by [Github Pages](https://pages.github.com/).
If you want to locally run your own playground, you must download this repository (via [zip download](https://github.com/sparkfabrik/nominatim-openapi/archive/refs/heads/main.zip) or `git clone`).

> Source of OAS is in `src/` folder, all final files (bundled and minified) are in `docs/` folder.

You can't simply open the `docs/index.html` file in your browser, because of default [Cross-Origin Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors).
So you need to serve `docs/` folder using a web server running locally.

In a javascript-ready environment (ie. with [node](https://nodejs.org/en) and [npm](https://www.npmjs.com/) installed),
you can run `make serve` in a terminal from the project folder and point your browser to `http://localhost:8080`.

In a Docker-ready environment, you can run `make ui` to have the playground exposed on `http://localhost:8091`.

### Security

You can verify the integrity of [deployed spec](https://sparkfabrik.github.io/nominatim-openapi/nominatim.openapi.json)
using the [sha512 checksum provided](https://github.com/sparkfabrik/nominatim-openapi/blob/main/docs/nominatim.openapi.json.checksum).

You can run `make checksum` and `make verify` to compute and verify the checksum.

Refs: #6.

## Roadmap

A this early stage, we are discussing the roadmap in a [dedicated issue](https://github.com/sparkfabrik/nominatim-openapi/issues/1).
When ready, the following table will be updated.

| Milestone | Task | TBD | To do | Doing | Done | Refs |
| --------- | ---- | --- | ----- | ----- | ---- | ---- |
| OpenAPI Spec | `/search` endpoint | | | ■ | | [#2](https://github.com/sparkfabrik/nominatim-openapi/issues/2) |
| | `/lookup` endpoint | | | ■ | | [#4](https://github.com/sparkfabrik/nominatim-openapi/issues/4) |
| | `/reverse` endpoint | | ■ | | | [#3](https://github.com/sparkfabrik/nominatim-openapi/issues/3) |
| | `/status` endpoint | | ■ | | | [#5](https://github.com/sparkfabrik/nominatim-openapi/issues/5) |
| | `/details` endpoint | ■ | | | | |
| Test suite | | ■ | | | | |
| Node CLI | | ■ | | | | |

## Contributing

Any contribution is welcome!

Please read and accept our [Code of Conduct](https://github.com/sparkfabrik/nominatim-openapi/blob/main/CODE_OF_CONDUCT.md),
then refer to [Contributing Guidelines](https://github.com/sparkfabrik/nominatim-openapi/blob/main/CONTRIBUTING.md) before opening issues or pull requests.

### Contributions to OpenAPI Specification

First of all, search for issues or open one to share your thoughts, needs or intents with the maintainers and the community.
Then fork and clone this repo, make your changes, commit and push them on a new branch, finally open a PR against `main` branch of this repo.

Pre-requisites: [git](https://git-scm.com/), [make](https://www.gnu.org/software/make/), [shasum](https://www.commandlinux.com/man-page/man1/shasum.1.html), [npx](https://www.npmjs.com/package/npx) (node and npm), [docker](https://www.docker.com/).

Editable source of OAS is in `src/` folder. You can validate it running `make validate`. You can bundle it running `make build`.

Please activate the Git Hooks provided in `.githooks/` folder before the first change (hooks are bash scripts). You can simply run `make hooks` to activate them.
- **pre-commit** - validate and bundle OAS spec, compute sha512 checksums.
- **pre-push** - verify the checksums.

In a Docker-ready environment, you can run `make editor` to have the new Swagger Editor up and running on `http://localhost:8092`.
Automatic file loading and saving is not available, so you must copy/paste the content of `src/nominatim.openapi.json` in the editor and then copy/paste it back to save the changes.

<p align="center"><img src="./docs/logo-wide.png" width="50%" /></p>

## FAQ

### What is OpenAPI?

Website: https://www.openapis.org

Repository: https://github.com/oai

Also known as: Swagger (see [history](https://youtu.be/_G9dlv66-xw))

Latest version: v3.1.0

> The OpenAPI Specification (OAS) is a specification language for HTTP APIs that provides a standardized means to define your API to others. You can quickly discover how an API works, configure infrastructure, generate client code, and create test cases for your APIs. Read more about how you can get control of your APIs now, understand the full API lifecycle and communicate with developer communities inside and outside your organization.

### What is JSON Schema?

Website: https://json-schema.org

Repository: https://github.com/json-schema-org

Latest version: v2020-12

> JSON Schema enables the confident and reliable use of the JSON data format.

### What is Swagger UI?

Website: https://swagger.io/tools/swagger-ui/

Repository: https://github.com/swagger-api/swagger-ui

Latest version: v5.1.0

> Swagger UI allows anyone - be it your development team or your end consumers - to visualize and interact with the API's resources without having any of the implementation logic in place. It's automatically generated from your OpenAPI (formerly known as Swagger) Specification, with the visual documentation making it easy for back end implementation and client side consumption.

### What is OpenStreetMap?

Website: https://www.openstreetmap.org

Repository: https://github.com/openstreetmap

> OpenStreetMap is a map of the world, created by people like you and free to use under an open license. It is built by a community of mappers that contribute and maintain data about roads, trails, cafés, railway stations, and much more, all over the world.

### What is Nominatim?

Website: https://nominatim.org

Repository: https://github.com/osm-search

> Nominatim uses OpenStreetMap data to find locations on Earth by name and address (geocoding). It can also do the reverse, find an address for any location on the planet.

### What is GeoJSON?

Website: https://geojson.org

Repository: https://github.com/geojson

> GeoJSON is a format for encoding a variety of geographic data structures.

### What is GeocodeJSON?

Website: https://github.com/geocoders/geocodejson-spec/tree/master/draft

Repository: https://github.com/geocoders/geocodejson-spec

> This specification attempts to create a standard for handling geocoding results.

### What is Subresource Integrity (SRI)

Website: https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity

> Subresource Integrity (SRI) is a security feature that enables browsers to verify that resources they fetch e delivered without unexpected manipulation. It works by allowing you to provide a cryptographic hash that a fetched resource must match.

### What are Secure Hash Algorithms (SHA)

Website: https://en.wikipedia.org/wiki/SHA-2

> The Secure Hash Algorithms are a family of cryptographic hash functions published by the National Institute of Standards and Technology (NIST).

## Drawbacks

Nominatim (and OpenStreetMap) project have a long story and a non trivial development path, so this OpenAPI specification reflects some features of actual software and official documentation.

- The `format` parameter ([docs](https://nominatim.org/release-docs/develop/api/Search/#output-format)) accepts 5 values (`xml`, `json`, `jsonv2`, `geojson`, `geocodejson`), where `jsonv2` is the default one, but this specification describes only the `geocodejson` format in `components.schemas` (see [Nominatim/discussions/3115](https://github.com/osm-search/Nominatim/discussions/3115#discussioncomment-6486249), [Nominatim/issues/1697](https://github.com/osm-search/Nominatim/issues/1697#issuecomment-726232719), and [OpenAPI-Specification/issues/2031](https://github.com/OAI/OpenAPI-Specification/issues/2031) for further informations).

## Open Source Software

This project would not exist without open source, it is open source, and the community behind it contributes to open source.

Here is a list of external contributions (code and discussions) starting from work for this project:
- fix typos in Nominatim error messages: [Nominatim/pull/3112](https://github.com/osm-search/Nominatim/pull/3112)
- discussion about `jsonv2` and `geocodejson` formats of Nominatim responses: [Nominatim/discussions/3115](https://github.com/osm-search/Nominatim/discussions/3115)
- proposal of a JSON schema for `geocodejson` spec: [geocodejson-spec/issues/21](https://github.com/geocoders/geocodejson-spec/issues/21)
- pull request the GeocodeJSON schema: [geocodejson-spec/pull/25](https://github.com/geocoders/geocodejson-spec/pull/25)
- release of an unofficial schema for [GeocodeJSON](https://semver.org/) format (see [jenkin/json-schema-bricks](https://github.com/jenkin/json-schema-bricks))
- release of an unofficial schema for [GeoHash](http://geohash.org/) format (see [jenkin/json-schema-bricks](https://github.com/jenkin/json-schema-bricks))
- release of an unofficial schema for [SemVer](https://semver.org/) format (see [jenkin/json-schema-bricks](https://github.com/jenkin/json-schema-bricks))
- ...

## License

MIT license on OpenAPI Specification.
Geolocated data from OSM are provided under the [ODbL](https://openstreetmap.org/copyright) license.
Please read and accept the [Nominatim Usage Policy](https://operations.osmfoundation.org/policies/nominatim/) before any use.

## Acknowledgements

Many thanks to all OpenStreetMap contributors.

Pictures for this project are generated using [Midjourney](https://www.midjourney.com/).

<p align="center"><img src="./docs/logo-close.png" width="50%" /></p>

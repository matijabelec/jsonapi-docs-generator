# JsonApi Document Generator
Simplify jsonApi based documentation using this generator.

## Requirements
Installed `aglio` as it is used to build documentation. Knowledge of
jsonApi and api blueprint format, as well as MSON structure is welcome
and can be very helpful.

## Documentation Structure
Everything that needs to be changed for your Api documentation is inside
of `src/` directory. A few, thing you need to keep in mind:
- `src/api-description.apib` contains general details and information of
your Api
- `src/requests.apib` and `src/responses.apib` contains general request
  and response templates used in endpoint documentation
- every resource is defined with two files (both can be generated from
  generator that is explained later in this document):
    - `src/groups/{resource-type}.apib` contains endpoint definitions 
       and examples
    - `src/resources/{resource-type}.apib` contains data structures
      that is referenced in endpoint definitions

## Generate From Templates
New resource can be added to documentation using generator script.

Script is run with arguments representing details of resource:
```shell script
$ ./generate.sh notes Note Notes
```

First argument is resource type (as jsonApi resource type). Second
argument is singular representation of resource name (used in a
documentation, and it MUST be a capitalized word). Third argument is
plural representation of resource name (also used in a documentation,
and it MUST be a capitalized word).

New generated files will be added to `src/groups/` and `src/resources/`
directories with name that is `{resource-type}.apib`.

## Build Documentation
Documentation is build as an `index.html` file in `dist/` directory.

To build api documentation use following command:
```shell script
$ ./build.sh
```

File `dist/index.html` can be open in browser without running any local
server.

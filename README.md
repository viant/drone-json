# drone-json
[![Build Status](https://cloud.drone.io/api/badges/viant/drone-json/status.svg)](https://cloud.drone.io/viant/drone-json)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/viant/drone-gcloud/blob/master/LICENSE)

Drone plugin to validate JSON files

## Usage

* `files` An array of files to test

* `dirs` Relative path to a directory that has `.json` files to test

* `debug` if True will print out the results of `jq` along with any plugin parameters 

## Example

```yaml
kind: pipeline
name: default

steps:

- name: test
  image: viant/drone-json:latest
  settings:
    dirs:
      - path/to/some/json
      - another/path/to/some/json
    files:
      - path/to/file.json
      - pathfile.json
```

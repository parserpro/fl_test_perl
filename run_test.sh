#!/usr/bin/env bash

docker-compose up --abort-on-container-exit --force-recreate --exit-code-from test

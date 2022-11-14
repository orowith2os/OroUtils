#!/usr/bin/env bash

if [ ! -d "$REPO_DIR" ]
then
	echo "Invalid repository directory."
fi

if [ ! -d "$CACHE_DIR" ]
then
	echo "Invalid cache directory."
fi

sudo ostree init --repo="REPO_DIR" --mode=$OSTREE_MODE

sudo rpm-ostree compose tree --repo="REPO_DIR" --cachedir=$CACHE_DIR config.yml

sudo ostree summary --repo="REPO_DIR"

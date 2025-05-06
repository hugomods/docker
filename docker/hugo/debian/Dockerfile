# syntax = devthefuture/dockerfile-x
INCLUDE ./Dockerfile-builder

FROM node:slim as node

INCLUDE ./snippets/go

INCLUDE ./snippets/git

INCLUDE ./snippets/common

INCLUDE ./snippets/user

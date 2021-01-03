#!/bin/sh

SG_DIR=Style-Guide

pandoc -C -o Style-Guide.pdf \
    ${SG_DIR}/Front-Matter.md \
    ${SG_DIR}/Motivation.md \
    ${SG_DIR}/Visual-Layout.md \
    ${SG_DIR}/Names.md \
    ${SG_DIR}/Code-Organization.md \
    ${SG_DIR}/Programming-Constructs.md \
    ${SG_DIR}/Comments.md \
    ${SG_DIR}/Additional-Resources.md \
    ${SG_DIR}/References.md

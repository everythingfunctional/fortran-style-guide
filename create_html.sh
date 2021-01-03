#!/bin/bash

SG_DIR=Style-Guide

mkdir -p public
mkdir -p public/${SG_DIR}
cp -a ${SG_DIR}/figures public/${SG_DIR}
pandoc -C -o public/index.html \
    ${SG_DIR}/Front-Matter.md \
    ${SG_DIR}/Motivation.md \
    ${SG_DIR}/Visual-Layout.md \
    ${SG_DIR}/Names.md \
    ${SG_DIR}/Code-Organization.md \
    ${SG_DIR}/Programming-Constructs.md \
    ${SG_DIR}/Comments.md \
    ${SG_DIR}/Additional-Resources.md \
    ${SG_DIR}/References.md

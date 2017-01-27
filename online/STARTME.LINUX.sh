#!/bin/bash
echo +++++++++++++++++++++++++++++++++++++++++++++++
echo + Immune Response Template navigator by ISBM. +
echo +++++++++++++++++++++++++++++++++++++++++++++++
echo ""
echo Starting a copy of IRT 1.1 as Google application...
echo ""
google-chrome -user-data-dir=/tmp --allow-file-access-from-files --disable-popup-blocking --app=file://$PWD/index.xhtml


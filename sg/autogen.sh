#!/bin/sh
# entr: take file list – run command everytime one of the files in the list changes - is nice
# http://entrproject.org/
# homebrew: brew install entr
find lib -name '*.dart' | entr dartdoc

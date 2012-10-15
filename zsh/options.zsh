#!/bin/env zsh


function options {

	aaa=(-x 1640)
	bbb=(-y 1641)
	ccc=(-z 1642)

	zparseopts -K -- x:=aaa y:=bbb z:=ccc h=help

	if [[ $? != 0 || "$help" != "" ]]; then
		echo Usage: $(basename "$0") "[-x xxx] [-y yyy] [-z zzz]"
		exit 1
	fi

	a=$aaa[2]
	b=$bbb[2]
	c=$ccc[2]
}

options $*

echo $a
echo $b
echo $c

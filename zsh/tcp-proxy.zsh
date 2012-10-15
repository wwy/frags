#!/bin/env zsh

zmodload zsh/net/tcp
autoload -U tcp_proxy

tcp_proxy 1640 'hostname'

#!/bin/bash
# Elimina la ruta por defecto: la máquina deja de tener salida a Internet.
ip route del default || true

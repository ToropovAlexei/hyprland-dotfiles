#!/bin/bash

nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader | tr -d ' ' | sed 's/%//g'
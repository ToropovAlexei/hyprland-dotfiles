#!/bin/bash

bash scripts/install-deps.sh
sudo bash scripts/nvidia-kernel.sh
bash scripts/copy-configs.sh
bash scripts/vscode.sh
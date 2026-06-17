#!/usr/bin/env bash
set -euo pipefail

# Launch elevated PowerShell and run the Cisco AnyConnect interface metric command.
tmp_ps1="$(mktemp /tmp/set-anyconnect-metric-XXXXXX.ps1)"

cat > "$tmp_ps1" <<'EOF'
$ErrorActionPreference = 'Stop'

Get-NetAdapter |
	Where-Object { $_.InterfaceDescription -Match 'Cisco AnyConnect' } |
	Set-NetIPInterface -InterfaceMetric 6000

Remove-Item -LiteralPath $PSCommandPath -Force -ErrorAction SilentlyContinue
EOF

win_tmp_ps1="$(wslpath -w "$tmp_ps1")"

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath 'PowerShell.exe' -Verb RunAs -ArgumentList @('-NoProfile','-ExecutionPolicy','Bypass','-File','$win_tmp_ps1')"

ping -c 3 8.8.8.8

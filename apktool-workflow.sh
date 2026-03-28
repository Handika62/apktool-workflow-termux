#!/bin/bash

# Script otomatis workflow APKTool di Termux
# Usage: ./apktool-workflow.sh nama_file.apk

APK=$1
BASENAME=$(basename "$APK" .apk)
OUTDIR="${BASENAME}_src"
MODAPK="${BASENAME}_mod.apk"
OUTPUTDIR=~/downloads/output

# Pastikan folder output ada
mkdir -p "$OUTPUTDIR"

# Step 1: Decode
echo "[1] Decode APK..."
apktool d "$APK" -o "$OUTDIR" -f

echo "[2] Silakan edit file di folder: $OUTDIR"
read -p "Tekan ENTER jika sudah selesai edit..."

# Step 2: Build ulang
echo "[3] Build ulang APK..."
apktool b "$OUTDIR" -o "$MODAPK"

# Step 3: Sign APK
echo "[4] Sign APK..."
if [ ! -f mykey.keystore ]; then
  echo "Generate keystore baru..."
  keytool -genkey -v -keystore mykey.keystore -alias myalias -keyalg RSA -keysize 2048 -validity 10000
fi

jarsigner -verbose -keystore mykey.keystore "$MODAPK" myalias

# Step 4: Copy hasil ke folder output
cp "$MODAPK" "$OUTPUTDIR/"
echo "Selesai! File hasil ada di: $OUTPUTDIR/$MODAPK"

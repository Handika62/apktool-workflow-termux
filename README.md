APKTool Workflow Termux

Script otomatis untuk mengedit file APK di Termux menggunakan Apktool.  
Workflow: decode → edit → build → sign → output otomatis.

🚀 Instalasi
1. Pastikan Termux sudah terpasang.
2. Install dependensi:
   `bash
   pkg update && pkg upgrade
   pkg install openjdk-17 git wget unzip
   `
3. Clone repo:
   `bash
   git clone https://github.com/Handika62/apktool-workflow-termux.git
   cd apktool-workflow-termux
   chmod +x apktool-workflow.sh
   `

⚙️ Cara Pakai
1. Jalankan script dengan file APK:
   `bash
   ./apktool-workflow.sh ~/downloads/app.apk
   `
2. Script akan:
   - Decode APK ke folder app_src
   - Menunggu Anda edit resource/kode
   - Build ulang APK
   - Sign APK
   - Simpan hasil ke folder ~/downloads/output

📌 Catatan
- Pastikan Java sudah terpasang di Termux.
- File hasil edit otomatis tersimpan di ~/downloads/output.
- Gunakan hanya untuk aplikasi yang legal dan sesuai izin.

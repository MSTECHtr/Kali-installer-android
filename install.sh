#!/data/data/com.termux/files/usr/bin/bash

echo "
    __  ____________________________  __
   /  |/  / ___/_  __/ ____/ ____/ / / /
  / /|_/ /\__ \ / / / __/ / /   / /_/ /
 / /  / /___/ // / / /___/ /___/ __  /
/_/  /_//____//_/ /_____/\____/_/ /_/
"

echo "Mstech ile çalıştığınız için teşekkür ederiz"

# Kali Linux depolarını ekle
echo "Kali Linux depoları ekleniyor..."
echo "deb https://mirrors.kali.org/kali kali-rolling main contrib non-free" > $PREFIX/etc/apt/sources.list
apt update && apt upgrade -y

echo "Kurulum Türünü Seçin:"
echo "1. Seçkin Kurulum (Kali Linux Large - Tüm araçlar)"
echo "2. Temel Kurulum (Kali Linux Default - 64 GB altı cihazlar için)"
read -p "Seçiminizi yapın (1/2): " choice

if [ "$choice" -eq 1 ]; then
    echo "Seçkin kurulum başlatılıyor..."
    apt install -y kali-linux-large
    echo "Tüm Kali Linux araçları yüklendi!"
elif [ "$choice" -eq 2 ]; then
    echo "Temel kurulum başlatılıyor..."
    apt install -y kali-linux-default
    echo "Temel araçlar yüklendi!"
else
    echo "Geçersiz seçim! Çıkılıyor..."
    exit 1
fi

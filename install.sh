#!/data/data/com.termux/files/usr/bin/bash

clear
echo "
    __  ____________________________  __
   /  |/  / ___/_  __/ ____/ ____/ / / / 
  / /|_/ /\__ \ / / / __/ / /   / /_/ /  
 / /  / /___/ // / / /___/ /___/ __  /   
/_/  /_//____//_/ /_____/\____/_/ /_/    
"

echo "Mstech ile çalıştığınız için teşekkür ederiz!"

# Termux depolarını güncelleyerek başla
echo "Termux depoları güncelleniyor..."
pkg update && pkg upgrade -y

#Kali Linux depolarını ekle
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > $PREFIX/etc/apt/sources.list

# Bütün Kali Linux araçlarını yükle
echo "Bütün Kali Linux araçları yükleniyor..."
pkg install -y python3-pip
pkg install git python python2 -y
pkg install -y nmap hydra sqlmap aircrack-ng metasploit-framework john nikto burp-suite gobuster gobuster-resolve wireshark
echo "Bütün araçlar yüklendi!"

# Gereksiz paketleri temizle
echo "Gereksiz dosyalar temizleniyor..."
pkg autoremove -y && pkg clean

# Rehber dosyasını oluştur
echo "Kurulum tamamlandı! Kullanım rehberiniz oluşturuluyor..."

cat <<EOF > ~/Kali-Linux-Kilavuzu.txt
======================
  Kali Linux Kullanım Rehberi  
======================

    __  ____________________________  __
   /  |/  / ___/_  __/ ____/ ____/ / / / 
  / /|_/ /\__ \ / / / __/ / /   / /_/ /  
 / /  / /___/ // / / /___/ /___/ __  /   
/_/  /_//____//_/ /_____/\____/_/ /_/    

İllegal kullanımında 

**YASAL UYARI:**  
Bu araç yalnızca **etik güvenlik testleri ve siber güvenlik eğitimleri** için tasarlanmıştır.  
**İzinsiz kullanım veya yasa dışı faaliyetler tamamen kullanıcının sorumluluğundadır!**  
Kötüye kullanım sonucu oluşabilecek **her türlü hukuki veya cezai sorumluluk** kullanıcıya aittir.  

 Terminalde Kali araçlarını çalıştırmak için:
   - nmap, sqlmap, hydra gibi araçları direk terminale yazabilirsiniz.

 Güncellemeleri yapmak için:
   - sudo apt update && sudo apt upgrade -y

 Daha fazla bilgi: https://www.kali.org/docs/
EOF

# kali-guide komutunu ekle
echo "alias kali-guide='cat ~/Kali-Linux-Kilavuzu.txt'" >> ~/.bashrc
source ~/.bashrc

echo "Kurulum tamamlandı! Kullanım rehberi: ~/Kali-Linux-Kilavuzu.txt"
echo "Kılavuzu görüntülemek için terminale kali-guide yazın."

echo "Kali linuxun kendisi yüklenecek bu geliştirici seçeneğidir rootfs kullanılır android 13 altı için önerilir"

read -p "Seçiminizi yapın (E/H): " choice

if [ "$choice" = "E" ]; then
    chmod +x install-
    bash install-rootfs-kali.sh
elif [ "$choice" = "H" ]; then
    echo "Rootfs kurulumundan çıkılıyor kali linux tool'larını termux üzerinden kullanmaya devam edebilirsiniz"
    clear
    
else
    echo "Geçersiz seçim! Çıkılıyor..."
    exit 1
fi

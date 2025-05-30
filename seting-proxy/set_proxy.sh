# Mengatur proxy untuk terminal
echo "Menambahkan proxy ke ~/.bashrc..."
echo 'export no_proxy="localhost,127.0.0.0/8,::1"' >> ~/.bashrc
echo 'export https_proxy="socks5//127.0.0.1:10808"' >> ~/.bashrc
echo 'export http_proxy="socks5://127.0.0.1:10808"' >> ~/.bashrc
echo 'export all_proxy="socks5://127.0.0.1:10808"' >> ~/.bashrc
. ~/.bashrc

# Mengatur proxy untuk terminal
echo "Menambahkan proxy ke ~/.zshrc..."
echo 'export no_proxy="localhost,127.0.0.0/8,::1"' >> ~/.zshrc
echo 'export https_proxy="socks5://127.0.0.1:10808"' >> ~/.zshrc
echo 'export http_proxy="socks5://127.0.0.1:10808"' >> ~/.zshrc
echo 'export all_proxy="socks5://127.0.0.1:10808"' >> ~/.zshrc
. ~/.zshrc

# Menetapkan proxy untuk Snap
echo "Setting proxy for Snap..."
sudo snap set system proxy.http="socks5://127.0.0.1:10808"
sudo snap set system proxy.https="socks5://127.0.0.1:10808"

# Konfigurasi proxy untuk APT
echo "Configuring APT proxy..."
echo 'Acquire::http::Proxy "http://127.0.0.1:10809/";' | sudo tee /etc/apt/apt.conf.d/01proxy > /dev/null
echo 'Acquire::https::Proxy "http://127.0.0.1:10809/";' | sudo tee -a /etc/apt/apt.conf.d/01proxy > /dev/null

# Konfigurasi proxy untuk Git
echo "Configuring Git proxy..."
git config --global http.proxy socks5://127.0.0.1:10808
git config --global https.proxy socks5://127.0.0.1:10808

echo "Proxy settings applied successfully!"

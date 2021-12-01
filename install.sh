echo "\033[0;32mInstalando pacotes..."

if [ $(echo $PREFIX | grep -o "com.termux") ]; then # Termux (Android)
    pkg update
    pkg install nodejs ffmpeg libwebp git -y 2>&1 > /dev/null  # Instalando pacotes necessários para o funcionamento do script (NodeJS, FFmpeg, LibWebP, Git) e silenciando os outputs.
    npm install -g npm@6 # we need to downgrade to npm 6 because https://github.com/npm/cli/issues/3577
else
    apt update 2>&1 > /dev/null && curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -\nsudo apt-get install -y nodejs && apt install ffmpeg git webpx || pacman -Syu 2>&1 >/dev/null && pacman -S nodejs ffmpeg libwebp git
fi
echo "\033[0;32mClonando bot..."
git clone https://github.com/kamuridesu/WhatsappBot.git 2>&1 > /dev/null  # Clonando o bot.
cd js-bot # Entrando no diretório do bot.
echo "\033[0;32mInstalando dependencias..."
npm i # Instalando dependencias do bot.
echo "\033[0;32mIniciando..."
npx nodemon index.js # Iniciando o bot.

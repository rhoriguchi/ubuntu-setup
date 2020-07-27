# ubuntu_setup

## Run init script

```bash
git clone --depth 1 https://github.com/rhoriguchi/ubuntu_setup.git /tmp/ubuntu_setup

sudo chmod +x /tmp/ubuntu_setup/init.sh
/tmp/ubuntu_setup/init.sh
```

## After

Login to:

- Discord
- Firefox
- Gitkraken
- League of Legends
- MegaSync
- MS Team
- Postman
- Resilio Sync
- Steam
- TeamViewer
- shift

### Visual Studio Code

Install **Settings Sync** extension
Manualy enter GistId and token
Download settings

### Login to NordVPN

```bash
nordvpn login
```

### GitHub

Replace `USERNAME` with git username and `PASSWORD` with git password

```bash
echo 'https://USERNAME:PASSWORD@github.com' > ~/.git-credentials
```

### JetBrains Toolbox

- Login to Toolbox
- Change settings in **Shell Scripts**
  - **Generate shell scripts** to `true`
  - **Shell scripts location** to `~/jetbrains`
- Install
  - IntelliJ IDEA Ultimate
  - Android Studio
  - PyCharm Professional
  - WebStorm
  - DataGrip

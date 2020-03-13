# ubuntu_setup

## Run init script

```bash
git clone https://github.com/rhoriguchi/ubuntu_setup.git --depth 1 /tmp/ubuntu_setup

sudo chmod +x /tmp/ubuntu_setup/init.sh
/tmp/ubuntu_setup/init.sh
```

## After

### Login to NordVPN

```bash
nordvpn login
```

### Create .git-credentials

Replace `USERNAME` with git username and `PASSWORD` with git password

```bash
echo 'https://USERNAME:PASSWORD@github.com' > ~/.git-credentials
```

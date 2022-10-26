#!/bin/bash
clear
echo "==================================================================="
echo -e "\e[92m"
echo  "   ____          ____       _                    ";
echo  "  | __ )  __ _  |  _ \ __ _| |_ ___ _ __   __ _  ";
echo  "  |  _ \ / _' | | |_) / _' | __/ _ \ '_ \ / _' | ";
echo  "  | |_) | (_| | |  __/ (_| | ||  __/ | | | (_| | ";
echo  "  |____/ \__, | |_|   \__,_|\__\___|_| |_|\__, | ";
echo  "         |___/                            |___/  ";
echo -e "\e[0m"
echo "===================================================================" 

echo -e '\e[36mAuthor :\e[39m' Bang Pateng
echo -e '\e[36mTelegram Group :\e[39m' @bangpateng_group
echo -e '\e[36mTelegram Channel :\e[39m' @bangpateng_airdrop
echo -e '\e[36mYoutube :\e[39m' www.youtube.com/c/BangPateng/
echo -e '\e[36mWebsite :\e[39m' www.bangpatengnode.site

sleep 2

# set vars
if [ ! $NODENAME ]; then
	read -p "Masukan Nama Validator Kalian: " NODENAME
	echo 'export NODENAME='$NODENAME >> $HOME/.bash_profile
fi
if [ ! $WALLET ]; then
	echo "export WALLET=wallet" >> $HOME/.bash_profile
fi
echo "export OKP4_CHAIN_ID=okp4-nemeton" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo '================================================='
echo -e "Your node name: \e[1m\e[32m$NODENAME\e[0m"
echo -e "Your wallet name: \e[1m\e[32m$WALLET\e[0m"
echo -e "Your chain name: \e[1m\e[32m$OKP4_CHAIN_ID\e[0m"
echo '================================================='
sleep 2

echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
cd $HOME
sudo apt update
sudo apt install make clang pkg-config libssl-dev build-essential git jq ncdu bsdmainutils htop -y

echo -e "\e[1m\e[32m2. Install Golang... \e[0m" && sleep 1
# install golang
cd $HOME
wget -O go1.19.2.linux-amd64.tar.gz https://golang.org/dl/go1.19.2.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.2.linux-amd64.tar.gz && rm go1.19.2.linux-amd64.tar.gz
echo 'export GOROOT=/usr/local/go' >> $HOME/.bash_profile
echo 'export GOPATH=$HOME/go' >> $HOME/.bash_profile
echo 'export GO111MODULE=on' >> $HOME/.bash_profile
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> $HOME/.bash_profile && . $HOME/.bash_profile
go version

echo -e "\e[1m\e[32m3. Install Software... \e[0m" && sleep 1
# install Software
rm -rf $HOME/okp4d
git clone https://github.com/okp4/okp4d.git
cd okp4d && git checkout v2.2.0
make build
sudo mv ./target/dist/okp4d /usr/local/bin/ || exit

okp4d init $NODENAME --chain-id $OKP4_CHAIN_ID

#seeds="8e1590558d8fede2f8c9405b7ef550ff455ce842@51.79.30.9:26656,bfffaf3b2c38292bd0aa2a3efe59f210f49b5793@51.91.208.71:26656,106c6974096ca8224f20a85396155979dbd2fb09@198.244.141.176:26656"
peers="f595a1386d5ca2e0d2cd81d3c6372c3bf84bbd16@65.109.31.114:2280,a49302f8999e5a953ebae431c4dde93479e17155@162.19.71.91:26656,b8330b2cb0b6d6d8751341753386afce9472bac7@89.163.208.12:26656,79d179ea2e1fbdcc0c59a95ab7f1a0c48438a693@65.108.106.131:26706,501ad80236a5ac0d37aafa934c6ec69554ce7205@89.149.218.20:26656,a5f66d43453252bb51e35025fcf697f337ee0a3b@88.198.34.226:10096,769f74d3bb149216d0ab771d7767bd39585bc027@185.196.21.99:26656,024a57c0bb6d868186b6f627773bf427ec441ab5@65.108.2.41:36656,fff0a8c202befd9459ff93783a0e7756da305fe3@38.242.150.63:16656,2bfd405e8f0f176428e2127f98b5ec53164ae1f0@142.132.149.118:26656,bf5802cfd8688e84ac9a8358a090e99b5b769047@135.181.176.109:53656,9bf4d4f672bb758b1e2be95ab2229a2002edbfba@178.62.97.132:26656,085cf43f463fe477e6198da0108b0ab08c70c8ab@65.108.75.237:6040,b576762786c937362c7b5884bcbc3774b4df8f60@128.199.49.113:26656,dc14197ed45e84ca3afb5428eb04ea3097894d69@88.99.143.105:26656,c0864edb1e36c52dbee47ce38d8b47ec364a9eb9@135.181.24.128:28656,43930c7e1cdcfeadf02b9705aefd9a0a59adc353@148.251.69.216:26656,2e877dac234099023a9237eb2e5a05cfb3893633@144.76.45.59:16656,efc552f1211516d578543fc56afcbfbb77c656bd@5.161.145.101:36656,1b0afc2af49098b5bf6e3c89d7d29ef336c47260@144.76.27.79:60756,ef595ee71a161131efadc9edfc0d1ec4bcd82b59@65.108.195.235:25656,3664b233b8d63ef9f65733271fc2a646716a4f26@190.2.155.67:28656,4bb02c1155e43b54b7e458a771afa5f80c8207f0@89.163.231.30:26656,b353d1400a0c92d44b8df57600f0b87113a5e698@137.184.136.12:26656,6f4dd12be93ae05fd004cfa7cd12003d0645af42@167.235.159.172:36656,7f3a30c3a7663bb91f1fe16e1eb45dbe91988a4d@178.63.102.172:56656,dddf4ff204b56dcfbeff81db0028c06e47c70caa@35.225.216.94:26656,7ca0f76a967666f3f264b96b55f97eb421e2791e@34.88.239.144:26656,21cb47396d2621ebfc30016170018afba9198457@135.181.103.75:26656,692837c6c1d73cd7793eb0eff0dd027ebbbd4442@161.35.46.85:26656,27f513114d8bfe81533cda1e5d7c3e075a5f36ed@146.190.220.228:26656,2596ec3b54d2c628ffb6c3f0b43cbd46eadbf11f@65.108.129.29:60656,a839da7646ef0bc5ca138a3d0379cb419c309ad3@38.242.205.84:26656,1e48c09a0f78070e90ed49b2e3d59f8fdc188e74@162.55.234.70:55156,0a65f7137f2948faec51601b12e13e19a3a0373a@65.21.48.76:26656,3bed84f09bf1216fe7d61d198bc8c0f68e7357c6@65.21.151.219:26656,7447f19178cbb41330bf7112a1b2e17ae6007071@199.204.45.15:2456,a604c3e63c9d232ae6a1061bb6df9332b6d5c26b@62.171.139.218:26656,465c8793c32acee902307cfe90d09e16dc984bd4@167.235.225.38:26656,d2f8958ec59f1fb6396809602f4df76efe960f6c@78.47.118.55:11656,9b5d24879bad90b2b7028755fb882c00eaa4ab3b@164.92.217.146:26656,e9a7cfb7573a4e16e024b30d3741305b4251ddbc@45.89.54.54:26656,2ad936eaf32489b8ef692616cdcbd84b7109dc79@185.252.232.110:26656,b827571a11d094886c3742b6ee1dd8453adffbea@173.249.14.133:16656,52ca878d164dd05a1f916da517689d370d24b792@38.242.157.30:26656,87fe634e631f83e9977800f1d3303e90b18ab371@167.99.139.56:26656,8cc8d572f2a7df4babb5932d6909386e832d4a08@198.244.167.164:56656,370a5d94910f2367ce15c7af07b4a4f552824085@138.68.158.147:26656,db7b567084200fe8048cb2f9db3d286b82c9634b@95.216.161.94:26656,abb48eaca722c3346da1ca50146374ffa277072b@159.223.174.155:26656,f985bf97d2526114f8506ef2f7a4eac5a9e0bcfe@173.212.218.21:26656,5ac6fe9c6b9acd9c8984e1707b20c561a8d3646d@38.242.220.64:46656,0a1330e9c17fc0e4caf4686a692157519f758825@138.197.169.190:26656,04e2b4278be9c7a08ceb1c9b8f681bd0b91e4a16@167.71.59.59:26656,9d5ef90a2ddf5fa0e11d6be763c28f6c24cb2b56@176.9.146.72:60656,4781e8933a3b718237478541ad821691ff40ad6c@165.227.238.223:26656,acc5ddcb4773b9146b54d4bacdd292b9ba7dbe96@65.109.60.217:26656,38db56edd5fb8252dc9916114488f3fe14ec5d7e@65.21.138.124:33656,0b7a7bb8251ab238bf292911055cd752138546de@194.5.152.172:26656,eed3f9217780b67e632626532e8f91cbf276ec36@216.202.234.100:26656,0cfd6c8264cbdc84d7a4002f45c5ef6728a81841@45.10.154.106:26656,545dd9080676c145f3ab01dc7d386220367d4fab@149.102.143.147:29656,7469a14a0a3b57ede1a5265c03cc99b6ab3b2cd7@134.209.217.172:26656,a6c8c79e02f01f7a4fdf261247604951945e0399@142.93.224.200:26656,2690f80bfbbe140b2c1a571f91ffff3ce4cb2496@198.211.100.107:26656,37444069358f5d1f20c973d037f4819a8e20935a@65.108.13.185:27363,695f5283c4c226d188a3a743229f6eb9afaac0c4@5.75.158.179:26656,b7c8fd4b442be6dece8aaf0b8a809b77ac681618@83.171.249.80:26656,ce06cbd4c262108659e10ef9dd79ec489fd0cf65@65.108.57.170:26656,e092f17369702ffd9f446f800ed7eef6756799c6@65.109.11.187:36656,f11c694cba20a3730c220853ad2a58897a405363@147.182.238.186:26656,cff048a17deadf97b0c877695e60a60ed35218d3@135.181.27.134:26656,b875c405286956ccbdccc97bca790c8d9d708fe4@135.181.28.249:26656,6c934de77458fc8e18e2773ac96f448df63f6dd6@195.88.87.27:46656,560527501df0cde485b3f39943e5a59a4fd3a8c6@167.235.49.33:26656,a36f2fde2dafcc584a7ff238622524ce11fbde82@34.174.23.22:26656,142d437bfe7d6464707fdc65be57224e25ca461b@188.165.252.22:26656,53f28813acde8ac10e8fc2478ebf670102bd2973@116.202.165.116:11656,4c4258747e1b94826694b8e946707c20d544ab29@137.184.86.70:26656,0dec986663fd3bc15e3a1b30403442f08991562e@38.242.251.204:26656,f5d5785010c280fef886479d02ce87e7c60ec537@165.227.231.193:26656,9cdf2dbcae01321ac8a67fa29a462ebe4aed613d@65.21.147.185:26656,ab44b52595a1803c9048dd62d56ca9003728acb3@154.12.236.153:10656,79ca9bfd5c080313c6c547dbe545b2d4dc86d8fe@139.59.63.250:26656,f745d1fa053d555ef36300f0ee11b717fad1b8db@20.55.13.244:26656,a5f07483bb0bae02f204c6b28aba8f135e648304@167.99.196.41:36656,3e96e7f36f3fa2c43735d83ac672fe8db0b63cc8@141.95.65.26:23856,4d463c56d5d766c255b87f8fb5d52fb359b1ef48@130.61.50.17:26656,52b385e6eed8bd92974a13fb02e7bb30da3791c2@37.230.114.114:26656,c8f981283c4f70b56fff1d232502a10e20c5d34f@148.251.53.202:36656,cc15ceec925e511f9f660deb3671770341abee18@86.48.20.122:26656,d7ceea2fe51a4b2605e53d7b9cb76a5f0ca8c27c@65.108.202.143:656,aab352ae37336ebcb11ad4b6e80afd753b77d497@121.78.209.27:26656,9f5ba8ce36bacbbe47cd571be5d79491ba89c8dc@45.67.32.53:46656,04194899a6cc13621ff74d4d9479e38d49f4d602@195.154.107.51:26656,92f5f1d6eb51f403a0cf6eb94666750d31c7d142@185.16.39.19:26656,ad5d29c1fc2e5224a51547a677968d84bde76eb8@95.217.118.96:26858,03d719f115066060976adb6e45270d319bc9de21@143.198.150.51:26656,edbc5574b34f34a17273b1af2d1e47aec341ce10@65.108.86.7:26656,75d27d10f38155f2ffbcd89b7323badf4f3c7baf@65.108.253.94:26656,ab44363ce335469a2e867aa64b28d0cc45d3428d@135.181.149.211:26656,2590f28592a97137de0b6f68043225e2890054b0@65.108.229.225:37656,624b5d754f79a2466bff14c1dd462c5508d35f78@167.235.197.90:26656,6894c679d851420522baf151e1d1bbf63d9defc9@144.76.97.251:12656,64ab19be44146faac99fb0e694dfb9971662bc71@45.14.194.50:26656,91e6871bda98f7c24047c14d39197f3c4c965e8d@135.181.156.52:26656,c8f1f8dc60ed53831b74c895a295327be3302a77@213.136.88.245:26656,7618c28b3bff54f93512783859315cba1c370611@69.197.179.50:26656,394ee378f82a2c7e73dbb601b4e266d3f5185b47@65.108.124.54:37656,6f23f9b89832b79143b89c44f596e6eb25d37132@159.223.165.240:2456,bff882ad1ff57ad57950c0e553c527aac21c1954@146.190.218.10:2456,fcbc71fadad3684f6e2b5ebd1f18653544147bb1@159.65.235.76:26656,16a604f8433df064bfa9c958c20dde16d9f2f0ec@165.227.236.144:26656,9917f412470344841e913415a5ea5da9da96a8fa@65.108.238.217:11014,f4817defa5e4735aef6ec6dbc6436488876cffb7@209.97.222.52:26656,2e043d03e3adbcde84e656b9bd80251078d4bcf0@143.198.67.36:26656,afb122a47e5e4412fea6769ecd81d709733af85b@68.183.25.79:26656,4bb35118116ab6157f0b2d833c352e60fcfbb483@146.190.208.128:26656,a382afcb737b2dd6c1a4e0230f4d393155231ce2@147.182.130.21:26656,0ac85f7ebd6eb678ce8c62ffcc57bc300c71113a@167.99.15.43:26656,7b830a297b85ca103c1a7f4b44d8fcdaf44252cf@38.242.143.150:26656,fdf72a3e63dfedb4fe4dbd714a55635acde49d1b@167.71.27.90:26656,7a5ca967323934f8a17c889115f1465a96807404@165.22.185.178:26656,e11282dccad96ac1ff08323aae67a814edbe4629@165.22.186.100:26656,daa8cad33782cd058b887f3c73261acda67d3ce6@137.184.3.225:26656"
#sed -i "s/^seeds *=.*/seeds = \"$seeds\"/;" $HOME/.okp4d/config/config.toml
sed -i.default "s/^persistent_peers *=.*/persistent_peers = \"$peers\"/;" $HOME/.okp4d/config/config.toml

echo -e "\e[1m\e[32m4. Set Service... \e[0m" && sleep 1

sed -i.default "s/pruning *=.*/pruning = \"custom\"/g" $HOME/.okp4d/config/app.toml
sed -i "s/pruning-keep-recent *=.*/pruning-keep-recent = \"100\"/g" $HOME/.okp4d/config/app.toml
sed -i "s/pruning-interval *=.*/pruning-interval = \"10\"/g" $HOME/.okp4d/config/app.toml
#sed -i "s/snapshot-interval *=.*/snapshot-interval = 0/g" $HOME/.okp4d/config/app.toml
sed -i -e "s/indexer *=.*/indexer = \"null\"/g" $HOME/.okp4d/config/config.toml

wget -O $HOME/.okp4d/config/genesis.json https://raw.githubusercontent.com/okp4/networks/main/chains/nemeton/genesis.json
okp4d tendermint unsafe-reset-all
wget -O $HOME/.okp4d/config/addrbook.json https://api.nodes.guru/okp4_addrbook.json

sudo tee /etc/systemd/system/okp4d.service > /dev/null <<EOF
[Unit]
Description=okp4d Node
After=network.target

[Service]
User=$USER
Type=simple
ExecStart=/usr/local/bin/okp4d start
Restart=on-failure
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > $HOME/okp4d.service
sudo mv $HOME/okp4d.service /etc/systemd/system
sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF

echo -e "\e[1m\e[32m5. Running Service... \e[0m" && sleep 1

sudo systemctl restart systemd-journald
sudo systemctl daemon-reload
sudo systemctl enable okp4d
sudo systemctl restart okp4d

echo '=============== SETUP FINISH BANG EASY BANGET KAN ==================='
echo -e 'To check logs: \e[1m\e[32msudo journalctl -u okp4d -f -o cat\e[0m'
echo -e "To check sync status: \e[1m\e[32okp4d status 2>&1 | jq .SyncInfo\e[0m" && sleep 1

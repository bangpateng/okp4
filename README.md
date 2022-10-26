<p style="font-size:14px" align="right">
<a href="https://t.me/bangpateng_group" target="_blank">Join our telegram <img src="https://user-images.githubusercontent.com/50621007/183283867-56b4d69f-bc6e-4939-b00a-72aa019d1aea.png" width="30"/></a>
</p>

<p align="center">
  <img height="150" height="auto" src="https://user-images.githubusercontent.com/38981255/197962129-aadfa530-2dc3-46a2-9104-c6489cf3a424.jpg">
</p>

# OKP4 TESTNET INCENTIVIZED

Webiste Official :
> [Website](https://okp4.network/#news)

Explorer :
> [Explorer](https://okp4.explorers.guru/)

## Perangkat Minimal

|  Komponen |  Persyaratan Minimum |
| ------------ | ------------ |
| CPU  | Intel 4 Core  |
| RAM | 8 GB  |
| Penyimpanan  | 200 SSD |

## Perangkat Lunak

|Komponen | Persyaratan Minimum |
| ------------ | ------------ |
| OS |  Ubuntu 18.04 atau lebih tinggi | 

## 1. Instal Otomatis
```
wget -qO okp4.sh https://raw.githubusercontent.com/bangpateng/okp4/main/okp4.sh && chmod +x okp4.sh && ./okp4.sh
```
## 2. Load Sistem
```
source $HOME/.bash_profile
```
## 3. Membuat Wallet

```
okp4d keys add $WALLET
```
Jangan Lupa Simpan Address & Mnemonic Anda dan Import ke Keplr Wallet
*Note :* Enter Keyring Passpharse = Kalian Isi Password Bebas dan Jangan Lupa

```
okp4d keys add $WALLET --recover
```
*(Opsional)* Gunakan Peritah di Bawah Jika Anda Memiliki Wallet Lama Bisa menggunakan Perintah di atas

## 4. Claim Faucet OKP4

- Open Website : https://faucet.okp4.network/
- Connect Wallet Keplr Yang Sudah Kalian Import dan Simpan tadi atau Paste Saja Addressnya Untuk Mengambil Tokennya
- Done

## 5. Masukan Variable 2 (Untuk Simpan Informasi Wallet)

OKP4_WALLET_ADDRESS=$(okp4d keys show $WALLET -a)
OKP4_VALOPER_ADDRESS=$(okp4d keys show $WALLET --bech val -a)
echo 'export OKP4_WALLET_ADDRESS='${OKP4_WALLET_ADDRESS} >> $HOME/.bash_profile
echo 'export OKP4_VALOPER_ADDRESS='${OKP4_VALOPER_ADDRESS} >> $HOME/.bash_profile
source $HOME/.bash_profile

## 6. Check Sinkron Block

```
journalctl -fu okp4d -o cat
```

*Note :* Pastikan Block di VPS Sampai Dengan Block Height Saat ini, Yang Ada di Blockchain nya, Silahkan Check di : https://okp4.explorers.guru/ : 

## 7. Check Balance 

```
okp4d q bank balances $OKP4_WALLET_ADDRESS
```

Jika Balance Anda Sudah Masuk, Anda Bisa Lanjut Untuk Membuat Validator

## 8. Membuat Validator Jalankan Perintah

```
okp4d tx staking create-validator \
--amount=1000000uknow \
--pubkey=$(okp4d tendermint show-validator) \
--moniker="$NODENAME" \
--chain-id=okp4-nemeton \
--commission-rate="0.01" \
--commission-max-rate="0.10" \
--commission-max-change-rate="0.01" \
--min-self-delegation="1000000" \
--fees=1000uknow \
--from=wallet \
-y
```

## 9. Beberapa Perintah Berguna (Optional)

### You can check the node logs with the command:
```
journalctl -u okp4d -f
```
### Restart node:
```
systemctl restart okp4d
```
### Check your node status:
```
curl localhost:26657/status
```
### Check node synchronization, if results false – node is synchronized
```
curl -s localhost:26657/status | jq .result.sync_info.catching_up
```
### Get your valoper address:
```
okp4d keys show wallet --bech val -a
```
### Bond more tokens (if you want increase your validator stake you should bond more to your valoper address):
```
okp4d tx staking delegate YOUR_VALOPER_ADDRESS 10000000uknow --from wallet --chain-id okp4-nemeton --fees 5000uknow
```
### Active validators list:
```
okp4d query staking validators --limit 2000 -o json | jq -r '.validators[] | select(.status=="BOND_STATUS_BONDED") | [.operator_address, .status, (.tokens|tonumber / pow(10; 6)), .description.moniker] | @csv' | column -t -s"," | sort -k3 -n -r
```
### Inactive validators list:
```
okp4d query staking validators --limit 2000 -o json | jq -r '.validators[] | select(.status=="BOND_STATUS_UNBONDED") | [.operator_address, .status, (.tokens|tonumber / pow(10; 6)), .description.moniker] | @csv' | column -t -s"," | sort -k3 -n -r
```

#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:67108864:c9282116055cbca0a5b52a5d288396cf890ecfac; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:67108864:7bbc987ae2147207083c8ef2dcc45886e2870878 EMMC:/dev/block/bootdevice/by-name/recovery c9282116055cbca0a5b52a5d288396cf890ecfac 67108864 7bbc987ae2147207083c8ef2dcc45886e2870878:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

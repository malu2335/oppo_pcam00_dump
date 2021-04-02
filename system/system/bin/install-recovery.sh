#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:67108864:5fbdb7a36af61664cc53a640e358715647cdd25b; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:67108864:3f810dcf77b190220ca31fc119e35bc1e16855c5 EMMC:/dev/block/bootdevice/by-name/recovery 5fbdb7a36af61664cc53a640e358715647cdd25b 67108864 3f810dcf77b190220ca31fc119e35bc1e16855c5:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:2b21c6ff49b86d8262b2aa202a520e3c25330d7f; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:152d165ae680c7925493e1e2144cc4403eb27ca3 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:2b21c6ff49b86d8262b2aa202a520e3c25330d7f && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi

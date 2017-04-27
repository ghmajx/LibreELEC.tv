# ASUS Tinker Board

This is an experimental project for the ASUS Tinker Board.

**Progress**

* [x] LEDs (power, sd-card activity and heartbeat)
* [x] Persistent ethernet MAC-address set in u-boot
* [x] Kodi fbdev (for performance testing, no vsync, no double buffering)
* [ ] Kodi DRM/KMS
  * [x] Basic rendering
  * [x] Resolution / refresh rate change
  * [ ] Atomic DRM
* [ ] Audio
  * [x] I2S Stereo L-PCM
  * [x] I2S Multi-channel L-PCM
  * [x] I2S NL-PCM (AC3/E-AC3/DTS)
  * [ ] I2S/SPDIF HBR (TrueHD/DTS-HD)
  * [x] HDA 3.5 mm jack
* [ ] Video
  * [x] Software decoding
  * [x] Hardware decoding (works with mpv)
    * [x] h264 / hevc / vp8
    * [x] mpegts container
    * [ ] scale video correctly
* [x] WiFi
* [ ] ~~Bluetooth~~
* [ ] CEC

**Known Issues**

* Video is stretched to full screen and uses wrong aspect ratio
* Scaling 2160p video to 1080p causes green lines at bottom of screen
* Bluetooth requires unwanted changes to uart in kernel
* Generic USB-Audio do not work due to a custom alsa config
* 4K resolution is limited to 30hz

**Code**

* FFmpeg: https://github.com/LongChair/FFmpeg/commits/rockchip
* mpv: https://github.com/LongChair/mpv/commits/rockchip
* Kodi: https://github.com/Kwiboo/plex-home-theater/commits/rockchip-krypton
* Linux: https://github.com/Kwiboo/linux-rockchip/commits/rockchip-4.4

**Build**

* `PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm MEDIACENTER=no make image`
* `PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm MEDIACENTER=no LINUX=rockchip-4.10 make image`
* `PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm MEDIACENTER=no LINUX=rockchip-4.11 make image`
* `PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm MEDIACENTER=glmark2 make image`
* `PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm MEDIACENTER=glmark2 OPENGLES=mali-midgard-fbdev make image`
* `PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm MEDIACENTER=mpv-rockchip make image`
* `PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm MEDIACENTER=kodi make image`
* `PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm MEDIACENTER=kodi OPENGLES=mali-midgard-fbdev make image`

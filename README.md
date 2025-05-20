# The official dotfiles used by jrswab
Website: [jrswab.com](http://jrswab.com)
Twitter: [@jrswab](https://twitter.com/jrswab)

If using the udev rule files to enable Yubikey, watch for hardware changes utc. you must copy each the file into the `/etc/udev/rules.d/` directory manually. GNU Stow and shell scripts do not work. This also goes for the scripts contained in `./hardware`. Once the udev rules are in place execute the following command:

```shell
sudo udevadm control --reload-rules && \
sudo udevadm trigger
```

This repository uses GNU stow.


#!/bin/sh
#
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.dotfiles/Xresources ]] && xrdb -merge ~/.dotfiles/Xresources
[[ -r ~/.config/colors/default.xresources ]] && xrdb -merge ~/.config/colors/default.xresources
exec awesome & wmpid=$!
if [ -f $HOME/.dotfiles/xbindkeysrc ]; then
    /usr/bin/xbindkeys --file $HOME/.dotfiles/xbindkeysrc &
fi
urxvtd -q -f &
redshift -l 25.0333:121.5333 &
remind -z -k'notify-send "Remind" %s &' /home/bercio/Reminders/all.rem &
unclutter &
numlockx &
synclient TouchpadOff=1 &
if [ -f $HOME/.dotfiles/xmodmaprc ]; then
    /usr/bin/xmodmap $HOME/.dotfiles/xmodmaprc &
fi
wait $wmpid

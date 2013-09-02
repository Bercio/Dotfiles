#!/bin/sh
#
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
[ -f ~/.xprofile ] && source ~/.xprofile
[[ -f ~/.dotfiles/Xresources ]] && xrdb -merge ~/.dotfiles/Xresources
[[ -r ~/.config/colors/default.xresources ]] && xrdb -merge ~/.config/colors/default.xresources
xsetroot -cursor_name left_ptr
exec awesome & wmpid=$!
if [ -f $HOME/.dotfiles/xbindkeysrc ]; then
    /usr/bin/xbindkeys --file $HOME/.dotfiles/xbindkeysrc &
fi
urxvtd -q -f &
# redshift -l 25.0333:121.5333 &
unclutter -grab &
xcape 
redshift -l 44.5075:11.3514 &
numlockx &
synclient TouchpadOff=1 &
if [ -f $HOME/.dotfiles/xmodmaprc ]; then
    /usr/bin/xmodmap $HOME/.dotfiles/xmodmaprc &
fi
wicd-gtk -t &
wait $wmpid

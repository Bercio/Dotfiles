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
exec dwm & wmpid=$!
if [ -f $HOME/.dotfiles/xbindkeysrc ]; then
    /usr/bin/xbindkeys --file $HOME/.dotfiles/xbindkeysrc &
fi
if [ -f $HOME/.dotfiles/xmodmaprc ]; then
    /usr/bin/xmodmap $HOME/.dotfiles/xmodmaprc &
fi
feh --bg-fill "Media/Pictures/c&h.jpg"
unclutter -grab &
redshift -l 44.5075:11.3514 &
dropboxd
numlockx &

eval $(cat ~/.fehbg)
synapse -s
xcape
wait $wmpid

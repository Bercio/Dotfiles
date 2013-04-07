#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
# change keymap to costum ~/.Xmodmap
#if [ -f $HOME/.Xmodmap ]; then
#    /usr/bin/xmodmap $HOME/.Xmodmap
#fi
#read .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
#xmonad & wmpid=$!
exec awesome & wmpid=$!
# exec gnome-session & wmpid=$!
# exec startkde & wmpid=$!
#exec startxfce4 & wmpid=$
#exec dwm & wmpid=$!
# ...or the Window Manager of your choice

#start programs when X is launched
redshift -l 25.0333:121.5333 &
batNotifier.py &
xbindkeys &
wait $wmpid

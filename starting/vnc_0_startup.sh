#!/bin/bash
export USER="root"
export PASSWORD="123123123"
echo "000000000000000000000000000000000000001111111111111111111111111111111111111"
#touch /root/.Xauthority
mkdir -p /root/.vnc/
echo $PASSWORD | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd


vncserver
vncserver -kill :1
mv /root/.vnc/xstartup /root/.vnc/xstartup.bak
cat <<EOF > /root/.vnc/xstartup
#!/bin/bash
xrdb /root/.Xresources
startxfce4 &
EOF
chmod +x /root/.vnc/xstartup

touch /root/.Xresources
sudo vncserver
websockify -D --web=/usr/share/novnc/  6901 localhost:5901

###########################################
/usr/bin/supervisord -n




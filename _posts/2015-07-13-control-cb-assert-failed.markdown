---
layout: post
title:  "Raspberry pi cluster: control_cb (pmiserv_cb.c:200): assert (!closed) failed"
date:   2015-07-13 10:00:45
comments: True
categories: Raspberry pi 
---

I have 2 PIs with ip 192.168.0.2 and 192.168.0.3. I can password-less ssh to each pi. (I used to have 3001 for ssh port, but now I change it back to 22)

I follow [tinkernut's pi cluster tutorial](https://www.tinkernut.com/2014/05/make-cluster-computer-part-2/)

I stuck in this part of tutorial: "mpiexec -f machinefile -n 4 hostname"

My command is simply "mpiexec -f machinefile -n 2 hostname"

After running my simple command, the output is:

pi01 (works!)

when it tries to reach pi02, the errors are

    host: 192.168.0.2
    host: 192.168.0.3
    
    ==================================================================================================
    mpiexec options:
    ----------------
      Base path: /home/rpimpi/mpi-install/bin/
      Launcher: (null)
      Debug level: 1
      Enable X: -1
    
      Global environment:
      -------------------
        MAIL=/var/mail/pi
        USER=pi
        SHLVL=1
        HOME=/home/pi
        OLDPWD=/home/pi/misc
        HUSHLOGIN=FALSE
        L1=tty1
        LOGNAME=pi
        _=./test.sh
        TERM=linux
        PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/rpimpi/mpi-install/bin
        LANG=en_GB.UTF-8
        LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:
        SHELL=/bin/bash
        PWD=/home/pi/misc/test
    
      Hydra internal environment:
      ---------------------------
        GFORTRAN_UNBUFFERED_PRECONNECTED=y
    
    
        Proxy information:
        *********************
          [1] proxy: 192.168.0.2 (1 cores)
          Exec list: hostname (1 processes); 
    
          [2] proxy: 192.168.0.3 (1 cores)
          Exec list: hostname (1 processes); 
    
    
    ==================================================================================================
    
    [mpiexec@pi01] Timeout set to -1 (-1 means infinite)
    [mpiexec@pi01] Got a control port string of 192.168.0.2:39681
    
    Proxy launch args: /home/rpimpi/mpi-install/bin/hydra_pmi_proxy --control-port 192.168.0.2:39681 --debug --rmk user --launcher ssh --demux poll --pgid 0 --retries 10 --usize -2 --proxy-id 
    
    Arguments being passed to proxy 0:
    --version 3.1.4 --iface-ip-env-name MPIR_CVAR_CH3_INTERFACE_HOSTNAME --hostname 192.168.0.2 --global-core-map 0,1,2 --pmi-id-map 0,0 --global-process-count 2 --auto-cleanup 1 --pmi-kvsname kvs_2638_0 --pmi-process-mapping (vector,(0,2,1)) --ckpoint-num -1 --global-inherited-env 15 'MAIL=/var/mail/pi' 'USER=pi' 'SHLVL=1' 'HOME=/home/pi' 'OLDPWD=/home/pi/misc' 'HUSHLOGIN=FALSE' 'L1=tty1' 'LOGNAME=pi' '_=./test.sh' 'TERM=linux' 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/rpimpi/mpi-install/bin' 'LANG=en_GB.UTF-8' 'LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:' 'SHELL=/bin/bash' 'PWD=/home/pi/misc/test' --global-user-env 0 --global-system-env 1 'GFORTRAN_UNBUFFERED_PRECONNECTED=y' --proxy-core-count 1 --exec --exec-appnum 0 --exec-proc-count 1 --exec-local-env 0 --exec-wdir /home/pi/misc/test --exec-args 1 hostname 
    
    Arguments being passed to proxy 1:
    --version 3.1.4 --iface-ip-env-name MPIR_CVAR_CH3_INTERFACE_HOSTNAME --hostname 192.168.0.3 --global-core-map 0,1,2 --pmi-id-map 0,1 --global-process-count 2 --auto-cleanup 1 --pmi-kvsname kvs_2638_0 --pmi-process-mapping (vector,(0,2,1)) --ckpoint-num -1 --global-inherited-env 15 'MAIL=/var/mail/pi' 'USER=pi' 'SHLVL=1' 'HOME=/home/pi' 'OLDPWD=/home/pi/misc' 'HUSHLOGIN=FALSE' 'L1=tty1' 'LOGNAME=pi' '_=./test.sh' 'TERM=linux' 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/rpimpi/mpi-install/bin' 'LANG=en_GB.UTF-8' 'LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:' 'SHELL=/bin/bash' 'PWD=/home/pi/misc/test' --global-user-env 0 --global-system-env 1 'GFORTRAN_UNBUFFERED_PRECONNECTED=y' --proxy-core-count 1 --exec --exec-appnum 0 --exec-proc-count 1 --exec-local-env 0 --exec-wdir /home/pi/misc/test --exec-args 1 hostname 
    
    [mpiexec@pi01] Launch arguments: /home/rpimpi/mpi-install/bin/hydra_pmi_proxy --control-port 192.168.0.2:39681 --debug --rmk user --launcher ssh --demux poll --pgid 0 --retries 10 --usize -2 --proxy-id 0 
    [mpiexec@pi01] Launch arguments: /usr/bin/ssh -x 192.168.0.3 "/home/rpimpi/mpi-install/bin/hydra_pmi_proxy" --control-port 192.168.0.2:39681 --debug --rmk user --launcher ssh --demux poll --pgid 0 --retries 10 --usize -2 --proxy-id 1 
    pi01
    [mpiexec@pi01] control_cb (/home/pi/Downloads/mpich3/mpich-3.1.4/src/pm/hydra/pm/pmiserv/pmiserv_cb.c:200): assert (!closed) failed
    [mpiexec@pi01] HYDT_dmxu_poll_wait_for_event (/home/pi/Downloads/mpich3/mpich-3.1.4/src/pm/hydra/tools/demux/demux_poll.c:76): callback returned error status
    [mpiexec@pi01] HYD_pmci_wait_for_completion (/home/pi/Downloads/mpich3/mpich-3.1.4/src/pm/hydra/pm/pmiserv/pmiserv_pmci.c:198): error waiting for event
    [mpiexec@pi01] main (/home/pi/Downloads/mpich3/mpich-3.1.4/src/pm/hydra/ui/mpich/mpiexec.c:344): process manager error waiting for completion



Research I done so far:

[http://stackoverflow.com/questions/27419782/error-while-executing-mpi](http://stackoverflow.com/questions/27419782/error-while-executing-mpi)

[http://stackoverflow.com/questions/20668042/mpiexec-checkpointing-error-rpi](http://stackoverflow.com/questions/20668042/mpiexec-checkpointing-error-rpi)

[http://stackoverflow.com/questions/29315216/mpich-example-cpi-generates-error-when-it-runs-on-multiple-fresh-installed-vps](http://stackoverflow.com/questions/29315216/mpich-example-cpi-generates-error-when-it-runs-on-multiple-fresh-installed-vps)


###Solution
I realized that I don't use switch to connect all PIs, instead of I use wifi dongle for each PI. I ssh to the PI1 itself, this forces to add to know_hosts under .ssh. I did this to PI2 as well. Now I am able exeucte this command: "mpiexec -f machinefile -n 2 hostname". It outputs "pi01" and "pi02". If it is still not working, I recommend you back up your .ssh and regenerate a new one.

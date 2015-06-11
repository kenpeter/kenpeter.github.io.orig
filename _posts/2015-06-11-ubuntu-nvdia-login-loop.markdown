---
layout: post
title:  "How to fix Ubuntu Nvdia login loop"
date:   2015-06-11 10:19:45
comments: True
categories: ubuntu
---

[Original post here](http://askubuntu.com/questions/614128/15-04-and-nvidia-login-loop/615184#615184)

**My fix for my laptop**

Dell xps l502x, so it is Intel + Nvidia optimus graphic card.

**Have a look at what you have**

In terminal type: ```dkms status```

You may get something like this

```bbswitch, 0.7, 3.19.0-15-generic, x86_64: installed```

```nvidia-340, 340.76, 3.19.0-15-generic, x86_64: installed```

**Remove all Nvidia drivers, make Ubuntu back to “clean” state.**

Have a look at this: [http://unix.stackexchange.com/questions/144871/remove-all-nvidia-files](http://unix.stackexchange.com/questions/144871/remove-all-nvidia-files)

Basically, you do:

```sudo apt-get purge $(dpkg -l | awk '$2~/nvidia/ {print $2}')```

This should remove all nvidia drivers and now you should be clean.

You may want to double check:

```dkms status```

**Install Nvidia driver**

Have a look at this: [http://www.binarytides.com/install-nvidia-drivers-ubuntu-14-04](http://www.binarytides.com/install-nvidia-drivers-ubuntu-14-04) (the command line part)

I tried to install nvidia-349, it didn’t work, then I remember previously I used nvidia-340. It seems important to remember what works for you. I do:

```sudo apt-get install nvidia-340``` (you may want to try nvidia-346)

**Look at this long guide**

[http://rajat-osgyan.blogspot.com.au/2015/03/how-to-install-bumblebee-on-ubuntu.html](http://rajat-osgyan.blogspot.com.au/2015/03/how-to-install-bumblebee-on-ubuntu.html)

On step 4, instead of

```sudo echo ON > cat/proc/acpi/bbswitch```

I changed it to

```sudo tee /proc/acpi/bbswitch <<<ON```
based on [https://github.com/Bumblebee-Project/bbswitch](https://github.com/Bumblebee-Project/bbswitch)

Sometimes after turn on bbswitch, reboot, when I do ```echo /proc/acpi/bbswitch```, I still see it “OFF”. Make sure Nvidia is installed in the first place or reboot for couple of times. If it is “OFF”, follow the guide to next step.

**Reboot**

After the guide, reboot, see if you still have the login loop issue. If you still have issues ,then look at /var/log/Xorg.0.log

**/var/log/Xorg.0.log**

Look for the error messages, which are indicated by (EE). In my case, it says Failed to load ```/usr/lib/x86_64-linux-gnu/xorg/extra-modules/libglx.so: libnvidia-tls.so.340.46: cannot open shared object file: No such file or directory```

I do a locate libglx.so, it seems the file is sitting in another locations. It is time to rebuild xorg.conf

**Rebuild xorg.conf**

Have a look at this guide: [https://lkubuntu.wordpress.com/2011/08/30/quick-and-easy-way-to-fix-x11-issues](https://lkubuntu.wordpress.com/2011/08/30/quick-and-easy-way-to-fix-x11-issues)

This was my last step and I was able to boot to the GUI.

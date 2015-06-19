---
layout: post
title:  "Ubuntu 15.04: connect University of Melbourne wired network with username and password manually"
date:   2015-06-19 22:48:45
comments: True
categories: ubuntu 
---

### Requirements
* In order to connect to University of Melbourne's wired network, you need a university username and password.
* A Ubuntu machine.
* Connect to univeristy network with a cable.

### Steps

* Mouse internet connection icon on the top right.
* Click "edit connections".
* Edit a connection or create a new one.
* Click on the tab says '802.1x Security'. 

![alt text][setting]

* Follow the settings above.
* [Based on this][ca], you need to
* Edit 
```etc/NetworkManager/system-connections```
* Change
```system-ca-certs=true```
to
```system-ca-certs=false```
* You are done.


[setting]: /images/unimelb_wired_network.png
[ca]: http://askubuntu.com/questions/456970/constantly-asked-for-wifi-password-and-ca-certificate

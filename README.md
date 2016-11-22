VirtualBox-make
===============

Usage
-----

Before usage, configuation file ``config.conf`` has to be prepared from
the example file ``config.conf.example``.

Preparing the guest virtual machine
-----------------------------------

In order for the guest VMS to function properly, the following steps have
to be taken (all modifications on guest VMS only):

* Forbid installation from the CD by commenting out a following line in
  the ``/etc/apt/sources.list``:

  ```
  deb cdrom:[some name]/ stable main
  ```

* Create the executing user (with home folder and ``/bin/bash`` Shell);
* Install ``sudo`` (if not already present);
* Install ``openssh-server`` on the guest machine and configure it to
  accept passwordless connections of the executing user;
* (**optional**) Allow passwordless execution of
  ``sudo apt-get install`` by adding the following line to
  ``/etc/sudoers``:

  ```
  tester            ALL = (ALL) NOPASSWD: /usr/bin/apt-get
  ```

  This may be neccessary in case if tester has to install dependencies.

Notices
-------
System uses a **trick to evade SSH key checking** as described here:
http://linuxcommando.blogspot.ch/2008/10/how-to-disable-ssh-host-key-checking.html.
In addition to this, the system creates and deletes a VMS snapshot for
each run.

**Port-forwarding for SSH** is set up automatically after starting the
guest and is removed right after shutting it down as described here:
http://stackoverflow.com/questions/5906441/how-to-ssh-to-a-virtualbox-guest-externally-through-a-host.

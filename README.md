selinux-role
=========

SELinux の設定を変更します｡

Requirements
------------

SELinux を Ansible で変更する場合は､下記をホストにインストールする必要があります｡

- libselinux-python

Role Variables
--------------

'selinux_role_selinuxstatus' の変数を変更して `SELinux` を設定してください｡

- disabled
- enforcing
- permissive

License
-------

BSD

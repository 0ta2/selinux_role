[![GitHub issues](https://img.shields.io/github/issues/0ta2/selinux_role)](https://github.com/0ta2/selinux_role/issues)
[![GitHub stars](https://img.shields.io/github/stars/0ta2/selinux_role)](https://github.com/0ta2/selinux_role/stargazers)
![GitHub Actions](https://github.com/0ta2/selinux_role/workflows/Molecule%20Test/badge.svg)

selinux_role
=========

SElinux の設定を変更するためのロール。

Requirements
------------

AnsibleでSELinuxを変更する場合、次のものをホストにインストールする必要があります。

- libselinux-python

Role Variables
--------------

`selinux_role_selinux_status`変数を変更して`SELinux`を設定します。

- disabled
- enforcing
- permissive

| 変数名                      | 役割                      |
|-----------------------------|---------------------------|
| selinux_role_selinux_status | SElinuxのステータスを変更 |


License
-------

![GitHub](https://img.shields.io/github/license/0ta2/selinux_role)

[![GitHub issues](https://img.shields.io/github/issues/0ta2/selinux-role)](https://github.com/0ta2/selinux-role/issues)
[![GitHub stars](https://img.shields.io/github/stars/0ta2/selinux-role)](https://github.com/0ta2/selinux-role/stargazers)
[![CircleCI](https://img.shields.io/circleci/build/github/0ta2/selinux-role/master)](https://circleci.com/gh/0ta2/selinux-role)
[![Ansible Role](https://img.shields.io/ansible/role/43413)](https://galaxy.ansible.com/0ta2/selinux_role)

selinux-role
=========

Change SElinux settings.

Requirements
------------

When changing SELinux with Ansible, the following must be installed on the host.

- libselinux-python

Role Variables
--------------

Change the 'selinux_role_selinux_status' variable to set `SELinux`.

- disabled
- enforcing
- permissive

License
-------

![GitHub](https://img.shields.io/github/license/0ta2/selinux-role)

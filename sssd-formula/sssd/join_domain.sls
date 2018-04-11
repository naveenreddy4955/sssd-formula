# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sssd/map.jinja" import sssd with context %}

{% if salt['grains.get']('os_family', None) == 'RedHat' %}
{% if salt['grains.get']('osmajorrelease', None) == 7 %}
domain-packages:
  pkg.installed:
    - pkgs:
      - realmd
      - oddjob
      - oddjob-mkhomedir
      - adcli
      - samba-common-tools

join-domain:
  cmd.run:
    - name: echo {{ sssd.domain_password }} | realm join -U {{ sssd.domain_user }} {{ sssd.domain }}
    - unless: realm list | grep {{ sssd.domain }}
    - require:
      - pkg: domain-packages
{% endif %}
{% endif %}

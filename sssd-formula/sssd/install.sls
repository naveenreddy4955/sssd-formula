# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sssd/map.jinja" import sssd with context %}

sssd-pkg:
  pkg.installed:
    - name: {{ sssd.pkg }}

# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sssd/map.jinja" import sssd with context %}

sssd-config:
  file.managed:
    - name: {{ sssd.config_file }}
    - source: salt://sssd/files/sssd.conf.tmpl
    - mode: 600
    - user: {{ sssd.user }}
    - group: {{ sssd.group }}
    - template: jinja
    - context:
      config: {{ sssd.config.options }}
    - require:
      - pkg: sssd-pkg

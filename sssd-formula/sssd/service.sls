# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sssd/map.jinja" import sssd with context %}

sssd-service:
  service.running:
    - name: {{ sssd.service }}
    - enable: True
    - require:
      - pkg: sssd-pkg
      - file: sssd-config
    - watch:
      - pkg: sssd-pkg
      - file: sssd-config

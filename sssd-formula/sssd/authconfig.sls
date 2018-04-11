# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sssd/map.jinja" import sssd with context %}

authconfig-pkg:
  pkg.installed:
    - name: authconfig

authconfig_update:
  cmd.run:
    - name: authconfig {{ sssd.authconfig.args }}
    - unless: test "`authconfig {{ sssd.authconfig.args }} --test`" = "`authconfig --test`"
    - require:
      - pkg: authconfig-pkg
      - service: sssd-service

# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sssd/map.jinja" import sssd with context %}

include:
  - sssd.install
{% if sssd.manage_config_file == True %}
  - sssd.config
{% endif %}
{% if sssd.manage_service == True %}
  - sssd.service
{% endif %}
{% if sssd.manage_authconfig == True %}
  - sssd.authconfig
{% endif %}
{% if sssd.join_domain == True %}
  - sssd.join_domain
{% endif %}

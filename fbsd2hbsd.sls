unbound:
  pkg:
    - installed

ca_root_nss:
  pkg:
    - installed

salt://fbsd2hbsd.sh:
  cmd.script:
    - require:
      - pkg: unbound
      - pkg: ca_root_nss
    - user: root
    - group: wheel
    - shell: /bin/tcsh 

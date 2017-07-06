unbound:
    pkg:
        - installed
ca_root_nss:
    pkg:
        - installed

fbsd2hbsd.sh
    cmd.script:
       - source: salt://fbsd2hbsd/fbsd2hbsd.sh
       - user: root
       - group: wheel
       - shell: /usr/bin/tcsh 

python-software-properties:
  pkg.latest

python-ppa:
  pkgrepo.managed:
    - humanname: Python PPA
    - ppa: fkrull/deadsnakes
    - name: http://ppa.launchpad.net/fkrull/deadsnakes/ubuntu
    - file: /etc/apt/sources.list.d/python.list
    - comps: main

pypy-ppa:
  pkgrepo.managed:
    - humanname: PyPy PPA
    - ppa: pypy/ppa
    - name: http://ppa.launchpad.net/pypy/ppa/ubuntu
    - file: /etc/apt/sources.list.d/pypy.list
    - comps: main

bootstrap-scripts:
  file.recurse:
    - name: /usr/local/sbin/
    - source: salt://usr/local/sbin/

python:
  pkg.latest:
    - pkgs:
      - python2.6
      - python2.7
      - python3.1
      - python3.2
      - python3.3
      - pypy
    - requires:
        pkgrepo: python-ppa
        pkgrepo: pypy-ppa
        pkg: python-software-properties

boostrap:
    cmd.run:
    - name: sh /usr/local/sbin/bootstrap-python.sh
    - user: root
    - unless: if command -v pip >/dev/null; then return 1; else return 0; fi
    - requires:
      - file: bootstrap-scripts
      - pkg: python

install-pip:
      cmd.run:
      - name: python /usr/local/sbin/get-pip.py
      - user: root
      - unless: if command -v pip >/dev/null; then exit 1; else exit; fi
      - requires:
        - cmd: bootstrap
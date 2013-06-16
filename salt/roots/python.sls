python-software-properties:
  pkg.latest

python-ppa:
  pkgrepo.managed:
    - humanname: Python PPA
    - ppa: fkrull/deadsnakes
    - name: http://ppa.launchpad.net/fkrull/deadsnakes/ubuntu
    - file: /etc/apt/sources.list.d/python-precise.list
    - comps: main
    - dist: precise

python:
  pkg.latest:
    - pkgs:
      - python2.6
      - python2.7
      - python3.1
      - python3.2
      - python3.3
    - requires:
        pkgrepo: python-ppa
        pkg: python-software-properties
python-legacy:
  pkg.latest:
    - pkgs:
      - python2.4
      - python2.5
    - requires:
        pkgrepo: python-ppa
        pkg: python-software-properties
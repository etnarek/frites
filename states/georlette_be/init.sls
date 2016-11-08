require:
    - sls: nginx.sls

/etc/nginx/sites-available/georlette.be:
  file.managed:
    - source: salt://georlette_be/vhost.conf
    - user: root
    - group: root
    - mode: 640
    - makedirs: True

/etc/nginx/sites-enabled/georlette.be:
  file.symlink:
    - makedirs: True
    - target: /etc/nginx/sites-available/georlette.be
    - require:
        - file: /etc/nginx/sites-available/georlette.be

/usr/share/nginx/georlette.be/index.html:
  file.managed:
    - source: salt://georlette_be/index.html
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

/usr/share/nginx/georlette.be/marmite.jpg:
  file.managed:
    - source: salt://georlette_be/marmite.jpg
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

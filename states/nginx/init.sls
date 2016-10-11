nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-available/default

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 640
    - makedirs: True

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/files/default
    - user: root
    - group: root
    - mode: 640
    - makedirs: True

/etc/nginx/sites-enabled/default:
  file.symlink:
    - makedirs: True
    - target: /etc/nginx/sites-available/default
    - require:
      - file: /etc/nginx/sites-available/default

/usr/share/nginx/html/index.html:
  file.managed:
    - source: salt://nginx/files/index.html.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

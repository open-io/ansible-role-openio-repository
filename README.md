repo-openio-sds
===============

Ansible role that configure OpenIO SDS repositories.

Requirements
------------

Only supports RedHat 7 and Ubuntu 16.04.

Role Variables
--------------

Available variables are listed below, along with default values (see defaults/main.yml):

    openio_sds_release: '16.04'
OpenIO SDS release installed. Defaults to the latest stable release.

    openio_sds_repo_baseurl: http://mirror.openio.io/pub/repo/openio
OpenIO base mirror URL for repositories.

    openio_sds_repo_produrl: "{{ openio_sds_repo_baseurl }}/sds"
OpenIO SDS product base URL used to install OpenIO SDS.

    openio_sds_repo_releaseurl: "{{ openio_sds_repo_produrl }}/{{ openio_sds_release }}"
OpenIO SDS product release URL used to install OpenIO SDS.

Dependencies
------------

This role has no dependencies.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: openio-repo-openio-sds, openio_sds_release: '17.04' }

License
-------

Apache

OpenIO
------

This role was created in 2017 by OpenIO.

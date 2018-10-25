[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-repository.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-repository)
# Ansible role `repository`

An Ansible role for setup OpenIO's repositories (and OpenStack). Specifically, the responsibilities of this role are to:

- Setup key and repository for an OpenIO product and a specific distribution
- Manage credentials for private repositories

## Requirements

- Ansible 2.4+

## Role Variables

| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_repository_disable_policy_autostart` | `true` | (Debian, Ubuntu) Disable the autostart of unconfigured packages |
| `openio_repository_manage_epel_repository` | `true` | (RedHat) Allow the installation of EPEL repository |
| `openio_repository_manage_openstack_repository` | `true` | Allow the installation of OpenStack's repository |
| `openio_repository_openstack_release` | `pike` | OpenStack release version codename |
| `openio_repository_products` | `{'sds': {'release': '17.04'}}` | OpenIO products repositories to setup |
| `openio_repository_mirror_host` | `"mirror.openio.io"` | The mirror host to setup |

The `openio_repository_products` variable should be a dict, with OpenIO products repository names ('sds', 'oiofs', 'replicator') as keys.

Each `openio_repository_products`s value should also be a dict, with the following content:

| Key   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `release` | None | OpenIO release version ('17.04', 'unstable'). This one is mandatory |
| `password` | None | Password for private repository. This will be provided to OpenIO's customers |
| `user` | None | User account name for private repository. This will be provided to OpenIO's customers |
| `state` | `"present"` | The state of the repository to setup |

## Example playbook

```yaml
- hosts: all
  gather_facts: true
  become: true
  roles:
    - role: openio-repository

    - role: openio-repository
      openio_repository_products:
        sds:
          release: "16.10"
          state: "present"

    - role: openio-repository
      openio_repository_products:
        sds:
          release: "17.04"
          state: "absent"

    - role: openio-repository
      openio_repository_products:
        sds:
          release: "17.04"
        oiofs:
          release: "unstable"
          user: foo
          password: bar
```

## Example inventory

```ini
[all]
node1 ansible_host=192.168.1.173
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License

GNU AFFERO GENERAL PUBLIC LICENSE, Version 3

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
- [Romain ACCIARI](https://github.com/racciari) (maintainer)
- [Vincent LEGOLL](https://github.com/vincent-legoll) (maintainer)

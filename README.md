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
| `openio_repository_creds` | `""` | Credentials string |
| `openio_repository_disable_policy_autostart` | `true` | (Ubuntu) Disable the autostart of unconfigured packages |
| `openio_repository_release` | `'17.04'` | Distribution of OpenIO |
| `openio_repository_manage_openstack_repository` | `true` | Allow the installation of OpenStack's repository |
| `openio_repository_openstack_release` | `pike` | OpenStack's distribution |
| `openio_repository_password` | `""` | Password for private repository. This password will be provided to OpenIO's customers |
| `openio_repository_product` | `'sds'` | Product of OpenIO |
| `openio_repository_user` | `""` | User for private repository |
| `openio_repository_state` | `"present"` | The state of the repository file |

## Dependencies

- EPEL repository for `RedHat` family

## Example Playbook

```yaml
- hosts: all
  gather_facts: true
  become: true
  roles:
    - role: openio-repository
    - role: openio-repository
      openio_repository_release: "16.10"
    - role: openio-repository
      openio_repository_release: "17.04"
      openio_repository_state: "asbent"
    - role: openio-repository
      openio_repository_product: oiofs
      openio_repository_user: foo
      openio_repository_password: bar

```


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

Apache License, Version 2.0

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
- [Romain ACCIARI](https://github.com/racciari) (maintainer)
- [Vincent LEGOLL](https://github.com/vincent-legoll) (maintainer)

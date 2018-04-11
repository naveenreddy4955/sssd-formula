================
sssd-formula
================

A SaltStack formula that manages the sssd package and service.

**NOTE**

See the full `Salt Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>

Supported systems
================

* RedHat/CentOS 7
* RedHat/CentOS 6

Available states
================

``install``
------------

Installs the sssd package.

``service``
------------

Starts and enables the sssd package. Enable/disable via pillar configuration. Default is to not start or enable the service

``config``
------------

Creates the sssd configuration file based on pillar data.

``authconfig``
------------

Runs the authconfig command to configure authentication resources to use sssd . Enable/disable via pillar configuration. Default is to not run authconfig.

``join_domain``
------------

Joins the system to a domain. Enable/disable via pillar configuration. Default is to not join the system to a domain.

Testing
=======

## Lint testing

To test YAML/JSON syntax use salt-call, e.g.

```
salt-call --local --config-dir=test/mock/conf/Redhat/ state.show_sls template.install
```

To test for other platforms you need to create the corresponding directory and minion file inside `test/mock/conf/`

## System tests
Use Test Kitchen to test the actual Salt code execution and perform more rigorous testing using inSpec.

* Install the requirements:
```
$ bundle install
```
* Set the needed environment variables:
```
$ export TEST_KITCHEN_SALT_VERSION=2017.7.2
```

### Test kitchen with Vagrant/Virtualbox
This is the default setting reflected in the main .kitchen.yml

### Test kitchen with Azure VMs
This is the setting reflected in the alternative .kitchen.azure.yml and it's used to test the Salt code against actual Azure VMs.
```
$ export KITCHEN_YAML=.kitchen.azure.yml
```
You also need to set the appropriate variables to access the subscription in which the VMs are going to be created. Create a service principal for that and copy the appropriate values:
```
$ export AZURE_CLIENT_ID="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
$ export AZURE_CLIENT_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
$ export AZURE_TENANT_ID="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```
Set some variables used in the .kitchen.azure.yml file like the subscription you use, the location and a password to use for the admin user on the VMs.
```
$ export TEST_KITCHEN_SUBSCRIPTION="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
$ export TEST_KITCHEN_LOCATION="xxxxx"
$ export TEST_KITCHEN_PASSWORD="xxxxxxxxxxxxx"
```

### Converge and run tests
After you set the variables depending on what driver you are working with, list the available roles:
```
$ bundle exec kitchen list
```
Converge a role and run the tests
```
$ bundle exec kitchen verify <role>
```

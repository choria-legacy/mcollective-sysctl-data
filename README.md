# Sysctl Data Plugin

## Deprecation Notice

This repository holds legacy code related to The Marionette Collective project.  That project has been deprecated by Puppet Inc and the code donated to the Choria Project.

Please review the [Choria Project Website](https://choria.io) and specifically the [MCollective Deprecation Notice](https://choria.io/mcollective) for further information and details about the future of the MCollective project.

## Introduction

This plugin can retrieve a value from a sysctl variable to be used in agents and discovery.

Sample usage to select all machines where ipv4 forwarding is enabled:

```
$ mco find -S "sysctl('net.ipv4.conf.all.forwarding').value=1"
```

## Portability

This plugin works on all systems where sysctl(8) is installed as
`/sbin/sysctl` such as Linux, *BSD, etc.

# Installation

* Follow the [basic plugin install guide](http://projects.puppetlabs.com/projects/mcollective-plugins/wiki/InstalingPlugins) placing the plugin and DDL in the data directory

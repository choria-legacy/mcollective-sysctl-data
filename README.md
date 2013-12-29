#Sysctl Data Plugin

##Introduction

This plugin can retrieve a value from a Linux sysctl variable to be used in agents and discovery.

Sample usage to select all machines where ipv4 forwarding is enabled:

```
$ mco find -S "sysctl('net.ipv4.conf.all.forwarding').value=1"
```

#Installation

* Follow the [basic plugin install guide](http://projects.puppetlabs.com/projects/mcollective-plugins/wiki/InstalingPlugins) placing the plugin and DDL in the data directory

#Sysctl Data Plugin

##Introduction

This plugin can retrieve a value from a sysctl variable to be used in agents and discovery.

Sample usage to select all machines where ipv4 forwarding is enabled:

```
$ mco find -S "sysctl('net.ipv4.conf.all.forwarding').value=1"
```

##Portability

This plugin works on all systems where sysctl(8) is installed as
`/sbin/sysctl` such as Linux, *BSD, etc.

#Installation

* Follow the [basic plugin install guide](http://projects.puppetlabs.com/projects/mcollective-plugins/wiki/InstalingPlugins) placing the plugin and DDL in the data directory

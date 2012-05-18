# Heckpacked
Is a lightweight library for Icinga passive checks. It helps you raise alerts in very easy way in your application :)

## Travis
Ci status
[![Build Status](https://secure.travis-ci.org/JakubOboza/henpecked.png?branch=master)](http://travis-ci.org/JakubOboza/henpecked)

## Passive Checks
It is implementing passive checks
<http://docs.icinga.org/latest/en/passivechecks.html>

## Usage
To use this you need to setup where is the `command file` for icinga in config like this:

    Henpecked.config do
      cmd_file "/usr/local/icinga/var/rw/icinga.cmd

"
    end

and then just push Alerts like this
    
    Henpecked.push(Henpecked::Alert::AcknowledgeHostProblem.new)

This will add line to icinga named pipe looking like this `[1337262645] ACKNOWLEDGE_HOST_PROBLEM; ;;;;;`


# Commands
Commands layout is based on:
<http://docs.icinga.org/latest/en/extcommands2.html>


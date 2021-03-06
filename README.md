# RedmineAttachByUrl

[![Build Status](https://travis-ci.org/nodecarter/redmine_attach_by_url.png)](https://travis-ci.org/nodecarter/redmine_attach_by_url)
[![Code Climate](https://codeclimate.com/github/nodecarter/redmine_attach_by_url.png)](https://codeclimate.com/github/nodecarter/redmine_attach_by_url)

## Description

Plugin for redmine making it possible to attach file to issue by its url.
Loading file is accomplished by a server, it is more exact by worker of delayed_job.

![Screenshot](https://github.com/nodecarter/redmine_attach_by_url/raw/master/screenshot.png)

## Installation

1. Copy plugin directory into #{RAILS_ROOT}/plugins.
If you are downloading the plugin directly from GitHub,
you can do so by changing into your plugin directory and issuing a command like

        git clone git://github.com/nodecarter/redmine_attach_by_url.git

2. Run the following command to upgrade your database (make a db backup before).

        bundle exec rake redmine:plugins:migrate RAILS_ENV=production

3. Restart Redmine

4. Start delayed_job worker

        bundle exec rake jobs:work RAILS_ENV=production

You should now be able to attach files by url.
Plugin does not require to be configured.

## Compatibility

This version supports only redmine 2.x. See redmine-1.x branch for Redmine 1.x.

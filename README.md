## OpenStack Storage Service (Swift) plugin for Fluent

### Overview

This gem is based on hard work of: `https://github.com/yuuzi41/fluent-plugin-swift`.
It is simplified and refactored version of this gem.


### Usage

Use OpenStack environment variables to configure parameters dynamically:

```
<system>
  @log_level debug
</system>

<source>
  @type forward
  @log_level debug
</source>

<filter app.rails>
  @type parser
  key_name messages
  <parse>
    @type json
  </parse>
</filter>

<match app.rails>
  @type copy
  <store>
    @type swift
    auth_url "#{ENV['OS_AUTH_URL']}"
    auth_user "#{ENV['OS_USERNAME']}"
    auth_api_key "#{ENV['OS_PASSWORD']}"
    auth_tenant "#{ENV['OS_TENANT_NAME']}"
    auth_region "#{ENV['OS_REGION']}"
    ssl_verify false
    swift_container app_rails_logs
    <buffer>
      flush_mode interval
      flush_interval 5m
      flush_thread_count 2
    </buffer>
  </store>
</match>

<match fluent.**>
  @type null
</match>

<match **>
  @type stdout
</match>
```

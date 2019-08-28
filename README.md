## OpenStack Storage Service (Swift) plugin for Fluent

### Overview

This gem is based on hard work of: `https://github.com/yuuzi41/fluent-plugin-swift`.
It is simplified and refactored version of this gem.


### Usage

Use OpenStack environment variables to configure parameters dynamically:

```
<match pattern>
  @type swift

  auth_url "#{ENV['OS_AUTH_URL']}"
  auth_user "#{ENV['OS_USERNAME']}"
  auth_api_key "#{ENV['OS_PASSWORD']}"
  auth_tenant "#{ENV['OS_AUTH_TENANT']}"
  auth_region "#{ENV['OS_REGION']}"
  ssl_verify false

  swift_container bridge_api_logs
  swift_object_key_format %{path}%{time_slice}_%{index}.%{file_extension}

  buffer_path /var/log/fluent/bra_sw
  time_slice_format %Y%m%d-%H
  buffer_type file
  buffer_chunk_limit 1g
  time_slice_wait 10m
  buffer_queue_limit 1024
</match>
```

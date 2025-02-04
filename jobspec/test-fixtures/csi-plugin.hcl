# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

job "binstore-storagelocker" {
  group "binsl" {
    task "binstore" {
      driver = "docker"

      csi_plugin {
        id             = "org.hashicorp.csi"
        type           = "monolith"
        mount_dir      = "/csi/test"
        health_timeout = "1m"
      }
    }
  }
}

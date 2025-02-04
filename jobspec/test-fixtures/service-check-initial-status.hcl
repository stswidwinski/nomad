# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

job "check_initial_status" {
  type = "service"

  group "group" {
    count = 1

    task "task" {
      service {
        tags = ["foo", "bar"]
        port = "http"

        check {
          name           = "check-name"
          type           = "http"
          path           = "/"
          method         = "POST"
          interval       = "10s"
          timeout        = "2s"
          initial_status = "passing"

          header {
            Authorization = ["Basic ZWxhc3RpYzpjaGFuZ2VtZQ=="]
          }
        }
      }
    }
  }
}

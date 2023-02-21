# Flagger

## Overview

Flagger is an open-source tool that provides automated canary release deployments for Kubernetes. It allows you to implement continuous delivery for your applications by automating the process of gradually rolling out new versions of your application and monitoring them for issues.

The way Flagger works is by creating a canary release, which means deploying a new version of your application alongside the existing version, and gradually routing traffic to the new version while monitoring it for errors, crashes, or other issues. If the new version performs well, Flagger will continue to increase the traffic to the new version until it replaces the old version completely. If issues are detected, Flagger will automatically roll back to the previous version to avoid any downtime or other problems.

Flagger supports several metrics for monitoring the canary release, including HTTP requests per second, error rates, and latency. It can also integrate with various monitoring tools and alerting systems to notify you of any issues detected during the canary release deployment.

Flagger is written in Go and can be used with any Kubernetes cluster, including those on public clouds like AWS, GCP, and Azure, or on-premises clusters. It's a powerful tool for automating canary releases and ensuring that your applications are deployed with minimal downtime and maximum reliability.

## Resources

- <https://flagger.app/>
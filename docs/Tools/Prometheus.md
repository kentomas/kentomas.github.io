# Prometheus

## Overview

Prometheus is an open-source monitoring and alerting tool that was originally developed at SoundCloud in 2012. It is now a project of the Cloud Native Computing Foundation (CNCF), a part of the Linux Foundation.

Prometheus is designed to collect metrics from various sources, including applications, services, and infrastructure components. It stores these metrics in a time-series database and provides a powerful query language for analyzing and visualizing the data.

Prometheus also includes a powerful alerting system that can send notifications when certain conditions are met. This makes it a valuable tool for monitoring complex distributed systems.

One of the key features of Prometheus is its ability to be easily integrated with other tools in the cloud-native ecosystem, such as Kubernetes, Grafana, and other monitoring and logging tools. This allows for a seamless and comprehensive monitoring and observability solution for modern, dynamic, and scalable applications and systems.

## Sample

To use Prometheus in a Java application, you can follow these steps:

1. Add Prometheus client libraries to your project: Prometheus provides client libraries in various programming languages, including Java. You can add the `prometheus-client` library to your project by adding the following dependency to your `pom.xml` file if you're using Maven:

    ```xml title="pom.xml"
    <dependency>
        <groupId>io.prometheus</groupId>
        <artifactId>simpleclient</artifactId>
        <version>0.11.0</version>
    </dependency>
    ```

2. Instrument your code with metrics: Once you've added the Prometheus client library to your project, you can start instrumenting your code with metrics. Prometheus provides several types of metrics, including counters, gauges, histograms, and summaries. You can use these metrics to track the performance and behavior of your application. For example, to create a counter metric in your Java code, you can use the following code:

    ```java
    import io.prometheus.client.Counter;
    import io.prometheus.client.exporter.HTTPServer;

    public class MyApplication {

        static final Counter requests = Counter.build()
            .name("requests_total")
            .help("Total number of requests.")
            .register();

        public static void main(String[] args) throws Exception {
            HTTPServer server = new HTTPServer(8080);
            while (true) {
                requests.inc();
                Thread.sleep(1000);
            }
        }
    }
    ```

    This code creates a Counter metric called requests_total and registers it with the Prometheus registry. The main method increments the counter every second.

3. Expose metrics to Prometheus: Once you've instrumented your code with metrics, you need to expose them to Prometheus so that it can scrape them. Prometheus supports several protocols for scraping metrics, including HTTP, HTTPS, and DNS. You can use the `HTTPServer` class from the `simpleclient` library to expose your metrics over HTTP. For example, to expose your metrics on port 8080, you can use the following code:

    ```java
    import io.prometheus.client.exporter.HTTPServer;

    public class MyApplication {

        public static void main(String[] args) throws Exception {
            HTTPServer server = new HTTPServer(8080);
        }
    }
    ```

4. Configure Prometheus to scrape your metrics: Finally, you need to configure Prometheus to scrape your metrics. You can do this by adding a scrape_config block to your Prometheus configuration file, as shown in the following example:

    ```yaml
    scrape_configs:
    - job_name: 'my_application'
        scrape_interval: 5s
        metrics_path: '/metrics'
        static_configs:
        - targets: ['localhost:8080']
    ```

    This configuration tells Prometheus to scrape metrics from `localhost:8080/metrics` every 5 seconds and label them with the job name `my_application`.

That's it! With these steps, you can use Prometheus to monitor and collect metrics from your Java application.

## References

- <https://prometheus.io/>
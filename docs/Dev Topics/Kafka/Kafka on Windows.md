# Kafka on Windows

## Overview

Source: <https://kafka.apache.org/quickstart>

## Step 1. Get Kafka

1. [Download](https://kafka.apache.org/downloads) the latest Kafka release and extract it.
    1. Just download the tar file and extract it using [7-Zip](https://www.7-zip.org/download.html).
2. Extract the contents to the root folder.
    1. Destination: `C:\Kafka\kafka_2.13-3.4.0\`

## Step 2. Start the Kafka Environment

### Kafka with ZooKeeper

1. In the `ZooKeep.properties` file update the log location for ZooKeeper.

    ```yaml
    dataDir=C:/tmp/zookeeper
    ```

2. Run

    ```powershell
    PS C:\Kafka\kafka_2.13-3.4.0\bin\windows> .\zookeeper-server-start.bat ..\..\config\zookeeper.properties
    ```

## Step 3. Create a topic to store events

```powershell

```

## Step 4. Write some events into the topic

## Step 5. Read the events

## Step 6. Import/Export your data as streams of events with Kafka Connect

## Step 7. Process your events with Kafka Streams

## Step 8. Terminate the Kafka Environment

## Files Used

### ZooKeeper Config

```config

```

## Troubleshooting

### Where does Kafka persist its topic data

- `C:\tmp\kafka-logs` as per location definition in `server.properties` file.

Reference: <https://stackoverflow.com/questions/40369238/which-directory-does-apache-kafka-store-the-data-in-broker-nodes>

### How to clear data from a topic

1. Delete folder `C:\tmp\kafka-logs`.

## Resources

- <https://kafka.apache.org/quickstart>
- <https://www.youtube.com/watch?v=BwYFuhVhshI>

# Kafka

## Overview

<https://kafka.apache.org/>

## Serialization and Deserialization (Serdes)

- `A single Kafka topic can only have one Serdes pair for both key and value`.
- `When creating a topic using the Kafka Admin tools, you cannot declare the Serdes for the topic directly`.

Serdes (short for Serializer/Deserializer) are used to serialize and deserialize data being produced and consumed by Kafka topics.

When configuring a Kafka producer or consumer, you can specify a Serdes pair for the key and value of the data being produced or consumed. For example, you might specify a StringSerializer and StringDeserializer for a topic that is expected to contain string data.

Once a Serdes pair has been specified for a topic, it applies to all messages that are produced and consumed from that topic. Kafka does not allow you to use multiple Serdes pairs for the same topic, as it would result in ambiguity and inconsistencies in the way data is serialized and deserialized.

If you have different types of data that need to be produced and consumed by a Kafka topic, you can either use a common data format that can be serialized and deserialized by a single Serdes pair (such as JSON or Avro), or you can use separate Kafka topics for each type of data, each with its own Serdes pair.

The following example is where this is declared.

```java title="PropertiesFactory.java" linenums="1" hl_lines="10-11"
    public static Properties createKafkaProperties()
    {
        // Source of these properties: <https://kafka.apache.org/34/documentation/streams/tutorial>

        Properties props = new Properties();

        props.put(StreamsConfig.APPLICATION_ID_CONFIG, "word-count-app");
        props.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");

        props.put(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        props.put(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());

        return props;
    }
```

```java title="Pipe.java" linenums="1" hl_lines="4 16"
public class Pipe {

    public static void main(String[] args) {
        Properties props = PropertiesFactory.createKafkaProperties();

        // Create stream builder.
        final StreamsBuilder builder = new StreamsBuilder();

        // Declare any messages received on topic "streams-plaintext-input" will be
        // automatically forwarded to topic "streams-pipe-output".
        builder.stream("streams-plaintext-input").to("streams-pipe-output");

        // Build
        final Topology topology = builder.build();

        final KafkaStreams streams = new KafkaStreams(topology, props);
        final CountDownLatch latch = new CountDownLatch(1);

        streams.start();

        ...
    }
}
```

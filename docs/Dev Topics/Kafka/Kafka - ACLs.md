# Kafka - ACLs

## Overview

To enforce permissions on a Kafka cluster, you can use Kafka's Access Control Lists (ACLs) feature. Kafka ACLs allow you to restrict access to specific resources within the Kafka cluster, such as topics, consumer groups, and cluster operations.

Here are the steps to enforce permissions using Kafka ACLs:

1. Enable ACLs in Kafka by setting the `authorizer.class.name` property in the Kafka broker configuration file to `kafka.security.auth.SimpleAclAuthorizer`.

2. Define your access control rules in the Kafka `server.properties` file or a separate `acl.policy` file, using the following format:

    ```xml
    <resource-type> <resource-name> <principal> <operation>
    ```

    - `<resource-type>` is one of cluster, topic, group, or delegation-token.
    - `<resource-name>` is the name of the resource to which the ACL applies.
    - `<principal>` is the user or group to which the ACL applies.
    - `<operation>` is the operation to which the ACL applies, such as read, write, or describe.

    For example, to allow the user alice to read from the topic my-topic, you would add the following line to your acl.policy file:

    ```sh
    topic my-topic alice read
    ```

3. Restart the Kafka broker to apply the new ACLs.

Once the ACLs are in place, Kafka will enforce them whenever a user attempts to access a resource. If a user does not have permission to perform a particular operation, Kafka will return an authorization error. You can also use Kafka command-line tools, such as `kafka-acls.sh`, to manage and view the ACLs in your Kafka cluster.

## Example

Here is an example `acl.policy` file for Kafka ACLs:

```yaml title="acl.policy"
# Allow all operations for the superuser
User:superuser
   # Allow all cluster operations
   Cluster:*
   # Allow all topic operations
   Topic:*
   # Allow all group operations
   Group:*

# Allow read and write operations for the alice user on the my-topic topic
User:alice
   Topic:my-topic
      # Allow read and write operations
      Read,Write

# Deny all operations for the bob user on the confidential-topic topic
User:bob
   Topic:confidential-topic
      # Deny all operations
      Deny

# Allow all operations for the marketing group on the marketing-topic topic
Group:marketing
   Topic:marketing-topic
      # Allow all operations
      Allow
```

In this example, we define four access control rules:

1. The `superuser` is allowed to perform all operations on all resources in the Kafka cluster.
2. The `alice` user is allowed to read and write to the my-topic topic.
3. The `bob` user is denied all operations on the confidential-topic topic.
4. The `marketing` group is allowed to perform all operations on the marketing-topic topic.

Note that the ACLs in this file use a hierarchical format, with each rule consisting of a user or group, a resource, and an operation. The `Allow` and `Deny` keywords are used to specify whether a user or group is allowed or denied access to a resource.

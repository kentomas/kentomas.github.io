# SSL Certificates

## Trust Store vs Key store

In the context of Java and SSL certificates, a trust store and a key store are two separate concepts that serve different purposes:

1. Trust Store:

   - A trust store is a `repository` `of` `trusted` `SSL/TLS certificates` used to `verify` the `identity` of `remote servers` when establishing a secure connection.
   - In other words, a trust store contains a `list of trusted Certificate Authority (CA) certificates`, which are used to validate the identity of SSL/TLS certificates presented by remote servers during SSL/TLS handshaking.
   - When a client connects to a server over SSL/TLS, the server presents its SSL/TLS certificate to the client, which contains information about the server's identity and public key.
   - The client then checks this certificate against its trust store to ensure that it was issued by a trusted CA and has not been revoked.
   - If the certificate passes this validation, the client establishes a secure connection with the server.

2. Key Store:

    - A key store, on the other hand, is a `repository` `of` `private keys` and the `corresponding public certificates`.
    - Private keys are used to decrypt data that was encrypted with the corresponding public key.
    - In the context of SSL/TLS, the key store contains the private key of the server that is used to establish a secure connection with clients.
    - When a server receives a connection request over SSL/TLS, it presents its SSL/TLS certificate, which contains its public key.
    - The client uses this public key to encrypt data sent to the server, which is then decrypted using the server's private key.

In summary, a trust store is used to verify the identity of remote servers, while a key store is used to store the private key of a server and its corresponding public certificate.

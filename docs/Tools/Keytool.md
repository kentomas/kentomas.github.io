# Keytool

## Overview

## Samples

```powershell
if ($null -eq $env:JAVA_HOME) { 
    $env:JAVA_HOME = 'C:\Program Files\java\openjdk-19.0.2' 
}

$keytool = $env:JAVA_HOME + "\bin\keytool.exe"
```

### Generate Keystore

```powershell
& "$keytool" -genkeypair `
    -alias zookeeper `
    -keyalg RSA `
    -keysize 2048 `
    -validity 365 `
    -keystore zookeeper.keystore.jks `
    -storepass ****** `
    -keypass ****** `
    -dname "CN=zookeeper.example.com, OU=ZooKeeper, O=Example Company, L=City, ST=State, C=US"
```

### Generate a certificate signing request (CSR) for the ZooKeeper key:

```powershell
& "$keytool" -certreq -alias zookeeper -keystore zookeeper.keystore.jks -file zookeeper.csr
```

### Generate Self-Signed Certificate

#### PKS12

```powershells
& "$keytool" -genkey `
    -alias myproducerapp `
    -storetype PKCS12 `
    -keyalg RSA `
    -keysize 2048 `
    -keystore keystore.p12 `
    -validity 3650 `
    -storepass ***** `
    -keypass **** `
    -dname "CN=myproducerapp.example.com, OU=Example, O=Example Company, L=City, ST=State, C=US"
```

#### JKS

```powershells
& "$keytool" -genkey `
    -alias myproducerapp `
    -keyalg RSA `
    -keysize 2048 `
    -keystore keystore.jks `
    -validity 3650 `
    -storepass ***** `
    -keypass **** `
    -dname "CN=myproducerapp.example.com, OU=Example, O=Example Company, L=City, ST=State, C=US"
```

```powershell
# Use existing keystore.
& "$keytool" -gencert -alias zookeeper -keystore zookeeper.keystore.jks -infile zookeeper.csr -outfile zookeeper.crt
```

### Import Certificate into Keystore

```powershell
keytool -import -alias mycert -file mycert.crt -keystore mykeystore.jks
```

- This command will prompt you for the keystore password and the key password, and then add the certificate to the keystore under the alias `mycert`.

Note that if the certificate is self-signed (i.e., not issued by a trusted CA), you will also need to import it into the trust store to avoid SSL/TLS connection errors. You can do this using the same keytool command, but with the -trustcacerts option:

```powershell
keytool -import -alias mycert -file mycert.crt -keystore cacerts.jks -trustcacerts
```

This command will add the certificate to the cacerts trust store (which is the default trust store for the JVM), and will prompt you for the trust store password. Once the certificate is added to the trust store, it will be trusted for SSL/TLS connections.

### List Certificates in Keystore

```powershell
keytool -list -v -keystore mykeystore.jks
```

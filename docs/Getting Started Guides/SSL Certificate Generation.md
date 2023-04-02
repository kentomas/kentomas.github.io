# SSL Certificate generation

```powershell
if ($null -eq $env:JAVA_HOME) { 
    $env:JAVA_HOME = 'C:\Program Files\java\openjdk-19.0.2' 
}

$keytool = $env:JAVA_HOME + "\bin\keytool.exe"

# 1. Generate a keystore for ZooKeeper:
#& "$keytool" -genkeypair -alias zookeeper -keyalg RSA -keysize 2048 -validity 365 -keystore zookeeper.keystore.jks
& "$keytool" -genkeypair -alias zookeeper -keyalg RSA -keysize 2048 -validity 365 -keystore zookeeper.keystore.jks -storepass ****** -keypass ****** `
    -dname "CN=zookeeper.example.com, OU=ZooKeeper, O=Example Company, L=City, ST=State, C=US"

# 2. Generate a certificate signing request (CSR) for the ZooKeeper key:
& "$keytool" -certreq -alias zookeeper -keystore zookeeper.keystore.jks -file zookeeper.csr

# 3. Generate a self-signed certificate for the ZooKeeper key:
& "$keytool" -gencert -alias zookeeper -keystore zookeeper.keystore.jks -infile zookeeper.csr -outfile zookeeper.crt

# 4. Import the certificate into the ZooKeeper keystore:
& "$keytool" -importcert -alias zookeeper -keystore zookeeper.keystore.jks -file zookeeper.crt

```

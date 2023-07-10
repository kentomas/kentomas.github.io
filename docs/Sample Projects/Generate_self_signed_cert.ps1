# Generate a private key
openssl genrsa -out private.key 2048

# Create a configuration file
@'
[req]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn
req_extensions = req_ext
x509_extensions = v3_ca

[dn]
C = US
ST = State
L = City
O = Organization
OU = Organizational Unit
CN = mycompany.local

[req_ext]
subjectAltName = @alt_names

[v3_ca]
subjectAltName = @alt_names

[alt_names]
DNS.1 = mycompany.local
DNS.2 = www.mycompany.local
'@ | Out-File -Encoding ASCII -FilePath "openssl.cnf"

# Generate the self-signed certificate
openssl req -new -x509 -key private.key -out certificate.crt -days 365 -config openssl.cnf -extensions v3_ca

# Clean up the configuration file
Remove-Item -Path "openssl.cnf"

Write-Host "Self-signed certificate generated successfully!"

# Parse X509 certificates to get the subdomains in it.

When downloading X509 certificates you might want to parse out all the (sub)domains included in the certificate. This small tool allows you to give the path to the `.der` certificate and get the (sub)domains and IP addresses back.

# Usage
```
ruby certs.rb ./spec/samples/alt_names_cert.der 127.0.0.1
```

__Output__
```
127.0.0.1,cs-stage-home02.qwilt.com
127.0.0.1,cs-stage-home02.op.qwilt.com
```

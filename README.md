# Parse X509 certificates to get the subdomains in it.

When downloading X509 certificates you might want to parse out all the (sub)domains included in the certificate. This small tool allows you to give the path to the `.der` certificate and get the (sub)domains back.

# Usage
```
ruby certs.rb ./spec/samples/alt_names_cert.der
```

__Output__
```
cs-stage-home02.qwilt.com
cs-stage-home02.op.qwilt.com
```

# Parse X509 certificates to get the subdomains in it.

When downloading X509 certificates you might want to parse out all the (sub)domains included in the certificate.

How to use:
```
ruby certs.rb ./spec/samples/cert.der
```
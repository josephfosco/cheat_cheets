---
---

**To Change LFO PAssword**

goto <https://passcore.leapfrogonline.com> and fill in the form to change the lfo password

**Update g2b certs**

Aaron Urasky
    hey, all. i pulled in a ticket to update some g2b certs as i'm the contact person to retrieve them, going to be testing on qa shortly. but one set of commands that helped convert the client pfx cert to the pem/key we use, was:

```
openssl pkcs12 -in g2b_qa_pkcs.pfx -nocerts -out g2b_qa.key
openssl pkcs12 -in g2b_qa_pkcs.pfx -clcerts -nokeys -out g2b_qa.pem
openssl rsa -in g2b_qa.key -out g2b_qa.key
```

just if anyone is ever in that situation. see also <https://github.com/iprospect-usa/ansible/pull/645>

stolen from: <https://www.xolphin.com/support/Certificate_conversions/Convert_pfx_file_to_pem_file>

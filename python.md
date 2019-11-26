---
---

**f-strings**

`>>> name = "Eric"`
`>>> age = 74`
`>>> f"Hello, {name}. You are {age}."`
`'Hello, Eric. You are 74.'`

**pyenv installation problems**
If you receive the error
`ERROR: The Python ssl extension was not compiled. Missing the OpenSSL lib?`
try
`$sudo dnf install compat-openssl10-devel --allowerasing`
then install again. If ths works then return to normal with
`sudo dnf install openssl-devel --allowerasing`


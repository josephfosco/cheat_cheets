---
---

**f-strings**

`>>> name = "Eric"`
`>>> age = 74`
`>>> f"Hello, {name}. You are {age}."`
`'Hello, Eric. You are 74.'`

**Mocking a method on an instance of a class**

{% highlight python %}
@patch("objectA")
def test1(self, mobj):
    mock_method = MagicMock()
    mobj.method = mock_method
    
    function_to_test()
    self.assertEqual(mobj().method), 2)
{% endhighlight %}
    
It appears that mobj() indicates ANY instance of the class mobj

**pyenv installation problems**
If you receive the error
`ERROR: The Python ssl extension was not compiled. Missing the OpenSSL lib?`
try
`$sudo dnf install compat-openssl10-devel --allowerasing`
then install again. If ths works then return to normal with
`sudo dnf install openssl-devel --allowerasing`


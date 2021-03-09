---
---

**f-strings**

`>>> name = "Eric"`
`>>> age = 74`
`>>> f"Hello, {name}. You are {age}."`
`'Hello, Eric. You are 74.'`

**To reload a python file in the shell**
```
import importlib
import <module name> #import the module here, so that it can be reloaded.
importlib.reload(<module name>)
from inputs import A # or whatever name you want.
```

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

**Mocking an atttribute of a class (like a method)**

The following code mocks the write method of the BytesIO object to be
a MagicMock. This means when write is called, the mock will be called
instead, and later it is possible to check what write eas called with.

{% highlight python %}

    @mock.patch('mulder.pages.blueprint.BytesIO')
    def test_download_u64encode(self, mbytesio):

                .
                .
                .

        mwrite=MagicMock()
        type(mbytesio.return_value).write = PropertyMock(return_value=mwrite)
        with self.app.test_client() as c:
            rv = c.get('/_download/things.html')
            mwrite.assert_called_once_with('ok'.encode())
{% endhighlight %}

**pyenv installation problems**
If you receive the error
`ERROR: The Python ssl extension was not compiled. Missing the OpenSSL lib?`
try
`$sudo dnf install compat-openssl10-devel --allowerasing`
then install again. If ths works then return to normal with
`sudo dnf install openssl-devel --allowerasing`

**To run the prometheus exporter for a python.django program**
`env/bin/honcho start -e .env,.env_local psh_comcast_prometheus`

This is for psh-comcast<br>
"psh_comcast_prometheus" is an entry in the procfile

**List all versions of python available in pyenv**
`pyenv install -l`

**Update list of python versions available to pyenv**
`pyenv update`

**Python Mocks**

Pycon Mock talk<br>
https://www.youtube.com/watch?v=ww1UsGZV8fQ

**Do not bufer log messages**

Use PYTHONUNBUFFERED=1 as in<br>
`PYTHONUNBUFFERED=1 make start`



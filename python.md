---
---

**split long strings to multiple lines in code**
```
long_string = ("this is a very"
               "long string")
               "on three lines in code")
```               

**To reload a python file in the shell**
```
import importlib
import <module name> #import the module here, so that it can be reloaded.
importlib.reload(<module name>)
from inputs import A # or whatever name you want.
```

**To run tests from one test file**

In  psh-comcast change the test command in Makefile to:   
`$(HONCHO) run -e .env.test $(COVERAGE) run $(COVERAGE_OPTS) -m unittest discover comcast -k <part_of_test_module_name>`
where `<part_of_test_module_name>` is any unique part of the filename of the test module you wish to test  
To test the module test_modular_offers.py you could write  
`-k modular`

**To use a local version of a library**
just put the path to the local library in the requirements file  
like celeryutil here (after the comment):
```
botocore==1.18.18
boto3>=1.15.0,<1.16
# celeryutil==5.2.0
../celeryutil/dist/celeryutil-6.0.0.tar.gz
cffi==1.14.5
charon==4.0.0
click>=7.1.2,<8.0.0
```

**To build a python library**
```
python3 -m pip install --upgrade build
python3 -m build
```

The final library file will be in the '**dist**' directory

**f-strings**
```
>>> name = "Eric"
>>> age = 74
>>> f"Hello, {name}. You are {age}."
'Hello, Eric. You are 74.'
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
instead, and later it is possible to check what write was called with.

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

**Python Mocks**

Pycon Mock talk<br>
https://www.youtube.com/watch?v=ww1UsGZV8fQ

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

**Do not bufer log messages**

Use PYTHONUNBUFFERED=1 as in<br>
`PYTHONUNBUFFERED=1 make start`



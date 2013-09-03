CATool
======
Create and manage an SSL Certificate Authority woth `openssl`

# Install
The included install script will fetch the latest version of `catool` form GitHub
and put it in your `$HOME/bin` folder. You will need to add `$HOME/bin` to your PATH.

```
curl -L https://github.com/jmanero/catool/raw/master/install | bash
```

### Requirements
* **bash 4.x** Note that many versions of OSX shiped with `bash 3.x`. Homebrew will
install `bash 4.x` in `/usr/local/Cellar/bash/4.x.x/bin/bash`, which you can link to
`/bin/bash` (!! At your own risk !!)
* **wget** and **rsync** Used by the install script to fetch the repository and copy scripts into place
* **openssl** To do all of the SSL things...

# Usage
* init <CA Name> - - - - - - - - - - Create a new CA at ./<CA Name>
* request <Common Name>  - - - - - - Create a new private kay and CSR for <Common Name>
* importreq <Path> [<Common Name>] - Import an existing CSR from <Path>; Optionally, store as <Common Name>]
* sign <Common Name> - - - - - - - - Sign an existing CSR for <Common Name>
* deny <Common Name> - - - - - - - - Remove stored CSR and private key for an unsigned request

# License
**The MIT License (MIT)**

Copyright (c) 2013 John Manero, Dynamic Network Services Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

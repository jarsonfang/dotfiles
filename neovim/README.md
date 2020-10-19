## My neovim configuration

### Install neovim

```bash
$ sudo apt install neovim
```

### Configuration

```bash
$ cd
$ git clone https://github.com/jarsonfang/dotfiles.git
$ mkdir -p ~/.config/nvim
$ cd ~/.config/nvim
$ ln -s ~/dotfiles/neovim/init.vim
$ ln -s ~/dotfiles/neovim/coc-settings.json
$ cd
```

### Install `ccls` or `clangd`

```bash
$ sudo apt install ccls
$ sudo apt install clangd
```

### Python provider

#### Install pip

你可以通过以下命令来判断 pip 是否已安装：

```bash
$ pip --version     # Python2.x 版本命令
$ pip3 --version    # Python3.x 版本命令
```

一般情况 pip 对应的是 Python 2.7，pip3 对应的是 Python 3.x。

如果 pip 未安装，则可以使用以下方法来安装：

```bash
$ sudo apt install curl
$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py   # 下载安装脚本
$ sudo python get-pip.py    # 运行安装脚本
```

**注意：**用哪个版本的 Python 运行安装脚本，pip 就被关联到哪个版本，如果是 Python3 则执行以下命令：

```bash
$ sudo python3 get-pip.py    # 运行安装脚本。
```

#### Install pynvim

```bash
$ pip install --user --upgrade pynvim
$ pip3 install --user --upgrade pynvim
```

### Node.js provider

```bash
$ sudo apt install nodejs npm
$ sudo npm install -g cnpm --registry=https://registry.npm.taobao.org
$ sudo cnpm install -g neovim
```

### Install CoC extensions

```
:CocInstall coc-sh
:CocInstall coc-pairs
:CocInstall coc-lists
:CocInstall coc-syntax
:CocInstall coc-snippets
:CocInstall coc-highlight
:CocInstall coc-css
:CocInstall coc-xml
:CocInstall coc-html
:CocInstall coc-yaml
:CocInstall coc-json
:CocInstall coc-toml
:CocInstall coc-cmake
:CocInstall coc-vimlsp
:CocInstall coc-clangd
:CocInstall coc-rust-analyzer
```

### References

[Python pip 安装与使用](https://www.runoob.com/w3cnote/python-pip-install-usage.html)

[npm换源](https://www.jianshu.com/p/0deb70e6f395)

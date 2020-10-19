## docker config

```bash
$ cd
$ git clone https://github.com/jarsonfang/dotfiles.git
$ ln -s ~/dotfiles/docker .docker
$ cd /etc
$ sudo ln -s ~/dotfiles/docker/etc/docker
```

## 解决 docker 系统里面中文显示乱码问题

在 `.bashrc` 文件中添加以下内容

```bash
export LANG=C.UTF-8
```

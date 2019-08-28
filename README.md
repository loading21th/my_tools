# tools

### just some useful config
1. 各工具使用说明请参见具体的配置文件
```
    tmux自行安装 2.9 
    vim 8<支持python2/3>
    gtags安装6.6.2
```
2. bash setup.sh 即可备份源文件，并产生所需配置的软链到此目录下
3. 安装完成后，可直接使用或者PlugClean/PlugInsrall重新安装，使vim-plug插件监管vim插件。

### 需要添加vim插件，请使用如下
1. git submodule add https://git::@github.com/Valloric/MatchTagAlways.git ./_vim/plugged/MatchTagAlupdate
2. 删除操作  
```
    1. rm -rf 子模块目录 删除子模块目录及源码
    2. vi .gitmodules 删除项目目录下.gitmodules文件中子模块相关条目
    3. vi .git/config 删除配置项中子模块相关条目
    4. rm .git/module/* 删除模块下的子模块目录，每个子模块对应一个目录，注意只删除对应的子模块目录即可
    5. rm  --cached 子模块名称
```
3. 在vim中添加新的插件，需在vim中打开 :split $MYVIMRC ,添加对应plug块以及相应设置即可， 之后 
```
    :PlugInsall 安装
    :PlugUpdate 更新
    :PlugClean  清除插件(先在配置文件中删除)
    :PlugUpgrade升级Vim-plug插件
    :PlugStatus 查看状态
```
4. 在各模块中，git remote -v 查看git url ，参考1，2步骤添加入子模块.添加过程中部分submodule出现`untracked content`需进入该模块，`git status`查看未跟踪内容，删除即可。




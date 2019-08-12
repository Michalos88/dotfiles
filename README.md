# Dotfiles

## Setup

clone this repository
```
git clone https://github.com/bsiddiqui/dotfiles.git ~/dotfiles
```
navigate into dotfiles directory
```
cd ~/dotfiles
```
make the devsetup.sh script executable
```
chmod +x devsetup.sh
```
run the script
```
./devsetup.sh
```

## Vim

### Color Schemes

The default color scheme is [Smyck](https://github.com/hukl/Smyck-Color-Scheme/), which looks best with the [corresponding terminal theme](https://github.com/hukl/Smyck-Color-Scheme/) installed as well.

### Font

Using one of the following fonts is recommended: https://github.com/Lokaltog/powerline-fonts. Right now, I use Inconsolata. On iTerm2, you may have to make the size of "Non-ASCII Font" smaller than the size of "Regular Font" in order to ensure everything lines up in your powerline. I typically use 12pt for "Regular" and 10pt for "Non-ASCII".

### VIM Shortcuts

* ; maps to :
* ,a: ack from the current directory
* ,b: browse tags
* ,c: toggle comments
* ,C: toggle block comments
* ,nt: open file in new tab
* ,l: toggle NERDTree
* ,k: syntax-check the current file
* ,o: open file
* ,p: toggle paste mode
* ,t: new tab
* ,s: vertical split window
* ,hs: horizontal split window
* ,w: close tab
* kj: enter normal mode and save
* Ctrl+{h, j, k, l}: move among windows
* Ctrl+z: pause vim and get back to vim

### Git
* gs: git status
* gi [TEMPLATENAME]: creates a gitignore file
* more here [git-omzh](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git)
### OSX Controls
* ofd: Open the current directory in a Finder window
* pfd: Return the path of the frontmost Finder window
* pfs:	Return the current Finder selection
* itunes: Controlling itunes
* tab:	Open the current directory in a new tab
* split_tab:	Split the current terminal tab horizontally
* vsplit_tab:	Split the current terminal tab vertically
* cdf:	cd to the current Finder directory
* pushdf:	pushd to the current Finder directory
* quick-look:	Quick-Look a specified file
* man-preview:	Open a specified man page in Preview app
* showfiles:	Show hidden files

### Python
* p [dirs]: run python
* pyfind: find all .py files
* pyclean [dirs]: Deletes byte-code and cache files from a list of directories or the current one
* pygrep <text>: Looks for text in .py files

## Credits

Inspiration drawn from [@ranman](https://github.com/ranman/), [@tmacwill](https://github.com/tmacwill/), [@MattNguyen](https://github.com/MattNguyen/)

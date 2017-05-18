```
 _          _                _       ~
| |__   ___| |__   __ _  ___| | __   ~
| '_ \ / _ \ '_ \ / _` |/ __| |/ /   ~
| |_) |  __/ |_) | (_| | (__|   <    ~
|_.__/ \___|_.__/ \__,_|\___|_|\_\   ~

```
                                  

## Introduction

The plugin provides shortcuts to insert `TODO: `, `WARN: ` and `NOTE:` on your
text/code.

Once you have some "NOTES: blablabla", a couple of "TODO: uhuhuhu" and a bunch
of "WARN: poooow!", beback.vim will give you quick access to them.


## Setup

Use your favorite plugin manager. With
[Vim-Plug](https://github.com/junegunn/vim-plug):

```
Plug 'lsrdg/beback.vim'
```

All mappings are prefixed with `<localleader>b`. By default, the localleader is
`,` (comma). If you don't like that, just change that to something else:

```
let g:maplocalleader = "<space>"
```
Now the space bar will be the local leader.

## Usage

Just type it in or, if in normal mode, use one of the following maps to get what
you need inserted.

| Mapping           | Inserts               |
|-------------------|-----------------------|
| `<localleader>bt` | `TODO: ` on the text. |
| `<localleader>bw` | `WARN: ` on the text. |
| `<localleader>bn` | `NOTE: ` on the text. |

The following mappings will open the location list in different ways:

| Mapping           | Shows                                                   |
|-------------------|---------------------------------------------------------|
| `<localleader>bz` | All `TODO: ` marks                                      |
| `<localleader>bx` | All `WARN: ` marks                                      |
| `<localleader>bc` | All `NOTE: ` marks                                      |
| `<localleader>bb` | All `TODO:`, `WARN:` and `NOTE:` in order of appearance |

Once you are _in_ the location list, pressing `q` will close its window.


## Possible (future) enhancements

- Insert mode mappings
- let user define the `b` prefix (and not only the localleader)
- add a proper `doc/comeback.txt`
- detect the language and insert the mark as a language's comment (to avoid
  compiling issues)
- allow other markup style 

## Bugs, issues, contributions and a warning

I am not a programmer - at all. There will be bugs and it will be my pleasure to
look after them. Contributions? More than welcome, please. (:

Just open an issue, report a bug or send a pull request. 

## Motivation and credits

beback.vim was inspired by this question: 
[Comments pane for current buffer that you can jump to such as TODO:, WARN:, and
NOTE:?](https://vi.stackexchange.com/questions/12419/comments-pane-for-current-buffer-that-you-can-jump-to-such-as-todo-warn-and).

After reading the question, I realized that that was something I could use.
Thanks for asking @leeand00.

After reading @grochmal 's comment (`:vimgrep TODO: % | cl`), I thought that
that solution seemed very
[familiar...](https://github.com/lsrdg/markdumb.vim/blob/master/ftplugin/markdown/headermenu.vim)

After all, beback.vim is just a really nice excuse to write Vimscript.

## License

DWYWWIBDIY. Seriously. DWYWWIBDIY = Do whatever you want with it but do it
yourself.

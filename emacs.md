---
---

**Commands**

| Command | Description |
|-----------|--------------|
| C-M-\ | infent block to the next tab point |
| C-M-\<n\>-\ | indent block to col \<n\> |
| c-space c-space |  set mark to remember position - no highlighting |
| c-u c-space | move backwards in mark-ring (used to swap point and mark) - no highlighting |
| M-x color-theme-print | get a list of all colors and their assignments |
| Mx list-faces-display | interactive list of all color settings |

**To Kill Rectangle**

kill-rectangle 【Ctrl+x r k】 → Delete selected column of text.

 -- or --
 
 `Put your cursor before rectangle
  Ctrl+Space
  Move cursor to end of rectangle.
  Alt+x kill-rectangle`

**Return to prior buffer layout**

 `C-c <left arrow>`

**Return to prior buffer layout**

 `C-c <left arrow>`

**To write a file with a name similar to another file**

 `C-w <file-name>`
  `M n`
  `Enter`

**To bring emacs to the foreground after putting in the background**

`fg` or `fg %emacs`

**Open a new buffer for a new file**

Do not search for other directories for a file with the name typed

 `C-x C-c C-f>`

**To debug elisp code**

Place (debug) where you would like to begin debugging

Some debugging commands

  - d: Step through
  - c: Continue
  - e: Eval expression
  - q: Top level (debugger code word for “quit”)


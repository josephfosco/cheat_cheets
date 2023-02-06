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

**To Insert Text or Spaces at the Start of a Region**

```
Place cursor at the start of the first line
Ctrl+space
Highlight text through thelast line of the Region
Alt+x string-insert-rectangle
```
**To indent/unindent a block of text**

Use column mode.

Select the lines in column mode, then add four spaces to all of them at once:

    1. Jump to column 1 of the first line you want to indent.
    2. C-<space> to set mark
    3. move the point down to the last lines (stay in column one)
    4. C-x r t to enter column mode (or C-<RET> if you've got CUA mode)
    5. <space><space><space><space><RET>

You can do a similar maneuver to delete four spaces -- just include 4 columns in your marked region (steps 2-3) and hit \<DEL\>


**To unindent**

Rectangle selection is my preferred way of doing this.

Put yourself at the beginning of the first line, C-space, go to the last line,
and the end of the indentation you want to remove and
C-x r k (rectangular kill). That does it.

**To write a file with a name similar to another file**

 `C-w <file-name>`
  `M n`
  `Enter`

**To bring emacs to the foreground after putting in the background**

`fg` or `fg %emacs`

**Open a new buffer for a new file**

Do not search for other directories for a file with the name typed

 `C-x C-c C-f>`

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


const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#04142C", /* black   */
  [1] = "#ff5260", /* red     */
  [2] = "#2d998c", /* green   */
  [3] = "#ebad79", /* yellow  */
  [4] = "#2a6f98", /* blue    */
  [5] = "#c16b86", /* magenta */
  [6] = "#7fd1cd", /* cyan    */
  [7] = "#d7d2ce", /* white   */

  /* 8 bright colors */
  [8]  = "#969390",  /* black   */
  [9]  = "#ff5260",  /* red     */
  [10] = "#2d998c", /* green   */
  [11] = "#ebad79", /* yellow  */
  [12] = "#2a6f98", /* blue    */
  [13] = "#c16b86", /* magenta */
  [14] = "#7fd1cd", /* cyan    */
  [15] = "#d7d2ce", /* white   */

  /* special colors */
  [256] = "#04142C", /* background */
  [257] = "#d7d2ce", /* foreground */
  [258] = "#d7d2ce",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

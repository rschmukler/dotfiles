const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#14162f", /* black   */
  [1] = "#e840af", /* red     */
  [2] = "#5736eb", /* green   */
  [3] = "#d39344", /* yellow  */
  [4] = "#1077e5", /* blue    */
  [5] = "#ae337f", /* magenta */
  [6] = "#04acd3", /* cyan    */
  [7] = "#bddff4", /* white   */

  /* 8 bright colors */
  [8]  = "#232653",  /* black   */
  [9]  = "#f372c7",  /* red     */
  [10] = "#836af4", /* green   */
  [11] = "#e2b073", /* yellow  */
  [12] = "#3f96f4", /* blue    */
  [13] = "#cd509e", /* magenta */
  [14] = "#19d1fc", /* cyan    */
  [15] = "#f2f9fd", /* white   */

  /* special colors */
  [256] = "#14162f", /* background */
  [257] = "#f2f9fd", /* foreground */
  [258] = "#f2f9fd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

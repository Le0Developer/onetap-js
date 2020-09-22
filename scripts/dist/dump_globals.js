/*
Github: https://github.com/le0developer/onetap-js/blob/master/scripts/dump_globals.coffee
Automatically generated and compiled on Tue Sep 22 2020 19:09:25 GMT+0200 (Central European Summer Time)

MIT License

Copyright (c) 2020 LeoDeveloper

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
// Generated by CoffeeScript 2.5.1
// Dump all Javascript globals
var dump;

dump = function(object, dept) {
  var key, results, type, value;
  results = [];
  for (key in object) {
    value = object[key];
    type = typeof value;
    Cheat.Print("  ".repeat(dept) + "- " + key + " (" + type + ")");
    if (type === "object") {
      Cheat.Print(":\n");
      results.push(dump(value, dept + 1));
    } else {
      results.push(Cheat.Print("\n"));
    }
  }
  return results;
};

dump(this, 0);

# dbasic

Modern implementation of the original Dartmouth BASIC compilers from the 1960s in the D programming language.

This software is currently under a state of rapid development and should therefore be considered alpha quality.

## Prerequisites

* Recent D compiler, only tested with `gdc` from gcc-trunk under Linux (v8.3.0 does NOT work) and DMD (v2.098.1) under Windows

* Recent (ideally trunk) `bison`, see https://github.com/akimd/bison or https://github.com/lexxmark/winflexbison and reqired patch below

* Toolchain for ARM (32-bit) hard-float (hf), tested with `arm-linux-gnueabihf-gcc` under Debian

* ARM emulator `qemu-arm` (tested with v3.1.0 under Debian), or possibly (untested) hardware running a hard-float (hf) build such as Raspbian

* (Untested) Instead of the last two steps, it may be possible to use `qemu-system-arm` running a hard-float ARM OS.

## Setting up

* Build `bison` (at least v3.8.x) and patch the D skeleton file:

```
--- /home[...]/bison/data/skeletons/d.m4
+++ /usr/share/bison/skeletons/d.m4     2022-01-23 15:29:07.549000000 +0000
@@ -284,8 +284,7 @@
      that double-quoting is unnecessary unless the string contains an
      apostrophe, a comma, or backslash (other than backslash-backslash).
      YYSTR is taken from yytname.  */
-    final void toString(W)(W sink) const
-    if (isOutputRange!(W, char))
+    final void toString(void delegate(const(char)[]) sink) const
     {
       immutable string[] yy_sname = @{
   ]b4_symbol_names[
@@ -296,7 +295,7 @@
   ]b4_translatable[
       @};]])[

-      put(sink, yy_sname[yycode_]);
+      sink.formattedWrite!"%s"(yy_sname[yycode_]);
     }
   }
 ]])
```

* (Optional) Run `bison grammar.y` and compare the generated `Parser.d` with the file in `autogen`

* Generate a native executable `dbasic` by running the GNU Makefile (or NMAKE Makefile under Windows) as `make`, altering it to reference `bison`/`win_bison.exe` and `gdc`/`dmd.exe` as necessary. (Windows needs a Visual Studio command prompt with `dmd2vars32.bat` executed in it, with the command `nmake /f Makefile.nmake`).

* (Optional) Run a command such as that below to test the ARM cross-build and compare generated `basic_lib.s` with the file in `autogen`:

```
$ arm-linux-gnueabihf-gcc -mcpu=arm3 -mfpu=vfp -march=armv2 -marm -mfloat-abi=hard -S -O5 runtime/basic_lib.c
```

* Test the compiler:

```
$ ./dbasic < examples/example-p12.bas > test.s
$ arm-linux-gnueabihf-gcc test.s basic_lib.s -lm
```

* If successful, run with `qemu-arm`:

```
$ QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf qemu-arm ./a.out
```

* (Optional) For automated runs use the supplied shell script:

```
$ ./runtime/run-linux.sh examples/ftball.txt
```

## Resources

Manual for the original Dartmouth BASIC: https://cs.bris.ac.uk/~dave/basic.pdf

See the `examples` directory for all of the BASIC programs in the above document.

Wikipedia: https://en.wikipedia.org/wiki/Dartmouth_BASIC

## Motivation and Roadmap

The intention is to recreate the original programming enviroment that existed in the late 1960s at Dartmouth College running on a GE-225 mainframe and accessed by teletype terminals, having been inspired by the book "Endless Loop" by Mark Jones Lorenzo. The compiler is the major part of this project.

Ultimately I'd like to support all of the Dartmouth BASICs (First thru Sixth); there is a runtime switch to turn functionality on and off (`./dbasic 1` enables only First Edition keywords, for example). The complete set of keywords up to Basic The Second (1964) are available, and also with `INPUT` from Basic The Third (to enable the Football Championship program `ftball.txt` to run).

* 2022/03/03: Tag 0.10.1 (hopefully complete) implementation of Basic The First (May 1964).

* 2022/05/02: Tag 0.20.1 (hopefully complete) implementation of Basic The Second (October 1964, originally known as CARDBASIC).

## Bugs

Please do report bugs, together with correct or incorrect BASIC input files.

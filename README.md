# dbasic
Modern implementation of the original Dartmouth BASIC compilers in the D programming language

This software is currently under a state of rapid development and should therefore be considered alpha quality.

## Prerequisites

* Recent D compiler, only tested with `gdc` from gcc-trunk (v8.3.0 does NOT work)

* Recent (probably trunk) `bison`, see https://github.com/akimd/bison and reqired patch below

* Toolchain for ARM (32-bit) hard float (hf), tested with `arm-linux-gnueabihf-gcc` under Debian

* ARM emulator `qemu-arm` (tested with v3.1.0 under Debian), or possibly (untested) hardware running a hard-float (hf) build such as Raspbian

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

* Generate a native executable `dbasic` by running the Makefile, altering it to reference `bison` and `gdc` as necessary

* (Optional) Run a command such as that below to test the ARM cross-build and compare generated `basic_lib.s` with the file in `autogen`:

```
$ arm-linux-gnueabihf-gcc -mcpu=arm3 -mfpu=vfp -march=armv2 -marm-mfloat-abi=hard -S -O5 runtime/basic_lib.c
```

* Test the compiler:

```
$ ./dbasic < examples/example1.bas > test.s
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
Wikipedia: https://en.wikipedia.org/wiki/Dartmouth_BASIC

## Motivation and Roadmap

The intention is to recreate the original programming enviroment that existed in the late 1960s at Dartmouth College for their GE-225 mainframe, having been inspired by the book "Endless Loop" by Mark Jones Lorenzo. The compiler is the major part of this.

Ultimately I'd like to support all of the Dartmouth BASIC's (First thru Sixth) with a runtime switch to turn functionality on and off. The complete set of keywords from Basic The First (1964) is available apart from `DEF` and `FN`, and also with `INPUT` from Basic The Third to enable the Football Championship program `ftball.txt` to run.

## Bugs

Please do report bugs, together with working or non-working BASIC code.

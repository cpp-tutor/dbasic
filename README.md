# dbasic

Modern implementation of the original Dartmouth BASIC compilers from the 1960s in the D programming language.

This software is currently under a state of rapid development and should therefore be considered alpha quality.

## Building

### Windows

**Prerequisites:**

* Bison parser generator `win_bison.exe` from https://github.com/lexxmark/winflexbison (to compile `grammar.y`). Note that a patch to the D skeleton file `d.m4` is currently required (see below); if running or patching WinFlexBison is not possible simply copy `Parser.d` out of the `autogen` directory.

* Recent D compiler `dmd.exe`, tested with Digital Mars D (DMD) v2.098.1 from https://dlang.org/download.html#dmd

* Windows Make Utility `nmake.exe` (part of Visual Studio) from https://visualstudio.microsoft.com/download

**To build:**

* Unpack the contents of source archive to a new directory

* Open a Command Window and navigate to this directory at the prompt

* To put `nmake.exe` on %PATH%, run `vcvars32.bat` or `vcvars64.bat` at this prompt (located within your Visual Studio installation, eg. `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build`)

* Run `dmd2vars32.bat` or `dmd2vars64.bat` at this prompt (located wherever you installed DMD)

* Run `nmake /f Makefile.nmake` to build `dbasic.exe`

*(Alternatively download a release version from https://github.com/cpp-tutor/dbasic/releases)*

* Test by issuing `dbasic [1-6]` at the same prompt (will read program from terminal input, Ctrl-Z, Enter to end input)

### Linux

**Prerequisites:**

* Recent `bison` (ideally trunk from https://github.com/akimd/bison), versions available with a "testing" or rolling release distro above 3.8 may work. Note that a patch to the D skeleton file `/usr/share/bison/skeletons/d.m4` is currently required (see below); if running or patching `bison` is not possible simply copy `Parser.d` out of the `autogen` directory.

* Recent D compiler, tested with both GNU `gdc` and LLVM `ldc`

* GNU `make` (and optionally `git`)

**To build:**

* Unpack the contents of source archive to an empty directory, *or*

* Clone the repository in a terminal, creating a new sub-directory `dbasic` with `git clone https://github.com/cpp-tutor/dbasic.git dbasic`

* Navigate to this directory in the terminal

* Run `make` to build `dbasic` with `gdc`, *or*

* Run `make -f Makefile.llvm` to build `dbasic` with `ldc`

* Test with `./dbasic [1-6]` (will read program from terminal input, Ctrl-D to end input)

## Patch for bison

The file `data\skeletons\d.m4` (WinFlexBison) or `/usr/share/bison/skeletons/d.m4` (Linux) needs to be patched so that the generated source file `Parser.d` can be compiled. The patch only needs to be applied once, and this can be achived manually if required by deleting lines which begin with a `-` and replacing them with those which begin with a `+`

```
--- d.m4
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

## Usage

### Windows

The executable `dbasic.exe` reads from standard input and writes to standard output, optionally with the required numerical Language Edition (only 1-3 currently supported).

The following command will compile the first example program `example-p12.bas` from the `examples` directory with First Edition compatibility, outputting the result to `test.s`:

```
dbasic 1 < examples\example-p12.bas > test.s
```

The output is GNU 32-bit ARM assembly language which can be compiled using `gcc`, either on a native hard-float ARM distro such as Raspbian (32-bit), or under a hard-float emulated enviroment using `qemu-system-arm.exe` see https://dominoc925.blogspot.om/2019/09/how-to-emulate-raspbian-os-in-qemu-on.html

To get the assembly language output *to* the native/virtual ARM machine a suitable Samba mount could be set up.

To compile the support library `basic_lib.s` (this only needs to be performed once) use:

```
gcc -mcpu=arm710t -mfpu=vfp -marm -mfloat-abi=hard -S -O3 runtime/basic_lib.c
```

To build and run `test` from `test.s` use:

```
gcc -o test test.s basic_lib.s -lm
./test
```

### Linux (Debian/Ubuntu)

To compile the assembly language output and support library, the ARM cross-compiler toolchain is required, including `arm-linux-gnueabihf-gcc`, from issuing `apt install gcc-arm-linux-gnueabihf libc-dev-armhf-cross`

To perform userspace emulation of an ARM processor, the executable `qemu-arm` is required, from issuing `apt install qemu-user`

The following command will compile the first example program `example-p12.bas` from the `examples` directory with First Edition compatibility, outputting the result to `test.s`:

```
./dbasic 1 < examples/example-p12.bas > test.s
```

To compile the support library `basic_lib.s` (this only needs to be performed once) use:

```
arm-linux-gnueabihf-gcc -mcpu=arm710t -mfpu=vfp -marm -mfloat-abi=hard -O3 -S runtime/basic_lib.c
```

To build and run `test` from `test.s` use:

```
arm-linux-gnueabihf-gcc -o test test.s basic_lib.s -lm
QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf qemu-arm ./test
```

### Linux (Arch-based)

To compile the assembly language output and support library, the ARM cross-compiler toolchain is required, including `arm-none-linux-gnueabihf-gcc`, from AUR package `arm-none-linux-gnueabihf-toolchain-bin`

To perform userspace emulation of an ARM processor, the executable `qemu-arm` is required, from Extra package `qemu-user`

The following command will compile the first example program `example-p12.bas` from the `examples` directory with First Edition compatibility, outputting the result to `test.s`:

```
./dbasic 1 < examples/example-p12.bas > test.s
```

To compile the support library `basic_lib.s` (this only needs to be performed once) use:

```
arm-none-linux-gnueabihf-gcc -mcpu=arm710t -mfpu=vfp -marm -mfloat-abi=hard -O3 -S runtime/basic_lib.c
```

To build and run `test` from `test.s` use:

```
arm-none-linux-gnueabihf-gcc -o test test.s basic_lib.s -lm
QEMU_LD_PREFIX=/usr/arm-none-linux-gnueabihf/libc qemu-arm ./test
```

## Resources

Manual for the original 1964 Dartmouth BASIC: https://cs.bris.ac.uk/~dave/basic.pdf

Manual for BASIC The Fourth, 1968: https://bitsavers.org/pdf/dartmouth/BASIC_4th_Edition_Jan68.pdf

See the `examples` directory for BASIC programs from the above documents, by page number.

Wikipedia: https://en.wikipedia.org/wiki/Dartmouth_BASIC

## Motivation and Roadmap

The intention is to recreate the original programming enviroment that existed in the mid- to late 1960s at Dartmouth College running on a GE-225 mainframe and accessed by teletype terminals, having been inspired by the book "Endless Loop" by Mark Jones Lorenzo. The compiler is the major part of this project.

Ultimately support for all of the early Dartmouth BASICs (First thru Sixth) is envisaged; there is a compiler switch to turn functionality on and off (`./dbasic 1` enables only First Edition keywords, for example). The complete set of keywords up to Basic The Third (1966, without supplementary additions) are available, which allows the Football Championship program `ftball.txt` to compile.

* 2022/03/03: Tag 0.10.1 (hopefully complete) implementation of Basic The First (May 1964)

* 2022/05/02: Tag 0.20.1 (hopefully complete) implementation of Basic The Second (October 1964, originally known as CARDBASIC).

* 2022/05/15: Tag 0.30.1 (hopefully complete) implementation of Basic The Third (1966)

## Bugs

Please do report bugs, together with correct or incorrect BASIC input files. I would recommend testing against the latest release or master branch, even if an earlier BASIC Edition is being used, as bugs will have been fixed while new features are being added.

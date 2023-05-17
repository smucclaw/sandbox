# Avoiding custom nix sheningans for now

Ignore `flake.nix`.

Instead do the following (it'll probably be easiest to do this in a linux environment):

```
nix shell https://gitlab.haskell.org/ghc/ghc-wasm-meta/-/archive/master/ghc-wasm-meta-master.tar.gz
```



Compile the wasm(s) you want:

```
wasm32-wasi-ghc Plus.hs -o Plus.wasm -no-hs-main -optl-mexec-model=reactor -optl-Wl,--export=hs_init,--export=plus

wasm32-wasi-ghc Hello.hs -o Hello.wasm  -no-hs-main -optl-mexec-model=reactor -optl-Wl,--export=hs_init,--export=getHello,--export=freeStrWithLen,--export=getString,--export=getStringLen
```

and put the wasm binary / binaries in the `dist` folder.


Then 

```
npm run build
```


to build the js scripts, serve the relevant html file, and open it in your browser.


# Resources


https://book.realworldhaskell.org/read/interfacing-with-c-the-ffi.html

https://www.haskell.org/onlinereport/haskell2010/haskellch8.html
https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/ffi.html
https://downloads.haskell.org/ghc/9.0.1/docs/html/users_guide/exts/ffi.html?highlight=capiffi#extension-CApiFFI

https://gitlab.haskell.org/ghc/ghc-wasm-meta
https://github.com/charles37/haskell-wasm-snake/blob/main/src/Main.hs

http://blog.haskell-exists.com/yuras/posts/malloc-free-and-ffi.html



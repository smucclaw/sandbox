/* 
Adapted from 
https://github.com/willmcpherson2/ghc-wasm-experiment/blob/main/www/main.js 
https://github.com/charles37/haskell-wasm-snake/blob/main/www/main.js
https://github.com/fourmolu/fourmolu/blob/d6529770cda5c77fad5b3bc3f0a08f9b2eaedec9/web/worker/index.js

Other resources
https://github.com/hellwolf/haskell-examples/blob/master/2023-02-24-wasm-comm/client.js
https://github.com/tweag/ormolu/tree/master/ormolu-live
*/

import { WASI } from "@bjorn3/browser_wasi_shim"; 
// https://github.com/bjorn3/browser_wasi_shim

const wasmBinaryPath = "hello.wasm";
const divToPrintID = "printHere";

async function initWebAssembly(source) {
    const wasi = new WASI([], ["LC_ALL=en_US.utf-8"], [/* fds */]);
    const wasm = await WebAssembly.instantiateStreaming(source, {
      wasi_snapshot_preview1: wasi.wasiImport,
    });
    wasi.inst = wasm.instance;
    return wasm
  }

async function initHSfromWasm(wasmObj) {
  const hs = wasm.instance.exports;

  /* A WASI reactor module may export an _initialize function (which, in the Haskell WASM case, will just call the ctors). If this
  exists, it must be called exactly once before any other exports are
  called. */
  hs._initialize();
  /* hs_init is a part of GHC's runtime system API. It must be called before
  any other exported Haskell functions are called.
  The parameters are `argc` and `argv` */ 
  hs.hs_init(0, 0);

  return hs;
}

function printToDiv(targetDivID, stringToPrint) {
  const divToPrint = document.getElementById(targetDivID);
  const para = document.createElement("p");

  para.textContent = stringToPrint;

  divToPrint.appendChild(element);
}

async function main() {
    const wasm = await initWebAssembly(fetch(wasmBinaryPath));
    const hs = initHSfromWasm(wasm);

    const resultPtr = hs.getHello(0);

    try {
      const outStrPtr = hs.getString(resultPtr);
      const outStrLen = hs.getStringLen(resultPtr);
      const outputBytes = new Uint8Array(hs.memory.buffer, outStrPtr, outStrLen);
      const outStr = decoder.decode(outputBytes);

      printToDiv(divToPrintID, outStr);

    } finally {
      hs.freeStrWithLen(resultPtr); // TO EDIT
    }





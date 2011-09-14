// Copyright (c) 2011 Raphael Proust
//
// Permission to use, copy, modify, and distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//

//Provides: console_create
function console_create() {
    return 0;
}

//Provides: console_write
function console_write(con, data, off, len) {
    if (typeof data == "object")
      data = data.toString();
    text = data.substring(off, off+len);
    //TODO: find something better to do
    //util.log(text);
    return 0;
}

// Main

//Provides: main_callback
var main_callback = (function () {
    //TODO: find something better to do
    //console.log("WARNING: no callback function registered!");
    return 0;
});

//Provides: caml_block_domain
function caml_block_domain() {
};

//Provides: caml_block_domain_with_timeout
//Requires: main_callback
function caml_block_domain_with_timeout(tm) {
    window.setTimeout(main_callback, tm);
};

//Provides: caml_callback_register
//Requires: main_callback
function caml_callback_register(fn) {
    main_callback = fn;
};

// Missing ocaml functions

//Provides: caml_ml_output_char
function caml_ml_output_char(vchannel, ch) {
    //TODO: find something better to do
    //console.log("caml_ml_output_char is not implemented");
    return 0;
}

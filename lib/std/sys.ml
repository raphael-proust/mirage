open Pervasives
(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the GNU Library General Public License, with    *)
(*  the special exception on linking described in file ../LICENSE.     *)
(*                                                                     *)
(***********************************************************************)

(* $Id: sys.mlp,v 1.2 2007/02/26 14:21:57 xleroy Exp $ *)

(*Dummy part for interface matching*)
let argv = [| |]
let executable_name = ""
external file_exists : string -> bool = "caml_sys_file_exists"
external is_directory : string -> bool = "caml_sys_is_directory"
external remove : string -> unit = "caml_sys_remove"
external rename : string -> string -> unit = "caml_sys_rename"
external getenv : string -> string = "caml_sys_getenv"
external command : string -> int = "caml_sys_system_command"
external time : unit -> float = "caml_sys_time"
external chdir : string -> unit = "caml_sys_chdir"
external getcwd : unit -> string = "caml_sys_getcwd"
external readdir : string -> string array = "caml_sys_read_directory"
let interactive = ref false
type signal_behavior =
    Signal_default
  | Signal_ignore
  | Signal_handle of (int -> unit)
external signal :
  int -> signal_behavior -> signal_behavior = "caml_install_signal_handler"
let set_signal _ _ = ()
let sigabrt = 0 (*can do better?*)
let sigint = 0
let sigalrm = 0
let sigfpe = 0
let sighup = 0
let sigill = 0
let sigkill = 0
let sigpipe = 0
let sigquit = 0
let sigsegv = 0
let sigterm = 0
let sigusr1 = 0
let sigusr2 = 0
let sigchld = 0
let sigcont = 0
let sigstop = 0
let sigtstp = 0
let sigttin = 0
let sigttou = 0
let sigvtalrm = 0
let sigprof = 0
exception Break
let catch_break _ = ()
let ocaml_version = ""


(* System interface *)

external get_config: unit -> string * int = "caml_sys_get_config"
let (os_type, word_size) = get_config()
let max_array_length = (1 lsl (word_size - 10)) - 1;;
let max_string_length = word_size / 8 * max_array_length - 1;;

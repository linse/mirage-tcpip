(*
 * Copyright (c) 2015 Thomas Gazagnaire <thomas@gazagnaire.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

type counter = {
  incrs: int;
  decrs: int;
}

let zero = { incrs = 0; decrs = 0 }
let value c = c.incrs - c.decrs
let incrs c = c.incrs
let decrs c = c.decrs

type t = {
  tcp_flows   : counter;
  tcp_listens : counter;
  tcp_channels: counter;
  tcp_connects: counter;
}


let tcp_flows = ref zero
let tcp_listens = ref zero
let tcp_channels = ref zero
let tcp_connects = ref zero

let incr r = let c = !r in r := { c with incrs = c.incrs + 1 }
let decr r = let c = !r in r := { c with decrs = c.decrs + 1 }

let incr_flow t = incr tcp_flows
let decr_flow t = decr tcp_flows

let incr_listen t = incr tcp_listens
let decr_listen t = decr tcp_listens

let incr_channel t = incr tcp_channels
let decr_channel t = decr tcp_channels

let incr_connect t = incr tcp_connects
let decr_connect t = decr tcp_connects

let create () = {
  tcp_flows    = !tcp_flows;
  tcp_listens  = !tcp_listens;
  tcp_channels = !tcp_channels;
  tcp_connects = !tcp_connects;
}

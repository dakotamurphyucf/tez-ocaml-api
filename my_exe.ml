
open SyncAPIV1.Api_error.Answer
let main () = (
(* SyncAPIV1.Api.get_pukh_from_alias "dakota"
  >>=? fun pkh ->
    SyncAPIV1.Api_error.Answer.return (SyncAPIV1.Api.string_of_pukh pkh)
>>=? fun tag ->
  print_endline tag; *)
SyncAPIV1.Api.get_contract "dakota"
  >>=? fun c->
    print_endline "yoyoy";
  SyncAPIV1.Api.get_balance c
  >>=? fun balance ->
   let b = string_of_float (SyncAPIV1.Api.Tez_t.to_float balance) in  print_endline b;
   SyncAPIV1.Api_error.Answer.return b)
  >>= function | Error e -> SyncAPIV1.Api_error.pp_error Format.std_formatter e; Lwt.return () | Ok s -> print_endline s; Lwt.return ()

let () = Lwt_main.run (main ())
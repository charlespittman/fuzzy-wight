(** Decode a run-length encoded list. (medium)

    Given a run-length code list generated as specified in the previous
    problem, construct its uncompressed version.

    # decode [Many (4,"a"); One "b"; Many (2,"c"); Many (2,"a"); One "d"; Many
      (4,"e")];;
    - : string list =
    ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
*)

(* Since OCaml lists are homogeneous, one needs to define a type to hold both
   single elements and sub-lists. *)
type 'a rle =
  | One of 'a
  | Many of int * 'a
;;

let decode list =
  let rec many acc n x = if n = 0
    then acc
    else many (x :: acc) (n - 1) x
  in
  let rec aux acc = function
    | [] -> acc
    | One x :: t -> aux (x :: acc) t
    | Many (n, x) :: t -> aux (many acc n x) t
  in
  aux [] (List.rev list)
;;

decode [Many (4,"a"); One "b"; Many (2,"c"); Many (2,"a"); One "d"; Many
          (4,"e")];;

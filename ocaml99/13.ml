(** Run-length encoding of a list (direct solution). (medium)

    Implement the so-called run-length encoding data compression method
    directly. I.e. don't explicitly create the sublists containing the
    duplicates, as in problem "Pack consecutive duplicates of list elements
    into sublists", but only count them. As in problem "Modified run-length
    encoding", simplify the result list by replacing the singleton lists (1 X)
    by X.

    # encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
    - : string rle list =
    [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d";
    Many (4, "e")]
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

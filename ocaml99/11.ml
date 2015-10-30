(** Modified run-length encoding. (easy)

    Modify the result of the previous problem in such a way that if an element
    has no duplicates it is simply copied into the result list. Only elements
    with duplicates are transferred as (N E) lists.

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

let encode list =
  let create_tuple cnt elem =
    if cnt = 1
    then One elem
    else Many (cnt, elem)
  in
  let rec aux count acc = function
    | [] -> []
    | [x] -> (create_tuple (count + 1) x) :: acc
    | hd :: (snd :: _ as tl) ->
      if
        hd = snd
      then aux (count + 1) acc tl
      else aux 0 ((create_tuple (count + 1) hd) :: acc) tl
  in
  List.rev (aux 0 [] list)
;;

encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;

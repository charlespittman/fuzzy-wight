(** Run-length encoding of a list. (easy)

    # encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
    - : (int * string) list =
    [(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")]
*)

let encode list =
  let rec aux count acc = function
    | [] -> []
    | [x] -> (count+1, x) :: acc
    | a :: (b :: _ as t) -> if a = b
      then aux (count + 1) acc t
      else aux 0 ((count + 1, a) :: acc) t
  in
List.rev (aux 0 [] list)
;;

encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;

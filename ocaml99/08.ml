(** Eliminate consecutive duplicates of list elements. (medium)

    # compress ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
    - : string list = ["a"; "b"; "c"; "a"; "d"; "e"]
*)

let rec compress = function
  | a :: (b :: _ as t) -> if a = b
    then compress t
    else a :: compress t
  | smaller -> smaller
;;

compress ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;

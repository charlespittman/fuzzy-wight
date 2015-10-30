(** Find the number of elements of a list. (easy)

    OCaml standard library has List.length but we ask that you reimplement
    it. Bonus for a tail recursive solution.

    # length [ "a" ; "b" ; "c"];;
    - : int = 3
    # length [];;
    - : int = 0
*)

let length list =
  let rec aux n = function
    | [] -> n
    | _ :: t -> aux ( n + 1) t
  in aux 0 list
;;

length [ "a" ; "b" ; "c"];;
length [];;

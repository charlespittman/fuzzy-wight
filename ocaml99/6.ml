(** Find out whether a list is a palindrome. (easy)

    HINT: a palindrome is its own reverse.

    # is_palindrome (String.to_list "xamax");;
    - : bool = true
    # is_palindrome (String.to_list "ab");;
    - : bool = false
*)

let is_palindrome list =
  list = List.rev list
;;

rev (String.to_list "abc");;
is_palindrome (String.to_list "xamax");;
is_palindrome (String.to_list "ab");;

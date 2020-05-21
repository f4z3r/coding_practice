let test_ex1_1 () =
  Alcotest.(check bool)
  "'Jakob' has no duplicates" false (Coding_practice.Ch1.Ex1.has_duplicates "Jakob")

let test_ex1_2 () =
  Alcotest.(check bool)
  "'hello' has duplicates" true (Coding_practice.Ch1.Ex1.has_duplicates "hello")

let test_ex1_3 () =
  Alcotest.(check bool)
  "'!!' has duplicates" true (Coding_practice.Ch1.Ex1.has_duplicates "!!")

let test_ex1_4 () =
  Alcotest.(check bool)
  "empty string has no duplicates" false (Coding_practice.Ch1.Ex1.has_duplicates "")


let exercise1 = [
  ("with 'Jakob'", `Quick, test_ex1_1);
  ("with 'hello'", `Quick, test_ex1_2);
  ("with '!!'", `Quick, test_ex1_3);
  ("with empty string", `Quick, test_ex1_4);
]

let () =
  let open Alcotest in
  run "Chatper 1" [
    "Exercise 1", exercise1
  ]

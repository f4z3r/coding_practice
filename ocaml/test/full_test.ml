(* Chapter 1 *)

let test_ch1 () =
  Alcotest.(check int) "answer should be 42" 42 (Coding_practice.Ch1.Ex1.answer)

let () =
 let open Alcotest in
 run "Coding Practice" [
  "chapter 1", [
   test_case "Exercise 1" `Quick test_ch1;
  ];
  ]

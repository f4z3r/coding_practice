module Ex1 = struct

 let has_duplicates str =
   let chars = List.init (String.length str) (String.get str) in
   let rec has_stutter = function
     | [] | [_] -> false
     | a :: b :: _ when a == b -> true
     | _ :: tl -> has_stutter tl
   in
   chars
     |> List.sort Char.compare
     |> has_stutter

end

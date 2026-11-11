open Traverse
let () =
  let module List =
    Primitives.List.Make (Applicative.Option (Applicative.Map)) in
  assert (List.traverse (S O)
    (fun x -> Some (x + 1)) [1; 2; 3] = Some [2; 3; 4])

let () =
  let module List =
    Primitives.List.Make (Applicative.Map) in
  assert (List.traverse (S (S O))
    (fun x y -> x + y) [1; 2; 3] [4; 5; 6]= [5; 7; 9])

let () =
  let module List =
    Primitives.List.Make (Applicative.Option (Applicative.Map)) in
  let flag = ref 0 in
  assert (List.traverse (S O)
    (fun f -> if f () then Some () else None)
      [(fun () -> flag := 1; true);
        (fun () -> false);
        (fun () -> flag := 2; true)] = None);
  assert (!flag = 1)

let () =
  let module Ref = Primitives.Ref.Make (Applicative.Map) in
  assert (!(Ref.traverse (S (S O)) (fun x y -> x + y) (ref 1) (ref 2)) = 3)

let () =
  let module Result =
    Primitives.Result.Make (Applicative.Option (Applicative.Map)) in
  assert (Result.traverse (S O)
    (fun x -> Some (x + 1)) (fun e -> Some (e ^ "!")) (Ok 1) = Some (Ok 2));
  assert (Result.traverse (S O)
    (fun x -> Some (x + 1)) (fun e -> Some (e ^ "!")) (Error "e")
    = Some (Error "e!"));
  assert (Result.traverse_ok (S O) (fun x -> Some (x + 1)) (Ok 1)
    = Some (Ok 2))

def fib(n: []i32) = n[1:2:-1]

--def even(arr: []i32) = map(\x -> if 0 == x % 2 then x else 0) arr
--def main(limit: i32) = reduce (+) 0 (even(fib(limit)))
def main(limit: i32) = iota 10

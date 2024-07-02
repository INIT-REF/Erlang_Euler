def fib(n: i32) = 
    loop arr = [2,1] while arr[0] + arr[1] < n do
        [arr[0] + arr[1]] ++ arr

def even(arr: []i32) = map(\x -> if 0 == x % 2 then x else 0) arr
def main = reduce (+) 0 (even(fib(4000000)))

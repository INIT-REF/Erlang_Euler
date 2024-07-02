def reverse(n: i32) = 
    let (_, rev) = loop (n, r) = (n, 0) while n > 0 do
        (n / 10, r * 10 + n % 10)
    in rev

def isPalindrome(n: i32) = if n == reverse(n) then n else 0

def max(a: i32)(b: i32) = if a > b then a else b

def products(A: []i32) = flatten(map(\a -> map(\b -> (a * b)) A) A)

def main = reduce (max) 0 (map(\x -> isPalindrome(x)) (products(100...999)))

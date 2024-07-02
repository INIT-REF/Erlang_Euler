def mult3or5(n: i32) = if 0 == n % 3 * n % 5 then n else 0
def main(limit: i32) = reduce (+) 0 (map(\x -> mult3or5(x)) (1...limit))

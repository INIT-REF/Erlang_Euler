def mult3or5(n: i32) = if 0 == n % 3 * n % 5 then n else 0
def main = reduce (+) 0 (map(\x -> mult3or5(x)) (0...999))


-- An alternative solution by building the multiples directly:

--def sum(arr: []i32) = reduce (+) 0 arr
--def main = sum(0..3...999) + sum(0..5...999) - sum(0..15...999) 

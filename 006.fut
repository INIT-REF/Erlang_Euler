def square(n: i32) = n * n
def sum(arr: []i32) = reduce (+) 0 arr
def main = square(sum(1...100)) - sum(map(\x -> x * x) (1...100))

--Alternative solution by using a tuple in a loop:

-- def tupsol = 
--     loop (a, b) = (0i32, 0i32) for i in (1...100) do
--         (a + i, b + i * i)

-- def main = tupsol.0 * tupsol.0 - tupsol.1

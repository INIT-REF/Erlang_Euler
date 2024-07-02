def square(n: i32) = n * n
def sum(arr: []i32) = reduce (+) 0 arr
def main = square(sum(1...100)) - sum(map(\x -> x * x) (1...100))

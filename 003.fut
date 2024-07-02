def pf(n: i64) = 
    let (_, lpf) = loop (n, d) = (n, 3) while n > 1 do
        if n % d == 0 then (n / d, d) else (n, d + 2)
    in lpf

def main = pf(600851475143)

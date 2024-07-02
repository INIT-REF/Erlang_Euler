def primes(limit: i64) =
    let (p, _) = loop (s, d) = ((replicate limit 1i32), 2i64) while d * d <= limit do
                    if s[d] == 1 then
                        let s = loop s for m in ((d * d)..(d + d * d)..<limit) do
                            let s[m] = 0i32 in s
                            in (s, d + 1)
                    else (s, d + 1)
    in p

def find10001st (p: []i32) = 
    let (_, res, _) = loop (p, i, c) = (p, 3i32, 1i32) while c < 10001 do
                        (p, i + 2, c + p[i])
    in res - 2

def main = find10001st(primes(115000))

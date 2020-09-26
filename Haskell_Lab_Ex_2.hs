
{- Easy functions -}
cube::Int->Int
cube x = x^3

double::Int->Int
double x = 2*x

{- Recursive Functions -}
modulus::Int->Int->Int
modulus x m = if(m > 0) 
            then (if (x >= 0 && x < m) 
                    then x 
                    else modulus(x- m) m ) 
            else 0


factorial::Int->Int
factorial x = if(x==0) 
            then 1 
            else x * factorial (x-1)


summation::Int->Int
summation n = if(n <= 1)
            then n
            else n + summation(n-1)

{- Higher order functions -}
compose :: (Int->Int)->(Int->Int)->(Int->Int)
compose x m = (\y -> x(m y))

subtractMaker :: Int -> (Int -> Int)
subtractMaker x = (\y -> y - x)

applyNTimes :: (Int-> Int) -> Int -> Int ->Int
applyNTimes f n x = if (n > 0)
                then f (applyNTimes (f) (n-1) (x))
                else x


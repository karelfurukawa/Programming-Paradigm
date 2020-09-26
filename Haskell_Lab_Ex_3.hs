my_map :: (a -> b) -> [a] -> [b]
my_map p l = 
  if length l == 0 then []
  else [p (head l)] ++ my_map p(tail l)


my_filter :: (a -> Bool) -> [a] -> [a]
my_filter p l = 
    if length l == 0 then []
    else (if p (head l) then [head l] else []) ++ my_filter p(tail l)


my_foldr :: (a -> a -> a) -> a-> [a] ->a
my_foldr f u l = 
  if length l > 0 
    then f (head l) (my_foldr f (u) (tail l) )
    else u
  

my_foldl :: (a -> a -> a) ->a ->[a] ->a
my_foldl f u l = 
    if length l > 0  
      then my_foldl f (f (u) (head l)) (tail l)
      else u


my_zip :: (a -> b -> c) -> [a] -> [b] -> [c]
my_zip f l m =
  if length l == 0 || length m == 0 then []
  else [f (head l) (head m)] ++  my_zip f (tail l) (tail m)


{-Sum of the Squares-}
sumOfSquares :: [Int] -> Int
sumOfSquares l =  my_foldl (\x y -> x + y) (0) (my_map (\x -> x ^ 2) (l)) 


{- List of Names -}
concatenate :: [Char] -> [Char]
concatenate x =  [head (x)] ++ "."

concatenate1 :: [Char] -> [Char] -> [Char]
concatenate1 x y = x ++ " " ++ y

wholeName :: [[Char]] -> [[Char]] -> [[Char]] -> [[Char]]
wholeName f m l = my_filter (\x -> length x `mod` 2 == 0) (my_zip (concatenate1) (my_zip (concatenate1) (f) (my_map (concatenate) (m))) (l))
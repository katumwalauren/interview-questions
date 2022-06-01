packages.dhall
@@ -99,7 +99,7 @@ in  upstream
-------------------------------
-}
let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.14.7-20220303/packages.dhall
        sha256:d7cbc15ea16768e4a4f99baa58a54559dd2648c6c1362de2469d9e41c23b28c3
      https://github.com/purescript/package-sets/releases/download/psc-0.15.2-20220531/packages.dhall
        sha256:278d3608439187e51136251ebf12fabda62d41ceb4bec9769312a08b56f853e3

in  upstream
  2  
spago.dhall
@@ -15,8 +15,6 @@ to generate this file without the comments in this block.
  [ "arrays"
  , "console"
  , "effect"
  , "foldable-traversable"
  , "math"
  , "maybe"
  , "numbers"
  , "prelude"
  228  
src/Exercise.purs
@@ -14,8 +14,8 @@ module Exercise

import Data.Array
import Data.Maybe
import Data.Number
import Data.Ord
import Math
import Prelude
import Prelude

@@ -26,19 +26,19 @@ import Prim.Boolean (False)

type Country =
 { president :: String
 , city :: String 
 , population :: Int 
 , city :: String
 , population :: Int
 }

uganda :: Country
uganda = 
uganda =
 { president : "Museveni"
 , city : "kampala"
 , population : 30
 }

kenya :: Country 
kenya = 
kenya :: Country
kenya =
 { president :"uhuru"
 , city : "Nirobi"
 , population : 90
@@ -47,18 +47,18 @@ kenya =

type Person =
 { firstName :: String
 , lastName :: String 
 , lastName :: String
 , age :: Int
 }

thatPerson :: Person
thatPerson = 
thatPerson =
 { firstName : "Katumwa"
 , lastName : "Lauren" 
 , lastName : "Lauren"
 , age : 19
 }

girlChild :: Person 
girlChild :: Person
girlChild =
 { firstName : "Nalubega"
 , lastName : "Cultus"
@@ -76,7 +76,7 @@ fullName :: Person -> String
fullName person = person.firstName <> person.lastName

--set age
setAge :: Int -> Person -> Person 
setAge :: Int -> Person -> Person
setAge newAge person = person { age = newAge }

--get all fullName
@@ -92,80 +92,80 @@ getFullName array = map fullName array
--getAverage person = sum findAge person

--findAge :: String -> Boolean
--findAge  
--findAge

-- sort persons by age and return youngest person
--sortby
--head
youngestPerson :: Array Person -> Maybe Person
youngestPerson persons = head (sortPersonsByAge persons) 
youngestPerson persons = head (sortPersonsByAge persons)

sortPersonsByAge :: Array Person -> Array Person 
sortPersonsByAge :: Array Person -> Array Person
sortPersonsByAge persons' = sortBy comparePersonsByAge persons'

comparePersonsByAge :: Person -> Person -> Ordering 
comparePersonsByAge :: Person -> Person -> Ordering
comparePersonsByAge person1 person2 = compare person1.age person2.age

--wen age is alredy got or sorted
sortPersonsByAge' :: Array Person -> Array Int 
sortPersonsByAge' :: Array Person -> Array Int
sortPersonsByAge' persons = sortAge (map getAge persons)

getAge :: Person -> Int 
getAge person = person.age  

sortAge :: Array Int -> Array Int 
getAge :: Person -> Int
getAge person = person.age

sortAge :: Array Int -> Array Int
sortAge ages  = sortBy compareLength ages

compareLength :: Int -> Int -> Ordering 
compareLength x y = compare x y 
compareLength :: Int -> Int -> Ordering
compareLength x y = compare x y

--use addable
class Addable a where 
  addable :: a -> a -> a 
class Addable a where
  addable :: a -> a -> a

instance Addable Int where 
  addable x y = x + y 
instance Addable Int where
  addable x y = x + y

-- implement type class instance for Number type 
class Addable' a where 
  addable' :: a -> a -> a 
-- implement type class instance for Number type
class Addable' a where
  addable' :: a -> a -> a

instance Addable' Number where
  addable' c d = c + d

--use show 
class Show' a where 
  show' :: a -> String 
--use show
class Show' a where
  show' :: a -> String

instance Show' String where 
  show' x = x 
instance Show' String where
  show' x = x

-- implement Show' instance for Int 
-- implement Show' instance for Int

instance Show' Int where 
instance Show' Int where
  show' c = show c

  --use joinable
class Joinable a where 
  join :: a -> a -> a 
class Joinable a where
  join :: a -> a -> a

-- implement Joinable instance for string
class Joinable' a where
  join' :: a -> a -> a

-- implement Joinable instance for string 
class Joinable' a where 
  join' :: a -> a -> a 
instance Joinable' String where
  join' add word = add <> word

instance Joinable' String where   
  join' add word = add <> word 


-- write a function that sorts persons by the length of their firstName
-- such that you return the person with the shortest firsName
shortestNameOfPerson :: Array Person -> Maybe Person
shortestNameOfPerson persons = head (sortPersonsByShortestName persons) 
shortestNameOfPerson persons = head (sortPersonsByShortestName persons)

sortPersonsByShortestName :: Array Person -> Array Person 
sortPersonsByShortestName :: Array Person -> Array Person
sortPersonsByShortestName persons'' = sortBy comparePersonsByShortestName persons''

comparePersonsByShortestName :: Person -> Person -> Ordering 
comparePersonsByShortestName :: Person -> Person -> Ordering
comparePersonsByShortestName personA personB = compare personA.firstName personB.firstName


@@ -174,143 +174,143 @@ data Maybe' a = Nothing' | Just' a
data Animal = Mammal | Reptile | Bird | Domestic | Wild


data Result a = Success a | Failure String 
data Result a = Success a | Failure String

isItReptile :: Animal -> Boolean
isItReptile animal = case animal of 
  Mammal -> false 
  Reptile -> true 
  Bird -> false 
isItReptile animal = case animal of
  Mammal -> false
  Reptile -> true
  Bird -> false
  Wild -> false
  Domestic -> false

-- isReptile animal 
-- isReptile animal

animal :: Animal 
animal = Mammal 
animal :: Animal
animal = Mammal

bird :: Animal 
bird = Bird 
bird :: Animal
bird = Bird

--- using case statements write a show instance for Animals 
--- using case statements write a show instance for Animals

class IsWild where 
class IsWild where
  isWild :: Animal -> Boolean

instance Show Animal where 
  show animal = case animal of 
instance Show Animal where
  show animal = case animal of
    Reptile -> "reptile"
    Wild -> "wild"
    Domestic -> "domestic"
    Mammal -> "mammal"
    Bird -> "bird"

  --isBird animal
reptile :: Animal 
reptile :: Animal
reptile = Reptile

domestic :: Animal
domestic = Domestic


data Orderable' = EQ | LT | GT 
data Orderable' = EQ | LT | GT

class Ord' a where 
class Ord' a where
  compare' :: a -> a -> Orderable'

instance Ord' Int where 
   compare' x y 
      | x > y     = GT 
      | x < y     = LT 
      | otherwise = EQ 
instance Ord' Int where
   compare' x y
      | x > y     = GT
      | x < y     = LT
      | otherwise = EQ

instance Ord' Animal where 
  compare' x y = case [x, y] of 
    [Wild, Domestic] -> GT 
    [Mammal, Wild]   -> LT 
instance Ord' Animal where
  compare' x y = case [x, y] of
    [Wild, Domestic] -> GT
    [Mammal, Wild]   -> LT
    _otherwise        -> EQ

-- Ord instance for String 
instance Ord' String where 
   compare' x y 
     | String.length x > String.length y = GT 
-- Ord instance for String
instance Ord' String where
   compare' x y
     | String.length x > String.length y = GT
     | String.length x < String.length y = LT
     | otherwise                         = EQ

class Eq' a where 
  eq' :: a -> a -> Boolean 
class Eq' a where
  eq' :: a -> a -> Boolean

instance Eq' Int where 
  eq' x y 
    | x == y = true  
    | otherwise = false 
instance Eq' Int where
  eq' x y
    | x == y = true
    | otherwise = false

-- Eq instance for String 
-- Eq instance for String
instance Eq' String where
  eq' x y
   | String.length x > String.length y = true
   | otherwise                         = false

-- Eq instance for Animal type
instance Eq' Animal where 
  eq' x y = case [x, y] of 
    [Wild, Wild]     -> true 
instance Eq' Animal where
  eq' x y = case [x, y] of
    [Wild, Wild]     -> true
    [Wild, Domestic] -> false
    _otherwise       -> false 
    
    _otherwise       -> false

--changing first item of int -> string
changeFirstItemToString :: Array Int -> Maybe String 
changeFirstItemToString array = map show (head array) 
changeFirstItemToString :: Array Int -> Maybe String
changeFirstItemToString array = map show (head array)

-- functor 
--The functor class is used for mapping values that are in some kind of container 
-- functor
--The functor class is used for mapping values that are in some kind of container

-- An Array is a container of some values. i.e Array Int. Is a container of Ints 
-- An Array is a container of some values. i.e Array Int. Is a container of Ints

--- Another example of a container is the Maybe data type 
--- Another example of a container is the Maybe data type

maybeAge :: Maybe' Int 
maybeAge :: Maybe' Int
maybeAge = Just' 13

noAge :: Maybe' Int 
noAge :: Maybe' Int
noAge = Nothing'



class Functor' f where 
class Functor' f where
  map' :: forall a b . ( a -> b) -> f a -> f b

--instance Functor' Maybe' where   
--instance Functor' Maybe' where

data Result' a = Success' a | Failure' String 
data Result' a = Success' a | Failure' String

getData :: String -> Result' String
getData input = case input of 
getData input = case input of
  "good" -> Success' "it ran well"
  _otherwise -> Failure' "wrong"   
  _otherwise -> Failure' "wrong"

-- array = 1 : 1 : []

-- instance Functor' Array where 
--   map' f someArray = case someArray of 
--     (x : xs) -> f x : map' f xs 
-- instance Functor' Array where
--   map' f someArray = case someArray of
--     (x : xs) -> f x : map' f xs
--     []       -> []


-- write Functor instance for Result 
-- write Functor instance for Result
instance Functor' Result' where
  map' f maybeInput = case maybeInput of
    Success' string    -> Success' (f string)
    Failure'  string  -> Failure' string

-- write Functor instance for Maybe 
instance Functor' Maybe' where 
  map' f maybeValue = case maybeValue of 
    Just' value -> Just' (f value) 
-- write Functor instance for Maybe
instance Functor' Maybe' where
  map' f maybeValue = case maybeValue of
    Just' value -> Just' (f value)
    Nothing'    -> Nothing'

-- change last item in an array of ints to string 
-- such that you return a Maybe of string 
-- change last item in an array of ints to string
-- such that you return a Maybe of string

changeLastItemToString :: Array Int -> Maybe String 
changeLastItemToString array = map show (last array) 
changeLastItemToString :: Array Int -> Maybe String
changeLastItemToString array = map show (last array)
  26  
src/Exp.purs
@@ -22,10 +22,10 @@ module Exp
  )
  where

import Math
import Data.Array
import Data.Maybe
import Data.Ord
import Data.Number
import Prelude

import Data.String as String
@@ -49,7 +49,7 @@ myMain = do
  log $ show $ theToUpper
  log "🍝"

numArray :: Array Int 
numArray :: Array Int
numArray = [5 ,6, 7, 8]

wordOfStrings :: Array String
@@ -73,11 +73,11 @@ findLength new = String.length new
theMap :: Array Int  -> Array String
theMap array = map findIt array

findIt :: Int -> String 
findIt :: Int -> String
findIt a = show $ a + 2

--use find
getIt :: Array String -> Maybe String 
getIt :: Array String -> Maybe String
getIt array = find getThat array

getThat :: String -> Boolean
@@ -88,40 +88,38 @@ oddNum :: Number -> Boolean
oddNum nums = if (nums % 2.0) /= 0.0  then true else false

-- use head
theFirst ::  Maybe String 
theFirst ::  Maybe String
theFirst = head wordOfStrings

--use insert
inserted :: String -> Array String
inserted array = insert array wordOfStrings

--use replicate 
replicated :: String -> Array String 
--use replicate
replicated :: String -> Array String
replicated number = replicate 7 number

-- elm
theElem  :: Array Int -> Boolean
theElem array = elem 6 array

--multiply 
--multiply
multiply :: Int -> Int -> Int
multiply a b = a * b

--use prefix 
thePrefix :: String -> String -> String 
thePrefix prefix word = prefix <> word 
--use prefix
thePrefix :: String -> String -> String
thePrefix prefix word = prefix <> word

--use drop
theDrop :: Array String -> Array String
theDrop array = map showIt array

showIt :: String -> String 
showIt :: String -> String
showIt arrays = String.drop 3 arrays

--toUpper
theToUpper ::  Array String
theToUpper  = map String.toUpper wordOfStrings

-- find Shortest


  83  
src/Main.purs
@@ -5,11 +5,11 @@ module Main
  , reduceOne
  , theReplicate
  )
  where

where

import Data.Array
import Data.Maybe
import Data.Number
import Data.Ord
import Prelude

@@ -29,11 +29,11 @@ main = do
  log $ show $ haveInset "Alex"
  log $ show $ theReplicate "by"
  log $ show $ theDropped  arrayOfStrings
  log $ show $ findThat arrayOfStrings 
  log $ show $ findThat arrayOfStrings
  log $ show $ firstOne
  log $ show $ theCapital
  log $ show $ shortestString arrayOfStrings
  log $ show $ line 2 4 
  log $ show $ line 2 4
  --log $ isEven 8
  log $ show $ findLength arrayOfStrings
  log $ show $ myPerson
@@ -43,36 +43,36 @@ main = do
  log $ show $ setNumberOfstudents 40 mySchool
  log "🍝"

type Person = 
  { name :: String 
  , age :: Int 
type Person =
  { name :: String
  , age :: Int
  }


myPerson :: Person 
myPerson = 
myPerson :: Person
myPerson =
  { name: "allan"
  , age: 20 
  , age: 20
  }

updatePerson :: Person -> Person 
updatePerson human = human {  name = "Alex" } 
updatePerson :: Person -> Person
updatePerson human = human {  name = "Alex" }

setAge :: Int -> Person -> Person 
setAge :: Int -> Person -> Person
setAge newAge human = human { age = newAge }

-- write function that sets a name similar to setAge 
-- write function that sets a name similar to setAge
setName :: String -> Person -> Person
setName newName array = array {name = newName }

getAge :: Person -> Int 
getAge person = person.age 
getAge :: Person -> Int
getAge person = person.age

-- write a function to return name of a person 
-- write a function to return name of a person
getName :: Person -> String
getName person = person.name

-- write a new record and its type to represent a school that has the following 
-- write a new record and its type to represent a school that has the following
-- field; numberOfstundents, schoolName and schoolDistrict
type School =
  { numberOfstundents :: Int
@@ -88,39 +88,39 @@ mySchool=
  }


-- write a function that sets the number of students in a given a school 
-- write a function that sets the number of students in a given a school
setNumberOfstudents :: Int -> School -> School
setNumberOfstudents newNumber school = school { numberOfstundents = newNumber }

sum :: Int -> Int -> Int 
sum :: Int -> Int -> Int
sum a b = a + b
  

  -- prefix
addPrefix :: String -> String -> String 
addPrefix prefix word = prefix <> word 
addPrefix :: String -> String -> String
addPrefix prefix word = prefix <> word

-- use if else
isOld :: Int -> String 
isOld age = if age > 20 then "This person is old" else "This person is young" 
isOld :: Int -> String
isOld age = if age > 20 then "This person is old" else "This person is young"

someArray :: Array Int 
someArray :: Array Int
someArray = [1, 2]

arrayOfStrings :: Array String 
arrayOfStrings :: Array String
arrayOfStrings = ["allan", "betty", "Ben"]

--ue map
changeToString :: Array Int -> Array String 
changeToString :: Array Int -> Array String
changeToString array = map addOne array

-- map :: (Int -> String) -> Array Int -> Array String
-- map :: (a -> b) -> f a -> f b


addOne :: Int -> String
addOne x = show $ x + 1 
addOne x = show $ x + 1

-- use insert Array function 
-- use insert Array function
haveInset :: String ->  Array String
haveInset value = insert value arrayOfStrings

@@ -135,12 +135,12 @@ newOne num = num > 1
firstOne ::  Maybe String
firstOne = head arrayOfStrings

-- use elem function 
-- use elem function
givenElement :: Array Int -> Boolean
givenElement array = elem 5 array


-- use find 
-- use find
findThat :: Array String -> Maybe String
findThat array = find word array

@@ -149,40 +149,40 @@ word string =  string == "betty"

--use replicate
theReplicate :: String -> Array String
theReplicate value = replicate 5 value 
theReplicate value = replicate 5 value


-- use the toUpper function from Data.String and array map function
-- to capitalize all letters in an arrayofStrings
theCapital :: Array String 
theCapital :: Array String
theCapital = map String.toUpper arrayOfStrings


-- Use the drop function from Data.String to remove the first 2 letters 
-- Use the drop function from Data.String to remove the first 2 letters
-- off each string, in an arrayofstrings.
theDropped :: Array String -> Array String
theDropped words = map dropLetters words


dropLetters :: String -> String 
dropLetters :: String -> String
dropLetters word' = String.drop 2 word'


-- find shortest string

shortestString :: Array String -> Maybe String
shortestString array = head (sortArray array) 
shortestString array = head (sortArray array)

sortArray :: Array String -> Array String
sortArray array = sortBy compareLength array

compareLength :: String -> String -> Ordering 
compareLength :: String -> String -> Ordering
compareLength x y = compare (String.length x) (String.length y)


-- write a function named called 'lineFunction or line' that replicates this formular 
-- y = x * a + c 
-- where 'x' and 'a' are function arguments and 'c' is constant that is equal to 10 
-- write a function named called 'lineFunction or line' that replicates this formular
-- y = x * a + c
-- where 'x' and 'a' are function arguments and 'c' is constant that is equal to 10
line :: Int -> Int -> Int
line x a = (x * a) + 10

@@ -199,4 +199,3 @@ findLength array = map theLength array

theLength :: String -> Int
theLength nums = String.length nums

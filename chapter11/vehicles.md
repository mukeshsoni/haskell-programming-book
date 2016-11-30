```haskell
data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = 
      PapuAir
    | CatapultsR'Us
    | TakeYourChangesUnited
      deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
              | Plane Airline
              deriving (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir
```

1. What is the type of `myCar`?

**Ans**
Vehicle

2. Given the following, define the functions:
```haskell
isCar :: Vehicle -> Bool
isCar = undefined

isPlane :: Vehicle -> Bool
isPlane = undefined

areCars = [Vehicle] - [Bool]
areCars = undefined
```

**Ans**
```haskell
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar
```

3. Now we are going to write a function to tell us the manufacturer of a piece of data.
```haskell
getManu :: Vehicle -> Manufacturer
getManu = undefined
```

**Ans**
```haskell
getManu :: Vehicle -> Manufacturer
getManu (Car manufacturer _) = manufacturer
getManu _ = error "only works for Car vehicle"
```

4. Given that we're returning the `Manufacturer`, what will happen if you use this on `Plane` data?

**Ans**
If we use it on plane data, it will throw an exception.

5. All right. Let's say you've decided to add the size of the plane as an argument to the `Plane` constructor. Add that to your datatypes in the appropriate places and change your data and functions appropriately.

**Ans**
```haskell
type Size = Integer
data Vehicle = Car Manufacturer Price
              | Plane Airline Size
              deriving (Eq, Show)

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False
```

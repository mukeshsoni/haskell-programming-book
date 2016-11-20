Given the following definitions, tell us what value results from further applications.
```haskell
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- fill in the types

flippy = flip cattyConny
appedCatty = cattyConny "woops"
frappe = flippy "haha"
```

1. What is the value of appedCatty "woohoo!" ? Try to determine the answer for yourself, then test in the REPL.

**Ans**
"woops! mrow woohoo!"

2. frappe "1"

**Ans**
"1 mrow haha"

3. frappe (appedCatty "2")

**Ans**
"woops mrow 2 mrow haha"

4. appedCatty (frappe "blue")

**Ans**
"woops mrow blue mrow haha"

5. cattyConny (frappe "pink")
        (cattyConny "green" (appedCatty "blue"))

**Ans**
"pink mrow haha mrow green mrow woops mrow blue"

6. cattyConny (flippy "Pugs" "are") "awesome"

**Ans**
"are mrow Pugs mrow awesome"
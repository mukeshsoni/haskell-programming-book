newtype Reader r a =
    Reader {runReader :: (r -> a)}

asks :: (r -> a) -> Reader r a
asks f = Reader f
module GetImages (Image) where

import Server (SearchTerm)

data Image = Image
  { url :: String,
    searchTerm :: SearchTerm,
    searchUrl :: String
  }
  deriving (Show)

getImage :: SearchTerm -> Image
getImage term =
  Image
    { url = "url",
      searchTerm = term,
      searchUrl = "searchUrl"
    }

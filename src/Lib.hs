{-# LANGUAGE OverloadedStrings #-}

module Lib
  ( restServer,
  )
where

import Network.HTTP.Types
import Network.Wai.Middleware.Cors (simpleCors)
import Web.Scotty (ScottyM, get, middleware, post, put, scotty, text)

restServer :: IO ()
restServer = scotty 8080 $ do
    middleware simpleCors
    get "/" $ do
        text "This was a GET request!" -- send 'text/plain' response
    post "/" $ do
        text "This was a POST request!"
    put "/" $ do
        text "This was a PUT request!"

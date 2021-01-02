{-# LANGUAGE OverloadedStrings #-}

module Lib
  ( restServer,
  )
where

import Network.HTTP.Types
import Web.Scotty (get, post, put, scotty, text)

restServer = scotty 8080 $ do
  get "/" $ do
    -- handle GET request on "/" URL
    text "This was a GET request!" -- send 'text/plain' response
  post "/" $ do
    text "This was a POST request!"
  put "/" $ do
    text "This was a PUT request!"

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module JSONparse where

import Control.Applicative
import Data.Aeson
import Data.ByteString.Lazy (ByteString)
import Data.Time
import Text.RawString.QQ

contractJSON :: ByteString
contractJSON = [r|
{
  "L4BuyerName": "Bob Banana",
  "L4ClosingDate": "1970:01:01 10:00:00Z",
  "L4Consideration": "USD 100",
  "L4SellerName": "Alice Apple"
}
|]

data L4Contract = 
  FruitSale {
    buyer :: String,
    closing :: String,
    consideration :: String,
    seller :: String 
     } deriving (Eq, Show)

instance FromJSON L4Contract where
  parseJSON = withObject "FruitSale" $ \v -> 
                FruitSale <$> v .: "L4BuyerName"
                          <*> v .: "L4ClosingDate"
                          <*> v .: "L4Consideration"
                          <*> v .: "L4SellerName"


-- possible datatypes?
-- they all need instances of FromJSON though

newtype Buyer = Buyer Entity deriving (Eq, Show)
newtype Seller = Seller Entity deriving (Eq, Show)

data Entity = 
    Individual String
  | Firm String
  deriving (Eq, Show)


test :: IO ()
test = print (decode contractJSON :: Maybe L4Contract)



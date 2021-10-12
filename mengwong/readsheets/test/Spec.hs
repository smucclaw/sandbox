{-# LANGUAGE OverloadedStrings #-}

import AbsL

import qualified Data.Tree as Tree
import Data.Tree(Tree(Node))
import KW

main :: IO ()
main = putStrLn "Test suite not yet implemented"



test_simplesing =
  Node "rule"
  [ Node "EVERY" [ Node "Person" [] ]
  , Node "WHO"   [ Node "AND" [ Node "walks"  []
                              , Node "runs"   []
                              , Node "OR"  [ Node "eats"   []
                                           , Node "drinks" []  ]
                              ]
                 ]
  , Node "MUST"  [ Node "sing" [] ]
  ]

test_simplest =
  Node "rule"
  [ Node "EVERY" [ Node "Person" [] ]
  , Node "WHO"   [ Node "walks"  [] ]
  , Node "AND"   [ Node "runs"   [] ]
  , Node "AND"   [ Node "eats"   [] ]
  , Node "OR"    [ Node "drinks" [] ]
  , Node "MUST"  [ ]
  , Node "➔"     [ Node "sing"   [] ]
  ]

test_mustsing = Rule
                 (RNum 1)
                 (RName (OptLangStringsLangStrings (ELangStrings [ELangString (LangID1 [LangLabelIdent (Ident "en-uk")]) "Waddington"])))
                 AsofNull
                 Meta0
                 (RModal
                  GU0
                  (MD1
                   (PartyLimb (PEvery PEvery_EVERYBODY) OptAsAlias0)
                   (DeonticLimb1 DEMust OptLangStrings1 (ActionDirObj
                                                         (ObjME (OMNoArgs [UnifyElemObjAttrElem (ObjAttrElemIdent (Ident "sing"))]
                                                                  (OptLangStringsLangStrings (ELangStrings [ELangString (LangID1 [LangLabelIdent (Ident "en-uk")]) "sing loudly"]))))
                                                          (OA_dots [])
                                                          OptAsAlias0) )
                    DL0)
                  (WHW
                   (WhenMatch (ListE (ListAnd
                                       [ ObjME (OMNoArgs [UnifyElemObjAttrElem (ObjAttrElemIdent (Ident "walk"))]
                                                 (OptLangStringsLangStrings (ELangStrings [ELangString (LangID1 [LangLabelIdent (Ident "en-uk")]) "walks slowly"])))
                                       , ObjME (OMNoArgs [UnifyElemObjAttrElem (ObjAttrElemIdent (Ident "run"))]
                                                 (OptLangStringsLangStrings (ELangStrings [ELangString (LangID1 [LangLabelIdent (Ident "en-uk")]) "runs quickly"])))
                                       ]
                                       (ListE (ListOr
                                                [ ObjME (OMNoArgs [UnifyElemObjAttrElem (ObjAttrElemIdent (Ident "eat"))]
                                                          (OptLangStringsLangStrings (ELangStrings [ELangString (LangID1 [LangLabelIdent (Ident "en-uk")]) "eat food"]))) ]
                                                ( ObjME (OMNoArgs [UnifyElemObjAttrElem (ObjAttrElemIdent (Ident "drink"))]
                                                          (OptLangStringsLangStrings (ELangStrings [ELangString (LangID1 [LangLabelIdent (Ident "en-uk")]) "drink beverage"])))
                                                )
                                              )
                                       )
                                     )
                              )
                   )
                    DNoHence
                    WhereLimb0
                  ))
                 


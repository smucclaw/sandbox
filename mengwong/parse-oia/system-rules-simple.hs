Parsed clauses:

[ P "IsMemberOf(the business, the competitor, the potential business with a higher score)" [] :- Any
    [ Leaf
        ( P "the business user feedback score < the competitor user feedback score" [] )
    , All
        [ Leaf
            ( P "the business user feedback score = the competitor user feedback score" [] )
        , Any
            [ Leaf
                ( P "the business’s eligibility level < the competitor’s eligibility level" [] )
            , All
                [ Leaf
                    ( P "the business’s eligibility level = the competitor’s eligibility level" [] )
                , Any
                    [ Leaf
                        ( P "the business's suitability score < the competitor’s suitability score" [] )
                    , All
                        [ Leaf
                            ( P "the business's suitability score = the competitor’s suitability score" [] )
                        , Leaf
                            ( P "Upper(the business) > Upper(the competitor)" [] )
                        ]
                    ]
                ]
            ]
        ]
    ]
, P "the investor has selected interest in any sector" [] :- Any
    [ Leaf
        ( P "the investor is interested in the Energy sector" [] )
    , Leaf
        ( P "the investor is interested in the Healthcare sector" [] )
    , Leaf
        ( P "the investor is interested in the Real Estate sector" [] )
    , Leaf
        ( P "the investor is interested in the Financials sector" [] )
    , Leaf
        ( P "the investor is interested in the Information Technology sector" [] )
    , Leaf
        ( P "the investor is interested in the Materials sector" [] )
    , Leaf
        ( P "the investor is interested in the Industrials sector" [] )
    , Leaf
        ( P "the investor is interested in the Consumer Discretionary sector" [] )
    , Leaf
        ( P "the investor is interested in the Consumer Staples sector" [] )
    , Leaf
        ( P "the investor is interested in the Communication Services sector" [] )
    , Leaf
        ( P "the investor is interested in the Utilities sector" [] )
    ]
, P "the input screen for business has to be displayed" [] :- All
    [ Leaf
        ( P "member"
            [ Var
                ( VariableName 0 "the business" )
            , Var
                ( VariableName 0 "all instances of the business" )
            ]
        )
    , Leaf
        ( P "the business is currently unknown" [] )
    ]
, P "the business name is entered" [] :- Leaf
    ( P "the business is currently known" [] )
, P "the initial assessment screen must be displayed" [] :- Leaf
    ( P "InstanceCount(all instances of the business) > 0" [] )
, P "the assessment has atleast one eligible business" [] :- Leaf
    ( P "InstanceCountIf(all instances of the business, the business investment opinion = “INTERESTING”) > 0" [] )
, P "the assessment has atleast one business eligibility undetermined" [] :- Leaf
    ( P "InstanceCountIf(all instances of the business, the business investment opinion = “SHRUG”) > 0" [] )
, P "the assessment has atleast one ineligible business" [] :- Leaf
    ( P "InstanceCountIf(all instances of the business, the business investment opinion = “REJECT”) > 0" [] )
, Fact
    ( P "the investment amount requested by the business = the investor’s choice of currency + “ ” + Text(the level of investment requested by the business)" [] )
, Fact
    ( P "the assessment year = ExtractYear(the current date)" [] )
, Fact
    ( P "the debug screen should not be displayed" [] )
]
Parsed clauses:

[ P "the business name is confirmed" [] :- All
    [ Leaf
        ( P "the business is currently known" [] )
    , Leaf
        ( P "the business is certain" [] )
    , Leaf
        ( P "the user has confirmed the business name" [] )
    ]
, P "the business sector is confirmed" [] :- All
    [ Leaf
        ( P "the sector in which the business operates is currently known" [] )
    , Leaf
        ( P "the sector in which the business operates is certain" [] )
    , Leaf
        ( P "the user has confirmed the business sector" [] )
    ]
, P "the business's stage of finance is confirmed" [] :- All
    [ Leaf
        ( P "the business's stage of finance is currently known" [] )
    , Leaf
        ( P "the business's stage of finance is certain" [] )
    , Leaf
        ( P "the user has confirmed the business's stage of finance" [] )
    ]
, P "the business's stage of commercialization is confirmed" [] :- All
    [ Leaf
        ( P "the business's stage of commercialization is currently known" [] )
    , Leaf
        ( P "the business's stage of commercialization is certain" [] )
    , Leaf
        ( P "the user has confirmed the business's stage of commercialization" [] )
    ]
, P "the business’s investment requirements are confirmed" [] :- All
    [ Leaf
        ( P "the business’s investment details are entered" [] )
    , Leaf
        ( P "the user has confirmed the business’s investment requirements" [] )
    ]
, P "the business’s financial details are confirmed" [] :- All
    [ Leaf
        ( P "the business’s financial details are entered" [] )
    , Leaf
        ( P "the user has confirmed the business’s financial details" [] )
    ]
, P "the business’s runway is confirmed" [] :- All
    [ Leaf
        ( P "the business’s cash details are entered" [] )
    , Leaf
        ( P "the user has confirmed the business’s runway" [] )
    ]
, P "the business’s other details are confirmed" [] :- All
    [ Leaf
        ( P "the business’s other details are entered" [] )
    , Leaf
        ( P "the user has confirmed the business’s other details" [] )
    ]
, P "the business’s market metrics are confirmed" [] :- All
    [ Leaf
        ( P "the business business’s market metrics are entered" [] )
    , Leaf
        ( P "the user has confirmed the business’s market metrics" [] )
    ]
, P "the business’s performance values are confirmed" [] :- All
    [ Leaf
        ( P "the business performance values are entered" [] )
    , Leaf
        ( P "the user has confirmed the business’s performance values" [] )
    ]
, P "the confirmed business info known score = 5" [] :- Any
    [ All
        [ Leaf
            ( P "the confirmed business info = “Name”" [] )
        , Leaf
            ( P "the business is currently known" [] )
        , Leaf
            ( P "the business is certain" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Sector”" [] )
        , Leaf
            ( P "the sector in which the business operates is currently known" [] )
        , Leaf
            ( P "the sector in which the business operates is certain" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Finance Stage”" [] )
        , Leaf
            ( P "the business's stage of finance is currently known" [] )
        , Leaf
            ( P "the business's stage of finance is certain" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Commercialization Stage”" [] )
        , Leaf
            ( P "the business's stage of commercialization is currently known" [] )
        , Leaf
            ( P "the business's stage of commercialization is certain" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Investment Requirements”" [] )
        , Leaf
            ( P "the business’s investment details are entered" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Financial Details”" [] )
        , Leaf
            ( P "the business’s financial details are entered" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Runway”" [] )
        , Leaf
            ( P "the business’s cash details are entered" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Other Details”" [] )
        , Leaf
            ( P "the business’s other details are entered" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Market Metric”" [] )
        , Leaf
            ( P "the business business’s market metrics are entered" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info =“Growth”" [] )
        , Leaf
            ( P "the business performance values are entered" [] )
        ]
    ]
, P "the confirmed business info confirmation score = 5" [] :- Any
    [ All
        [ Leaf
            ( P "the confirmed business info = “Name”" [] )
        , Leaf
            ( P "the user has confirmed the business name" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Sector”" [] )
        , Leaf
            ( P "the user has confirmed the business sector" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Finance Stage”" [] )
        , Leaf
            ( P "the user has confirmed the business's stage of finance" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Commercialization Stage”" [] )
        , Leaf
            ( P "the user has confirmed the business's stage of commercialization" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Investment Requirements”" [] )
        , Leaf
            ( P "the user has confirmed the business’s investment requirements" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Financial Details”" [] )
        , Leaf
            ( P "the user has confirmed the business’s financial details" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Runway”" [] )
        , Leaf
            ( P "the user has confirmed the business’s runway" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Other Details”" [] )
        , Leaf
            ( P "the user has confirmed the business’s other details" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info = “Market Metric”" [] )
        , Leaf
            ( P "the user has confirmed the business’s market metrics" [] )
        ]
    , All
        [ Leaf
            ( P "the confirmed business info =“Growth”" [] )
        , Leaf
            ( P "the user has confirmed the business’s performance values" [] )
        ]
    ]
, P "the next potential business ( the potential business rank + 1) exists" [] :- Leaf
    ( P "the potential business rank < total number of businesses" [] )
, P "the business is a member of the potential businesses in order of ranking" [] :- Leaf
    ( P "the business's ranking order = the potential business rank" [] )
, Fact
    ( P "the confirmed business info total score = DefaultWithUnknown( the confirmed business info known score , 0) + DefaultWithUnknown( the confirmed business info confirmation score , 0)" [] )
, Fact
    ( P "the business’s completeness score = DefaultWithUnknown(InstanceSum( all instances of the confirmed business info , the confirmed business info total score ), 0)" [] )
, Fact
    ( P "the business’s completeness score for screens = Text( the business’s completeness score ) + “%”" [] )
, Fact
    ( P "total number of businesses = InstanceCount( all instances of the business )" [] )
, Fact
    ( P "the first potential business (1) exists" [] )
, Fact
    ( P "the potential business = InstanceValueIf( the potential businesses in order of ranking , the business , TRUE)" [] )
, Fact
    ( P "the potential business’s user feedback = InstanceValueIf( the potential businesses in order of ranking , the business's user feedback , TRUE)" [] )
, Fact
    ( P "the potential business’s eligibility level = InstanceValueIf( the potential businesses in order of ranking , the business's eligibility level , TRUE)" [] )
, Fact
    ( P "the potential business’s suitability score = InstanceValueIf( the potential businesses in order of ranking , the business's suitability score , TRUE)" [] )
]

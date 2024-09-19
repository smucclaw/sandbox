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
, Fact
    ( P "the confirmed business info score = 12.5%" [] )
, Fact
    ( P "the business’s completeness score = DefaultWithUnknown(InstanceSum(all instances of the confirmed business info, the confirmed business info score), 0)" [] )
, Fact
    ( P "the business’s completeness score for screens = Text(the business’s completeness score * 100) + “%”" [] )
]

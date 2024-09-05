Parsed clauses:

[ P "the business is eligible for investment" [] :- All
    [ Leaf
        ( P "the business’s stage of finance matches the investor’s mandated stage of finance" [] )
    , Leaf
        ( P "the business’s stage of commercialization matches the investment type the investor is open to" [] )
    , Any
        [ Leaf
            ( P "the business’s projected ROI as an annual percentage is uncertain" [] )
        , Leaf
            ( P "the business’s projected ROI as an annual percentage >= the investor's minimum annual Return On Investment as a percentage" [] )
        ]
    , Any
        [ Leaf
            ( P "the business’s runway in months is uncertain" [] )
        , Leaf
            ( P "the business has enough runway" [] )
        ]
    , Leaf
        ( P "the business is not eliminated from investment" [] )
    ]
, P "the business is eliminated from investment" [] :- Any
    [ Leaf
        ( P "the investor’s investment in the business would be more than the maximum investment on a single ticket" [] )
    , Leaf
        ( P "the investor’s investment in the business would be more than the maximum allocation in a single business" [] )
    , Leaf
        ( P "the investor’s investment in the business would represent a higher proportion of the investor’s portfolio than the maximum allocated portion in a single business" [] )
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Energy"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Energy" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Healthcare"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Healthcare" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Real Estate"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Real Estate" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Financials"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Financials" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Information Technology"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Information Technology" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Materials"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Materials" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Industrials"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Industrials" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Consumer Discretionary"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Consumer Discretionary" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Consumer Staples"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Consumer Staples" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Communication Services"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Communication Services" [] )
        ]
    , All
        [ Leaf
            ( P "the sector in which the business operates = "Utilities"" [] )
        , Leaf
            ( P "the investor’s portfolio including an investment in the business would be overinvested in Utilities" [] )
        ]
    ]
, P "the investment is in Energy" [] :- Leaf
    ( P "the sector of the investment = "Energy"" [] )
, P "the investment is in Healthcare" [] :- Leaf
    ( P "the sector of the investment = "Healthcare"" [] )
, P "the investment is in Real Estate" [] :- Leaf
    ( P "the sector of the investment = "Real Estate"" [] )
, P "the investment is in Financials" [] :- Leaf
    ( P "the sector of the investment = "Financials"" [] )
, P "the investment is in Information Technology" [] :- Leaf
    ( P "the sector of the investment = "Information Technology"" [] )
, P "the investment is in Materials" [] :- Leaf
    ( P "the sector of the investment = "Materials"" [] )
, P "the investment is in Industrials" [] :- Leaf
    ( P "the sector of the investment = "Industrials"" [] )
, P "the investment is in Consumer Discretionary" [] :- Leaf
    ( P "the sector of the investment = "Consumer Discretionary"" [] )
, P "the investment is in Consumer Staples" [] :- Leaf
    ( P "the sector of the investment = "Consumer Staples"" [] )
, P "the investment is in Communication Services" [] :- Leaf
    ( P "the sector of the investment = "Communication Services"" [] )
, P "the investment is in Utilities" [] :- Leaf
    ( P "the sector of the investment = "Utilities"" [] )
, Fact
    ( P "the business's runway in months = the business’s current cash on hand / the business’s current monthly expenses" [] )
, Fact
    ( P "the portion of the investor’s portfolio represented by the business in case we invest in it = the level of investment requested by the business / (the investor’s total funds allocated + the level of investment requested by the business)" [] )
, Fact
    ( P "the investor’s total funds allocated = the investor’s funds allocated to the investment totaled for all of the existing investments in the investor’s portfolio" [] )
, Fact
    ( P "the investor’s total allocation in Energy = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Energy" [] )
, Fact
    ( P "the investor’s allocated portion in Energy = the investor’s total allocation in Energy / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Healthcare = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Healthcare" [] )
, Fact
    ( P "the investor’s allocated portion in Healthcare = the investor’s total allocation in Healthcare / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Real Estate = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Real Estate" [] )
, Fact
    ( P "the investor’s allocated portion in Real Estate = the investor’s total allocation in Real Estate / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Financials = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Financials" [] )
, Fact
    ( P "the investor’s allocated portion in Financials = the investor’s total allocation in Financials / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Information Technology = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Information Technology" [] )
, Fact
    ( P "the investor’s allocated portion in Information Technology = the investor’s total allocation in Information Technology / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Materials = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Materials" [] )
, Fact
    ( P "the investor’s allocated portion in Materials = the investor’s total allocation in Materials / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Industrials = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Industrials" [] )
, Fact
    ( P "the investor’s allocated portion in Industrials = the investor’s total allocation in Industrials / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Consumer Discretionary = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Consumer Discretionary" [] )
, Fact
    ( P "the investor’s allocated portion in Consumer Discretionary = the investor’s total allocation in Consumer Discretionary / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Consumer Staples = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Consumer Staples" [] )
, Fact
    ( P "the investor’s allocated portion in Consumer Staples = the investor’s total allocation in Consumer Staples / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Communication Services = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Communication Services" [] )
, Fact
    ( P "the investor’s allocated portion in Communication Services = the investor’s total allocation in Communication Services / the investor’s total assets under management" [] )
, Fact
    ( P "the investor’s total allocation in Utilities = the investor’s funds allocated to the investment as per sector share totaled for all of the existing investments in the investor’s portfolio for which it is the case that the investment is in Utilities" [] )
, Fact
    ( P "the investor’s allocated portion in Utilities = the investor’s total allocation in Utilities / the investor’s total assets under management" [] )
, Fact
    ( P "the business’s suitability score = Round(DefaultWithUnknown(the value for money of the business, 1) * the business’s founder bonus factor * the business’s client bonus factor, 8)" [] )
, Fact
    ( P "the business’s valuation percentage = the business’s suitability score * 100" [] )
, Fact
    ( P "the value for money of the business = the estimated valuation of the business / the implied valuation of the business" [] )
, Fact
    ( P "the implied valuation of the business = the level of investment requested by the business / the portion of the business being offered" [] )
, Fact
    ( P "the portion of the business being offered = the number of shares in the business being offered / the total number of shares in the business" [] )
, Fact
    ( P "the business's asking price per share = the implied valuation of the business / the total number of shares in the business" [] )
, Fact
    ( P "the business's asking price-to-earnings ratio = the implied valuation of the business / the business's EBITDA in 2023" [] )
, Fact
    ( P "the estimated valuation of the business = (the estimated valuation of the business based on revenue + the estimated valuation of the business based on earnings) / 2" [] )
, Fact
    ( P "the estimated valuation of the business based on revenue = the business’s average revenue in 2023 and 2022 * the revenue multiplier to valuate the business" [] )
, Fact
    ( P "the estimated valuation of the business based on earnings = the business’s average earnings in 2023 and 2022 * the earnings multiplier to valuate the business" [] )
, Fact
    ( P "the business’s average revenue in 2023 and 2022 = (the business's total revenue in 2023 + the business's total revenue in 2022) / 2" [] )
, Fact
    ( P "the business’s average earnings in 2023 and 2022 = (the business's EBITDA in 2023 + the business's EBITDA in 2022) / 2" [] )
]

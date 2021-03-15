# baby-l4

```
┌─[mengwong@solo-wmw] - [~/src/smucclaw/sandbox/jacobtan/baby-l4] - [2021-02-10 01:08:25]
└─[0] <git:(default 5b909cb✱) > stack run baby-l4-exe < src/babyl4.txt
Just
    [ L4Type
        ( TypeDef ( TypeS "Business" ) ( Just 12345 )
            [ TypeAttr ( AttrS "is_operating" ) ( Just 23456 ) ( AttrTypeS "boolean" )
            , TypeAttr ( AttrS "is_legal" ) ( Just 34567 ) ( AttrTypeS "boolean" )
            ]
        )
    , L4Obj
        ( ObjDef ( ObjS "megaCorp" ) ( TypeS "Business" ) )
    , L4Prop
        ( BinOp "is_operating" ( IStr "megaCorp" ) ( IStr "true" ) )
    , L4Query
        ( BinOp "is_operating" ( IStr "megaCorp" ) ( IStr "true" ) )
    ]
```

![Parse Sample](src/parse-sample.png)

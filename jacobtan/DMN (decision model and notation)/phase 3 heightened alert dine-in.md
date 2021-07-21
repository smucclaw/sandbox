Context:

> UPDATES ON PHASE 3 (HEIGHTENED ALERT) MEASURES
> 
> https://www.moh.gov.sg/news-highlights/details/updates-on-phase-3-(heightened-alert)-measures
> 
> Annex A
> 
> https://www.moh.gov.sg/docs/librariesprovider5/default-document-library/annex-a91cf05db079a473e85e033bb8f9cb428.pdf
> 
> Annex B
> 
> https://www.moh.gov.sg/docs/librariesprovider5/default-document-library/annex-b26e603847daf404a99c4f73cb79600fc.pdf (edited) 

![image](https://user-images.githubusercontent.com/12626411/126429518-e1191e89-a302-49c3-b1ac-9f5da64dea28.png) _________
![image](https://user-images.githubusercontent.com/12626411/126429542-7f0c52af-85da-4add-88b4-bcd27cf88518.png)


---

Annex A (interpreted strictly) is actually inconsistent with Annex B, specifically the case of a group of size 2 with 2 children from different households.

The rules actually follow a hit policy of "first". I.e. pick the first row that is consistent with the situation.

(This is identical to pattern matching in Haskell.)

---

It's possible to systematically translate such a "first" hit policy table into a flowchart.

The algorithm isn't immediately obvious though.

Seems to work: start from the first relevant variable in the first row. Then move on to the next relevant variable in the first same row. Do likewise for subsequent rows.

https://flowchart.fun/

```
~~~
layout:
  name: dagre
  rankDir: TB
~~~

max group size
  2: yes
  otherwise: eligibility
    all eligible: max group size
      5: children's household
        different household: max # of children
          hogsrd *: yes.
          //otherwise: no
        same household: max # of children
          4: yes.
          //otherwise: no
      //otherwise: no
    //otherwise: no
* hogsrd = half of group size, round down
otherwise
  no
```

![image](https://user-images.githubusercontent.com/12626411/126429176-0748b546-dfde-4b6a-a71e-bb0caf5e5642.png)

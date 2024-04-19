xquery version "3.1";

for $alb in doc("Albums.xml")//ALBUM
let $numRents := sum(
	for $cd in doc("CatalogCD.xml")//CD[@ALBUM_ID = $alb/@ID]
    let $numRents_CD := count(
    	for $rnt in doc("Rent.xml")//RENT[@CD_ID = $cd/@ID]
        where matches($rnt/FROM_DATE/text(),"[0-9]{2}/0[1-3]/2020")
        return $rnt
    	)
    return $numRents_CD
	)
where $numRents > 3
return $alb
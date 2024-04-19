xquery version "3.1";

let $most_rented_alb := (
	for $alb in doc("Albums.xml")//ALBUM
	let $numRents := sum(
		for $cd in doc("CatalogCD.xml")//CD[@ALBUM_ID = $alb/@ID]
    	let $numRents_CD := count(
    		for $rnt in doc("Rent.xml")//RENT[@CD_ID = $cd/@ID]
        	return $rnt
    	)
    	return $numRents_CD
	)
	order by $numRents descending
	return $alb)[1]

let $cd_IDs := (
	for $cd in doc("CatalogCD.xml")//CD[@ALBUM_ID = $most_rented_alb/@ID]
	return $cd/@ID
    )
    
let $cl_most_renting := (
	for $cl in doc("Clients.xml")//CLIENT
	let $num_rents := count(
		for $rnt in doc("Rent.xml")//RENT[@CLIENT_ID = $cl/@ID]
		where $rnt/@CD_ID = $cd_IDs
		return $rnt
    )
	order by $num_rents descending
	return $cl
)
return 
<RESULT>
	{$cl_most_renting[1]}
    {$most_rented_alb}
</RESULT>

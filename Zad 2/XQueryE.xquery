xquery version "3.1";

for $alb in doc("Album.xml")//ALBUM
let $avg_rents := avg(
	for $cd in doc("CatalogCD.xml")//CD[@ALBUM_ID = $alb/@ID]
	let $num_rents := count(
		for $rnt in doc("Rent.xml")//RENT[@CD_ID = $cd/@ID]
		return $rnt
        )
    return $num_rents
    )
return 
<RESULT>
	{$alb}
    <AVERAGE_RENTS>{$avg_rents}</AVERAGE_RENTS>	
</RESULT>

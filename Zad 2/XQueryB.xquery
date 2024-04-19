xquery version "3.1";

let $sorted_cl := (
	for $cl in doc("Clients.xml")//CLIENT
	let $rents := doc("Rent.xml")//RENT[@CLIENT_ID = $cl/@ID]
	let $numRents := count($rents)
	order by $numRents descending
	return $cl
	)
for $cl in subsequence($sorted_cl, 1, 3)
return $cl
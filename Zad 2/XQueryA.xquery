xquery version "3.1";

for $art in doc("Artists.xml")//ARTIST
return 
<ARTIST_AND_ALBUMS>
	{$art}
    <ALBUMS>
    	{
    	for $alb in doc("Albums.xml")//ALBUM[@ARTIST_ID = $art/@ID]
        return $alb
        
    	}
    </ALBUMS>
</ARTIST_AND_ALBUMS>
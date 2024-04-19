xquery version "3.1";

<SYSTEM>
	<ARTISTS>
      <DJS>
      {
          for $dj in doc("DJ.xml")//DJ
          let $artist := doc("Artists.xml")//ARTIST[@ID = $dj/@ID]
          return 
          <DJ ARTIST_ID="{$dj/@ID}">
          	{$artist/NAME}
            {$artist/COUNTRY}
            {$dj/NET_WORTH}
            {$dj/YEAR_OF_BIRTH}
          	{$dj/YEAR_STARTED_PERFORMING}
            <GENRES>
            {
            	for $genre in $artist/GENRE
                return $genre
            }
            </GENRES>
            <ALBUMS>
            {
            	for $alb in doc("Albums.xml")//ALBUM[@ARTIST_ID = $dj/@ID]
                return 
                <ALBUM ALBUM_ID="{$alb/@ID}" >
                {$alb/NAME}
                {$alb/RELEASE_YEAR}
                {$alb/PRICE}
                <CDS>
                {
                    for $cd in doc("CatalogCD.xml")//CD[@ALBUM_ID = $alb/@ID]
                    return
                    <CD CD_ID="{$cd/@ID}">
                        {$cd/OCCUPIED}
                        {$cd/STATE}
                    </CD>
                }
                </CDS>
                </ALBUM>
            }
            </ALBUMS >
          </DJ>
      }
      </DJS>
      <GROUPS>
      {
          for $gr in doc("Groups.xml")//GROUP
          let $artist := doc("Artists.xml")//ARTIST[@ID = $gr/@ID]
          return 
          <GROUP ARTIST_ID="{$gr/@ID}">
          	{$artist/NAME}
            {$artist/COUNTRY}
            {$gr/YEAR_FORMED}
            {$gr/NUMBER_OF_MEMBERS}
            <GENRES>
            {
            	for $genre in $artist/GENRE
                return $genre
            }
            </GENRES>
            <ALBUMS>
            {
            	for $alb in doc("Albums.xml")//ALBUM[@ARTIST_ID = $gr/@ID]
                return 
                <ALBUM ALBUM_ID="{$alb/@ID}" >
                {$alb/NAME}
                {$alb/RELEASE_YEAR}
                {$alb/PRICE}
                <CDS>
                    {
                    	for $cd in doc("CatalogCD.xml")//CD[@ALBUM_ID = $alb/@ID]
                        return
                        <CD CD_ID="{$cd/@ID}">
                        	{$cd/OCCUPIED}
                        	{$cd/STATE}
                        </CD>
                    }
                </CDS>
                </ALBUM>
            }
            </ALBUMS >
          </GROUP>
      }
      </GROUPS>
      <SINGERS>
      {
          for $sg in doc("Singers.xml")//SINGER
          let $artist := doc("Artists.xml")//ARTIST[@ID = $sg/@ID]
          return 
          <SINGER ARTIST_ID="{$sg/@ID}">
          	{$artist/NAME}
            {$artist/COUNTRY}
            {$sg/YEAR_OF_BIRTH}
            {$sg/YEAR_STARTED_PERFORMING}
            <GENRES>
            {
            	for $genre in $artist/GENRE
                return $genre
            }
            </GENRES>
            <ALBUMS>
            {
            	for $alb in doc("Albums.xml")//ALBUM[@ARTIST_ID = $sg/@ID]
                return 
                <ALBUM ALBUM_ID="{$alb/@ID}" >
                {$alb/NAME}
                {$alb/RELEASE_YEAR}
                {$alb/PRICE}
                <CDS>
                    {
                    	for $cd in doc("CatalogCD.xml")//CD[@ALBUM_ID = $alb/@ID]
                        return
                        <CD CD_ID="{$cd/@ID}">
                        	{$cd/OCCUPIED}
                        	{$cd/STATE}
                        </CD>
                    }
                </CDS>
                </ALBUM>
            }
            </ALBUMS >
          </SINGER>
      }
      </SINGERS>
      
    </ARTISTS>
    
    <CLIENTS>
    {
    	for $cl in doc("Clients.xml")//CLIENT
        return 
        <CLIENT CLIENT_ID="{$cl/@ID}">
        	{$cl/BASIC_INFO}
        	{$cl/NAME}
        	{$cl/SURNAME}
        	{$cl/ADDRESS}
        	{$cl/EMAIL}
        	<PHONES>
        	{
        		for $ph in $cl/PHONE_NUMBER
            	return $ph
        	}
        	</PHONES>
        	<RENTS>
            {
            	for $rnt in doc("Rent.xml")//RENT[@CLIENT_ID = $cl/@ID]
                return 
                <RENT RENT_ID="{$rnt/@ID}" CD_ID="{$rnt/@CD_ID}">
                	{$rnt/FROM_DATE}
                	{$rnt/RETURN_STATE}
                    {$rnt/RETURN_DATE}
                </RENT>
            }
        	</RENTS>
        </CLIENT>
    }
    </CLIENTS>

</SYSTEM>

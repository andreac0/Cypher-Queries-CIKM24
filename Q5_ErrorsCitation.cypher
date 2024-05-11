//Q5-ErrorsCitation
MATCH p=(l:Law)-[:HAS_ART]->(a:Art)<-[r:ABROGATE]-(a2:Art)
      <-[:HAS_ART]-(l2:Law)
MATCH (a)-[:IN_PREAMBLE]->(l3:Law)
WHERE r.comma IS NULL
AND l3.publicationDate > l2.publicationDate
RETURN l3.id as LawWithError, a.id as CitedAbrogatedArt
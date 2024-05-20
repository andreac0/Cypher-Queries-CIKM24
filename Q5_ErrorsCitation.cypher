//Q5-ErrorsCitation
MATCH p=(l:Law)-[:HAS_ARTICLE]->(a:Article)<-[r:ABROGATE]-(a2:Article)
      <-[:HAS_ARTICLE]-(l2:Law)
MATCH (a)-[:IN_PREAMBLE]->(l3:Law)
WHERE r.paragraph IS NULL
AND l3.publicationDate > l2.publicationDate
RETURN l3.id as LawWithError, a.id as CitedAbrogatedArt
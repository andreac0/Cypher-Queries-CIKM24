//Q8-DecreeConversion
MATCH p=(l:Law)-[:HAS_ART]->(a:Art)<-[r:AMENDS|ABROGATE]-(a2:Art)
      <-[:HAS_ART]-(l2:Law)-[:UNDER_GOVERNMENT]-(g:Government)
WHERE l.typeLaw = "DECRETO-LEGGE"  and l2.typeLaw <> "DECRETO-LEGGE" 
AND l2.publicationDate <= (l.publicationDate + duration({days:45})) 
AND l2.title CONTAINS "Conversione in legge" 
WITH l.id AS DecretoID, l2.id AS LeggeID, count(r) AS N, 
     g.name AS Government
RETURN Government, avg(N) AS avgModifications
//NeverCitedLaws
MATCH (l:Law)-[:HAS_ARTICLE|HAS_ATTACHMENT]->(a)
WHERE NOT (l)-[:IN_PREAMBLE]->(:Law) AND NOT (a)-[:IN_PREAMBLE]->(:Law) AND NOT (a)<-[:AMENDS]-() AND NOT (a)<-[:ABROGATE]-() AND NOT (a)<-[:CITATION]-() AND NOT (a)<-[:INTRODUCE]-() AND NOT (l)<-[:AMENDS]-() AND NOT (l)<-[:ABROGATE]-() AND NOT (l)<-[:CITATION]-() 
RETURN l.publicationDate.year AS Date, COUNT(DISTINCT l) AS N


//StockInForceLaws
MATCH p=(l:Law)-[:HAS_ARTICLE]->(a:Article)<-[r:ABROGATE]-(a2:Article)<-
      [:HAS_ARTICLE]-(l2:Law)
WHERE r.paragrah IS NULL AND l2.publicationDate <= datetime($YEAR)
WITH l.id AS abrogatedLaw, l.numArt AS N_Arts, COUNT(DISTINCT a) 
     AS N_Repeals
WHERE N_Repeals >= N_Arts 
WITH COLLECT(abrogatedLaw) AS list_abrogations
MATCH (l:Law)
WHERE l.publicationDate <= datetime($YEAR) AND NOT l.id IN 
    list_abrogations AND NOT ()-[:ABROGATE]->(l:Law)
RETURN COUNT(l.id) AS CountInForceLaws
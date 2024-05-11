//StockInForceLaws
MATCH p=(l:Law)-[:HAS_ART]->(a:Art)<-[r:ABROGATE]-(a2:Art)<-
      [:HAS_ART]-(l2:Law)
WHERE r.comma IS NULL AND l2.publicationDate <= datetime('2020')
WITH l.id AS abrogatedLaw, l.numArt AS N_Arts, COUNT(DISTINCT a) 
     AS N_Repeals
WHERE N_Repeals >= N_Arts 
WITH COLLECT(abrogatedLaw) AS list_abrogations
MATCH (l:Law)
WHERE l.publicationDate <= datetime('2020') AND NOT l.id IN 
    list_abrogations AND NOT ()-[:ABROGATE]->(l:Law)
RETURN COUNT(l.id) AS CountInForceLaws
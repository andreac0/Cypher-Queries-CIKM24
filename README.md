# Modelling Legislative Systems into Property Graphs to Enable Advanced Pattern Detection: the Italian Legislative Property Graph (ILPG)

This repository includes the PG-Schema of legislative property graphs and the Cypher queries over the Italian Legislative Property Graph that we presented in the paper **Modelling Legislative Systems into Property Graphs to Enable Advanced Pattern Detection** submitted to CIKM 2024 - Applied Research.

## PG-Schema for Legislative Property Graphs
Here we provide the PG-Schema formalization of the graph schema we propose. To this aim, we resort to the formalization introduced in [PG-Schema](https://dl.acm.org/doi/pdf/10.1145/3589778) 

```cypher
CREATE GRAPH TYPE lawsGraphType STRICT{
      (lawType: Law {id STRING, title STRING, lawNum INT, typeLaw STRING, publicationDate DATE, numArt INT, numAttach INT}),
      (articleType: Article {id STRING, title STRING, number INT}),
      (attachmentType: Attachment {id STRING, title STRING, type STRING}),
      (legislatureType: Legislature {name STRING, startDate DATE, endDate DATE}),
      (governmentType: Government {name STRING, startDate DATE, endDate DATE}),
      (:lawType)-[hasArticleType: has_article]->(:articleType),
      (:lawType)-[hasAttachmentType: has_attachment]->(:attachmentType),
      (:lawType)-[underGovernmentType: under_government]->(:governmentType),
      (:lawType)-[underLegislatureType: under_legislature]->(:legislatureType),
      (:governmentType)-[succededByType: succeded_by]->(:governmentType),
      (:lawType)-[referenceType: in_preamble]->(:lawType),
      (:articleType)-[referenceType: in_preamble|amends|abrogates|citation]->(:lawType),
      (:articleType)-[referenceType: amends|abrogates|citation {paragraph STRING}]->(:articleType),
      (:articleType)-[referenceType: amends|abrogates|citation {paragraph STRING}]->(:attachmentType),
      (:attachmentType)-[referenceType: in_preamble|citation]->(:lawType),
      (:attachmentType)-[referenceType: citation {paragraph STRING}]->(:articleType),
      (:attachmentType)-[referenceType: citation {paragraph STRING}]->(:attachmentType)
}
```

## The ILPG

The graph is available for upload in your Neo4J at Zenodo: [Colombo, A., Bernasconi, A., & Ceri, S. (2024). Italian Legislative Property Graph](https://doi.org/10.5281/zenodo.11210265)

You can easily upload the graph via the [***cypher-shell***](https://neo4j.com/docs/operations-manual/5/tools/cypher-shell/), via the ***:source*** command.


## Authors

- Andrea Colombo, Politecnico di Milano
- Anna Bernasconi, Politecnico di Milano
- Stefano Ceri, Politecnico di Milano

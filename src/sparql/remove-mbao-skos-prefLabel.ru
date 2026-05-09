PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

DELETE {
  ?term skos:prefLabel ?label .
}
WHERE {
  ?term skos:prefLabel ?label .
  FILTER(STRSTARTS(STR(?term), "https://purl.brain-bican.org/ontology/mbao/"))
}

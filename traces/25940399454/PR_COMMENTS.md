# Update hypertrophic chondrocyte (CL:0000743)

Addresses [issue #3506](https://github.com/obophenotype/cell-ontology/issues/3506).

## Summary of changes

All edits are to `src/ontology/cl-edit.owl` for class `CL:0000743` (hypertrophic chondrocyte).

### Textual definition

Replaced the previous definition

> Chondrocyte that is terminally differentiated, produces type X collagen, is large in size, and often associated with the replacement of cartilage by bone (endochondral ossification).

with the curator-supplied wording, citing PMID:25321476 and PMID:35179487:

> A chondrocyte that is part of the hypertrophic cartilage zone. This cell is significantly enlarged and characterised by high expression of type X collagen (COL10A1) in both humans and mice. It actively coordinates endochondral ossification by mineralising the extracellular matrix, attracting blood vessels via angiogenic signalling, and mediating the transition from cartilage to bone - often by transdifferentiating into an osteoblast rather than undergoing apoptosis.

The previous definition's references (GO_REF:0000034, PMID:15951842) are dropped because the wording is replaced; the new references support the new wording.

### Comment (`rdfs:comment`)

Replaced the legacy curator comment

> is hypertrophic pathological or normal? and can it be described using a pato term?

with the curator-supplied explanatory comment (cited to PMID:35179487 and PMID:41207902):

> Despite historical descriptions as 'terminally differentiated,' hypertrophic chondrocytes survive and transdifferentiate into osteoblasts. Genetic lineage tracing shows that hypertrophic chondrocytes do not simply undergo apoptosis but cross the cartilage-bone boundary, dedifferentiate into skeletal stem/progenitor cells, and then redifferentiate into osteoblasts and osteocytes. Single-cell RNA-seq further indicates that these chondrocyte-derived SSPCs are a major source of trabecular osteoblasts and marrow adipocytes.

(The em-dash "cartilage–bone" was replaced with a hyphen "cartilage-bone" to keep the file ASCII-safe.)

### Logical axioms added

Following `docs/relations_guide.md`:

- `part_of` (BFO:0000050) some 'hypertrophic cartilage zone' (UBERON:0008187)
- `capable_of` (RO:0002215) some 'endochondral ossification' (GO:0001958)

The existing `SubClassOf CL:0000138` (chondrocyte) is retained.

### Class declarations

Added `Declaration(Class(...))` lines for the two referenced imports:

- `UBERON:0008187` ("hypertrophic cartilage zone")
- `GO:0001958` ("endochondral ossification")

These follow the same minimal declaration pattern used for the other UBERON/GO imports in `cl-edit.owl`. A full import refresh (`sh run.sh make imports/merged_import.owl`, per `docs/Adding_classes_from_another_ontology.md`) was not run here because it requires Docker and a full ODK environment; the editor merging this PR may want to run that step so the imports pull in labels, definitions and parent axioms for the two new classes.

### Term tracker

Added `IAO:0000233` (term_tracker_item) pointing to issue #3506.

## Validation / research checklist

- [x] Read issue body and confirmed there are no further comments.
- [x] Located the existing `CL:0000743` axioms in `src/ontology/cl-edit.owl` and confirmed no other axioms (incl. `present_in_taxon` / `RO:0002175`) reference it.
- [x] Verified the UBERON ID for "hypertrophic cartilage zone" via OLS: `UBERON:0008187` (primary label: "hypertrophic cartilage zone"; also cross-referenced by EMAPA:35415 and MA:0002849).
- [x] Verified the GO ID for "endochondral ossification" via OLS: `GO:0001958`.
- [x] Confirmed relation choices against `docs/relations_guide.md` (`part_of` for material-anatomical location; `capable_of` for a process the cell carries out in entirety).
- [x] Followed the per-class formatting conventions used elsewhere in `cl-edit.owl` (annotation xrefs as `Annotation(oboInOwl:hasDbXref "PMID:...")`, `IAO:0000233` as an IRI, one axiom per line).

## Notes / things for the reviewer

- **"Remove present in taxon Homo sapiens"** — the issue asks for this, but I could not find any taxon-restriction axiom on `CL:0000743` in `cl-edit.owl` (no `RO:0002175`, no `RO:0002162`, no other reference to NCBITaxon in the term's axioms). I made no removal. If this was visible in a released artifact (e.g. via the GO_REF reference or an imported overlay), please flag and I'll dig in.
- **Import refresh** — I declared the two new external classes but did not refresh `imports/merged_import.owl`; that is the standard follow-up step described in `docs/Adding_classes_from_another_ontology.md` and is best run in a Dockered ODK environment.
- **Reasoner validation** — I did not run `robot reason` (robot is not available in this environment). The textual definition mirrors the new genus-differentia logical structure (chondrocyte that is part of hypertrophic cartilage zone and is capable of endochondral ossification), so the existing `SubClassOf CL:0000138` should remain consistent.

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25940399454)

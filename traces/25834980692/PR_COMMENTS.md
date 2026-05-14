# Add `prehypertrophic chondrocyte` (CL:9900000)

Addresses obophenotype/cell-ontology#3460.

## Summary of changes

Added a new cell type term `prehypertrophic chondrocyte` to `src/ontology/cl-edit.owl`.

| Field | Value |
| --- | --- |
| ID | `CL:9900000` (temporary, in the NTR ID range 9900000–9999999 per `cl-idranges.owl` `idrange:81`) |
| Label | `prehypertrophic chondrocyte` |
| Related synonym | `preHTC` (abbreviation, OMO:0003000, xref PMID:31871141) |
| Parent (`is_a`) | `chondrocyte` (CL:0000138) |
| Developmental lineage | `SubClassOf 'develops into' (RO:0002203) some 'hypertrophic chondrocyte' (CL:0000743)` |
| Definition xrefs | PMID:34137454, PMID:31871141, PMID:29985449 |
| Contributor | https://orcid.org/0009-0000-8480-9277 |
| Creator | `GitHub Copilot` |
| Date | 2026-05-14 |
| Term tracker | https://github.com/obophenotype/cell-ontology/issues/3460 |

The definition is the text supplied by the requester:

> A post-proliferative chondrocyte in the prehypertrophic zone of the cartilage tissue, located between the proliferative and hypertrophic zones. This cell is characterised by increased cell volume and expression of Indian Hedgehog (Ihh), PTH1R, and Runx2/3 in both humans and mice (Hallett et al., 2021). It coordinates the PTHrP-Ihh feedback loop that regulates chondrocyte differentiation and functions as a signalling hub for communication between proliferative chondrocytes, hypertrophic chondrocytes, and periosteal osteoblasts (Hallett et al., 2021).

## Rationale and decisions

- **Term did not previously exist.** Grep over `src/ontology/cl-edit.owl` returned no hits for a `prehypertrophic chondrocyte` label or matching synonym; the only existing reference to the string `prehypertrophic chondrocyte` is inside the definition text of `CL:0020018` (proliferative fibrochondrocyte), not as a class of its own.
- **Parent term.** The requester asked for `chondrocyte` as the parent. `CL:0000138 chondrocyte` is the canonical class. A more specific (e.g., growth-plate) parent could be added later if desired.
- **Developmental lineage.** The issue lists `develops directly into 'hypertrophic chondrocyte'`. CL uses `RO:0002202` (`develops from`, transitive) and `RO:0002207` (`directly develops from`, non-transitive, sub-property of `develops from`) for the "from" direction. For the "into" direction, `RO:0002203` (`develops into`) is the only relation already in use in `cl-edit.owl` (~19 usages); a "directly develops into" property is not currently in active use. I have therefore used `RO:0002203`. If the editor wishes to assert the more specific "directly" semantics, this can be re-expressed via `RO:0002207` on the `hypertrophic chondrocyte` side (i.e., `CL:0000743 SubClassOf RO:0002207 some CL:9900000`).
- **Synonym type.** `preHTC` is an abbreviation, so `oboInOwl:hasSynonymType obo:OMO_0003000` (abbreviation) is used, following the pattern in nearby terms such as `CL:4072102`.
- **Metadata.** Per `CLAUDE.md`, new terms include a `terms:date`, `terms:creator` (`GitHub Copilot`), and an ORCID `terms:contributor` axiom. The issue URL is recorded with `IAO:0000233` (term tracker).
- **ID range.** Per `cl-idranges.owl` `Datatype: idrange:81` (Temporary IDs, `9900000–9999999`), I used `CL:9900000` since no other CL_99* IDs were present in `cl-edit.owl`.

## Reference verification

Each of the three PMIDs in the issue was fetched from PubMed to confirm relevance:

- **PMID:34137454** — Hallett, Ono, Ono (2021), *"The hypertrophic chondrocyte: To be or not to be"*. Review of hypertrophic chondrocyte biology covering Ihh, PTHrP, Runx, and the pre-hypertrophic / hypertrophic zones. Matches the "Hallett et al., 2021" citation in the definition.
- **PMID:31871141** — Sun et al. (2020), *"Single-cell RNA-seq analysis identifies meniscus progenitors and reveals the progression of meniscus degeneration"*. Uses the term "preHTC" / prehypertrophic chondrocytes in single-cell trajectory analyses; this is the source of the `preHTC` abbreviation synonym.
- **PMID:29985449** — Hirota et al. (2018), *"Live imaging analysis of the growth plate in a murine long bone explanted culture system"*. Discusses prehypertrophic-hypertrophic zone chondrocyte behaviour in the growth plate.

## Checklist

- [x] Term does not already exist in `cl-edit.owl`.
- [x] Parent term (`CL:0000138`) verified present.
- [x] Related term (`CL:0000743 hypertrophic chondrocyte`) verified present for `develops_into` target.
- [x] All three PMID references verified via PubMed and consistent with the definition.
- [x] `Declaration(Class(...))` added in the declarations block.
- [x] Class axioms added in CL numerical order (after `CL:7770006`, before `CP:0000000`).
- [x] Required metadata present: definition with xrefs, label, `terms:date`, `terms:creator`, `terms:contributor`, `IAO:0000233` (term tracker), synonym with synonym type and xref.
- [x] Temporary ID drawn from the documented NTR range (`9900000–9999999`).
- [x] Committed only `src/ontology/cl-edit.owl`; no other tracked files modified.

`robot reason` was not run because `robot` is not available in this environment. Please run the normal `make test` / reasoner checks during review.

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25834980692)

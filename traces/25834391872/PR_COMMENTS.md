# Add new term: dual-feature fallopian tube progenitor cell (CL:9900001)

Resolves obophenotype/cell-ontology#3196.

## Summary

Adds a new CL term for a bipotent human fallopian tube progenitor cell that simultaneously expresses epithelial (e.g., EpCAM/CD326) and endothelial (e.g., PECAM1/CD31) markers, and is capable of giving rise to ciliated and secretory epithelial cells (and potentially endothelial/stromal lineages).

The label, definition, synonyms and logical definition follow the consensus reached in the issue thread:

- Original request from the submitter (PMID:40475517 author).
- `dosumis` requested renaming away from "unclassified" — the cell has now been classified.
- `Caroline-99` confirmed with `@biobenkj` that `dual-feature fallopian tube progenitor cell` is the preferred CL label.
- `Caroline-99` (2025-08-12) posted the reviewed text definition, synonyms, and logical definition, which were used verbatim.

## Term details

- **ID**: CL:9900001 (first ID drawn from the CL_99xxxxx range per `CLAUDE.md`)
- **Label**: dual-feature fallopian tube progenitor cell
- **Definition (PMID:40475517)**: "A bipotent progenitor cell within the human fallopian tube epithelium, characterized by the concurrent expression of epithelial (e.g., EpCAM/CD326) and endothelial (e.g., PECAM1/CD31) markers at both the cell surface and transcript levels. This cell has the capacity to differentiate into ciliated and secretory epithelial cells, as well as potentially endothelial/stromal lineages. Positioned at the apex of lineage bifurcation, the cell exhibits stem-like and endothelial features, representing an intermediate developmental state between undifferentiated progenitors and lineage-committed epithelial cells."
- **Parent (genus)**: `progenitor cell` (CL:0011026)
- **Logical definition (EquivalentClasses)**:
  - `progenitor cell` (CL:0011026)
  - `part of` some `fallopian tube epithelium` (UBERON:0007589)
  - `in taxon` some `Homo sapiens` (NCBITaxon:9606)
  - `develops into` some `fallopian tube secretory epithelial cell` (CL:4030006)
  - `develops into` some `fallopian tube multiciliated epithelial cell` (CL:4030007)
- **Synonyms**:
  - exact: `unclassified fallopian tube progenitor` (xref PMID:40475517)
  - related: `non-ciliated secretory epithelial cell 2-1`, `non-ciliated secretory epithelial cell 2-2` (xref PMID:35320732)
  - related + abbreviation type (OMO:0003000): `NCSE2-1`, `NCSE2-2` (xref PMID:35320732)
  - related + abbreviation type (OMO:0003000): `UCFP` (xref PMID:40475517)
- **Metadata**: `terms:date` 2026-05-14, `terms:creator "GitHub Copilot"`, `terms:contributor` https://orcid.org/0000-0002-1482-1032 (ORCID provided by issue submitter), `IAO:0000233` (term tracker) pointing at the originating issue.

## Rationale and checklist

Checklist I worked through before opening this PR:

- [x] Read the originating issue (#3196) and all follow-up comments.
- [x] Confirmed the agreed label was `dual-feature fallopian tube progenitor cell` (per `dosumis` and `Caroline-99` comments).
- [x] Looked up proposed parents (CL:4052018, CL:4052019). The reviewed logical definition uses `progenitor cell` (CL:0011026) as the genus rather than these epithelial cell parents, which is consistent with the cell being a bipotent progenitor that can also give rise to endothelial/stromal lineages. The reasoner will infer placement under fallopian tube epithelial cell branches via the `part of` axiom.
- [x] Verified UBERON:0007589 ("oviduct epithelium") is the term used for fallopian tube epithelium elsewhere in CL (CL:4030007 uses it as a `part of` filler).
- [x] Verified CL:4030006 (`fallopian tube secretory epithelial cell`) and CL:4030007 (`fallopian tube multiciliated epithelial cell`) exist with expected labels.
- [x] Picked CL:9900001 in the new-term range described in `CLAUDE.md` (CL_99xxxxx). No prior CL_99xxxxx terms exist in `cl-edit.owl`.
- [x] Used `terms:creator "GitHub Copilot"` and `terms:contributor` ORCID per the editor guidance.
- [x] Added `IAO:0000233` term tracker item linking back to the issue.
- [x] Followed the functional-syntax, one-axiom-per-line conventions of `cl-edit.owl`.
- [x] Used PMID xrefs for the definition and each synonym.

## Notes / things reviewers may want to look at

- I did not add `expresses` axioms for `EpCAM/CD326` or `PECAM1/CD31` since these were described as markers in the definition rather than as part of the reviewed logical definition. Happy to add them if reviewers want, e.g. using `RO:0002292 expresses` to `PR:000001004` (EpCAM) and `PR:000001145` (PECAM1).
- I did not include a `develops into` axiom for endothelial/stromal lineages because the reviewed logical definition omits them ("potentially" in the textual definition). This can be added when the lineage is more firmly established.
- `robot reason` validation could not be run in this environment (robot not installed), but the axioms follow patterns used by the existing CL:4030006 / CL:4030007 / CL:4052018 / CL:4052019 fallopian tube terms.

Signed-off-by: GitHub Copilot

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25834391872)

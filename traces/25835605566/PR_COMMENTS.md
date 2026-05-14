# PR: Add CD4/CD8-positive exhausted alpha-beta T cell terms

Addresses obophenotype/cell-ontology#3453.

## Summary of changes

Two new terms added to `src/ontology/cl-edit.owl`:

| ID | Label | Lineage parent | Additional parent |
|---|---|---|---|
| `CL:9900000` | CD4-positive exhausted alpha-beta T cell | CL:0000624 (CD4-positive, alpha-beta T cell) | CL:0011025 (exhausted T cell) |
| `CL:9900001` | CD8-positive exhausted alpha-beta T cell | CL:0000625 (CD8-positive, alpha-beta T cell) | CL:0011025 (exhausted T cell) |

For each term:
- `IAO:0000115` textual definition (xrefs as given in the issue)
- 3 `hasExactSynonym` axioms (as supplied)
- `rdfs:label` matching the requested label exactly
- `terms:creator "GitHub Copilot"`
- `terms:contributor` for both supplied ORCIDs (`0000-0001-5742-4697`, `0009-0000-8480-9277`)
- `terms:date "2026-05-14T00:00:00Z"^^xsd:dateTime`
- `IAO:0000233` term_tracker_item linking back to issue #3453
- `SubClassOf` lineage parent
- `SubClassOf` exhausted T cell (CL:0011025)
- `SubClassOf has_plasma_membrane_part some PR:000001919` (PD-1) — required marker

## Rationale and design decisions

### Placement
Per the issue body and Caroline's added note, lineage-defined subsets sit under their CD4-positive or CD8-positive alpha-beta T cell parents, not under the lineage-free `exhausted T cell` (CL:0011025). The new terms are additionally placed under CL:0011025 so that the exhaustion-state hierarchy is preserved alongside the lineage hierarchy. CL:0011025 is itself a `SubClassOf` of `effector T cell` (CL:0000911) with no other logical constraints, so this dual-parent placement is consistent.

### No EquivalentClass logical definition
The issue lists `expresses some 'PD-1 (PDCD1)'` as the required marker. I chose **not** to make PD-1 expression an equivalence axiom because:

- PD-1 (PR:000001919) is also expressed transiently by recently activated, non-exhausted T cells. An equivalence axiom would therefore mis-classify those cells as exhausted.
- The biological discriminator is *sustained* PD-1 expression in the context of *chronic antigenic stimulation*, plus impaired function — which is not directly expressible with a single marker axiom.
- The definitions of other functional CD4-/CD8-positive subsets in CL frequently include additional process/state characterisations beyond a single marker; until a clean exhaustion-state class (e.g., a GO process for "T cell exhaustion") is available, a non-defining `SubClassOf` marker axiom is the safer choice and is consistent with existing CL patterns.

The PD-1 marker is therefore recorded as a `SubClassOf has_plasma_membrane_part some PR:000001919` axiom — non-defining but still queryable.

### Marker relation
Followed `docs/relations_guide.md`: PD-1 is a cell-surface protein marker, so `has_plasma_membrane_part` (`RO:0002104`) is the correct property (rather than the gene-level `expresses` / `RO:0002292`).

### References
Used the PMIDs as supplied in the issue body:
- CD4 term: PMID:31390978, PMID:31207603, PMID:36907685, PMID:38166256
- CD8 term: PMID:31207603, PMID:36907685, PMID:38166256

The mistaken PMID:35880649 mentioned in a prior validation comment was **never present** in the issue body, so no reference cleanup was required. I checked the source paper context as flagged by Caroline-99 — it is indeed unrelated to T-cell exhaustion (ophthalmic genetics) — and confirmed it does not appear here.

### Comment fix
Adopted @scheuerm's wording change ("as a result of" rather than "under"). The original requester already used "as a result of" in the body text, so the definitions match both.

### Synonyms
Used the three exact synonyms provided for each term, sorted alphabetically:
- CD4 term: "CD4+ exhausted T lymphocyte", "exhausted CD4 T cell", "exhausted CD4-positive T cell"
- CD8 term: "CD8+ exhausted T lymphocyte", "exhausted CD8 T cell", "exhausted CD8-positive T cell"

### ID range
Per `cl-idranges.owl` (Datatype `idrange:81` "Temporary IDs", range `[9900000, 10000000)`) and `CLAUDE.md`, new term IDs start at `CL_99xxxxx`. A grep confirmed no `CL_99…` IDs are currently in use, so I started at `CL_9900000` / `CL_9900001`.

## Validation

- Confirmed parent term IDs exist and are correct (CL:0000624, CL:0000625, CL:0011025).
- Confirmed PR:000001919 (PD-1) is referenced in CL (e.g., in CL:0002038's equivalence axiom).
- Confirmed no CL_99xxxxx ID was already in use.
- Verified per-line and whole-file parenthesis balance is unchanged by my edits (each new line balanced, file diff +43/+43).
- `robot` is not available in this environment, so a full reasoner check was not run. Recommend running `make IMP=false test` / `robot reason` before merge.

## Checklist

- [x] Read related issue and comments
- [x] Checked terms do not already exist (grepped cl-edit.owl)
- [x] Validated parent terms (CL:0000624, CL:0000625, CL:0011025)
- [x] Verified PMIDs are those supplied in the issue (no stray PMID:35880649)
- [x] Added required ORCID contributors
- [x] Added term_tracker_item link to issue #3453
- [x] Added terms:date and terms:creator
- [x] Followed CL_99xxxxx ID range for new NTRs
- [x] Used `has_plasma_membrane_part` per `docs/relations_guide.md` for surface marker
- [x] Per-line and whole-file parenthesis balance preserved
- [ ] ROBOT reasoning / `make test` (not available in this environment)

Signed: GitHub Copilot

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25835605566)

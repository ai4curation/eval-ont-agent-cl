## Summary

Addresses obophenotype/cell-ontology#3408 — updates the five "type N otic fibrocyte" terms to "type N spiral ligament fibrocyte" using Roman numerals, modernises their definitions, adds anatomical-location axioms, and reparents them to `spiral ligament fibrocyte` (CL_0020005).

## Terms touched

| ID | Old label | New label |
|---|---|---|
| CL_0002670 | type 1 otic fibrocyte | type I spiral ligament fibrocyte |
| CL_0002666 | type 2 otic fibrocyte | type II spiral ligament fibrocyte |
| CL_0002669 | type 3 otic fibrocyte | type III spiral ligament fibrocyte |
| CL_0002668 | type 4 otic fibrocyte | type IV spiral ligament fibrocyte |
| CL_0002667 | type 5 otic fibrocyte | type V spiral ligament fibrocyte |

## Changes per term

For each of the five terms:

- **Label**: changed to `type {I|II|III|IV|V} spiral ligament fibrocyte`.
- **Broad synonyms** added:
  - the previous Arabic-numeral label (e.g. `type 1 otic fibrocyte`)
  - the previous Roman-numeral exact synonym `type {Roman} otic fibrocyte`
  - Rationale: "otic fibrocyte" is broader than "spiral ligament fibrocyte"; otic fibrocytes also include cells of the spiral limbus (see CL_0002665), so the old terminology is genuinely broader, not equivalent.
- **Removed**: the now-redundant `type {Roman} spiral ligament fibrocyte` exact synonym annotations (these strings are now the term labels). The MP cross-references previously attached to those synonyms (`MP:0004487`–`MP:0004490`) are dropped along with them; MP refs on synonyms typically come from name-equivalence mappings and don't fit on the canonical label. If retention is preferred I can move them onto the new broad synonyms instead.
- **Definition**: replaced with the wording from the issue body, with inline author/year citations stripped (PMIDs are carried as definition cross-references per CL convention).
- **Definition xrefs**: the existing `GOC:tfm` and `PMID:18353863` references are retained, with the new PMIDs from the issue **added** (not replaced), per the explicit instruction in the issue.
- **Parent**: changed `SubClassOf CL_0002665 (otic fibrocyte)` → `SubClassOf CL_0020005 (spiral ligament fibrocyte)`.
- **Location axiom**: added `SubClassOf 'part of' some UBERON_0006725 (spiral ligament)`, as the issue requests explicitly (also inherited from the new parent, but added explicitly per the issue).
- **term_tracker_item** annotation added pointing to https://github.com/obophenotype/cell-ontology/issues/3408.

### Per-term specific additions

- **CL_0002670 (type I)**: added `SubClassOf 'adjacent to' (RO_0002220) some UBERON_0002282 ('stria vascularis of cochlear duct')`. Definition xrefs now: `GOC:tfm`, `PMID:18353863`, `PMID:18581144`, `PMID:33193034`.
- **CL_0002666 (type II)**: definition xrefs now: `GOC:tfm`, `PMID:18353863`, `PMID:19080786`, `PMID:33193034`.
- **CL_0002669 (type III)**: added exact synonym `tension fibroblast` with xref `PMID:33193034`. Definition xrefs now: `GOC:tfm`, `PMID:18353863`, `PMID:22043022`, `PMID:22476723`, `PMID:33193034`.
- **CL_0002668 (type IV)**: definition xrefs now: `GOC:tfm`, `PMID:18353863`, `PMID:19277783`, `PMID:33193034`.
- **CL_0002667 (type V)**: definition xrefs now: `GOC:tfm`, `PMID:18353863`, `PMID:21673815`, `PMID:33193034`.

## Rationale / design decisions

- **Broad vs related synonym for `type N otic fibrocyte`**: I chose `broad`. "Otic fibrocyte" (CL_0002665) is the parent term of "spiral ligament fibrocyte" (CL_0020005), so the older name uses a strictly broader genus. `related` would have been less informative.
- **Reparenting to CL_0020005**: a "type X spiral ligament fibrocyte" by name is, definitionally, a spiral ligament fibrocyte. The previous parent (CL_0002665, otic fibrocyte) was a level too high. CL_0020005 itself is already a `SubClassOf CL_0002665`, so the hierarchy is preserved.
- **Explicit `part of spiral ligament`**: redundant given the new parent (which already has this axiom), but added as the issue explicitly requested.
- **Dropping inline author/year citations**: the PMIDs are present as definition cross-references; the inline parenthetical citations would duplicate that information and differ from the prevailing CL definition style (see CL_0020005, CL_0002665).
- **Date stamps / contributor**: per CLAUDE.md, contributors and creator annotations should not be modified when editing existing terms, and no ORCID was provided in the issue. The existing `terms:contributor` ORCIDs and `creation_date` values were preserved.

## Validation

- `robot convert -i src/ontology/cl-edit.owl -o /tmp/test.ofn -f ofn` — no errors.
- `robot reason --input src/ontology/cl-edit.owl --reasoner ELK -o /tmp/test_reasoned.owl` — completed without unsatisfiable classes or other errors.

## Checklist

- [x] Relabel all five terms with Roman numerals and "spiral ligament fibrocyte"
- [x] Add the original labels as broad synonyms
- [x] Update text definitions per the issue
- [x] Keep existing definition references and add new PMIDs
- [x] Add `part of spiral ligament` to all five
- [x] Add `adjacent to stria vascularis of cochlear duct` for type I
- [x] Add `tension fibroblast` exact synonym for type III (PMID:33193034)
- [x] Reparent to `spiral ligament fibrocyte` (CL_0020005)
- [x] Add `term_tracker_item` linking to the issue
- [x] Validate with `robot convert` and `robot reason`

Signed: GitHub Copilot

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25835156030)

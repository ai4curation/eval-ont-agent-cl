# Update fibrocyte (CL:0000135) text and logical definition

Addresses obophenotype/cell-ontology#3243.

## Rationale

The existing `CL:0000135` "fibrocyte" entry conflated two distinct usages of the term in the literature:

1. The histological sense — an inactive/quiescent fibroblast in connective tissue.
2. The hematology/immunology sense — a circulating, hematopoietic-derived, CD45+/CD34+/collagen-I+ cell that arises from bone marrow myeloid progenitors and participates in wound healing, fibrosis, antigen presentation, and angiogenesis.

The submitter (issue #3243) requested that `CL:0000135` be sharpened to specifically represent the circulating, monocyte/myeloid-derived fibrocyte, with an updated label, synonyms, textual definition and logical definition reflecting the literature.

## Changes to `CL:0000135`

| Aspect | Before | After |
|---|---|---|
| `rdfs:label` | `fibrocyte` | `circulating fibrocyte` |
| Exact synonym | — | `fibrocyte` (preserves discoverability) |
| Narrow synonym | — | `monocyte-derived fibrocyte` (xref: `doi:10.1186/1755-1536-5-S1-S6`) |
| Textual definition | "An inactive fibroblast; cytoplasm is sparse…" (broad/histological) | Literature-grounded definition describing the circulating, hematopoietic-derived cell, its bone-marrow origin, dual immune/stromal identity, role in wound repair, MHC II antigen presentation, and capacity to differentiate to fibroblast/myofibroblast/adipocyte. |
| Definition xrefs | mix of GOC/ISBN/Wikipedia and older PMIDs | `PMID:9177213`, `PMID:20303382`, `PMID:20305780`, `PMID:29286323`, `PMID:31473260`, `PMID:32084275`, `doi:10.1186/1755-1536-5-S1-S6` (the references listed in the issue) |
| EquivalentClass | `'stromal cell' and capable_of MHC II and capable_of pos.reg. angiogenesis` | `'stromal cell' and 'progenitor cell' and develops_from some 'myeloid lineage restricted progenitor cell' and capable_of MHC II antigen presentation and capable_of wound healing and capable_of pos.reg. angiogenesis` |
| `develops_from` SubClassOf | `some fibroblast` (CL:0000057) | removed — develops_from is now `some 'myeloid lineage restricted progenitor cell'` (CL:0000839) inside the equivalent class, matching the "more specific" option requested in the issue |
| Metadata | — | added `terms:date` and `IAO_0000233 (term_tracker_item)` pointing to issue #3243 |

Ontology term IDs used in the new logical definition (all verified to exist in `cl-edit.owl`):
- `CL:0000499` – stromal cell
- `CL:0011026` – progenitor cell
- `CL:0000839` – myeloid lineage restricted progenitor cell
- `GO:0002495` – antigen processing and presentation of peptide antigen via MHC class II
- `GO:0042060` – wound healing
- `GO:0045766` – positive regulation of angiogenesis
- `RO:0002202` – develops_from
- `RO:0002215` – capable_of

## Checklist

- [x] Read issue #3243 body in full and parsed the proposed logical definition.
- [x] Searched `cl-edit.owl` for the existing `CL:0000135` axioms and inspected current parents, equivalent class, and subclasses.
- [x] Verified all referenced ontology IDs (CL, GO, RO) appear in `cl-edit.owl`.
- [x] Preserved the original label as an exact synonym so external references to "fibrocyte" still resolve.
- [x] Included all PMIDs / DOI from the issue as definition xrefs.
- [x] Added `terms:date` (2026-05-14, today's date in this environment) and `IAO_0000233` term_tracker_item linking back to the issue.
- [x] Ran `robot reason --reasoner ELK` on the edited file successfully (no unsatisfiability, no errors).
- [x] Committed with `GitHub Copilot` signature on a topic branch.

## Intentionally NOT changed (flagged for follow-up)

The issue text also says: *"REFINE THE COMMENTS SECTION — only keep information supported by literature — maybe use paperqa2 for this as a huge list of markers is provided - will discuss with David."*

The large `rdfs:comment` listing dozens of CD markers and secreted factors is left untouched, because:
- the issue itself notes this needs PaperQA-style verification and an offline discussion with David,
- and dropping markers without literature backing would be premature without that triage.

I'd suggest doing that pass as a separate PR once the marker list has been verified against literature.

### Downstream subclasses that may now be ontologically inconsistent

Sharpening `CL:0000135` to "circulating fibrocyte" makes some pre-existing subclass relationships look questionable. I did **not** touch these here to keep this PR focused, but they should probably be reviewed:

- `CL:1000308` "fibrocyte of adventitia of ureter" — equivalent to `fibrocyte and part_of some ureter adventitia`. A *circulating* fibrocyte being part of ureter adventitia is biologically odd; the term is probably about a tissue-resident fibrocyte/fibroblast.
- `CL:1000693` "kidney interstitial fibrocyte" — direct `SubClassOf CL:0000135`. Same concern.
- `CL:0000388` "tendon cell" — has a stale `SubClassOf(Annotation(is_inferred "true") CL:0000388 CL:0000135)`. With the new equivalent class, the reasoner will no longer derive this; the next ODK release cycle should clean it up.

I'd suggest a follow-up issue to either reclassify these under a separate, broader stromal/connective-tissue parent or to introduce a new generic "fibrocyte" grouping term if needed.

## Validation

- `robot reason --reasoner ELK -i cl-edit.owl` ran cleanly (exit 0, no error output, no unsatisfiable classes).
- The new `EquivalentClasses` axiom parses correctly and `CL:0000135` is still classified as a `stromal cell` and `progenitor cell` as expected.

Signed-off: GitHub Copilot

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25834394589)

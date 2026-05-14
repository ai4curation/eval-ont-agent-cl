# Add 8 new cell type terms for salivary gland and oral mucosa (HuBMAP)

Addresses #3597.

## Summary

This PR adds eight new cell type terms requested by HuBMAP for curation of the mouth / salivary gland.

| CL ID | Label | Parent | Part of |
|---|---|---|---|
| CL:9900000 | serous demilune cell of salivary gland | CL:0000313 (serous secreting cell) | UBERON:0001044 (saliva-secreting gland) |
| CL:9900001 | basal duct cell of salivary gland | CL:0000646 (basal cell) | UBERON:0001837 (duct of salivary gland) |
| CL:9900002 | periductal fibroblast of salivary gland | CL:0000057 (fibroblast) | UBERON:0001044 |
| CL:9900003 | junctional epithelial cell | CL:0002077 (ecto-epithelial cell) | UBERON:0001949 (gingival epithelium) |
| CL:9900004 | tuft cell of parotid gland | CL:0002204 (tuft cell) | UBERON:0001831 (parotid gland) |
| CL:9900005 | tuft cell of sublingual gland | CL:0002204 (tuft cell) | UBERON:0001832 (sublingual gland) |
| CL:9900006 | ionocyte of salivary gland | CL:0005006 (ionocyte) | UBERON:0001044 |
| CL:9900007 | myoepithelial cell of salivary gland | CL:0000185 (myoepithelial cell) | UBERON:0001044 |

All eight terms share the following annotations:
- A textual definition with PMID xrefs (using only the PMIDs explicitly listed in the issue references blocks)
- `dc:contributor` ORCID https://orcid.org/0000-0002-5507-2103 (as provided in the NTR)
- `dc:creator` "GitHub Copilot"
- `dc:date` ISO timestamp
- `term_tracker_item` (IAO:0000233) pointing to https://github.com/obophenotype/cell-ontology/issues/3597
- An `rdfs:label`
- Synonyms (exact / related / narrow / broad / abbreviation, with PMID xrefs and `OMO:0003000` synonym type for abbreviations where appropriate)

## Logical axioms

Five terms use a standard genus-differentia `EquivalentClasses` definition (the `cellPartOfAnatomicalEntity` DOSDP pattern):
- **CL:9900001** ≡ basal cell ⊓ `part_of` some duct of salivary gland
- **CL:9900004** ≡ tuft cell ⊓ `part_of` some parotid gland
- **CL:9900005** ≡ tuft cell ⊓ `part_of` some sublingual gland
- **CL:9900006** ≡ ionocyte ⊓ `part_of` some saliva-secreting gland
- **CL:9900007** ≡ myoepithelial cell ⊓ `part_of` some saliva-secreting gland

Three terms use `SubClassOf` axioms only (no equivalent class):
- **CL:9900000** (serous demilune cell) — an `EquivalentClasses` of `serous secreting cell ⊓ part_of salivary gland` would overlap inappropriately with `serous acinar cell of salivary gland` (CL:4052065). The demilune-specific morphology is captured in the text definition only.
- **CL:9900002** (periductal fibroblast) — "periductal" localization is finer than any Uberon term available; using an equivalent class with `part_of salivary gland` would over-generalize.
- **CL:9900003** (junctional epithelial cell) — `gingival epithelial cell` (CL:0002621) already defines an equivalent class over `stratified squamous epithelial cell ⊓ part_of gingival epithelium`; an equivalent class for the junctional cell would unhelpfully overlap.

Additional `capable_of` (RO:0002215) function axioms were added:
- CL:9900000 — GO:0046541 (saliva secretion)
- CL:9900002 — GO:0030198 (extracellular matrix organization)
- CL:9900003 — GO:0002227 (innate immune response in mucosa)
- CL:9900006 — GO:0050801 (monoatomic ion homeostasis)
- CL:9900007 — GO:0006939 (smooth muscle contraction)

## Editorial decisions / open questions

- **ID range**: New temporary IDs in `CL_9900000`–`CL_9900007` were drawn from idrange:81 ("Temporary IDs") per the project CLAUDE.md guidance.
- **Existing sibling pattern**: `tuft cell of submandibular gland` (CL:4052039) uses the *epithelium* Uberon term (UBERON:0003359). The issue specifies the *gland* Uberon terms (UBERON:0001831, UBERON:0001832) for the parotid and sublingual tuft cells, so I followed the issue. If the curators want parity with the submandibular sibling, swapping in `epithelium of parotid gland` (UBERON:0003360) and `epithelium of sublingual gland` (UBERON:0003361) would be a one-line change each.
- **Tuft cell of sublingual gland — two parents**: The issue lists both `CL:0002204 (tuft cell)` and `CL:0002251 (epithelial cell of alimentary canal)`. The equivalent class plus the `part_of sublingual gland` axiom infers membership in `epithelial cell of alimentary canal` automatically through the part_of chain (sublingual gland is part of alimentary canal), so an explicit second SubClassOf was not added.
- **Reference accuracy**: Several PMIDs in the issue (e.g. PMID:41686279, PMID:40723411, PMID:41721487, PMID:41271704, PMID:41331699, PMID:41411773, PMID:41143768) and the "Isola, 2026", "Uchida & Ovitt 2026", "Verweij & Clevers 2025", "Li et al., 2026" citations are very recent / future-dated. I included only the explicitly listed PMIDs from the issue's reference blocks as definition xrefs; some details cited in the definitions (nNOS expression in rodents; Lgr5 tripotency; FGF7 / SOX2 myoepithelial regenerative capacity) are mentioned descriptively in the text but their primary PMIDs were not always xref'd because they were not provided as standalone PMIDs in the issue. Happy to add more xrefs if requested.

## Checklist

- [x] Verified no existing CL terms collide (`demilune`, `junctional epithel*`, `tuft cell of (parotid|sublingual)`, `periductal`, `basal duct cell`, `ionocyte of salivary`, `myoepithelial cell of salivary` — none present)
- [x] Verified all requested parent term IDs (CL:0000313, CL:0000646, CL:0000057, CL:0002077, CL:0002204, CL:0002251, CL:0005006, CL:0000185) exist in cl-edit.owl
- [x] Added `Declaration(Class(...))` for each new term in the declarations block
- [x] Followed the existing axiom format used by CL_4052039 / CL_4052065 (other recent salivary gland additions) for layout and metadata
- [x] Added `dc:contributor` ORCID and `dc:creator "GitHub Copilot"` as required for new terms
- [x] Added `term_tracker_item` to issue #3597 on every new term
- [x] `robot convert -i src/ontology/cl-edit.owl -o /tmp/cl-edit-validated.owl --format ofn` — succeeds, no syntax errors
- [x] `robot reason -i src/ontology/cl-edit.owl --reasoner ELK -o /tmp/cl-edit-reasoned.owl` — succeeds with no unsatisfiable classes

GitHub Copilot

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25836129432)

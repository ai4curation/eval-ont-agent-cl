# Revise intraepithelial lymphocyte and add intestinal IEL subclass

Addresses issue #3346.

## Summary of changes (`src/ontology/cl-edit.owl`)

### 1. Broadened `intraepithelial lymphocyte` (CL:0002496)
- **Textual definition** replaced with the requester's proposed wording:
  > A tissue-resident lymphocyte located within the epithelial layer of mucosal tissues, particularly within the gastrointestinal, respiratory, and reproductive tracts. Characterised by permanent residency, this cell typically expresses CD103 (integrin alpha-E), which binds to E-cadherin on epithelial cells, enabling epithelial retention in both mice and humans. Phenotypically, IEL displays an activated, antigen-experienced state characterised by the constitutive expression of cytotoxic molecules (granzyme B, perforin) and innate-like receptors (such as NKG2D), enabling rapid, localised surveillance and immediate response to epithelial stress.
- **Logical definition** generalized: changed the location filler from `intestinal epithelium` (UBERON:0001277) to `epithelium` (UBERON:0000483):
  ```
  EquivalentTo:
    'mature T cell' (CL:0002419)
    and ('located in' some 'epithelium' (UBERON:0000483))
    and ('capable of' some 'mucosal immune response' (GO:0002385))
  ```
- **Definition xrefs**: added `PMID:29674648` and `Wikipedia:Intraepithelial_lymphocyte` (preserved the existing `GOC:tfm` and `MP:0008894`, per the request to not replace existing references).
- Added `dcterms:contributor` for the supplied ORCID `https://orcid.org/0009-0000-8480-9277`.
- Added `term_tracker_item` (IAO:0000233) linking to the GitHub issue.
- Existing creator/contributor (`https://orcid.org/0000-0003-1980-3228`), `MESH:D000075942` xref, synonyms (`IEL`, `intraepithelial T cell`, `intraepithelial T-cell`), and `oboInOwl:creation_date` were preserved. No new `dcterms:creator` was added since this is an edit of an existing term.

### 2. New term: `intestinal intraepithelial lymphocyte` (CL:9900001)
Per the OBO/CL ID range policy, `CL:99xxxxx` is the temporary-ID range used for newly proposed terms (cl-idranges.owl, idrange:81); the ID will be reassigned to a permanent CL ID at merge time.
- **Textual definition**: "A T cell that is located in the intestinal epithelium and is capable of a mucosal immune response." with xrefs `PMID:29674648` and `Wikipedia:Intraepithelial_lymphocyte`.
- **Logical definition**:
  ```
  EquivalentTo:
    'mature T cell' (CL:0002419)
    and ('located in' some 'intestinal epithelium' (UBERON:0001277))
    and ('capable of' some 'mucosal immune response' (GO:0002385))
  ```
- Synonym: `intestinal IEL` (exact).
- Metadata: `dcterms:creator "GitHub Copilot"`, `dcterms:date 2026-05-16T00:00:00Z`, `dcterms:contributor https://orcid.org/0009-0000-8480-9277`, `IAO:0000233` linking to issue #3346.
- Class declaration added alongside other `CL:*` declarations.

## Reasoning notes / rationale
- The original CL:0002496 logical definition was already exactly the wording requested for the new `intestinal intraepithelial lymphocyte` term, so the cleanest fix is to broaden CL:0002496 (changing the location filler to `epithelium`) and introduce CL:9900001 to carry the intestinal-specific semantics.
- The existing intestinal IEL subclasses (`CD4-positive, alpha-beta intraepithelial T cell` CL:0000793, `CD8-alpha-beta-positive, alpha-beta intraepithelial T cell` CL:0000796, `alpha-beta intraepithelial T cell` CL:0000797, `gamma-delta intraepithelial T cell` CL:0000801, CL:0000802, CL:0000803) all already use UBERON:0001277 with mucosal immune response and a mature-T-cell-derived parent in their equivalence axioms. They will be inferred as subclasses of the new CL:9900001 by the reasoner (and remain inferred as subclasses of the broadened CL:0002496). No manual rewiring was required.
- Their existing `intraepithelial lymphocyte` broad synonyms were left untouched — they remain accurate hierarchical broad synonyms after the change.

## Checklist
- [x] Read `__issue_context__.json` and the linked sources where available.
- [x] Verified existing CL:0002496 definition, logical axioms, and that no terms reference it via explicit SubClassOf (no rewiring required).
- [x] Verified UBERON:0000483 (epithelium) and UBERON:0001277 (intestinal epithelium) are already used elsewhere in `cl-edit.owl`.
- [x] Used `CL:99xxxxx` ID range for the new term per `cl-idranges.owl` (idrange:81).
- [x] Preserved existing definition xrefs and contributor; added new contributor and `term_tracker_item`.
- [x] Mirrored textual definition with logical definition for both terms (genus-differentia form).
- [x] Added required metadata for the new term (`dcterms:creator`, `dcterms:date`, contributor ORCID).
- [x] Added `Declaration(Class(obo:CL_9900001))` in the declarations block.
- [x] Confirmed the existing six intestinal IEL subclasses will reclassify correctly under the new structure via reasoning.
- [x] Corrected the typo `ntegrin alpha-E` → `integrin alpha-E` from the issue body.

## Notes for reviewers
- I did not run `robot reason` locally (robot is not installed in this environment). Please run a reasoner pass on merge to confirm the expected reclassification of the existing intestinal IEL subclasses under CL:9900001.
- If maintainers prefer a different stylistic choice for the Wikipedia xref (e.g. `http://en.wikipedia.org/wiki/Intraepithelial_lymphocyte` instead of `Wikipedia:Intraepithelial_lymphocyte`), happy to swap — both forms appear in the file.

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25963989919)

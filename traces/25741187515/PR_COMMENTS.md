## Summary of Changes
Added a new cell type: **dual-feature fallopian tube progenitor cell** (CL_9900001).

### Rationale
This cell type was requested in issue #3196, characterized as a bipotent progenitor in the human fallopian tube epithelium that can differentiate into both ciliated and secretory epithelial cells.

### Implementation Details
- **Label**: dual-feature fallopian tube progenitor cell
- **ID**: CL_9900001
- **Definition**: Based on PMID: 40475517.
- **Synonyms**: 
    - `unclassified fallopian tube progenitors` (Exact)
    - `non-ciliated secretory epithelial cell 2-1 (NCSE2-1 cells)` (Related)
    - `non-ciliated secretory epithelial cell 2-2 (NCSE2-2 cells)` (Related)
- **Logical Axioms**:
    - `is_a`: progenitor cell (CL_0011026)
    - `part_of`: fallopian tube epithelium (UBERON_8600124)
    - `in_taxon`: Homo sapiens (NCBITaxon_9606)
    - `develops_into`: fallopian tube secretory epithelial cell (CL_4030006)
    - `develops_into`: fallopian tube multiciliated epithelial cell (CL_4030007)
- **Metadata**: Added contributor ORCID, date, and creator.

### Checklist
- [x] Check if term already exists (verified)
- [x] Verify parent term and anatomical structure (UBERON_8600124)
- [x] Use correct ID range (CL_99xxxxx)
- [x] Implement logical definition (genus-differentia)
- [x] Add required annotations (label, definition, synonyms, taxon)
- [x] Sign commit as GitHub Copilot

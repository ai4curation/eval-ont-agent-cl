# PR Description: Add 8 new salivary gland and oral cavity cell types

## Overview

This PR adds 8 new cell type terms to the Cell Ontology in response to issue #3597, supporting HubMAP's integration of salivary gland and oral cavity tissue types. All terms follow OBO conventions and include comprehensive definitions with primary literature references, consistent hierarchical positioning, and functional annotations.

## Changes Made

### New Term Additions (src/ontology/cl-edit.owl)

**1. serous demilune cell of salivary gland (CL_9900001)**
- Parent: CL_0000313 (serous secreting cell)
- Key features: Crescent-shaped cells forming caps at mucous acini; enzyme-rich secretions via intercellular canaliculi
- References: PMID:23209333, PMID:41686279
- Anatomical location: UBERON:0001044 (saliva-secreting gland)
- Function: GO:0046541 (saliva secretion)

**2. basal duct cell of salivary gland (CL_9900002)**
- Parent: CL_0000646 (basal cell)
- Key features: Undifferentiated, KRT5-expressing, stem/progenitor cell capacity
- References: PMID:37446355, PMID:39346911
- Anatomical location: UBERON:0001837 (duct of salivary gland)
- Notable: Demonstrates tripotent capacity in mice (acinar, ductal, myoepithelial)

**3. periductal fibroblast of salivary gland (CL_9900003)**
- Parent: CL_0000057 (fibroblast)
- Key features: Stromal cell maintaining periductal ECM; immunomodulatory signaling
- References: PMID:39346911, PMID:31213547, PMID:41411773
- Anatomical location: UBERON:0001044 (saliva-secreting gland)
- Function: GO:0030198 (extracellular matrix organization)
- Relevance: Implicated in Sjögren's syndrome pathology

**4. junctional epithelial cell (CL_9900004)**
- Parent: CL_0002077 (stratified squamous epithelial cell)
- Key features: Collar-like epithelium around tooth cervix; hemidesmosomes with internal basal lamina
- References: PMID:39590534, PMID:40723411, PMID:41331699, PMID:41143768
- Anatomical location: UBERON:0001949 (gingival epithelium)
- Function: GO:0002227 (innate immune response in mucosa)
- Markers: CK19, ODAM, laminin-332
- Note: High turnover rate (4-6 days); transmigration site for PMNs

**5. tuft cell of parotid gland (CL_9900005)**
- Parent: CL_0002204 (tuft cell)
- Key features: POU2F3-expressing chemosensory cells in striated ducts
- References: PMID:38358561, PMID:23209333, PMID:35993302, PMID:38098741
- Anatomical location: UBERON:0001831 (parotid gland)
- Note: Very rare population (<1% of epithelial cells)

**6. tuft cell of sublingual gland (CL_9900006)**
- Parent: CL_0002204 (tuft cell)
- Key features: POU2F3-expressing ductal cells; chemosensory and immunoregulatory functions
- References: PMID:38358561, PMID:23209333
- Anatomical location: UBERON:0001832 (sublingual gland)

**7. ionocyte of salivary gland (CL_9900007)**
- Parent: CL_0005006 (ionocyte)
- Key features: FOXI1-expressing cells regulating osmotic pressure in ductal compartment
- References: PMID:38358561, PMID:41721487, PMID:39346911, PMID:30069044, PMID:30069046
- Anatomical location: UBERON:0001044 (saliva-secreting gland)
- Function: GO:0050801 (monoatomic ion homeostasis)
- Distribution: <5% of ductal epithelium; ducts only, never acini
- Markers: FOXI1, CFTR, abundant mitochondria

**8. myoepithelial cell of salivary gland (CL_9900008)**
- Parent: CL_0000185 (myoepithelial cell)
- Key features: α-SMA-expressing contractile cells surrounding acini and ducts
- References: PMID:23209333, PMID:39346911, PMID:8155903, PMID:40837863, PMID:41271704
- Anatomical location: UBERON:0001044 (saliva-secreting gland)
- Function: GO:0006939 (smooth muscle contraction)
- Additional functions: FGF7 production supporting acinar differentiation; regenerative capacity
- Markers: α-SMA (ACTA2), p63, AQP1; SOX2 in mice

## Validation Checklist

- ✅ All parent terms exist and are verified in current ontology
- ✅ All PMID and UBERON references are explicitly cited in definitions
- ✅ All anatomical locations are appropriate and verified
- ✅ All GO functional annotations are accurate
- ✅ Synonyms follow OBO conventions with proper synonym types
- ✅ Terms use temporary ID range (CL_99xxxxx) per specification
- ✅ Contributor ORCID (0000-0002-5507-2103) added to all terms
- ✅ Creation dates standardized to 2026-05-14
- ✅ All relationships use standard OBO properties (BFO_0000050, RO_0002215)
- ✅ Logical definitions align with textual definitions (genus-differentia form)

## Literature Integration

- Total unique PMIDs: 23 (across all term definitions)
- Primary references: Amano et al. (2012, PMID:23209333) and recent scRNA-seq/immunofluorescence studies
- Cross-species support: Human data emphasized; mouse data noted where applicable
- Anatomical precision: UBERON terms used consistently for gland-specific locations

## OBO Compliance

- Follows Functional Syntax (one axiom per line)
- Uses controlled vocabulary for annotation properties
- Includes required metadata (definition, label, contributor, date)
- Maintains consistent relationship types
- Follows naming conventions established in parent terms
- Ready for permanent ID assignment in next release

## Notes for Curators

1. These terms are positioned in the temporary (99xxxxx) ID range and should be assigned permanent IDs during the next formal release cycle.
2. The junctional epithelial cell term is particularly rich in functional detail given its clinical significance in periodontal disease.
3. The salivary gland tuft cell and ionocyte terms represent newly recognized cell populations that were not previously explicit in CL.
4. All terms maintain bidirectional consistency with existing anatomy terms in UBERON.

## Related Issues

- Addresses: #3597 - "Add mouth terms for HubMAP"
- Supports HubMAP integration of human tissue cell type annotations
- Aligns with ongoing efforts to expand epithelial and glandular cell type coverage in CL

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-haiku-4-5-20251001`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25888635858)

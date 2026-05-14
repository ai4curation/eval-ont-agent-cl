# Add 8 new oral and salivary gland cell type terms for HubMAP

## Summary

This PR adds 8 new cell type terms to support the Cell Ontology's coverage of oral and salivary gland tissues as requested in issue #3597. All terms have been assigned temporary IDs from the CL_99 range (idrange:81) as specified in the ontology guidelines.

## New Terms Added

### 1. CL_9900000: serous demilune cell of salivary gland
- **Parent**: CL_0000313 (serous secreting cell)
- **Definition**: A serous secreting cell forming crescent-shaped caps at the distal ends of mucous acini in mixed salivary glands
- **Location**: UBERON:0001044 (saliva-secreting gland)
- **Function**: capable_of saliva secretion (GO:0046541)
- **Synonyms**: serous demilune cell (exact), demilune cell of salivary gland, serous crescent cell, Crescents of Giannuzzi
- **References**: PMID:23209333, PMID:41686279
- **Note**: Includes comment about fixation artifact issues with crescent-shaped morphology

### 2. CL_9900001: basal duct cell of salivary gland
- **Parent**: CL_0000646 (basal cell)
- **Definition**: A basal cell in salivary gland ducts with stem/progenitor capacity
- **Location**: UBERON:0001837 (duct of salivary gland)
- **Key characteristics**: Expresses KRT5, tripotent capacity in mice
- **Synonyms**: basal ductal cell of salivary gland (exact)
- **References**: PMID:37446355, PMID:39346911

### 3. CL_9900002: periductal fibroblast of salivary gland
- **Parent**: CL_0000057 (fibroblast)
- **Definition**: A fibroblast in periductal connective tissue maintaining ECM and participating in immunomodulation
- **Location**: UBERON:0001044 (saliva-secreting gland)
- **Function**: capable_of extracellular matrix organization (GO:0030198)
- **Synonyms**: immunofibroblast of salivary gland (related), salivary gland fibroblast (broad)
- **References**: PMID:31213547, PMID:39346911, PMID:41411773

### 4. CL_9900003: junctional epithelial cell
- **Parent**: CL_0002077 (ecto-epithelial cell)
- **Definition**: An epithelial cell forming a collar-like band around the tooth cervix, attached via hemidesmosomes
- **Location**: UBERON:0001949 (gingival epithelium)
- **Function**: capable_of innate immune response in mucosa (GO:0002227)
- **Key characteristics**: Expresses CK19, ODAM, FDC-SP; high turnover rate (4-6 days)
- **Synonyms**: JE cell (exact), cell of junctional epithelium (exact), DAT cell (narrow), gingival junctional epithelial cell (related)
- **References**: PMID:39590534, PMID:40723411, PMID:41143768, PMID:41331699
- **Note**: Includes comment explaining DAT cell refers to innermost layer

### 5. CL_9900004: tuft cell of parotid gland
- **Parent**: CL_0002204 (tuft cell)
- **Definition**: A tuft cell in parotid gland ducts with chemosensory function
- **Location**: UBERON:0001831 (parotid gland)
- **Key marker**: POU2F3 expression
- **Synonyms**: parotid gland tuft cell (exact), brush cell of parotid gland (related)
- **References**: PMID:23209333, PMID:35993302, PMID:38098741, PMID:38358561

### 6. CL_9900005: tuft cell of sublingual gland
- **Parent**: CL_0002204 (tuft cell)
- **Definition**: A tuft cell in sublingual gland ducts with chemosensory and immune regulation functions
- **Location**: UBERON:0001832 (sublingual gland)
- **Key marker**: POU2F3 expression
- **Synonyms**: sublingual gland tuft cell (exact), brush cell of sublingual gland (related)
- **References**: PMID:23209333, PMID:38358561

### 7. CL_9900006: ionocyte of salivary gland
- **Parent**: CL_0005006 (ionocyte)
- **Definition**: An ionocyte in salivary gland ducts regulating osmotic pressure
- **Location**: UBERON:0001044 (saliva-secreting gland)
- **Function**: capable_of monoatomic ion homeostasis (GO:0050801)
- **Key marker**: FOXI1 expression; expected to express CFTR
- **References**: PMID:30069044, PMID:30069046, PMID:38358561, PMID:39346911, PMID:41721487

### 8. CL_9900007: myoepithelial cell of salivary gland
- **Parent**: CL_0000185 (myoepithelial cell)
- **Definition**: A myoepithelial cell in salivary glands with stellate morphology around acini
- **Location**: UBERON:0001044 (saliva-secreting gland)
- **Function**: capable_of smooth muscle contraction (GO:0006939)
- **Key characteristics**: Expresses α-SMA, p63, AQP1; contracts to facilitate saliva expulsion
- **Synonyms**: salivary gland myoepithelial cell (exact), salivary myoepithelial cell (exact), basket cell of salivary gland (related)
- **References**: PMID:23209333, PMID:39346911, PMID:40837863, PMID:41271704

## Metadata and Annotations

All terms include:
- ✅ Comprehensive textual definitions with in-line references from provided PMIDs
- ✅ Appropriate synonyms with references and synonym types (exact, related, narrow, broad)
- ✅ Logical definitions using EquivalentClasses following genus-differentia pattern
- ✅ Anatomical location axioms using part_of (BFO_0000050) with UBERON terms
- ✅ Functional capability axioms where appropriate using capable_of (RO_0002215) with GO terms
- ✅ Dublin Core terms:date timestamp (2026-05-14T00:00:00Z)
- ✅ Dublin Core terms:contributor with ORCID 0000-0002-5507-2103
- ✅ Dublin Core terms:creator "GitHub Copilot"
- ✅ Link to issue #3597 via IAO_0000233 (term tracker item)
- ✅ Comments where clarification is needed (demilune fixation artifact, DAT cell specificity)

## Validation

- ✅ All parent terms verified to exist in the ontology
- ✅ Logical definitions follow established patterns in CL
- ✅ UBERON anatomical terms used appropriately
- ✅ GO functional terms used where specified in the request
- ✅ All PMIDs included as provided in the issue
- ✅ Synonyms follow OBO naming conventions
- ✅ Temporary IDs from correct idrange (CL_9900000-9900007)

## Implementation Details

The terms were added to `src/ontology/cl-edit.owl` before the final closing statements, maintaining the functional syntax format with one axiom per line as specified in the project guidelines. Each term follows the established pattern seen in existing salivary gland terms like CL_4052065 (serous acinar cell of salivary gland).

## References

All literature references provided in the issue have been incorporated:
- Amano et al. (2012) - PMID:23209333
- Multiple references for stem cell capacity - PMID:37446355, PMID:39346911
- Immunofibroblast references - PMID:31213547, PMID:39346911, PMID:41411773
- Junctional epithelium - PMID:39590534, PMID:40723411, PMID:41143768, PMID:41331699
- Tuft cell markers - PMID:38358561, PMID:23209333, and others
- Ionocyte characterization - PMID:30069044, PMID:30069046, PMID:38358561, PMID:39346911, PMID:41721487
- Myoepithelial cell function - PMID:23209333, PMID:39346911, PMID:40837863, PMID:41271704

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-sonnet-4-5-20250929`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25877798670)

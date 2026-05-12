# Pull Request: Fix design patterns for columnar cuboidal and squamous epithelial cells

## Overview
This PR implements comprehensive changes to fix and extend the design patterns for columnar/cuboidal and squamous epithelial cells in the Cell Ontology, as requested in issue #3536.

## Detailed Changes

### 1. New Term Creation
**CL_9900001 - cuboidal epithelial cell**
- Logical definition: epithelial cell AND has_characteristic some cuboid (PATO:0001872)
- Parent: columnar/cuboidal epithelial cell (CL_0000075)
- Definition: "A cuboidal epithelial cell characterized by its roughly cube-shaped morphology. These cells are typically found in ducts and glands where they play a role in secretion and absorption."
- Metadata: Contributor: https://orcid.org/0000-0001-5208-3432, Date: 2026-05-12

### 2. Logical Definitions for Parent Terms
**CL_0000076 - squamous epithelial cell**
- Added EquivalentClasses axiom: epithelial cell AND has_characteristic some flattened (PATO:0002254)
- Updated definition to emphasize broad, flat morphology
- All squamous epithelial cell subclasses now inherit this logical definition

### 3. Axiomatization - has_characteristic relationships

#### Squamous Epithelial Cells (13 terms)
Added SubClassOf: ObjectSomeValuesFrom(RO_0000053 PATO_0002254) to:
- CL_0000240 - stratified squamous epithelial cell
- CL_0002190 - squamous cell of epidermis
- CL_0002221 - keratinized squamous cell of esophagus
- CL_0002244 - squamous cell of ectocervix
- CL_0002653 - squamous endothelial cell
- CL_0008040 - squamous endothelial cell of venule
- CL_0009066 - stratified squamous epithelial cell of anal canal
- CL_0009096 - esophagus non-keratinized squamous epithelial cell
- CL_1001575 - uterine cervix squamous cell
- CL_1001576 - oral mucosa squamous cell
- CL_1001577 - tonsil squamous cell
- CL_1001578 - vagina squamous cell
- CL_4033083 - squamous granulosa cell

#### Cuboidal Epithelial Cells (4 terms)
Added SubClassOf: ObjectSomeValuesFrom(RO_0000053 PATO_0001872) to:
- CL_0000075 - columnar/cuboidal epithelial cell
- CL_0000241 - stratified cuboidal epithelial cell
- CL_9900001 - cuboidal epithelial cell (new)
- CL_4033084 - cuboidal granulosa cell

### 4. Design Patterns (DOSDP)

**squamousEpithelialCell.yaml**
- Pattern for generating squamous epithelial cell terms
- Base class: CL_0000066 (epithelial cell)
- Characteristic: PATO:0002254 (flattened)
- Relation: RO_0000053 (has characteristic)
- Supports location-based parameterization

**cuboidalEpithelialCell.yaml**
- Pattern for generating cuboidal epithelial cell terms
- Base class: CL_0000066 (epithelial cell)
- Characteristic: PATO:0001872 (cuboid)
- Relation: RO_0000053 (has characteristic)
- Supports location-based parameterization

### 5. Documentation Updates

**docs/relations_guide.md**
- Added new section: "Recording cell shape morphology"
- Documented the use of 'has characteristic' (RO_0000053) with PATO shape terms
- Provided examples for both squamous (flattened) and cuboidal epithelial cells
- Moved morphology section for better organization

## Design Decisions

1. **PATO Terms Selected**:
   - PATO:0002254 (flattened) rather than PATO:0000407 (flat) for squamous cells - more specific term indicating a process of becoming flat
   - PATO:0001872 (cuboid) for cuboidal cells - precise term for cube-shaped morphology

2. **EquivalentClasses vs SubClassOf**:
   - EquivalentClasses used for parent terms (CL_0000076, CL_9900001) to establish logical definitions
   - SubClassOf used for more specific cell types to allow for additional constraints

3. **New ID Range**:
   - Used CL_9900001 (temporary ID range) for the new cuboidal epithelial cell term, following CL ID allocation guidelines

4. **DOSDP Pattern Design**:
   - Created generic patterns that support location-based specialization
   - Patterns use equivalence definitions to enable automatic reasoning and classification

## Validation Checklist

- [x] New term CL_9900001 created with proper ID allocation
- [x] Logical definitions added to CL_0000076 (squamous epithelial cell)
- [x] has_characteristic relationships added to all specified squamous cells (13 terms)
- [x] has_characteristic relationships added to all specified cuboidal cells (4 terms)
- [x] DOSDP patterns created following established conventions
- [x] Documentation updated in relations_guide.md
- [x] Commit message is clear and descriptive
- [x] All changes use appropriate metadata (contributors, timestamps, references)

## Impact

These changes establish a consistent design pattern for epithelial cell classification based on morphological characteristics, making the ontology more expressive and enabling better reasoning about epithelial cell types. The patterns can be reused for other cell types with distinct morphological characteristics.

## Notes

- All existing relationships and annotations of modified terms have been preserved
- Changes are backward compatible; subclasses inherit logical definitions through SubClassOf relationships
- The new DOSDP patterns follow the same structure and conventions as existing patterns in the ontology

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-haiku-4-5-20251001`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25761872648)

# PR Summary: Add 14 New Myenteric Neuron Cell Types

## Overview

This PR adds 14 new cell type terms to the Cell Ontology (CL) for myenteric and enteric neurons, fulfilling the request in issue #3584 to support HubMap cell type annotations. These terms represent distinct neuronal populations identified through functional, morphological, and neurochemical characterization studies.

## Terms Created

### 1. Prerequisite Parent Class
- **CL_9900001 (Dogiel type II neuron)**: A morphologically-defined parent class for multiaxonal neurons with characteristic prolonged afterhyperpolarization (AH-type) electrophysiology. This serves as the parent for the myenteric-specific Dogiel type II neuron.

### 2. Core Functional Types
- **CL_9900002 (intrinsic primary afferent neuron of myenteric plexus)**: Sensory neurons of the myenteric reflex circuits, characterized by AH-type electrophysiology, ChAT+ immunophenotype, and Dogiel type II morphology.
- **CL_9900003 (interneuron of myenteric plexus)**: Integration neurons connecting sensory inputs to motor outputs within myenteric ganglia.
- **CL_9900004 (secretomotor/vasodilator neuron of myenteric plexus)**: Neurons innervating secretory epithelium and blood vessels, characterized by VIP expression.
- **CL_9900005 (intestinofugal neuron)**: Neurons with extrinsic projections to prevertebral sympathetic ganglia (celiac, superior/inferior mesenteric), providing gut-to-brain signaling. Also known as viscerofugal neurons.

### 3. Myenteric Reflex Pathway Components
- **CL_9900006 (ascending interneuron of myenteric plexus)**: Orally-projecting neurons forming excitatory limb of ascending reflex pathways, ChAT+/ENK+ with peristaltic coordination functions.
- **CL_9900007 (descending interneuron of myenteric plexus)**: Aborally-projecting neurons forming inhibitory limb of descending reflex pathways, encompassing serotonergic and nitrergic subtypes.

### 4. Motor Neuron Subtypes
- **CL_9900008 (stubby Dogiel type I neuron of myenteric plexus)**: Excitatory motor neurons with lamellar dendrite morphology, ChAT+/NOS1-, corresponding to motor neuron phenotype 1.
- **CL_9900009 (spiny Dogiel type I neuron of myenteric plexus)**: Inhibitory motor neurons with spiny dendrite morphology, NOS1+/ChAT-, corresponding to motor neuron phenotype 2.

### 5. Sensory Neuron Subtypes
- **CL_9900010 (Dogiel type II neuron of myenteric plexus)**: Location-specific class for IPANs with complete morphological and neurochemical characterization.
- **CL_9900011 (calretinin-positive IPAN of myenteric plexus)**: IPAN subtype characterized by calretinin expression (SN1 subtype).
- **CL_9900012 (calretinin-negative IPAN of myenteric plexus)**: IPAN subtype lacking calretinin expression (SN2 subtype).

### 6. Neurochemical Grouping Classes
- **CL_9900013 (cholinergic neuron of myenteric plexus)**: Defined class (EquivalentClasses) autoclassifying all acetylcholine-secreting myenteric neurons, including stubby Dogiel I neurons, IPANs, and ascending interneurons.
- **CL_9900014 (nitrergic neuron of myenteric plexus)**: Defined class autoclassifying all nitric oxide-producing myenteric neurons, particularly spiny Dogiel I motor neurons.

## Key Implementation Decisions

### 1. ID Assignment
- Used CL_99xxxxx temporary ID range (idrange:81) for all new terms, ensuring they follow OBO standards for new term requests.
- Sequential numbering (CL_9900001-CL_9900014) for clarity.

### 2. Hierarchical Structure
- Terms are organized in a logical hierarchy respecting both anatomical/functional distinctions and morphological classifications.
- Dependencies handled properly: prerequisite parent classes created first, then dependent terms.

### 3. Defined Classes
- Terms 13 and 14 use EquivalentClasses with logical definitions to create autoclassifying groupings:
  - Cholinergic class: enteric neuron AND soma in myenteric plexus AND capable of acetylcholine secretion
  - Nitrergic class: enteric neuron AND soma in myenteric plexus AND capable of nitric oxide biosynthesis

### 4. References and Annotations
- All definitions include inline PMID citations from the source literature.
- Multiple reference PMIDs per term reflecting convergent characterization across studies.
- Synonyms annotated with their source references (PMID or DOI).

### 5. Relationships
- All sensory types include relationship to parent sensory class (CL_0000101).
- All myenteric neurons include soma location (has_soma_location UBERON_0002439).
- Motor neuron subtypes include parent relationships to CL_0000100 (motor) or CL_0008015 (inhibitory motor).

## Validation Checklist

- ✅ All parent terms verified to exist (CL_0007011, CL_0000101, CL_0000099, CL_0000100, CL_0008015, CL_0000540, CL_0000108, CL_0000528, CL_4047038)
- ✅ All UBERON location terms verified (UBERON_0002439)
- ✅ All GO terms referenced exist or are appropriate for future update (GO_0014055 for cholinergic, GO_0006809 for nitrergic biosynthesis)
- ✅ Definitions include genus-differentia structure matching logical definitions
- ✅ PMIDs verified in issue context (34170401, 37355216, 40954253, 32888429, 38292899)
- ✅ Term declarations added to Declaration section (lines 3550-3563)
- ✅ Class definitions added to end of ontology file with proper formatting

## Notes on Neurochemical Classes

The nitrergic neuron class uses GO:0006809 (nitric oxide biosynthetic process) as specified in the issue, with a note that this may need updating when a more specific GO term for "nitric oxide secretion, neurotransmission" is created.

## References

All terms are grounded in the following key papers:
- PMID:34170401 - Core characterization of myenteric neuron types
- PMID:37355216 - Morphological classification and sensory subtypes
- PMID:40954253 - Contemporary review of myenteric neuron diversity
- PMID:32888429 - Secretomotor neuron characterization
- PMID:38292899 - Viscerofugal/intestinofugal neuron characterization

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-haiku-4-5-20251001`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25761823968)

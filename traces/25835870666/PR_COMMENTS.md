# Add 14 new myenteric plexus neuron terms (issue #3584)

This PR addresses [issue #3584](https://github.com/obophenotype/cell-ontology/issues/3584), adding 14 new Cell Ontology classes describing neurons of the myenteric plexus for use by HuBMAP. These terms cover the major functional, morphological, and chemical classes of enteric neurons whose soma resides in the myenteric plexus.

## Summary of new terms

All new terms were assigned temporary CL_99xxxxx IDs from the range allocated for new term requests in `cl-idranges.owl` (Datatype: idrange:81, 9900000–9999999):

| ID | Label | Direct parents |
|---|---|---|
| CL:9900000 | Dogiel type II neuron (prerequisite) | neuron (CL:0000540) |
| CL:9900001 | intrinsic primary afferent neuron of myenteric plexus | enteric neuron (CL:0007011); sensory neuron (CL:0000101) |
| CL:9900002 | interneuron of myenteric plexus | enteric neuron; interneuron (CL:0000099) |
| CL:9900003 | secretomotor/vasodilator neuron of myenteric plexus | enteric neuron |
| CL:9900004 | intestinofugal neuron | enteric neuron |
| CL:9900005 | ascending interneuron of myenteric plexus | interneuron of myenteric plexus |
| CL:9900006 | descending interneuron of myenteric plexus | interneuron of myenteric plexus |
| CL:9900007 | stubby Dogiel type I neuron of myenteric plexus | Dogiel type I neuron (CL:4047038); enteric neuron; motor neuron (CL:0000100) |
| CL:9900008 | spiny Dogiel type I neuron of myenteric plexus | Dogiel type I neuron; enteric neuron; inhibitory motor neuron (CL:0008015) |
| CL:9900009 | Dogiel type II neuron of myenteric plexus | Dogiel type II neuron (CL:9900000); IPAN of myenteric plexus (CL:9900001) |
| CL:9900010 | calretinin-positive intrinsic primary afferent neuron of myenteric plexus | IPAN of myenteric plexus |
| CL:9900011 | calretinin-negative intrinsic primary afferent neuron of myenteric plexus | IPAN of myenteric plexus |
| CL:9900012 | cholinergic neuron of myenteric plexus (defined) | enteric neuron; (autoclassifies under cholinergic neuron CL:0000108) |
| CL:9900013 | nitrergic neuron of myenteric plexus (defined) | nitrergic neuron (CL:0000528); enteric neuron |

## Editorial decisions

- **ID range**: per `src/ontology/cl-idranges.owl` `idrange:81 "Temporary IDs"` (9900000–9999999), new term IDs are issued from CL_99xxxxx, starting at CL_9900000.
- **has soma location**: every term carries `RO:0002100 some UBERON:0002439` (myenteric nerve plexus) per the issue specification and the relations guide. Dogiel type II neuron (CL:9900000) is intentionally location-agnostic so it can sit as a sibling to Dogiel type I (CL:4047038).
- **Defined grouping classes (Terms 12, 13)**: encoded with `EquivalentClasses(... ObjectIntersectionOf(CL:0007011, RO:0002100 some UBERON:0002439, RO:0002215 some GO:XXX))` so subtype membership is inferred. For nitrergic, the GO term is the broad `GO:0006809 nitric oxide biosynthetic process` (the issue notes a follow-up to swap to a more specific "nitric oxide secretion, neurotransmission" GO term once available). Because `CL:0000528 nitrergic neuron` itself has no logical definition, an explicit `SubClassOf(CL:9900013 CL:0000528)` is asserted to preserve the parent relationship.
- **Synonyms**: short uppercase abbreviations (IPAN, PSVN, VFN, SN1, SN2) are tagged with `oboInOwl:hasSynonymType obo:OMO_0003000` (abbreviation). Descriptive synonyms are exact or related as appropriate, each carrying its PMID provenance.
- **Annotations on every term**: textual definition with PMID xrefs, `terms:creator "GitHub Copilot"`, `terms:date "2026-05-14T00:00:00Z"^^xsd:dateTime`, `IAO:0000233` (term_tracker_item) pointing at issue #3584.
- **Term 4 (intestinofugal neuron) axon targets**: the prevertebral ganglia targets (UBERON:0002262 celiac, UBERON:0005479 superior mesenteric, UBERON:0005480 inferior mesenteric) are described in the textual definition rather than encoded as an axiom — these UBERON classes are not currently declared in `cl-edit.owl`, and there is no obvious unambiguous "axon target" relation in CL's relations guide. Happy to add axioms (e.g. `sends synaptic output to region`) if the curation team has a preference.
- **PRO calretinin import flag (Term 10)**: not addressed in this PR — flagged in the issue as a follow-up dependency.

## Checklist

- [x] All 14 terms have `rdfs:label`, textual definition (`IAO:0000115`) with at least one PMID xref
- [x] Every term has `terms:creator "GitHub Copilot"` and `terms:date` ISO 8601 timestamp
- [x] Every term has `IAO:0000233` term_tracker_item linking to issue #3584
- [x] All non-defined terms have at least one `SubClassOf` to a named class
- [x] Defined grouping classes (Terms 12, 13) have `EquivalentClasses` axioms
- [x] All required parent classes exist in `cl-edit.owl` (verified by grep)
- [x] All Declarations for new CL_99 classes added at the appropriate location
- [x] IDs are within the allocated temporary ID range (9900000–9999999)
- [x] All synonyms carry PMID xrefs
- [x] Abbreviation-form synonyms tagged with `OMO:0003000`
- [x] Commit message describes the rationale and lists added terms

## Validation

The `robot` tool was not available in this environment, so reasoning validation (`robot reason`) could not be performed locally. Editorial review should run `robot reason` to confirm the defined grouping classes (Terms 12, 13) classify as expected.

## References used

- PMID:34170401 — Brehmer 2021 review of enteric neuron classification
- PMID:37355216 — myenteric IPAN markers (calretinin SN1/SN2)
- PMID:40954253 — single-cell atlas of myenteric neurons
- PMID:38292899 — intestinofugal / viscerofugal neurons
- PMID:32888429 — VIP+ secretomotor neurons

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25835870666)

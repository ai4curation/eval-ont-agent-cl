# Design patterns for squamous and cuboidal epithelial cells

Addresses obophenotype/cell-ontology#3536.

## Summary

- Added a logical (`EquivalentClasses`) definition for **squamous epithelial cell** (`CL:0000076`):
  `'epithelial cell' and ('has characteristic' some flattened)` (where `flattened` is `PATO:0002254`). A text definition mirroring the logical definition was also added.
- Created a new term **cuboidal epithelial cell** (`CL:9900001`, temporary ID) with logical definition `'epithelial cell' and ('has characteristic' some cuboid)` (where `cuboid` is `PATO:0001872`, synonym "cuboidal"), asserted `SubClassOf columnar/cuboidal epithelial cell` (`CL:0000075`).
- Added `has characteristic` shape axioms to additional cell types that are unambiguously squamous or cuboidal in shape.
- Added two DOSDPs under `src/patterns/dosdp-patterns/`:
  - `squamousEpithelialCell.yaml`
  - `cuboidalEpithelialCell.yaml`
- Extended `docs/relations_guide.md` with a new subsection "Epithelial cell shape (squamous, cuboidal, columnar)" under "Recording Morphology".

## Rationale

The ontology already had `columnar/cuboidal epithelial cell` (`CL:0000075`) as a single broad parent. The issue asked us to give `squamous` and `cuboidal` proper logical definitions in terms of cell shape (PATO), making `cuboidal epithelial cell` a sibling of `squamous epithelial cell` under `epithelial cell` (and a subclass of the broader `columnar/cuboidal epithelial cell`).

`PATO:0001872 cuboid` carries `cuboidal` as an exact synonym, so it is the natural choice for the cuboidal shape characteristic. `PATO:0002254 flattened` is specified directly in the issue.

## Cells axiomatised explicitly

I only added explicit `'has characteristic' some PATO:0002254` / `PATO:0001872` axioms to cells that are not already going to inherit the characteristic via being a subclass of `squamous epithelial cell` or the new `cuboidal epithelial cell` (where it would be redundant) AND whose name/definition unambiguously identifies them as that shape.

### Squamous (PATO:0002254 flattened)
- `CL:0002653` squamous endothelial cell (parent is endothelial cell, not squamous epithelial cell)
- `CL:4033083` squamous granulosa cell (parent is granulosa cell)

### Cuboidal (PATO:0001872 cuboid)
- `CL:0000241` stratified cuboidal epithelial cell
- `CL:0000634` Claudius cell ("A cuboidal cell which...")
- `CL:0002223` anterior lens cell ("simple cuboidal epithelium")
- `CL:0002224` lens epithelial cell ("cuboidal epithelium")
- `CL:0002662` luminal cell of lactiferous duct ("This cuboidal epithelial cell...")
- `CL:0005009` renal principal cell ("A cuboidal epithelial cell of the kidney...")
- `CL:0005010` renal intercalated cell ("A cuboidal epithelial cell of the kidney...")
- `CL:4033084` cuboidal granulosa cell
- `CL:4052048` intercalated cell of salivary gland ("A cuboidal epithelial cell that is part of the intercalated duct...")

`CL:0002063` (pulmonary alveolar type 2 cell) already carried `has characteristic some PATO:0001872`, so no edit was required there.

### Intentionally left unchanged

Cell types whose shape is described as variable / context-dependent were not given a fixed shape axiom. These include:
- `CL:0000115` endothelial cell ("can be squamous or cuboidal")
- `CL:0000244` transitional epithelial cell
- `CL:0002258` thyroid follicular epithelial cell ("shape ranges from squamous when inactive to cuboidal or columnar when active")
- `CL:0002538` intrahepatic cholangiocyte ("flattened or cuboidal in shape")
- `CL:0005012` motile ciliated epithelial cell (columnar/cuboidal)
- `CL:2000064` ovarian surface epithelial cell ("flat to cuboidal to pseudostratified columnar")
- `CL:4052023` endometrial luminal epithelial cell ("tall columnar to cuboidal")
- `CL:4052049` striated cell of salivary gland (columnar/cuboidal)

`CL:0000075` (`columnar/cuboidal epithelial cell`) was deliberately left as a non-equivalent parent class — it is an inclusive group spanning two distinct shapes (columnar OR cuboidal) and is not itself logically equivalent to the new `cuboidal epithelial cell`.

## Checklist
- [x] Read issue context and confirmed scope.
- [x] Verified PATO IDs (`PATO:0002254` flattened; `PATO:0001872` cuboid) exist in the import.
- [x] Used `CL:9900001` from the temporary-ID range (`idrange:81` in `src/ontology/cl-idranges.owl`).
- [x] Added `Declaration(Class(obo:CL_9900001))` and `Declaration(Class(obo:PATO_0002254))`.
- [x] Added `EquivalentClasses` axioms for both prototype terms.
- [x] Added text definition and dc:date for the new term; signed as `dc:creator "GitHub Copilot"`.
- [x] Annotated both prototype terms with `term_tracker_item` (IAO:0000233) pointing to issue #3536.
- [x] Added `has characteristic` shape axioms to non-redundant cell types.
- [x] Added DOSDP patterns for squamous and cuboidal epithelial cells.
- [x] Updated `docs/relations_guide.md`.
- [x] Ran `robot reason --reasoner ELK` on the edited `cl-edit.owl`; no unsatisfiable classes / no errors.

## Notes for the reviewer
- The `CL:9900001` ID is from the temporary-ID range. Per the project's ID-management workflow it will be replaced by a definitive ID when the PR is integrated.
- I left existing redundant `SubClassOf CL:0000066` axioms intact where they predate the new equivalences (the reasoner will mark them inferred).
- Please double-check that I picked the right PATO term for "cuboidal". I used `PATO:0001872 cuboid` (synonym: cuboidal); if there is a preferred different PATO term (e.g. a more cell-shape-specific class) it can be swapped easily in three places (definition annotation, equivalence axiom on `CL:9900001`, DOSDP pattern, and the per-cell `SubClassOf` axioms).

---
🤖 **Generated by claude agent**
- Runtime: `claude`
- Model: `claude-opus-4-7`
- Agent config: `ai4curation/cl-agent-config@v3:.`
- Iteration: `1`
- Run: [View workflow run](https://github.com/ai4curation/eval-ont-agent-cl/actions/runs/25835255880)

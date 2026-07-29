import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure ComponentModelsPackage where
  resistorModel : Type u
  capacitorModel : Type v
  inductorModel : Type w
  sourceModel : Type x
  linearComponent : Prop
  timeInvariant : Prop
  passiveComponent : Prop

structure ComponentModelsEvidence (C : ComponentModelsPackage) where
  linearComponentClosed : C.linearComponent
  timeInvariantClosed : C.timeInvariant
  passiveComponentClosed : C.passiveComponent

def ComponentModelsClosed (C : ComponentModelsPackage) : Prop :=
  C.linearComponent ∧ C.timeInvariant ∧ C.passiveComponent

theorem component_models_closed_from_evidence (C : ComponentModelsPackage) (E : ComponentModelsEvidence C) :
    ComponentModelsClosed C := by
  exact And.intro E.linearComponentClosed (And.intro E.timeInvariantClosed E.passiveComponentClosed)

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
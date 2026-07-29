import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure CircuitComponent where
  identifier : String
  componentType : String
  parameters : List (String × String)
  behaviorModel : String

structure CircuitComponentEvidence (C : CircuitComponent) where
  identifierNonempty : C.identifier ≠ ""
  componentTypeDefined : C.componentType ∈ ["resistor", "capacitor", "inductor", "diode", "transistor"]
  parametersNonempty : C.parameters ≠ []
  behaviorModelNonempty : C.behaviorModel ≠ ""

def CircuitComponentClosed (C : CircuitComponent) : Prop :=
  C.identifier ≠ "" ∧ C.componentType ∈ ["resistor", "capacitor", "inductor", "diode", "transistor"] ∧ C.parameters ≠ [] ∧ C.behaviorModel ≠ ""

theorem circuit_component_closed_from_evidence (C : CircuitComponent) (E : CircuitComponentEvidence C) : CircuitComponentClosed C := by
  exact And.intro E.identifierNonempty (And.intro E.componentTypeDefined (And.intro E.parametersNonempty E.behaviorModelNonempty))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse

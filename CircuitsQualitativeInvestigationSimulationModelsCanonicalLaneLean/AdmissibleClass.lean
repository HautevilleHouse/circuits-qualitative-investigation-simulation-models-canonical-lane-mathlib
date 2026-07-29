import HautevilleHouse.CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean.CircuitComponents

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure CircuitObject where
  package : CircuitPackage
  conclusion : SimulationClosed package

structure AdmissibleClass where
  object : CircuitObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SimulationClosed A.object.package ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
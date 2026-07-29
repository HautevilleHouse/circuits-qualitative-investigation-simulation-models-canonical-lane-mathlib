import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure SwitchingCircuitPackage where
  inputStates : List Prop
  outputState : Prop
  stateTransition : Prop
  admissibleTransition : Prop

structure SwitchingCircuitEvidence (S : SwitchingCircuitPackage) where
  inputStatesClosed : S.inputStates = [True, False, True]
  outputStateClosed : S.outputState = False
  stateTransitionClosed : S.stateTransition
  admissibleTransitionClosed : S.admissibleTransition

def SwitchingCircuitClosed (S : SwitchingCircuitPackage) : Prop :=
  (S.inputStates = [True, False, True]) ∧
  (S.outputState = False) ∧
  S.stateTransition ∧
  S.admissibleTransition

theorem switching_circuit_closed_from_evidence (S : SwitchingCircuitPackage)
    (E : SwitchingCircuitEvidence S) : SwitchingCircuitClosed S :=
  And.intro E.inputStatesClosed
    (And.intro E.outputStateClosed
      (And.intro E.stateTransitionClosed E.admissibleTransitionClosed))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
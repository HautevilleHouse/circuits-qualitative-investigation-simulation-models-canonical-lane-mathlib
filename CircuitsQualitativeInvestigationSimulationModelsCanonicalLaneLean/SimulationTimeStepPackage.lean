import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure SimulationTimeStepPackage where
  timeStep : ℝ
  simulationDuration : ℝ
  stabilityCondition : Prop
  accuracyCondition : Prop

structure SimulationTimeStepEvidence (S : SimulationTimeStepPackage) where
  timeStepClosed : S.timeStep > 0.0
  simulationDurationClosed : S.simulationDuration > 0.0
  stabilityConditionClosed : S.stabilityCondition
  accuracyConditionClosed : S.accuracyCondition

def SimulationTimeStepClosed (S : SimulationTimeStepPackage) : Prop :=
  (S.timeStep > 0.0) ∧
  (S.simulationDuration > 0.0) ∧
  S.stabilityCondition ∧
  S.accuracyCondition

theorem simulation_time_step_closed_from_evidence (S : SimulationTimeStepPackage)
    (E : SimulationTimeStepEvidence S) : SimulationTimeStepClosed S :=
  And.intro E.timeStepClosed
    (And.intro E.simulationDurationClosed
      (And.intro E.stabilityConditionClosed E.accuracyConditionClosed))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
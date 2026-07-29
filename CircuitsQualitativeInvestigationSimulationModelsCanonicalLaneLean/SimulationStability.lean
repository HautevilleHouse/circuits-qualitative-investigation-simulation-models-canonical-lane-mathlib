import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure SimulationStabilityPackage {G : CircuitQualitativePackage} where
  timeStepConvergence : Prop
  numericalStability : Prop
  errorBound : Prop
  transientAccuracy : Prop

structure SimulationStabilityEvidence {G : CircuitQualitativePackage}
    (S : SimulationStabilityPackage G) where
  timeStepConvergenceClosed : S.timeStepConvergence
  numericalStabilityClosed : S.numericalStability
  errorBoundClosed : S.errorBound
  transientAccuracyClosed : S.transientAccuracy

def SimulationStabilityClosed {G : CircuitQualitativePackage}
    (S : SimulationStabilityPackage G) : Prop :=
  S.timeStepConvergence ∧ S.numericalStability ∧ S.errorBound ∧ S.transientAccuracy

theorem simulation_stability_closed_from_evidence {G : CircuitQualitativePackage}
    (S : SimulationStabilityPackage G) (E : SimulationStabilityEvidence S) :
    SimulationStabilityClosed S := by
  exact And.intro E.timeStepConvergenceClosed
    (And.intro E.numericalStabilityClosed
      (And.intro E.errorBoundClosed E.transientAccuracyClosed))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
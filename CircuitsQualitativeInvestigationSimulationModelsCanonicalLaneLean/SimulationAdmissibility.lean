import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure SimulationAdmissibility where
  numericalStability : Prop
  convergenceCriteria : Prop
  timeStepAdmissible : Prop

structure SimulationAdmissibilityEvidence (S : SimulationAdmissibility) where
  numericalStabilityClosed : S.numericalStability
  convergenceCriteriaClosed : S.convergenceCriteria
  timeStepAdmissibleClosed : S.timeStepAdmissible

def SimulationAdmissibilityClosed (S : SimulationAdmissibility) : Prop :=
  S.numericalStability ∧ S.convergenceCriteria ∧ S.timeStepAdmissible

theorem simulation_admissibility_closed_from_evidence
    (S : SimulationAdmissibility) (E : SimulationAdmissibilityEvidence S) :
    SimulationAdmissibilityClosed S := by
  exact And.intro E.numericalStabilityClosed
    (And.intro E.convergenceCriteriaClosed E.timeStepAdmissibleClosed)

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
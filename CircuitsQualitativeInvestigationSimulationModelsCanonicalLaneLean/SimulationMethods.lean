import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure SimulationMethodsPackage where
  nodalAnalysis : Prop
  meshAnalysis : Prop
  transientAnalysis : Prop
  acAnalysis : Prop
  numericalIntegration : Prop
  convergenceGuaranteed : Prop

structure SimulationMethodsEvidence (S : SimulationMethodsPackage) where
  nodalAnalysisClosed : S.nodalAnalysis
  meshAnalysisClosed : S.meshAnalysis
  transientAnalysisClosed : S.transientAnalysis
  acAnalysisClosed : S.acAnalysis
  numericalIntegrationClosed : S.numericalIntegration
  convergenceGuaranteedClosed : S.convergenceGuaranteed

def SimulationMethodsClosed (S : SimulationMethodsPackage) : Prop :=
  S.nodalAnalysis ∧ S.meshAnalysis ∧ S.transientAnalysis ∧ S.acAnalysis ∧ S.numericalIntegration ∧ S.convergenceGuaranteed

theorem simulation_methods_closed_from_evidence (S : SimulationMethodsPackage) (E : SimulationMethodsEvidence S) :
    SimulationMethodsClosed S := by
  exact And.intro E.nodalAnalysisClosed
    (And.intro E.meshAnalysisClosed
      (And.intro E.transientAnalysisClosed
        (And.intro E.acAnalysisClosed
          (And.intro E.numericalIntegrationClosed E.convergenceGuaranteedClosed))))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
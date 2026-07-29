import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure KirchhoffLawsPackage where
  currentLawStatements : Prop
  voltageLawStatements : Prop
  kclApplied : Prop
  kvlApplied : Prop
  linearIndependence : Prop

structure KirchhoffLawsEvidence (K : KirchhoffLawsPackage) where
  currentLawStatementsClosed : K.currentLawStatements
  voltageLawStatementsClosed : K.voltageLawStatements
  kclAppliedClosed : K.kclApplied
  kvlAppliedClosed : K.kvlApplied
  linearIndependenceClosed : K.linearIndependence

def KirchhoffLawsClosed (K : KirchhoffLawsPackage) : Prop :=
  K.currentLawStatements ∧ K.voltageLawStatements ∧ K.kclApplied ∧ K.kvlApplied ∧ K.linearIndependence

theorem kirchhoff_laws_closed_from_evidence (K : KirchhoffLawsPackage) (E : KirchhoffLawsEvidence K) :
    KirchhoffLawsClosed K := by
  exact And.intro E.currentLawStatementsClosed
    (And.intro E.voltageLawStatementsClosed
      (And.intro E.kclAppliedClosed (And.intro E.kvlAppliedClosed E.linearIndependenceClosed)))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
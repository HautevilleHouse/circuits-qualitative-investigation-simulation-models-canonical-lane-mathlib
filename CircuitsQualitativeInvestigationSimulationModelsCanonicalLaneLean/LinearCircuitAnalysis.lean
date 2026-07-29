import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure LinearCircuitAnalysisPackage {G : CircuitQualitativePackage} where
  kirchhoffCurrentLaw : Prop
  kirchhoffVoltageLaw : Prop
  ohmsLawResistors : Prop
  capacitorInductorModel : Prop
  stateSpaceFormulation : Prop

structure LinearCircuitAnalysisEvidence {G : CircuitQualitativePackage}
    (L : LinearCircuitAnalysisPackage G) where
  kirchhoffCurrentLawClosed : L.kirchhoffCurrentLaw
  kirchhoffVoltageLawClosed : L.kirchhoffVoltageLaw
  ohmsLawResistorsClosed : L.ohmsLawResistors
  capacitorInductorModelClosed : L.capacitorInductorModel
  stateSpaceFormulationClosed : L.stateSpaceFormulation

def LinearCircuitAnalysisClosed {G : CircuitQualitativePackage}
    (L : LinearCircuitAnalysisPackage G) : Prop :=
  L.kirchhoffCurrentLaw ∧ L.kirchhoffVoltageLaw ∧ L.ohmsLawResistors ∧
  L.capacitorInductorModel ∧ L.stateSpaceFormulation

theorem linear_circuit_analysis_closed_from_evidence {G : CircuitQualitativePackage}
    (L : LinearCircuitAnalysisPackage G) (E : LinearCircuitAnalysisEvidence L) :
    LinearCircuitAnalysisClosed L := by
  exact And.intro E.kirchhoffCurrentLawClosed
    (And.intro E.kirchhoffVoltageLawClosed
      (And.intro E.ohmsLawResistorsClosed
        (And.intro E.capacitorInductorModelClosed E.stateSpaceFormulationClosed)))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
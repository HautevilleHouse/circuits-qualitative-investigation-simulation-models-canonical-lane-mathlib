import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure CircuitStateSpace where
  nodeVoltages : Type u
  branchCurrents : Type v
  timeDomain : Type w
  continuousEvolution : Prop
  piecewiseSmoothness : Prop

structure CircuitStateSpaceEvidence (C : CircuitStateSpace) where
  continuousEvolutionClosed : C.continuousEvolution
  piecewiseSmoothnessClosed : C.piecewiseSmoothness

def CircuitStateSpaceClosed (C : CircuitStateSpace) : Prop :=
  C.continuousEvolution ∧ C.piecewiseSmoothness

theorem circuit_state_space_closed_from_evidence
    (C : CircuitStateSpace) (E : CircuitStateSpaceEvidence C) :
    CircuitStateSpaceClosed C := by
  exact And.intro E.continuousEvolutionClosed E.piecewiseSmoothnessClosed

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
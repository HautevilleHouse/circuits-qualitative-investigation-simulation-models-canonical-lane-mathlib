import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

def ConstrainedCircuitsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_circuits_endgame (A : AdmissibleClass) :
    ConstrainedCircuitsClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
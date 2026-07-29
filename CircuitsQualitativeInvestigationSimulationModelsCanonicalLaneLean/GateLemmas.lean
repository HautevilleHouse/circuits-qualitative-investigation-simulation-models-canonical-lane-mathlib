import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
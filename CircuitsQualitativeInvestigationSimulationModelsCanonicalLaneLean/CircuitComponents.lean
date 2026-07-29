import HautevilleHouse.CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure CircuitComponent where
  label : String
  componentType : String
  parameters : List (String × ℝ)

structure CircuitTopology where
  nodes : List ℕ
  edges : List (ℕ × ℕ × CircuitComponent)

structure SimulationModel where
  topology : CircuitTopology
  equations : List String
  simulationParams : String → ℝ

structure CircuitPackage where
  topology : CircuitTopology
  model : SimulationModel

structure CircuitEvidence (C : CircuitPackage) where
  topologyValid : C.topology.nodes.length ≥ 2
  equationsConsistent : C.model.equations.length ≥ 1

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
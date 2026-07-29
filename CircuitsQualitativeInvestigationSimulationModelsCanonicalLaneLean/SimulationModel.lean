import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean.CircuitComponent

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure SimulationModel where
  name : String
  components : List CircuitComponent
  connections : List (String × String)
  solver : String
  timeDomain : String

structure SimulationModelEvidence (M : SimulationModel) where
  nameNonempty : M.name ≠ ""
  componentsClosed : ∀ c ∈ M.components, CircuitComponentClosed c
  connectionsNonempty : M.connections ≠ []
  solverDefined : M.solver ∈ ["SPICE", "Euler", "RungeKutta", "Trapezoidal"]
  timeDomainNonempty : M.timeDomain ≠ ""

def SimulationModelClosed (M : SimulationModel) : Prop :=
  M.name ≠ "" ∧ (∀ c ∈ M.components, CircuitComponentClosed c) ∧ M.connections ≠ [] ∧ M.solver ∈ ["SPICE", "Euler", "RungeKutta", "Trapezoidal"] ∧ M.timeDomain ≠ ""

theorem simulation_model_closed_from_evidence (M : SimulationModel) (E : SimulationModelEvidence M) : SimulationModelClosed M := by
  exact And.intro E.nameNonempty (And.intro E.componentsClosed (And.intro E.connectionsNonempty (And.intro E.solverDefined E.timeDomainNonempty)))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure CircuitTopologyPackage where
  circuitGraph : Type u
  nodeSet : Set circuitGraph
  edgeSet : Set (circuitGraph × circuitGraph)
  incidenceMatrix : List (List Nat)
  graphIsFinite : Prop
  graphIsConnected : Prop
  graphIsDirected : Prop

structure CircuitTopologyEvidence (C : CircuitTopologyPackage) where
  graphIsFiniteClosed : C.graphIsFinite
  graphIsConnectedClosed : C.graphIsConnected
  graphIsDirectedClosed : C.graphIsDirected

def CircuitTopologyClosed (C : CircuitTopologyPackage) : Prop :=
  C.graphIsFinite ∧ C.graphIsConnected ∧ C.graphIsDirected

theorem circuit_topology_closed_from_evidence (C : CircuitTopologyPackage) (E : CircuitTopologyEvidence C) :
    CircuitTopologyClosed C := by
  exact And.intro E.graphIsFiniteClosed (And.intro E.graphIsConnectedClosed E.graphIsDirectedClosed)

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
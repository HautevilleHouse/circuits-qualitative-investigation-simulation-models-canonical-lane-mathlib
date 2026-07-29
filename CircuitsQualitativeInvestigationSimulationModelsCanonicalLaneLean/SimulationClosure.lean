import HautevilleHouse.CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean.CircuitComponents

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

def SimulationClosed (C : CircuitPackage) : Prop :=
  C.topology.nodes.length ≥ 2 ∧ C.model.equations.length ≥ 1

theorem simulation_closed_from_evidence (C : CircuitPackage) (E : CircuitEvidence C) : SimulationClosed C :=
  And.intro E.topologyValid E.equationsConsistent

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SimulationClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedSimulationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_simulation_endgame (A : AdmissibleClass) : ConstrainedSimulationClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
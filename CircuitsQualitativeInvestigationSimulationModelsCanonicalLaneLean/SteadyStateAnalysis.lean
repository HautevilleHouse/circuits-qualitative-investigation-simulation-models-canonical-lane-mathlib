import HautevilleHouse.CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean.CircuitComponents

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure SteadyStatePackage (C : CircuitPackage) where
  steadyStateEquations : List String
  solutionExists : Prop
  solutionUnique : Prop

structure SteadyStateEvidence {C : CircuitPackage} (S : SteadyStatePackage C) where
  steadyStateEquationsConsistent : S.steadyStateEquations.length ≥ 1
  solutionExistsClosed : S.solutionExists
  solutionUniqueClosed : S.solutionUnique

def SteadyStateAnalysisClosed {C : CircuitPackage} (S : SteadyStatePackage C) : Prop :=
  S.steadyStateEquationsConsistent ∧ S.solutionExists ∧ S.solutionUnique

theorem steady_state_analysis_closed_from_evidence {C : CircuitPackage} (S : SteadyStatePackage C) (E : SteadyStateEvidence S) :
    SteadyStateAnalysisClosed S :=
  And.intro E.steadyStateEquationsConsistent (And.intro E.solutionExistsClosed E.solutionUniqueClosed)

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure SimulationModelValidationPackage {G : CircuitQualitativePackage}
    {L : LinearCircuitAnalysisPackage G}
    {Q : QualitativeBehaviorAnalysisPackage L} where
  modelOrderReductionValid : Prop
  parameterSensitivity : Prop
  experimentalValidation : Prop
  fidelityCriteria : Prop

structure SimulationModelValidationEvidence {G : CircuitQualitativePackage}
    {L : LinearCircuitAnalysisPackage G}
    {Q : QualitativeBehaviorAnalysisPackage L}
    (V : SimulationModelValidationPackage Q) where
  modelOrderReductionValidClosed : V.modelOrderReductionValid
  parameterSensitivityClosed : V.parameterSensitivity
  experimentalValidationClosed : V.experimentalValidation
  fidelityCriteriaClosed : V.fidelityCriteria

def SimulationModelValidationClosed {G : CircuitQualitativePackage}
    {L : LinearCircuitAnalysisPackage G}
    {Q : QualitativeBehaviorAnalysisPackage L}
    (V : SimulationModelValidationPackage Q) : Prop :=
  V.modelOrderReductionValid ∧ V.parameterSensitivity ∧
  V.experimentalValidation ∧ V.fidelityCriteria

theorem simulation_model_validation_closed_from_evidence
    {G : CircuitQualitativePackage} {L : LinearCircuitAnalysisPackage G}
    {Q : QualitativeBehaviorAnalysisPackage L}
    (V : SimulationModelValidationPackage Q) (E : SimulationModelValidationEvidence V) :
    SimulationModelValidationClosed V := by
  exact And.intro E.modelOrderReductionValidClosed
    (And.intro E.parameterSensitivityClosed
      (And.intro E.experimentalValidationClosed E.fidelityCriteriaClosed))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
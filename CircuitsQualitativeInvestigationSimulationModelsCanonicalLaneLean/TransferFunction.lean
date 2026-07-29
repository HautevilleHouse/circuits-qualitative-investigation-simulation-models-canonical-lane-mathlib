import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure TransferFunctionPackage where
  laplaceDomain : Prop
  frequencyResponse : Prop
  polesDefined : List Complex
  zerosDefined : List Complex
  stabilityCondition : Prop
  rationalFunction : Prop

structure TransferFunctionEvidence (T : TransferFunctionPackage) where
  laplaceDomainClosed : T.laplaceDomain
  frequencyResponseClosed : T.frequencyResponse
  polesDefinedClosed : T.polesDefined = T.polesDefined
  zerosDefinedClosed : T.zerosDefined = T.zerosDefined
  stabilityConditionClosed : T.stabilityCondition
  rationalFunctionClosed : T.rationalFunction

def TransferFunctionClosed (T : TransferFunctionPackage) : Prop :=
  T.laplaceDomain ∧ T.frequencyResponse ∧ T.stabilityCondition ∧ T.rationalFunction

theorem transfer_function_closed_from_evidence (T : TransferFunctionPackage) (E : TransferFunctionEvidence T) :
    TransferFunctionClosed T := by
  exact And.intro E.laplaceDomainClosed
    (And.intro E.frequencyResponseClosed
      (And.intro E.stabilityConditionClosed E.rationalFunctionClosed))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
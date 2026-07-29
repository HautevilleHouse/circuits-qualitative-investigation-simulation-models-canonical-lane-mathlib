import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean

structure FeedbackLoopPackage where
  loopGain : ℝ
  phaseShift : ℝ
  stabilityMargin : ℝ
  oscillationCondition : Prop

structure FeedbackLoopEvidence (F : FeedbackLoopPackage) where
  loopGainClosed : F.loopGain > 1.0
  phaseShiftClosed : F.phaseShift = π
  stabilityMarginClosed : F.stabilityMargin > 0.0
  oscillationConditionClosed : F.oscillationCondition

def FeedbackLoopClosed (F : FeedbackLoopPackage) : Prop :=
  (F.loopGain > 1.0) ∧
  (F.phaseShift = π) ∧
  (F.stabilityMargin > 0.0) ∧
  F.oscillationCondition

theorem feedback_loop_closed_from_evidence (F : FeedbackLoopPackage)
    (E : FeedbackLoopEvidence F) : FeedbackLoopClosed F :=
  And.intro E.loopGainClosed
    (And.intro E.phaseShiftClosed
      (And.intro E.stabilityMarginClosed E.oscillationConditionClosed))

end CircuitsQualitativeInvestigationSimulationModelsCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure StabilityAnalysisPackage where
  linearOperator : Type u
  spectralRadius : Type v
  vonNeumannCondition : Prop
  cflCondition : Prop
  eigenvalueBound : Prop

structure StabilityAnalysisEvidence (S : StabilityAnalysisPackage) where
  vonNeumannConditionClosed : S.vonNeumannCondition
  cflConditionClosed : S.cflCondition
  eigenvalueBoundClosed : S.eigenvalueBound

def StabilityAnalysisClosed (S : StabilityAnalysisPackage) : Prop :=
  S.vonNeumannCondition ∧ S.cflCondition ∧ S.eigenvalueBound

theorem stability_analysis_closed_from_evidence (S : StabilityAnalysisPackage)
    (E : StabilityAnalysisEvidence S) : StabilityAnalysisClosed S := by
  exact And.intro E.vonNeumannConditionClosed
    (And.intro E.cflConditionClosed E.eigenvalueBoundClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
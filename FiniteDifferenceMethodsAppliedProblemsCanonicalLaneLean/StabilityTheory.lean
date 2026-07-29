import canonicalLaneMathlib.AdmissibleClass
import FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean.FiniteDifferenceOperator

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure StabilityCondition (G : FiniteDifferenceOperator gridType) where
  amplificationFactor : gridType → gridType → Float
  vonNeumannCondition : Prop
  cflCondition : Float
  conditionSatisfied : Prop

structure StabilityEvidence (G : FiniteDifferenceOperator gridType) (S : StabilityCondition G) where
  vonNeumannConditionClosed : S.vonNeumannCondition
  cflConditionClosed : S.cflCondition
  conditionSatisfiedClosed : S.conditionSatisfied

def StabilityClosed (G : FiniteDifferenceOperator gridType) (S : StabilityCondition G) : Prop :=
  S.vonNeumannCondition ∧ S.cflCondition ∧ S.conditionSatisfied

theorem stability_closed_from_evidence
    (G : FiniteDifferenceOperator gridType) (S : StabilityCondition G)
    (E : StabilityEvidence G S) : StabilityClosed G S := by
  exact And.intro E.vonNeumannConditionClosed (And.intro E.cflConditionClosed E.conditionSatisfiedClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
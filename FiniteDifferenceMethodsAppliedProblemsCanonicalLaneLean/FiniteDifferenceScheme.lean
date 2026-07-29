import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure FiniteDifferenceScheme where
  spatialDiscretization : Type u
  timeDiscretization : Type v
  stencil : List Int
  consistencyOrder : Nat
  stabilityCondition : Prop
  truncationErrorBound : Prop
  convergenceRate : Prop

structure FiniteDifferenceSchemeEvidence (S : FiniteDifferenceScheme) where
  consistencyOrderClosed : S.consistencyOrder ≥ 1
  stabilityConditionClosed : S.stabilityCondition
  truncationErrorBoundClosed : S.truncationErrorBound
  convergenceRateClosed : S.convergenceRate

def FiniteDifferenceSchemeClosed (S : FiniteDifferenceScheme) : Prop :=
  (S.consistencyOrder ≥ 1) ∧ S.stabilityCondition ∧ S.truncationErrorBound ∧ S.convergenceRate

theorem finite_difference_scheme_closed_from_evidence (S : FiniteDifferenceScheme)
    (E : FiniteDifferenceSchemeEvidence S) : FiniteDifferenceSchemeClosed S := by
  exact And.intro E.consistencyOrderClosed
    (And.intro E.stabilityConditionClosed
      (And.intro E.truncationErrorBoundClosed E.convergenceRateClosed))

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
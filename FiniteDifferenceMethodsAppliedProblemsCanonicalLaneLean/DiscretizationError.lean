import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure DiscretizationErrorPackage where
  gridSpacing : ℝ
  truncationError : ℝ
  stabilityCondition : Prop
  consistencyOrder : ℕ

structure DiscretizationErrorEvidence (D : DiscretizationErrorPackage) where
  truncationErrorClosed : D.truncationError = 0
  stabilityConditionClosed : D.stabilityCondition
  consistencyOrderClosed : D.consistencyOrder ≥ 1

def DiscretizationErrorClosed (D : DiscretizationErrorPackage) : Prop :=
  D.truncationError = 0 ∧ D.stabilityCondition ∧ D.consistencyOrder ≥ 1

theorem discretization_error_closed_from_evidence (D : DiscretizationErrorPackage) (E : DiscretizationErrorEvidence D) : DiscretizationErrorClosed D := by
  exact And.intro E.truncationErrorClosed (And.intro E.stabilityConditionClosed E.consistencyOrderClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse

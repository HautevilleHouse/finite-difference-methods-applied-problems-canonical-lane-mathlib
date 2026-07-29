import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure EllipticOperatorDiscretization where
  operatorType : String
  stencilWidth : Nat
  consistencyOrder : Nat
  stabilityCondition : Prop
  errorEstimate : Prop

structure EllipticDiscretizationEvidence (D : EllipticOperatorDiscretization) where
  operatorTypeClosed : D.operatorType = "Laplacian" ∨ D.operatorType = "Poisson"
  stencilWidthClosed : D.stencilWidth ≥ 3
  consistencyOrderClosed : D.consistencyOrder ≥ 2
  stabilityConditionClosed : D.stabilityCondition
  errorEstimateClosed : D.errorEstimate

def EllipticDiscretizationClosed (D : EllipticOperatorDiscretization) : Prop :=
  (D.operatorType = "Laplacian" ∨ D.operatorType = "Poisson") ∧
  D.stencilWidth ≥ 3 ∧ D.consistencyOrder ≥ 2 ∧ D.stabilityCondition ∧ D.errorEstimate

theorem elliptic_discretization_closed_from_evidence (D : EllipticOperatorDiscretization)
    (E : EllipticDiscretizationEvidence D) : EllipticDiscretizationClosed D := by
  exact And.intro E.operatorTypeClosed (And.intro E.stencilWidthClosed
    (And.intro E.consistencyOrderClosed (And.intro E.stabilityConditionClosed E.errorEstimateClosed)))

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
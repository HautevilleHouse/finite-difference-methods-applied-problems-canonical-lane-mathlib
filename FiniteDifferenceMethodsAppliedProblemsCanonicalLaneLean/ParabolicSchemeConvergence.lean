import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure ParabolicSchemeConvergence where
  schemeName : String
  cflCondition : Float
  convergenceOrder : Nat
  stabilityProof : Prop
  liftingOperator : Prop

structure ParabolicConvergenceEvidence (P : ParabolicSchemeConvergence) where
  schemeNameClosed : P.schemeName = "ForwardEuler" ∨ P.schemeName = "CrankNicolson"
  cflConditionClosed : P.cflCondition ≤ 1.0
  convergenceOrderClosed : P.convergenceOrder ≥ 1
  stabilityProofClosed : P.stabilityProof
  liftingOperatorClosed : P.liftingOperator

def ParabolicConvergenceClosed (P : ParabolicSchemeConvergence) : Prop :=
  (P.schemeName = "ForwardEuler" ∨ P.schemeName = "CrankNicolson") ∧
  P.cflCondition ≤ 1.0 ∧ P.convergenceOrder ≥ 1 ∧ P.stabilityProof ∧ P.liftingOperator

theorem parabolic_convergence_closed_from_evidence (P : ParabolicSchemeConvergence)
    (E : ParabolicConvergenceEvidence P) : ParabolicConvergenceClosed P := by
  exact And.intro E.schemeNameClosed (And.intro E.cflConditionClosed
    (And.intro E.convergenceOrderClosed (And.intro E.stabilityProofClosed E.liftingOperatorClosed)))

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
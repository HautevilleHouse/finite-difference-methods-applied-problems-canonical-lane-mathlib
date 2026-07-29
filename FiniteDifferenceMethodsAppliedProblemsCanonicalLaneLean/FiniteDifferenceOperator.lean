import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure FiniteDifferenceOperator (gridType : Type u) where
  grid : gridType
  stencil : List (Int × Int)
  coefficients : gridType → gridType → Float
  consistent : Prop
  stable : Prop
  convergent : Prop

structure FiniteDifferenceOperatorEvidence (G : FiniteDifferenceOperator gridType) where
  consistentClosed : G.consistent
  stableClosed : G.stable
  convergentClosed : G.convergent

def FiniteDifferenceOperatorClosed (G : FiniteDifferenceOperator gridType) : Prop :=
  G.consistent ∧ G.stable ∧ G.convergent

theorem finite_difference_operator_closed_from_evidence
    (G : FiniteDifferenceOperator gridType) (E : FiniteDifferenceOperatorEvidence G) :
    FiniteDifferenceOperatorClosed G := by
  exact And.intro E.consistentClosed (And.intro E.stableClosed E.convergentClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
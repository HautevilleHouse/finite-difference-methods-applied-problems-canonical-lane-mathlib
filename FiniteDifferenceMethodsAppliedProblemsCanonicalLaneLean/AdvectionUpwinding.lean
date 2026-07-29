import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure AdvectionUpwinding where
  advectionDirection : String
  upwindScheme : String
  tvdProperty : Prop
  monotonicity : Prop
  entropyCondition : Prop

structure AdvectionUpwindingEvidence (A : AdvectionUpwinding) where
  advectionDirectionClosed : A.advectionDirection = "positive" ∨ A.advectionDirection = "negative"
  upwindSchemeClosed : A.upwindScheme = "firstOrder" ∨ A.upwindScheme = "secondOrder"
  tvdPropertyClosed : A.tvdProperty
  monotonicityClosed : A.monotonicity
  entropyConditionClosed : A.entropyCondition

def AdvectionUpwindingClosed (A : AdvectionUpwinding) : Prop :=
  (A.advectionDirection = "positive" ∨ A.advectionDirection = "negative") ∧
  (A.upwindScheme = "firstOrder" ∨ A.upwindScheme = "secondOrder") ∧
  A.tvdProperty ∧ A.monotonicity ∧ A.entropyCondition

theorem advection_upwinding_closed_from_evidence (A : AdvectionUpwinding)
    (E : AdvectionUpwindingEvidence A) : AdvectionUpwindingClosed A := by
  exact And.intro E.advectionDirectionClosed (And.intro E.upwindSchemeClosed
    (And.intro E.tvdPropertyClosed (And.intro E.monotonicityClosed E.entropyConditionClosed)))

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
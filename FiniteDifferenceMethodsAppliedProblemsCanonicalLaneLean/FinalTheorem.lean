import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

def ConstrainedFiniteDifferenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_finite_difference_endgame (A : AdmissibleClass) : ConstrainedFiniteDifferenceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure GridConvergencePackage where
  meshFamily : Nat → Type u
  discreteSolutions : Nat → Type v
  exactSolution : Type w
  convergenceOrder : Prop
  errorAsymptotic : Prop
  richardsonExtrapolation : Prop

structure GridConvergenceEvidence (G : GridConvergencePackage) where
  convergenceOrderClosed : G.convergenceOrder
  errorAsymptoticClosed : G.errorAsymptotic
  richardsonExtrapolationClosed : G.richardsonExtrapolation

def GridConvergenceClosed (G : GridConvergencePackage) : Prop :=
  G.convergenceOrder ∧ G.errorAsymptotic ∧ G.richardsonExtrapolation

theorem grid_convergence_closed_from_evidence (G : GridConvergencePackage)
    (E : GridConvergenceEvidence G) : GridConvergenceClosed G := by
  exact And.intro E.convergenceOrderClosed
    (And.intro E.errorAsymptoticClosed E.richardsonExtrapolationClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
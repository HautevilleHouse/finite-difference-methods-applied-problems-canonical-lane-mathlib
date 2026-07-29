import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure StabilityConvergencePackage where
  methodConsistent : Prop
  zeroStability : Prop
  convergenceGuaranteed : Prop

structure StabilityConvergenceEvidence (S : StabilityConvergencePackage) where
  methodConsistentClosed : S.methodConsistent
  zeroStabilityClosed : S.zeroStability
  convergenceGuaranteedClosed : S.convergenceGuaranteed

def StabilityConvergenceClosed (S : StabilityConvergencePackage) : Prop :=
  S.methodConsistent ∧ S.zeroStability ∧ S.convergenceGuaranteed

theorem stability_convergence_closed_from_evidence (S : StabilityConvergencePackage) (E : StabilityConvergenceEvidence S) : StabilityConvergenceClosed S := by
  exact And.intro E.methodConsistentClosed (And.intro E.zeroStabilityClosed E.convergenceGuaranteedClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse

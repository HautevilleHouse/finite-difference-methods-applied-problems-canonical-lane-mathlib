import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure ConvergenceProofPackage where
  consistencyEstablished : Prop
  stabilityEstablished : Prop
  convergenceViaLaxEquivalence : Prop

structure ConvergenceProofEvidence (C : ConvergenceProofPackage) where
  consistencyEstablishedClosed : C.consistencyEstablished
  stabilityEstablishedClosed : C.stabilityEstablished
  convergenceViaLaxEquivalenceClosed : C.convergenceViaLaxEquivalence

def ConvergenceProofClosed (C : ConvergenceProofPackage) : Prop :=
  C.consistencyEstablished ∧ C.stabilityEstablished ∧ C.convergenceViaLaxEquivalence

theorem convergence_proof_closed_from_evidence (C : ConvergenceProofPackage) (E : ConvergenceProofEvidence C) :
  ConvergenceProofClosed C := by
  exact And.intro E.consistencyEstablishedClosed (And.intro E.stabilityEstablishedClosed E.convergenceViaLaxEquivalenceClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse

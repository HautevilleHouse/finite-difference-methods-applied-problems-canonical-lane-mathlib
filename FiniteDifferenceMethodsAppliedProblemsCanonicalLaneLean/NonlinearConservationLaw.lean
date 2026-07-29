import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure NonlinearConservationLaw where
  fluxFunction : String
  riemannSolver : String
  godunovType : String
  entropyStability : Prop
  boundPreservation : Prop

structure NonlinearConservationLawEvidence (N : NonlinearConservationLaw) where
  fluxFunctionClosed : N.fluxFunction = "Burger" ∨ N.fluxFunction = "Euler"
  riemannSolverClosed : N.riemannSolver = "Rusanov" ∨ N.riemannSolver = "HLL"
  godunovTypeClosed : N.godunovType = "Godunov" ∨ N.godunovType = "MUSCL"
  entropyStabilityClosed : N.entropyStability
  boundPreservationClosed : N.boundPreservation

def NonlinearConservationLawClosed (N : NonlinearConservationLaw) : Prop :=
  (N.fluxFunction = "Burger" ∨ N.fluxFunction = "Euler") ∧
  (N.riemannSolver = "Rusanov" ∨ N.riemannSolver = "HLL") ∧
  (N.godunovType = "Godunov" ∨ N.godunovType = "MUSCL") ∧
  N.entropyStability ∧ N.boundPreservation

theorem nonlinear_conservation_law_closed_from_evidence (N : NonlinearConservationLaw)
    (E : NonlinearConservationLawEvidence N) : NonlinearConservationLawClosed N := by
  exact And.intro E.fluxFunctionClosed (And.intro E.riemannSolverClosed
    (And.intro E.godunovTypeClosed (And.intro E.entropyStabilityClosed E.boundPreservationClosed)))

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
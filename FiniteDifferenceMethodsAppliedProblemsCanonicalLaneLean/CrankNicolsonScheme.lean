import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure CrankNicolsonScheme where
  theta : ℝ
  unconditionalStability : Prop
  secondOrderAccuracy : Prop
  implicitSolveable : Prop

structure CrankNicolsonSchemeEvidence (S : CrankNicolsonScheme) where
  unconditionalStabilityClosed : S.unconditionalStability
  secondOrderAccuracyClosed : S.secondOrderAccuracy
  implicitSolveableClosed : S.implicitSolveable

def CrankNicolsonSchemeClosed (S : CrankNicolsonScheme) : Prop :=
  S.unconditionalStability ∧ S.secondOrderAccuracy ∧ S.implicitSolveable

theorem crank_nicolson_scheme_closed_from_evidence (S : CrankNicolsonScheme) (E : CrankNicolsonSchemeEvidence S) :
  CrankNicolsonSchemeClosed S := by
  exact And.intro E.unconditionalStabilityClosed (And.intro E.secondOrderAccuracyClosed E.implicitSolveableClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse

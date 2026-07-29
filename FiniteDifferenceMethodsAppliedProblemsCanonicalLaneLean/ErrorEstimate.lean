import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure ErrorEstimatePackage where
  localTruncationError : ℝ
  globalError : ℝ
  convergenceOrder : ℕ
  errorBoundProved : Prop

structure ErrorEstimateEvidence (E : ErrorEstimatePackage) where
  errorBoundProvedClosed : E.errorBoundProved

def ErrorEstimateClosed (E : ErrorEstimatePackage) : Prop :=
  E.errorBoundProved

theorem error_estimate_closed_from_evidence (E : ErrorEstimatePackage) (Ev : ErrorEstimateEvidence E) :
  ErrorEstimateClosed E := by
  exact Ev.errorBoundProvedClosed

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse

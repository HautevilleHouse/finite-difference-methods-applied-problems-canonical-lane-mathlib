import canonicalLaneMathlib.AdmissibleClass
import FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean.FiniteDifferenceOperator

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure ConvergenceAnalysisPackage (G : FiniteDifferenceOperator gridType) where
  gridRefinement : Prop
  consistencyOrder : Nat
  stabilityCondition : Prop
  l2Error : gridType → Float
  convergenceRate : Nat

structure ConvergenceAnalysisEvidence (G : FiniteDifferenceOperator gridType) (C : ConvergenceAnalysisPackage G) where
  gridRefinementClosed : C.gridRefinement
  stabilityConditionClosed : C.stabilityCondition
  l2ErrorBounded : Prop
  convergenceRateClosed : C.convergenceRate = C.consistencyOrder

def ConvergenceAnalysisClosed (G : FiniteDifferenceOperator gridType) (C : ConvergenceAnalysisPackage G) : Prop :=
  C.gridRefinement ∧ C.stabilityCondition ∧ (C.convergenceRate = C.consistencyOrder)

theorem convergence_analysis_closed_from_evidence
    (G : FiniteDifferenceOperator gridType) (C : ConvergenceAnalysisPackage G)
    (E : ConvergenceAnalysisEvidence G C) : ConvergenceAnalysisClosed G C := by
  exact And.intro E.gridRefinementClosed (And.intro E.stabilityConditionClosed E.convergenceRateClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
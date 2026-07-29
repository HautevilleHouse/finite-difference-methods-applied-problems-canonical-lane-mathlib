import canonicalLaneMathlib.AdmissibleClass
import FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean.FiniteDifferenceOperator

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure TimeDependentSolver (gridType : Type u) (timeType : Type v) where
  spatialOperator : FiniteDifferenceOperator gridType
  timeStepping : timeType → gridType → gridType
  initialCondition : gridType → Float
  boundaryCondition : gridType → Float
  numericalScheme : Prop
  convergent : Prop

structure TimeDependentSolverEvidence (gridType : Type u) (timeType : Type v)
    (T : TimeDependentSolver gridType timeType) where
  numericalSchemeClosed : T.numericalScheme
  convergentClosed : T.convergent

def TimeDependentSolverClosed (gridType : Type u) (timeType : Type v)
    (T : TimeDependentSolver gridType timeType) : Prop :=
  T.numericalScheme ∧ T.convergent

theorem time_dependent_solver_closed_from_evidence
    (gridType : Type u) (timeType : Type v)
    (T : TimeDependentSolver gridType timeType)
    (E : TimeDependentSolverEvidence gridType timeType T) :
    TimeDependentSolverClosed gridType timeType T := by
  exact And.intro E.numericalSchemeClosed E.convergentClosed

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
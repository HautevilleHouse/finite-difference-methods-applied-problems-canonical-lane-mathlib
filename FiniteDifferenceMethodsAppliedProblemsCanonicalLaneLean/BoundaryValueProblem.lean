import canonicalLaneMathlib.AdmissibleClass
import FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean.FiniteDifferenceOperator

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure BoundaryValueProblem (domainType : Type u) where
  domain : domainType
  boundaryValues : domainType → Float
  differentialOperator : FiniteDifferenceOperator domainType
  solution : domainType → Float
  wellPosed : Prop

structure BoundaryValueProblemEvidence (B : BoundaryValueProblem domainType) where
  wellPosedClosed : B.wellPosed
  solutionSatisfiesDifference : Prop
  boundaryConditionsMatched : Prop

def BoundaryValueProblemClosed (B : BoundaryValueProblem domainType) : Prop :=
  B.wellPosed

theorem boundary_value_problem_closed_from_evidence
    (B : BoundaryValueProblem domainType) (E : BoundaryValueProblemEvidence B) :
    BoundaryValueProblemClosed B := by
  exact E.wellPosedClosed

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
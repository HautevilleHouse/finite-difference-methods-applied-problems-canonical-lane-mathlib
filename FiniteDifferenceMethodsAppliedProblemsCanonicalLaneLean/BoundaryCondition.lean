import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure DirichletBoundaryCondition where
  leftValue : ℝ
  rightValue : ℝ
  imposed : Prop

structure NeumannBoundaryCondition where
  leftDerivative : ℝ
  rightDerivative : ℝ
  imposed : Prop

structure RobinBoundaryCondition where
  leftCoeff : ℝ
  rightCoeff : ℝ
  imposed : Prop

structure BoundaryConditionPackage where
  dirichlet : DirichletBoundaryCondition
  neumann : NeumannBoundaryCondition
  robin : RobinBoundaryCondition
  consistency : Prop

structure BoundaryConditionEvidence (B : BoundaryConditionPackage) where
  consistencyClosed : B.consistency

def BoundaryConditionClosed (B : BoundaryConditionPackage) : Prop :=
  B.consistency

theorem boundary_condition_closed_from_evidence (B : BoundaryConditionPackage) (E : BoundaryConditionEvidence B) :
  BoundaryConditionClosed B := by
  exact E.consistencyClosed

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse

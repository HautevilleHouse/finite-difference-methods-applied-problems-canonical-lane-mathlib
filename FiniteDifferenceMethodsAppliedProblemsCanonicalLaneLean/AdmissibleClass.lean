import canonicalLaneMathlib.AdmissibleClass
import FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean.BoundaryValueProblem

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure AdmissibleClass where
  object : BoundaryValueProblem Type
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FiniteDifferenceOperatorClosed A.object.differentialOperator ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
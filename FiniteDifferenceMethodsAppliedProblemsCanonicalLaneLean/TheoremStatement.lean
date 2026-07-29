import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure FiniteDifferenceAdmittedObject where
  space : Type
  grid : Type
  scheme : Type
  stabilityCondition : Prop
  consistencyCondition : Prop
  convergenceCondition : Prop
  conclusion : convergenceCondition

def FiniteDifferenceWitnessClosed (O : FiniteDifferenceAdmittedObject) : Prop :=
  O.convergenceCondition

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
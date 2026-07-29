import canonicalLaneMathlib.AdmissibleClass
import FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FiniteDifferenceOperatorClosed A.object.differentialOperator

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.wellPosed

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
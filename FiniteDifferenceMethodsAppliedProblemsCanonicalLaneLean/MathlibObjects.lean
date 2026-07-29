import FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure FiniteDifferenceSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure FiniteDifferenceAdmittedObject where
  space : FiniteDifferenceSpace
  uniformGrid : Prop
  consistentScheme : Prop
  stabilityCondition : Prop
  conclusion : stabilityCondition

def FiniteDifferenceWitnessClosed (O : FiniteDifferenceAdmittedObject) : Prop :=
  O.stabilityCondition

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
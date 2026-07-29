import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure FiniteDifferenceGrid where
  numPoints : Nat
  stepSize : Float
  domainStart : Float
  domainEnd : Float
  gridPoints : Array Float
  uniform : Prop

structure GridEvidence (G : FiniteDifferenceGrid) where
  numPointsClosed : G.numPoints ≥ 2
  stepSizeClosed : G.stepSize > 0.0
  uniformClosed : G.uniform

def GridClosed (G : FiniteDifferenceGrid) : Prop :=
  G.numPoints ≥ 2 ∧ G.stepSize > 0.0 ∧ G.uniform

theorem grid_closed_from_evidence (G : FiniteDifferenceGrid) (E : GridEvidence G) : GridClosed G := by
  exact And.intro E.numPointsClosed (And.intro E.stepSizeClosed E.uniformClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
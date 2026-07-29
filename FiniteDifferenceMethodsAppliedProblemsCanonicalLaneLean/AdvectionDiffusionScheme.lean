import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure AdvectionDiffusionSchemePackage where
  upwindingApplied : Prop
  diffusionTermCentered : Prop
  cflConditionSatisfied : Prop
  monotonicScheme : Prop

structure AdvectionDiffusionSchemeEvidence (A : AdvectionDiffusionSchemePackage) where
  upwindingAppliedClosed : A.upwindingApplied
  diffusionTermCenteredClosed : A.diffusionTermCentered
  cflConditionSatisfiedClosed : A.cflConditionSatisfied
  monotonicSchemeClosed : A.monotonicScheme

def AdvectionDiffusionSchemeClosed (A : AdvectionDiffusionSchemePackage) : Prop :=
  A.upwindingApplied ∧ A.diffusionTermCentered ∧ A.cflConditionSatisfied ∧ A.monotonicScheme

theorem advection_diffusion_scheme_closed_from_evidence (A : AdvectionDiffusionSchemePackage) (E : AdvectionDiffusionSchemeEvidence A) : AdvectionDiffusionSchemeClosed A := by
  exact And.intro E.upwindingAppliedClosed (And.intro E.diffusionTermCenteredClosed (And.intro E.cflConditionSatisfiedClosed E.monotonicSchemeClosed))

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse

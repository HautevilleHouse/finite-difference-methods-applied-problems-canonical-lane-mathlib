import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean

structure NonlinearExtensionPackage where
  nonlinearOperator : Type u
  linearizationMethod : Type v
  newtonIteration : Prop
  convergenceGuarantee : Prop
  adaptivityControl : Prop

structure NonlinearExtensionEvidence (N : NonlinearExtensionPackage) where
  newtonIterationClosed : N.newtonIteration
  convergenceGuaranteeClosed : N.convergenceGuarantee
  adaptivityControlClosed : N.adaptivityControl

def NonlinearExtensionClosed (N : NonlinearExtensionPackage) : Prop :=
  N.newtonIteration ∧ N.convergenceGuarantee ∧ N.adaptivityControl

theorem nonlinear_extension_closed_from_evidence (N : NonlinearExtensionPackage)
    (E : NonlinearExtensionEvidence N) : NonlinearExtensionClosed N := by
  exact And.intro E.newtonIterationClosed
    (And.intro E.convergenceGuaranteeClosed E.adaptivityControlClosed)

end FiniteDifferenceMethodsAppliedProblemsCanonicalLaneLean
end HautevilleHouse
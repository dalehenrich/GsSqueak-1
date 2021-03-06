*SqClasses-error handling
_primitiveFailed: aSelector
  "Methods which are implemented as primitives send _primitiveFailed:
 when a primitive fails and the failure is not attributable to any
 normal error such as bad argument kind, argument out of range, etc."

  | args |
  args := {self.
  aSelector}.
  args add: primArgs.
  ^ ArgumentError new
    _number: 2258;
    args: args;
    signal	"#rtErrPrimFailed"

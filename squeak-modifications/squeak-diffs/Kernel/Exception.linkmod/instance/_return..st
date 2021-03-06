handling
_return: returnValue
 "When sent within an ANSI handler's handlerBlock,
  resume execution by returning returnValue from the #on:do: send 
  which installed the currently active handlerBlock .   

  Caller has executed ensure: blocks between top of stack and that #on:do: .
  This primitive will trim stack back to that #on:do: .
  Generates an error if sent within a legacy handler's handlerBlock.

  Will return into a C extension exception handling C code, or
  to from the currently active handlerBlock, which ever is closer
  to the top of the stack. 
"
<primitive: 2020> "does not return"
self _uncontinuableError


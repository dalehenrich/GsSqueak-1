as yet unclassified
screenSize
  | cArray cArrayClass |
  cArrayClass := GemstoneSmalltalk _env0 classNamed: #CByteArray.
  cArray := cArrayClass gcMalloc: 8.
  getSizeCo
    _env0 callWith:
      {(self defaultWindow).
      cArray}.
  ^ (cArray _env0 uint32At: 0) @ (cArray _env0 uint32At: 4)
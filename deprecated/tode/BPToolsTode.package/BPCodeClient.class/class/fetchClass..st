as yet unclassified
fetchClass: aSymbol
  | tcpSocket buffer |
  tcpSocket := Socket newTCP.
  tcpSocket connectTo: self codeHost port: 1742.	"tcpSocket waitForConnectionFor: 2."
  tcpSocket sendData: aSymbol asString.
  buffer := ''.
  [ tcpSocket isConnected ]
    whileTrue: [ buffer := buffer , (tcpSocket readString: 100000000) ].
  ^ buffer
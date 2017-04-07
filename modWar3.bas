Attribute VB_Name = "modWar3"
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function GetTickCount Lib "kernel32" () As Long

Public BroodHwnd As Long

Public Type t_MemInfo
    Address1 As Long        ' Դ��ַ
    Mem0() As Byte          ' Դ����
    Mem1() As Byte          ' �޸�-��ת
    Address2 As Long        ' ת��-��ַ
    Mem2() As Byte          ' ת��-����
    Address3 As Long        ' �Ĵ����ı���
    Address3Patch As Long   ' ���޸ĵĵ�ַ��Ĵ�����ƫ����
    
    Index As Long           ' DataGrid��Index
    Name As String          ' ����޸ĵ�����
    DataType As VbVarType   ' 3-Long 4-Single
End Type

Public Type t_MemManage
    Address1 As Long
    ok As Boolean
End Type

Public sMemory(1 To 12) As t_MemInfo
Public sMemoryState(1 To 12) As t_MemManage
Public Const sMemoryMin As Long = 1
Public Const sMemoryMax As Long = 12

' Patch 2007.1.31 - �����������������
' Begin
Public tickStart1 As Long
' End

Public Sub dataInit(dataGrid As MSHFlexGrid)
    On Error Resume Next

    Dim i As Integer, j As Integer
    For i = sMemoryMin To sMemoryMax
        j = j + 1
        With sMemory(i)
            'dataGrid.TextMatrix(j, 0) = LoadResString(Trim(Str(j)) & "00")
            dataGrid.AddItem LoadResString(Trim(Str(j)) & "00"), j
            .Address1 = Val("&H" & LoadResString(Trim(Str(j)) & "01"))
            .Address2 = Val("&H" & LoadResString(Trim(Str(j)) & "02"))
            .Address3 = Val("&H" & LoadResString(Trim(Str(j)) & "03"))
            .Address3Patch = Val("&H" & LoadResString(Trim(Str(j)) & "04"))
            .DataType = Val(LoadResString(Trim(Str(j)) & "05"))
            .Mem0 = LoadResData(j * 100 + 0, "CUSTOM")
            .Mem1 = LoadResData(j * 100 + 1, "CUSTOM")
            .Mem2 = LoadResData(j * 100 + 2, "CUSTOM")
            .Index = j
        End With
    Next
End Sub

Public Sub goInject()
    Dim i As Integer
    Dim var1(0 To 3) As Byte
    For i = sMemoryMin To sMemoryMax
        var1(0) = 0
        var1(1) = 0
        var1(2) = 0
        var1(3) = 0
        
        If sMemory(i).Address1 <> 0 Then
            EditMem BroodHwnd, sMemory(i).Address2, sMemory(i).Mem2
            EditMem BroodHwnd, sMemory(i).Address1, sMemory(i).Mem1
            EditMem BroodHwnd, sMemory(i).Address3, var1
        End If
        sMemoryState(i).ok = False
        sMemoryState(i).Address1 = 0
    Next
End Sub

Public Sub findHero(dataGrid As MSHFlexGrid)
    Dim vMem(0 To 3) As Byte
    Dim vVal As Long
    Dim vRetLng As Long, vRetFloat As Single
    Dim i As Integer
    For i = sMemoryMin To sMemoryMax
        If sMemoryState(i).ok Then
            ' �ָ���������
            'EditMem BroodHwnd, sMemory(i).Address1, sMemory(i).Mem0
        Else
            ' ��д��������
            With sMemory(i)
                ReadMem BroodHwnd, .Address3, vMem
                CopyMemory ByVal VarPtr(vVal), vMem(0), 4
                If vMem(0) = 0 _
                And vMem(1) = 0 _
                And vMem(2) = 0 _
                And vMem(3) = 0 Then
                    ' ��û�и㶨
                Else
                    ' ��ȡ
                    ReadMem BroodHwnd, vVal + .Address3Patch, vMem
                    If .DataType = vbLong Then
                        CopyMemory ByVal VarPtr(vRetLng), vMem(0), 4
                        dataGrid.TextMatrix(.Index, 1) = Trim(Str(vRetLng))
                    ElseIf .DataType = vbSingle Then
                        CopyMemory ByVal VarPtr(vRetFloat), vMem(0), 4
                        dataGrid.TextMatrix(.Index, 1) = Trim(Str(vRetFloat))
                    End If
                    ' ��¼���ָ���������
                    'sMemoryState(i).ok = True
                    'sMemoryState(i).Address1 = vVal
                    'EditMem BroodHwnd, sMemory(i).Address1, sMemory(i).Mem0
                    
                    ' Patch 2007.1.31 - ����������������� ----------------
                    ' Begin
                    If i = 3 Then
                        ' �����ݡ��ո��ҵ�
                        tickStart1 = GetTickCount
                    End If
                    If i = 4 Then  ' ��ǰ��"����"
                        If sMemoryState(3).ok And GetTickCount - tickStart1 > 3000 Then  ' �����ݡ��Ѿ��ҵ�&&�Ѿ���ʱ3��
                            ' ��¼���ָ���������
                            sMemoryState(i).ok = True
                            sMemoryState(i).Address1 = vVal
                            EditMem BroodHwnd, sMemory(i).Address1, sMemory(i).Mem0
                        End If
                    Else           ' ��ͨ���
                        ' ��¼���ָ���������
                        sMemoryState(i).ok = True
                        sMemoryState(i).Address1 = vVal
                        If sMemory(i).Address1 <> 0 Then
                            EditMem BroodHwnd, sMemory(i).Address1, sMemory(i).Mem0
                        End If
                    End If
                    ' Patch End -------------------------------------------
                End If
            End With
        End If
    Next
End Sub

Public Sub editHero(dataGrid As MSHFlexGrid)
    Dim vMem(0 To 3) As Byte
    Dim vVal As Long
    Dim vStr As String
    Dim vRetLng As Long, vRetFloat As Single

    Dim i As Integer
    For i = sMemoryMin To sMemoryMax
    With sMemory(i)
        'ReadMem BroodHwnd, .Address3, vMem
        'CopyMemory ByVal VarPtr(vVal), vMem(0), 4
        vVal = sMemoryState(i).Address1
        
        vStr = dataGrid.TextMatrix(.Index, 2)
        If Trim(vStr) <> "" And vVal <> 0 Then
        ' ��!
            dataGrid.TextMatrix(.Index, 1) = dataGrid.TextMatrix(.Index, 2)
            dataGrid.TextMatrix(.Index, 2) = ""
            If .DataType = vbLong Then
                vRetLng = Val(vStr)
                CopyMemory vMem(0), ByVal VarPtr(vRetLng), 4
            ElseIf .DataType = vbSingle Then
                vRetFloat = Val(vStr)
                CopyMemory vMem(0), ByVal VarPtr(vRetFloat), 4
            End If
            EditMem BroodHwnd, vVal + .Address3Patch, vMem
        End If
    End With
    Next
End Sub

' ����޸ĵĴ���
Sub AntiRefresh()
    Dim vMem(0 To 3) As Byte
    Dim vVal As Long
    Dim vRetLng As Long, vRetFloat As Single
    Dim i As Integer
    For i = sMemoryMin To sMemoryMax
        sMemoryState(i).ok = True
        ' �ָ���������
        If sMemory(i).Address1 <> 0 Then
            EditMem BroodHwnd, sMemory(i).Address1, sMemory(i).Mem0
        End If
    Next
End Sub

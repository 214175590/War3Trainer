Attribute VB_Name = "modWar3Common"
Option Explicit

'public Declare Function GetTickCount Lib "kernel32" () As Long

Public BroodHwnd As Long    ' ��Ϸ���

Public Type t_MemInject
    Address1 As Long        ' Դ-��ַ
    Mem0() As Byte          ' Դ-����
    Mem1() As Byte          ' ��ת-����
    
    Address2 As Long        ' ת��-��ַ
    Mem2() As Byte          ' ת��-����
    
    Address3 As Long        ' �Ĵ�������-��ַ
End Type

Public Type t_MemManage
    Caption As String       ' ����޸���ʲô
    DataType As VbVarType   ' 3-Long 4-Single
    Address4 As Long        ' Ŀ���ַ
    OK As Boolean           ' �Ƿ������޸�
End Type

Public pGameMemory_ThisGame As Long         ' ��Ϸȫ��      [6FAA4178]
Public pGameMemory_ThisGameMemory As Long   ' ��Ϸȫ���ڴ�  [ThisGame + 0xC]

Public pUnit_ThisUnit As Long               ' ��ǰ��λ      ESI
Public pUnit_UnitAttributes As Long         '               [ThisUnit + 1E4]
Public pUnit_HeroAttributes As Long         '               [ThisUnit + 1EC]

Public Const WAR3_ADDRESS_THIS_GAME As Long = &H6FAA4178

Public Sub initGameMemory()
    pGameMemory_ThisGame = OperMem.ReadMemLong(BroodHwnd, WAR3_ADDRESS_THIS_GAME)
    If pGameMemory_ThisGame <> 0 Then
        pGameMemory_ThisGameMemory = OperMem.ReadMemLong(BroodHwnd, pGameMemory_ThisGame + &HC)
    Else
        pGameMemory_ThisGameMemory = 0
        pUnit_ThisUnit = 0
        pUnit_UnitAttributes = 0
        pUnit_HeroAttributes = 0
    End If
End Sub

' ��ν��<�ڴ���ȡ�㷨0>
Public Function readFromGameMemory(ByVal nIndex As Long) As Long
    If nIndex < 0 Then
        MsgBox "BUG in <readFromGameMemory>��nIndex���λΪ1��"
        readFromGameMemory = 0
        Exit Function
    End If
    If pGameMemory_ThisGameMemory <> 0 Then
        readFromGameMemory = OperMem.ReadMemLong(BroodHwnd, pGameMemory_ThisGameMemory + nIndex * 8 + 4)
    Else
        readFromGameMemory = 0
    End If
End Function

' ��ν��<�ڴ���ȡ�㷨1>����������
Public Function getGameVar1(ByVal nIndex As Long) As Long
    getGameVar1 = readFromGameMemory(nIndex)
    getGameVar1 = getGameVar1 + &H78
End Function

' ��ν��<�ڴ���ȡ�㷨2>�������ƶ��ٶ�
Public Function getGameVar2(ByVal nIndex As Long)
    getGameVar2 = readFromGameMemory(nIndex)
    If OperMem.ReadMemLong(BroodHwnd, getGameVar2 + &H20) = 0 Then
        getGameVar2 = OperMem.ReadMemLong(BroodHwnd, getGameVar2 + &H54)
    Else
        MsgBox "BUG in <�ڴ���ȡ�㷨2>��sub_6F468A20()�����ַ + 20��ָ����Ϊ�㡣"
        ' �����ķ����ˣ����³�Ϯsub_6F468A20
        ' �ϵ�����6F0776F6
        getGameVar2 = 0
    End If
End Function


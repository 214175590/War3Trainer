VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmMain 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "[tc]ħ��3�ڴ��޸��� v6"
   ClientHeight    =   6915
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   11895
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   6915
   ScaleWidth      =   11895
   StartUpPosition =   2  '��Ļ����
   Begin VB.Frame Frame5 
      Caption         =   "������"
      Height          =   915
      Left            =   3000
      TabIndex        =   3
      Top             =   360
      Width           =   4215
      Begin VB.Label labVersion 
         AutoSize        =   -1  'True
         Caption         =   "��Ϸ�汾"
         Height          =   180
         Left            =   240
         TabIndex        =   4
         Top             =   300
         Width           =   3720
         WordWrap        =   -1  'True
      End
   End
   Begin VB.CommandButton cmdGetUnitList 
      Caption         =   "��ѡ"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1440
      TabIndex        =   6
      ToolTipText     =   "�ģ����ı���޸�Ӧ�õ�����ͷ��"
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Frame Frame4 
      Caption         =   "ѡ�еĵ�λ"
      Height          =   5175
      Left            =   240
      TabIndex        =   5
      Top             =   1560
      Width           =   2535
      Begin VB.ListBox lstSelectedUnits 
         Height          =   4560
         Left            =   240
         TabIndex        =   7
         Top             =   360
         Width           =   2055
      End
   End
   Begin VB.TextBox txtVal2 
      Height          =   270
      Left            =   8760
      MaxLength       =   9
      TabIndex        =   16
      ToolTipText     =   "�༭������ڱ�ĵ�Ԫ����˫��"
      Top             =   1560
      Visible         =   0   'False
      Width           =   1500
   End
   Begin VB.CommandButton cmdEdit_Game 
      Caption         =   "�޸�"
      Enabled         =   0   'False
      Height          =   375
      Left            =   10440
      TabIndex        =   14
      ToolTipText     =   "�޸ĺ���Ϸ�в��������з�Ӧ����������Ϸ�иı���Ӧ��ֵ"
      Top             =   240
      Width           =   975
   End
   Begin VB.CommandButton cmdReFresh_Game 
      Caption         =   "��ֵ����"
      Enabled         =   0   'False
      Height          =   375
      Left            =   9120
      TabIndex        =   13
      ToolTipText     =   "����Ǯ"
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "�޸�"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5880
      TabIndex        =   9
      ToolTipText     =   "�ģ����ı���޸�Ӧ�õ�����ͷ��"
      Top             =   1440
      Width           =   1095
   End
   Begin VB.TextBox txtVal1 
      Height          =   270
      Left            =   4320
      MaxLength       =   9
      TabIndex        =   11
      ToolTipText     =   "�༭������ڱ�ĵ�Ԫ����˫��"
      Top             =   2760
      Visible         =   0   'False
      Width           =   1500
   End
   Begin VB.Frame Frame2 
      Caption         =   "��λ"
      Height          =   5175
      Left            =   3000
      TabIndex        =   8
      ToolTipText     =   "��λ���������"
      Top             =   1560
      Width           =   4215
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid gridHero 
         Height          =   4575
         Left            =   240
         TabIndex        =   10
         ToolTipText     =   "˫����Ԫ����Ա༭"
         Top             =   360
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   8070
         _Version        =   393216
         Cols            =   3
         GridColor       =   -2147483637
         AllowBigSelection=   0   'False
         ScrollBars      =   2
         _NumberOfBands  =   1
         _Band(0).Cols   =   3
         _Band(0).GridLinesBand=   1
         _Band(0).TextStyleBand=   0
         _Band(0).TextStyleHeader=   0
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "����"
      Height          =   915
      Left            =   240
      TabIndex        =   0
      ToolTipText     =   "�����Ϸ�Ƿ�����"
      Top             =   360
      Width           =   2535
      Begin VB.TextBox txtHwnd 
         Height          =   315
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   1
         TabStop         =   0   'False
         Text            =   "״̬"
         Top             =   360
         Width           =   855
      End
      Begin VB.CommandButton cmdRe 
         Caption         =   "������Ϸ"
         Height          =   435
         Left            =   1200
         TabIndex        =   2
         ToolTipText     =   "���¼����Ϸ�Ƿ�����"
         Top             =   300
         Width           =   1095
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "��Ϸ"
      Height          =   6375
      Left            =   7440
      TabIndex        =   12
      ToolTipText     =   "��Ϸ������"
      Top             =   360
      Width           =   4215
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid gridGame 
         Height          =   5775
         Left            =   240
         TabIndex        =   15
         ToolTipText     =   "˫����Ԫ����Ա༭"
         Top             =   360
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   10186
         _Version        =   393216
         Cols            =   3
         GridColor       =   -2147483637
         AllowBigSelection=   0   'False
         ScrollBars      =   2
         _NumberOfBands  =   1
         _Band(0).Cols   =   3
         _Band(0).GridLinesBand=   1
         _Band(0).TextStyleBand=   0
         _Band(0).TextStyleHeader=   0
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim isGridGame_FirstClick As Boolean
Dim posGridGame_LastClickRow As Long
Dim isGridUnit_FirstClick As Boolean
Dim posGridUnit_LastClickRow As Long

Private Sub cmdRe_Click()
    reScanGame
End Sub

Private Sub Form_Load()
    isGridGame_FirstClick = True
    isGridUnit_FirstClick = True

    modModifyUnit.dataInit gridHero
    gridHero.TextMatrix(0, 1) = "ԭֵ"
    gridHero.TextMatrix(0, 2) = "Ŀ��"
    gridHero.ColWidth(0) = 85 * Screen.TwipsPerPixelX
    gridHero.ColWidth(1) = 71 * Screen.TwipsPerPixelX
    gridHero.ColWidth(2) = 74 * Screen.TwipsPerPixelX
    txtVal1.Width = 74 * Screen.TwipsPerPixelX
    gridHero.RemoveItem gridHero.Rows - 1
    
    modModifyMoney.dataInit gridGame
    gridGame.TextMatrix(0, 1) = "ԭֵ"
    gridGame.TextMatrix(0, 2) = "Ŀ��"
    gridGame.ColWidth(0) = 85 * Screen.TwipsPerPixelX
    gridGame.ColWidth(1) = 71 * Screen.TwipsPerPixelX
    gridGame.ColWidth(2) = 74 * Screen.TwipsPerPixelX
    txtVal2.Width = 74 * Screen.TwipsPerPixelX
    gridGame.RemoveItem gridGame.Rows - 1

    ToKen
    reScanGame
End Sub

Public Sub reScanGame()
    BroodHwnd = GetBroodHwnd
    If BroodHwnd = 0 Then
        txtHwnd = "δ����"
        cmdReFresh_Game.Enabled = False
        cmdGetUnitList.Enabled = False
        labVersion.Caption = "��Ϸû�����У�����������Ϸ��Ȼ�󵥻�����ˢ��"
    Else
        txtHwnd = Hex(BroodHwnd)
        cmdGetUnitList.Enabled = True
        cmdReFresh_Game.Enabled = True
        
        labVersion.Caption = getWar3Version
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub cmdGetUnitList_Click()
    lstSelectedUnits.Clear
    Call modModifyUnit.goInject
    
    Dim i As Long
    For i = 1 To modModifyUnit.nSelectedUnitList
        lstSelectedUnits.AddItem Hex(modModifyUnit.sMemorySelectedUnitList(i).heroESI) _
                                    & ":" & getUnitName(modModifyUnit.sMemorySelectedUnitList(i).heroESI)
    Next
End Sub

Private Sub lstSelectedUnits_Click()
    If lstSelectedUnits.ListIndex <> -1 Then
        modWar3Common.pUnit_ThisUnit = modModifyUnit.sMemorySelectedUnitList(lstSelectedUnits.ListIndex + 1).heroESI
        
        modModifyUnit.unitCaleAllAdress
        modModifyUnit.getUnitValues gridHero
        cmdEdit.Enabled = True
    End If
End Sub

Private Sub cmdReFresh_Game_Click()
    Call modModifyMoney.goInject
    Call modModifyMoney.fillData(gridGame)
    cmdEdit_Game.Enabled = True
End Sub

' ******************************************************************************************
' * GUI
' ******************************************************************************************
'ʵ�ֱ༭����
Private Sub cmdEdit_Click()
    modModifyUnit.putUnitValues gridHero
End Sub

Private Sub cmdEdit_Game_Click()
    modModifyMoney.editData gridGame
End Sub

Private Sub gridGame_Click()
    If isGridGame_FirstClick = False And posGridGame_LastClickRow <> gridGame.Row Then
        gridGame.TextMatrix(posGridGame_LastClickRow, 2) = txtVal2.Text
        posGridGame_LastClickRow = gridGame.Row
        isGridGame_FirstClick = True
        txtVal2.Visible = False
    End If
End Sub

Private Sub gridGame_DblClick()
    '�������˫��
    If isGridGame_FirstClick Then
        posGridGame_LastClickRow = gridGame.Row
        txtVal2.Text = gridGame.TextMatrix(posGridGame_LastClickRow, 1)
        
        isGridGame_FirstClick = False
    End If
    '���ı�����õ���ǰ��Ԫ��
    txtVal2.Move Frame3.Left + gridGame.Left + gridGame.ColPos(2) + 1 * Screen.TwipsPerPixelX, _
                Frame3.Top + gridGame.Top + gridGame.RowPos(gridGame.Row) + 1 * Screen.TwipsPerPixelY
    txtVal2.Visible = True
    txtVal2.SetFocus
End Sub

'ʵ�ֱ༭����
Private Sub gridHero_Click()
    If isGridUnit_FirstClick = False And posGridUnit_LastClickRow <> gridHero.Row Then
        gridHero.TextMatrix(posGridUnit_LastClickRow, 2) = txtVal1.Text
        posGridUnit_LastClickRow = gridHero.Row
        isGridUnit_FirstClick = True
        txtVal1.Visible = False
    End If
End Sub

Private Sub gridHero_DblClick()
    '�������˫��
    If isGridUnit_FirstClick Then
        posGridUnit_LastClickRow = gridHero.Row
        txtVal1.Text = gridHero.TextMatrix(posGridUnit_LastClickRow, 1)
        
        isGridUnit_FirstClick = False
    End If
    '���ı�����õ���ǰ��Ԫ��
    txtVal1.Move Frame2.Left + gridHero.Left + gridHero.ColPos(2) + 1 * Screen.TwipsPerPixelX, _
                Frame2.Top + gridHero.Top + gridHero.RowPos(gridHero.Row) + 1 * Screen.TwipsPerPixelY
    txtVal1.Visible = True
    txtVal1.SetFocus
End Sub

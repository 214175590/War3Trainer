VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "[tc]ħ��3�ڴ��޸���"
   ClientHeight    =   6150
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   5670
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6150
   ScaleWidth      =   5670
   StartUpPosition =   2  '��Ļ����
   Begin VB.CommandButton cmdAntiRefresh 
      Caption         =   "��ֹˢ��"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2640
      TabIndex        =   8
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdReFresh 
      Caption         =   "ˢ��"
      Height          =   375
      Left            =   1320
      TabIndex        =   7
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "�޸�"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3960
      TabIndex        =   6
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   5160
      Top             =   1200
   End
   Begin VB.TextBox txtVal1 
      Height          =   270
      Left            =   3240
      TabIndex        =   4
      Top             =   2760
      Visible         =   0   'False
      Width           =   1500
   End
   Begin VB.Frame Frame2 
      Caption         =   "��λ"
      Height          =   4575
      Left            =   240
      TabIndex        =   3
      Top             =   1320
      Width           =   5175
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid gridHero 
         Height          =   3975
         Left            =   240
         TabIndex        =   5
         Top             =   360
         Width           =   4695
         _ExtentX        =   8281
         _ExtentY        =   7011
         _Version        =   393216
         Cols            =   3
         AllowBigSelection=   0   'False
         ScrollBars      =   0
         _NumberOfBands  =   1
         _Band(0).Cols   =   3
         _Band(0).GridLinesBand=   5
         _Band(0).TextStyleBand=   0
         _Band(0).TextStyleHeader=   0
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "����"
      Height          =   855
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2295
      Begin VB.TextBox txtHwnd 
         Height          =   315
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   360
         Width           =   735
      End
      Begin VB.CommandButton cmdRe 
         Caption         =   "ˢ��"
         Height          =   315
         Left            =   1080
         TabIndex        =   1
         Top             =   360
         Width           =   1035
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdRe_Click()
    reScanGame
End Sub

Private Sub Form_Load()
    modWar3.dataInit gridHero
    gridHero.TextMatrix(0, 1) = "ԭֵ"
    gridHero.TextMatrix(0, 2) = "Ŀ��"
    gridHero.ColWidth(0) = 100 * Screen.TwipsPerPixelX
    gridHero.ColWidth(1) = 100 * Screen.TwipsPerPixelX
    gridHero.ColWidth(2) = 100 * Screen.TwipsPerPixelX
    txtVal1.Width = 100 * Screen.TwipsPerPixelX
    'gridHero.AddItem "��û�����ݣ�"
    gridHero.TextMatrix(gridHero.Rows - 1, 0) = "��û�����ݣ�"
    
    ToKen
    reScanGame
End Sub

Public Sub reScanGame()
    BroodHwnd = GetBroodHwnd
    If BroodHwnd = 0 Then
        txtHwnd = "δ����"
        'Timer1.Enabled = False
    Else
        txtHwnd = Hex(BroodHwnd)
        'Timer1.Enabled = True
        'Call modWar3.goInject
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ' Ҫ�ָ��ڴ棡
    Call cmdAntiRefresh_Click
End Sub

'ʵ�ֱ༭����
Private Sub gridHero_DblClick()
    Static firstClick As Boolean
    Static lastClickRow As Long
    Static lastClickCol As Long
    
    txtVal1.Visible = False
    '�������˫������ô��ִ�����´���
    If firstClick = True Then
        lastClickRow = gridHero.Row
        lastClickCol = gridHero.Col
        txtVal1.Text = gridHero.TextMatrix(lastClickRow, lastClickCol)
    End If
    '���ı�����õ���ǰ��Ԫ��
    Dim LeftOfText% '�ı����left����
    Dim TopOfText% '�ı����top����
    Dim selrow% '��ǰ��
    Dim selcol% '��ǰ��
    selrow = gridHero.Row
    selcol = gridHero.Col
    If selcol = 2 Then selcol = 1
    'LeftOfText = Frame2.Left + gridHero.Left + gridHero.ColPos(selcol) + 45
    LeftOfText = Frame2.Left + gridHero.Left + gridHero.ColPos(2) + 45
    TopOfText = Frame2.Top + gridHero.Top + gridHero.RowPos(selrow) + 45
    txtVal1.Move LeftOfText, TopOfText
    txtVal1.Visible = True
    '������ǳ���˫������ô��ִ�����´���
    If firstClick = False Then
        gridHero.TextMatrix(lastClickRow, lastClickCol) = txtVal1.Text
        lastClickRow = gridHero.Row
        lastClickCol = gridHero.Col
    End If
    txtVal1.Text = gridHero.TextMatrix(selrow, selcol)
    '�Ѿ����ǵ�һ�ν���˫������
    firstClick = False
    txtVal1.SetFocus
End Sub

Private Sub Timer1_Timer()
    findHero gridHero
    
    Dim ok As Boolean
    Dim i As Long
    ok = True
    ' �����ȫok�Ļ�����ֹtimer
    For i = sMemoryMin To sMemoryMax
        If Not sMemoryState(i).ok Then
            ok = False
            Exit For
        End If
    Next
    If ok Then
        Call cmdAntiRefresh_Click
    End If
End Sub

Private Sub cmdReFresh_Click()
    Call modWar3.goInject
    Timer1.Enabled = True
    cmdAntiRefresh.Enabled = True
    cmdEdit.Enabled = False
End Sub

Private Sub cmdEdit_Click()
    editHero gridHero
End Sub

Private Sub cmdAntiRefresh_Click()
    Call AntiRefresh
    Timer1.Enabled = False
    cmdEdit.Enabled = True
    cmdAntiRefresh.Enabled = False
End Sub


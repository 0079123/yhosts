'------------------------------------------------------------
' ConvFile.vbs
' ʵ��Dos��Unix�ı��ļ����໥ת��
' benbenknight
Function ConvUnixToDos(strInfo)
' ���ַ�����Unix���и�ʽתΪDos���и�ʽ
' ����vbCr�滻ΪvbCrLf
    ' �Ƚ�vbCrLf����vbCr
    ConvUnixToDos = Replace(strInfo, vbCrLf, vbLf)
    ' �Ƚ�vbCr����vbCrLf
    ConvUnixToDos = Replace(ConvUnixToDos, vbLf, vbCrLf)
    
End Function
Function ConvDosToUnix(strInfo)
' ���ַ�����Dos���и�ʽתΪUnix���и�ʽ
' ����vbCrLf�滻ΪvbCr
    ConvDosToUnix = Replace(strInfo, vbCrLf, vbLf)
    
End Function
Function ReadFileToString(strFilePath)
' ���ı��ļ����뵽�ַ�����
' strFilePath �ı��ļ�ȫ·��
    ' �ļ���д��־
    Const ForReading = 1
    
    ' ���ļ�
    Set ofs = CreateObject("Scripting.FileSystemObject")
    Set ofile = ofs.OpenTextFile(strFilePath, ForReading, True)
    
    ' �����ļ�
    ReadFileToString = ofile.ReadAll
    ' �ر��ļ�
    ofile.Close
    
End Function
Sub WriteStringToFile(strFilePath, strInfo)
' ���ַ���д���ı��ļ�
' strFilePath �ı��ļ�ȫ·��
' strInfo �ַ���
    ' �ļ���д��־
    Const ForWriting = 2
    Const isCreateNew = True
    Set ofs = CreateObject("Scripting.FileSystemObject")
    
    ' ���ļ�
    Set ofile = ofs.OpenTextFile(strFilePath, ForWriting, isCreateNew)
    
    ' д���ļ�
    ofile.Write strInfo
    
    '�ر��ļ�
    ofile.Close
    
End Sub
   
    strSrcFile = "d:\merge_dos.txt"
    strDestFile = "d:\merge_unix.txt"
    strDestFile2 = "d:\merge_dos2.txt"
    
    ' ��Dos�ļ�תΪUnix�ļ�
    strDos = ReadFileToString(strSrcFile)
    strUnix = ConvDosToUnix(strDos)
    WriteStringToFile strDestFile, strUnix
    
    ' ��Unix�ļ�תΪDos�ļ�
    strUnix = ReadFileToString(strDestFile)
    strDos = ConvUnixToDos(strUnix)
    WriteStringToFile strDestFile2, strDos
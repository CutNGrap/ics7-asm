; ��������������������������������������������������������������������������������������������������
;    This example does not use the common control library as it only uses the standard controls
; ��������������������������������������������������������������������������������������������������

    include \masm32\include\masm32rt.inc
    include \masm32\include\dialogs.inc
    include \masm32\include\debug.inc
    includelib \masm32\lib\debug.lib

    dlgproc PROTO :DWORD,:DWORD,:DWORD,:DWORD
    GetTextDialog PROTO :DWORD,:DWORD,:DWORD
    add_string PROTO :DWORD,:DWORD,:DWORD
    get_number PROTO :DWORD
    get_string PROTO :DWORD,:DWORD

    .data?
      hInstance dd ?

    .code



start:
    mov hInstance, rv(GetModuleHandle,NULL) ; так как NULL, то возвращает дескриптор данного процесса
    call main
    invoke ExitProcess,eax ; чистое завершение процесса, с отключением всех dll


main proc

    LOCAL hIcon :DWORD

    invoke InitCommonControls ; Регистрирует и инициализирует классы окна стандартного органа управления

    mov hIcon, rv(LoadIcon,hInstance,10) 

    rv(GetTextDialog,"Calculator","Enter numbers",hIcon)


    invoke GlobalFree,ptxt 

    ret

main endp

; ��������������������������������������������������������������������������������������������������

GetTextDialog proc dgltxt:DWORD,grptxt:DWORD,iconID:DWORD

    LOCAL arg1[4]:DWORD
    LOCAL parg  :DWORD

    lea eax, arg1
    mov parg, eax

  ; ---------------------------------------
  ; load the array with the stack arguments
  ; ---------------------------------------
    mov ecx, dgltxt
    mov [eax], ecx
    mov ecx, grptxt
    mov [eax+4], ecx
    mov ecx, iconID
    mov [eax+8], ecx

    Dialog "Get User Text", \               ; caption
           "Arial",8, \                     ; font,pointsize
            WS_OVERLAPPED or \              ; styles for
            WS_SYSMENU or DS_CENTER, \      ; dialog window
            6, \                            ; number of controls
            50,50,150,80, \                 ; x y co-ordinates
            4096                            ; memory buffer size

    DlgGroup  0,8,4,131,31,300
    DlgEdit   ES_LEFT or WS_BORDER or WS_TABSTOP,17,16,50,11,301
    DlgStatic "+",SS_LEFT,70,16,5,11,100
    DlgEdit   ES_LEFT or WS_BORDER or WS_TABSTOP,77,16,50,11,302
    DlgButton "Calculate",WS_TABSTOP,22,42,50,13,IDOK
    DlgButton "Exit",WS_TABSTOP,75,42,50,13,IDCANCEL

    CallModalDialog hInstance,0,dlgproc,parg

    ret

GetTextDialog endp

; ��������������������������������������������������������������������������������������������������

dlgproc proc hWin:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD

    LOCAL flen  :DWORD
    LOCAL slen  :DWORD
    LOCAL rlen  :DWORD
    LOCAL fMem  :DWORD
    LOCAL sMem  :DWORD
    LOCAL rMem  :DWORD
    LOCAL hIcon :DWORD

    switch uMsg
      case WM_INITDIALOG
      ; -------------------------------------------------
      ; get the arguments from the array passed in lParam
      ; -------------------------------------------------
        push esi
        mov esi, lParam
        fn SetWindowText,hWin,[esi]                         ; title text address
        fn SetWindowText,rv(GetDlgItem,hWin,300),[esi+4]    ; groupbox text address
        mov eax, [esi+8]                                    ; icon handle
        .if eax == 0
          mov hIcon, rv(LoadIcon,NULL,IDI_ASTERISK)         ; use default system icon
        .else
          mov hIcon, eax                                    ; load user icon
        .endif
        pop esi

        fn SendMessage,hWin,WM_SETICON,1,hIcon
        invoke SendMessage,rv(GetDlgItem,hWin,299),STM_SETIMAGE,IMAGE_ICON,hIcon
        xor eax, eax
        ret

      case WM_COMMAND
        switch wParam
          case IDOK
            mov flen, rv(GetWindowTextLength,rv(GetDlgItem,hWin,301))
            .if flen == 0
              invoke SetFocus,rv(GetDlgItem,hWin,301)
              ret
            .else
              mov slen, rv(GetWindowTextLength,rv(GetDlgItem,hWin,302))
              .if slen == 0
                invoke SetFocus,rv(GetDlgItem,hWin,302)
                ret
              .endif
            .endif
            add flen, 1
            add slen, 1
            push eax
            mov eax, flen
            or eax, slen
            mov rlen, eax
            pop eax
            mov fMem, alloc(flen)
            mov sMem, alloc(slen)
            mov rMem, alloc(rlen)
            fn GetWindowText,rv(GetDlgItem,hWin,301),fMem,flen
            fn GetWindowText,rv(GetDlgItem,hWin,302),sMem,slen
            fn add_string,fMem,sMem,rMem
            free fMem
            free sMem
            invoke EndDialog,hWin,rMem
          case IDCANCEL
            invoke EndDialog,hWin,0
        endsw
      case WM_CLOSE
        invoke EndDialog,hWin,0
    endsw

    xor eax, eax
    ret

dlgproc endp

; ��������������������������������������������������������������������������������������������������

add_string proc f_str:DWORD,s_str:DWORD,r_str:DWORD

    LOCAL number :DWORD

    push ecx
    push ebx

    mov ecx, 0
    mov ebx, 0
    
    mov ecx, rv(get_number,f_str)
    add ecx, rv(get_number,s_str)
    
    
    fn get_string,r_str,ecx

    pop ebx
    pop ecx


    ret

add_string endp


get_number proc d_str:DWORD
    push ebx
    push edi
    push ecx
    push edx

    mov eax, 0
    mov ecx, 10
    mov ebx, 0

    mov edi, d_str
    mov bl, [edi]

while_start:

    mul ecx
    sub bl, 30h
    add eax, ebx
    add edi, 1
    mov bl, [edi]
    cmp ebx, 0
    jne while_start


    pop edx
    pop ecx
    pop edi
    pop ebx

    ret

get_number endp


get_string proc r_str:DWORD,number:DWORD

    push eax
    push edx
    push ecx
    push ebx
    push edi

    mov eax, number
    mov ebx, 0
    mov ecx, 10

w_start:
    ;{
    mov edx, 0
    div ecx
    inc ebx
    cmp eax, 0
    jne w_start
    ;}
    
    mov edi, r_str
    dec ebx
    add edi, ebx

    mov eax, number
    mov ecx, 10

second_w_start:
    ;{
    mov edx, 0
    div ecx
    add edx, 30h
    mov [edi], dl
    dec edi
    cmp eax, 0
    jne second_w_start
    ;}

    pop edi
    pop ebx
    pop ecx
    pop edx
    pop eax

    ret

get_string endp


end start

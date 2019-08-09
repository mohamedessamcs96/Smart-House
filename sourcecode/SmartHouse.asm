
_main:

;SmartHouse.c,27 :: 		void main()
;SmartHouse.c,29 :: 		TRISD=0;
	CLRF       TRISD+0
;SmartHouse.c,30 :: 		PORTD=0;
	CLRF       PORTD+0
;SmartHouse.c,33 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;SmartHouse.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SmartHouse.c,35 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  //Stop the Cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SmartHouse.c,37 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;SmartHouse.c,38 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;SmartHouse.c,40 :: 		while(1)
L_main1:
;SmartHouse.c,45 :: 		if (UART1_Data_Ready() == 1)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;SmartHouse.c,47 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;SmartHouse.c,50 :: 		if(receive=='a')
	MOVF       R0+0, 0
	XORLW      97
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;SmartHouse.c,52 :: 		LightON();
	CALL       _LightON+0
;SmartHouse.c,53 :: 		UART1_write_Text("Light on");
	MOVLW      ?lstr1_SmartHouse+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SmartHouse.c,54 :: 		}
	GOTO       L_main5
L_main4:
;SmartHouse.c,55 :: 		else if(receive=='b')
	MOVF       _receive+0, 0
	XORLW      98
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;SmartHouse.c,57 :: 		LightOFF();
	CALL       _LightOFF+0
;SmartHouse.c,58 :: 		UART1_write_Text("Light OFF");
	MOVLW      ?lstr2_SmartHouse+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SmartHouse.c,59 :: 		}
	GOTO       L_main7
L_main6:
;SmartHouse.c,60 :: 		else if(receive=='c')
	MOVF       _receive+0, 0
	XORLW      99
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;SmartHouse.c,62 :: 		LCDON();
	CALL       _LCDON+0
;SmartHouse.c,63 :: 		UART1_write_Text("LCDON");
	MOVLW      ?lstr3_SmartHouse+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SmartHouse.c,64 :: 		}
	GOTO       L_main9
L_main8:
;SmartHouse.c,65 :: 		else if(receive=='d')
	MOVF       _receive+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;SmartHouse.c,67 :: 		UART1_write_Text("LCDOFF");
	MOVLW      ?lstr4_SmartHouse+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SmartHouse.c,68 :: 		LCDOFF();
	CALL       _LCDOFF+0
;SmartHouse.c,69 :: 		}
	GOTO       L_main11
L_main10:
;SmartHouse.c,71 :: 		else if(receive=='e')
	MOVF       _receive+0, 0
	XORLW      101
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;SmartHouse.c,73 :: 		UART1_write_Text("FanON");
	MOVLW      ?lstr5_SmartHouse+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SmartHouse.c,74 :: 		FanON();
	CALL       _FanON+0
;SmartHouse.c,75 :: 		}
	GOTO       L_main13
L_main12:
;SmartHouse.c,76 :: 		else if(receive=='f')
	MOVF       _receive+0, 0
	XORLW      102
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;SmartHouse.c,77 :: 		{    UART1_write_Text("FanOFF");
	MOVLW      ?lstr6_SmartHouse+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SmartHouse.c,78 :: 		FanOFF();
	CALL       _FanOFF+0
;SmartHouse.c,79 :: 		}
	GOTO       L_main15
L_main14:
;SmartHouse.c,82 :: 		stop();
	CALL       _stop+0
;SmartHouse.c,83 :: 		}
L_main15:
L_main13:
L_main11:
L_main9:
L_main7:
L_main5:
;SmartHouse.c,84 :: 		}
L_main3:
;SmartHouse.c,85 :: 		}
	GOTO       L_main1
;SmartHouse.c,87 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_LightON:

;SmartHouse.c,91 :: 		void LightON()
;SmartHouse.c,93 :: 		TRISD=0;
	CLRF       TRISD+0
;SmartHouse.c,94 :: 		PORTD.f1=1;
	BSF        PORTD+0, 1
;SmartHouse.c,96 :: 		}
L_end_LightON:
	RETURN
; end of _LightON

_LightOFF:

;SmartHouse.c,97 :: 		void LightOFF()
;SmartHouse.c,99 :: 		PORTD.f1=0;
	BCF        PORTD+0, 1
;SmartHouse.c,100 :: 		}
L_end_LightOFF:
	RETURN
; end of _LightOFF

_LCDON:

;SmartHouse.c,101 :: 		void LCDON()
;SmartHouse.c,103 :: 		TRISD=0;
	CLRF       TRISD+0
;SmartHouse.c,104 :: 		PORTD.f0=1;
	BSF        PORTD+0, 0
;SmartHouse.c,105 :: 		Lcd_Out(1,1,"This is CS50x");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_SmartHouse+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SmartHouse.c,106 :: 		}
L_end_LCDON:
	RETURN
; end of _LCDON

_LCDOFF:

;SmartHouse.c,107 :: 		void LCDOFF()
;SmartHouse.c,109 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SmartHouse.c,110 :: 		PORTD.f0=0;
	BCF        PORTD+0, 0
;SmartHouse.c,111 :: 		}
L_end_LCDOFF:
	RETURN
; end of _LCDOFF

_FanON:

;SmartHouse.c,112 :: 		void FanON()
;SmartHouse.c,113 :: 		{  TRISD=0;
	CLRF       TRISD+0
;SmartHouse.c,114 :: 		PORTD.f2=1;
	BSF        PORTD+0, 2
;SmartHouse.c,116 :: 		}
L_end_FanON:
	RETURN
; end of _FanON

_FanOFF:

;SmartHouse.c,117 :: 		void FanOFF()
;SmartHouse.c,119 :: 		PORTD.f2=0;
	BCF        PORTD+0, 2
;SmartHouse.c,120 :: 		}
L_end_FanOFF:
	RETURN
; end of _FanOFF

_stop:

;SmartHouse.c,122 :: 		void stop()
;SmartHouse.c,124 :: 		}
L_end_stop:
	RETURN
; end of _stop

// Lcd pinout settings
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;

   char receive;

   void LCDON();
   void LCDOFF();
   void LightON();
   void LightOFF();
   void FanON();
   void FanOFF();

   void stop();
void main()
{
  TRISD=0;
  PORTD=0;

  //LCD Reperation
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);       // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);  //Stop the Cursor
  //Bluetooth send speed
  UART1_Init(9600);
  delay_ms(100);
  //UART1_write_text("Hello,world i am connected");
  while(1)
  {
  // Initialize hardware UART1 and establish communication at 9600 bps

 // If data is ready, read it:
 if (UART1_Data_Ready() == 1)
 {
   receive = UART1_Read();

   //Here the Condtiotion
   if(receive=='a')
  {
       LightON();
       UART1_write_Text("Light on");
  }
   else if(receive=='b')
   {
        LightOFF();
        UART1_write_Text("Light OFF");
   }
   else if(receive=='c')
   {
        LCDON();
        UART1_write_Text("LCDON");
   }
   else if(receive=='d')
   {
        UART1_write_Text("LCDOFF");
        LCDOFF();
   }
   
   else if(receive=='e')
   {
        UART1_write_Text("FanON");
        FanON();
   }
   else if(receive=='f')
   {    UART1_write_Text("FanOFF");
        FanOFF();
   }
   else
   {
   stop();
   }
     }
  }

}



void LightON()
{
   TRISD=0;
   PORTD.f1=1;

}
void LightOFF()
{
   PORTD.f1=0;
}
void LCDON()
{
  TRISD=0;
  PORTD.f0=1;
  Lcd_Out(1,1,"This is CS50x");
}
void LCDOFF()
{
 Lcd_Cmd(_LCD_CLEAR);       // Clear display
 PORTD.f0=0;
}
void FanON()
{  TRISD=0;
   PORTD.f2=1;

}
void FanOFF()
{
   PORTD.f2=0;
}

void stop()
{
}
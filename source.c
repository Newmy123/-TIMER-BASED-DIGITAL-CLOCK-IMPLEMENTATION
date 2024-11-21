#include <stdio.h>
#include "io.h"
#include "system.h"
#include "altera_avalon_timer_regs.h"
#include "sys/alt_irq.h"
unsigned int sec = 0;
int *switch1 = SWITCH_BASE;
int *ledr = LED_BASE;
int data = 0x300;
int temp,value9,value28,value01;
char  min = 0, hour = 0;
int segcode[] = { 0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02,0x78, 0x00, 0x10, 0x08, 0x03, 0x46, 0x21, 0x06, 0x0E};

void timer_Init(){
unsigned int period = 0;
// Stop Timer
IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE,
ALTERA_AVALON_TIMER_CONTROL_STOP_MSK);
//Configure period
period = 50000000 - 1;
IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, period);
IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, (period >> 16));
IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE,
ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | // Continue counting mode
ALTERA_AVALON_TIMER_CONTROL_ITO_MSK | // Interrupt enable
ALTERA_AVALON_TIMER_CONTROL_START_MSK);// Start Timer
}

void Timer_IRQ_Handler(void* isr_context){
++sec;
	value9 = *switch1 >> 9 & 0x1;//1 switch ngoai cung ben trai
	value28 = *switch1 >> 2 & 0x7F; //7 switch giua
	value01 = *switch1 & 0x7;//2 switch ngoai cung ben phai
	IOWR(HEX0_BASE, 0 ,segcode[sec%10]);
	IOWR(HEX1_BASE, 0 ,segcode[sec/10]);
	IOWR(HEX2_BASE, 0 ,segcode[min%10]);
	IOWR(HEX3_BASE, 0 ,segcode[min/10]);
	IOWR(HEX4_BASE, 0 ,segcode[hour%10]);
	IOWR(HEX5_BASE, 0 ,segcode[hour/10]);
	if(sec == 59)
	{
		sec = 0;
		if(++min == 60){
			min = 0;
			if(++hour == 24){
				hour = 0;
			}
		}
	}

	if(value9 != 1){
	*ledr = data;
	temp = (data << 9)&0x200;
	data = ((data >> 1) | temp);
	}else {
	*ledr = data;
	temp = (data >> 9)&0x001;
	data = ((data << 1) | temp);
	}
	if(value01 == 1){
		sec = value28;
		if(sec >= 59)	sec = 0;
		IOWR(HEX0_BASE, 0 ,segcode[sec%10]);
		IOWR(HEX1_BASE, 0 ,segcode[sec/10]);
	}
	if(value01 == 2){
		min = value28;
		if(min >= 59)	min = 0;
		IOWR(HEX2_BASE, 0 ,segcode[min%10]);
		IOWR(HEX3_BASE, 0 ,segcode[min/10]);
	}
	if(value01 == 3){
		hour = value28;
		if(hour >= 24)	hour = 0;
		IOWR(HEX4_BASE, 0 ,segcode[hour%10]);
		IOWR(HEX5_BASE, 0 ,segcode[hour/10]);
	}


printf("switch value38 = %d\n",value01);
printf("switch value38 = %d\n",value28);
printf("switch value = %d\n",value9);
printf("%d seconds\n", sec);

// Clear Timer interrupt bit
IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE,ALTERA_AVALON_TIMER_STATUS_TO_MSK);
}

void clear_seg7()
{
	IOWR(HEX0_BASE, 0 ,segcode[0]);
	IOWR(HEX1_BASE, 0 ,segcode[0]);
	IOWR(HEX2_BASE, 0 ,segcode[0]);
	IOWR(HEX3_BASE, 0 ,segcode[0]);
	IOWR(HEX4_BASE, 0 ,segcode[0]);
	IOWR(HEX5_BASE, 0 ,segcode[0]);
}
void main(){
clear_seg7();
timer_Init();
alt_ic_isr_register(0, TIMER_0_IRQ, Timer_IRQ_Handler, (void*)0,
(void*)0);

while(1){


};
}

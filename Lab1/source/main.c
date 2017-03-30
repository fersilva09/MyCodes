// int matriz[4][6] = {{110,255,11,4, 2, 0},{10,1,1,1, 12,122},{2,2,2,2,12,222},{3,3,3,3,21,232}};

// extern int f_asm(void);
// int main()
// {
  // int i;  
  // i = f_asm( );
  // return 0;
// }

//  Equipe 2 - Fernando Torres, Tauan Marinho, Willian Bernardo
#include "inttypes.h";
#include "stdio.h"

uint8_t image_in[4][4] = {{0,0,0,0},{1,1,1,1},{2,2,2,2},{3,3,3,3}};

extern int f_asm(void);
extern uint32_t histrgb(uint16_t, uint16_t, uint8_t[], uint32_t*);
FILE *imagem;
long size;
char *buffer;

int main()
{
  
  
  uint32_t hist_out[768];
  int i;  
  char ch;
  int dim_x, dim_y, max_value;
  int counter;
  
  imagem = fopen("imagem2.ppm", "r");
  if (imagem != NULL)
  {
    //    
    
    while (ch != '\n')
    {
      ch = getc(imagem);
    }
    fscanf(imagem,"%d", &dim_x);
    fscanf(imagem,"%d", &dim_y);
    fscanf(imagem,"%d", &max_value);  
    buffer = (uint8_t*)malloc(dim_x*dim_y*3);
    //buffer = (uint8_t*)0xfffffff;
    
    
    for(int i =0; i<dim_y; i++)
    {
      for(int j =0; j<dim_x; j++)
      {
        for(int k = 0; k<3;k++)
        {
          
          fscanf(imagem,"%d",&buffer[counter]);
          counter++;
        }
      }
    }
  }
  
  for(int i = 0; i < 768; i++ )
  {
      hist_out[i] = 0;
  }
  
  i = histrgb( dim_x, dim_y, buffer,hist_out);
  return 0;
}

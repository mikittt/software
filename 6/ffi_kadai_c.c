#include<stdio.h>
void kadai(double a[3],double b[3]){
  double c;
  int i=0;
  for (i;i<3;i++){
    c+=a[i]*b[i];
  }
  printf ("%f\n",c);
}

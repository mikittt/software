int fibonacci(int i){
  int a1=0,a2=1,a3,k;
  for(k=0;k<i;k++){
    a3=a1+a2;
    a1=a2;
    a2=a3;
  }
  return a3;
}

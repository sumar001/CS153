
_lab1_testfile:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
int exitWait(void);
int waitPid(void);
int CELEBW02(void);

int main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  printf(1, "\n This program tests the correctness of your lab#1\n");
   d:	c7 44 24 04 40 0e 00 	movl   $0xe40,0x4(%esp)
  14:	00 
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 9f 08 00 00       	call   8c0 <printf>
  
  if (atoi(argv[1]) == 1)
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	89 04 24             	mov    %eax,(%esp)
  27:	e8 c4 06 00 00       	call   6f0 <atoi>
  2c:	83 f8 01             	cmp    $0x1,%eax
  2f:	74 47                	je     78 <main+0x78>
    exitWait();
  else if (atoi(argv[1]) == 2)
  31:	8b 43 04             	mov    0x4(%ebx),%eax
  34:	89 04 24             	mov    %eax,(%esp)
  37:	e8 b4 06 00 00       	call   6f0 <atoi>
  3c:	83 f8 02             	cmp    $0x2,%eax
  3f:	74 41                	je     82 <main+0x82>
    waitPid();
  else if (atoi(argv[1]) == 3)
  41:	8b 43 04             	mov    0x4(%ebx),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 a4 06 00 00       	call   6f0 <atoi>
  4c:	83 f8 03             	cmp    $0x3,%eax
  4f:	74 38                	je     89 <main+0x89>
    CELEBW02();
  else 
    printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid and \"lab1 3\" to test the extra credit WNOHANG option \n");
  51:	c7 44 24 04 74 0e 00 	movl   $0xe74,0x4(%esp)
  58:	00 
  59:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  60:	e8 5b 08 00 00       	call   8c0 <printf>
  
  // End of test
  exitUDef(0);
  65:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  6c:	e8 81 07 00 00       	call   7f2 <exitUDef>
  return 0;
 }
  71:	31 c0                	xor    %eax,%eax
  73:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  76:	c9                   	leave  
  77:	c3                   	ret    
    exitWait();
  78:	e8 23 00 00 00       	call   a0 <exitWait>
  7d:	8d 76 00             	lea    0x0(%esi),%esi
  80:	eb e3                	jmp    65 <main+0x65>
    waitPid();
  82:	e8 39 01 00 00       	call   1c0 <waitPid>
  87:	eb dc                	jmp    65 <main+0x65>
  89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    CELEBW02();
  90:	e8 9b 03 00 00       	call   430 <CELEBW02>
  95:	eb ce                	jmp    65 <main+0x65>
  97:	66 90                	xchg   %ax,%ax
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <exitWait>:
  
int exitWait(void) {
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  int pid, ret_pid, exit_status;
  int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");
  a4:	bb 01 00 00 00       	mov    $0x1,%ebx
int exitWait(void) {
  a9:	83 ec 24             	sub    $0x24,%esp
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");
  ac:	c7 44 24 04 28 0c 00 	movl   $0xc28,0x4(%esp)
  b3:	00 
  b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bb:	e8 00 08 00 00       	call   8c0 <printf>

  for (i = 0; i < 2; i++) {
    pid = fork();
  c0:	e8 85 06 00 00       	call   74a <fork>
    if (pid == 0) { // only the child executed this code
  c5:	83 f8 00             	cmp    $0x0,%eax
  c8:	0f 85 8b 00 00 00    	jne    159 <exitWait+0xb9>
      if (i == 0) {
  ce:	83 fb 01             	cmp    $0x1,%ebx
  d1:	74 3e                	je     111 <exitWait+0x71>
        printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
        exitUDef(0);
      }
      else {
	printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
  d3:	e8 fa 06 00 00       	call   7d2 <getpid>
  d8:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  df:	ff 
  e0:	c7 44 24 04 6c 0c 00 	movl   $0xc6c,0x4(%esp)
  e7:	00 
  e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	e8 c8 07 00 00       	call   8c0 <printf>
        exitUDef(-1);
  f8:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
  ff:	e8 ee 06 00 00       	call   7f2 <exitUDef>
  for (i = 0; i < 2; i++) {
 104:	83 fb 02             	cmp    $0x2,%ebx
 107:	75 3f                	jne    148 <exitWait+0xa8>
      printf(2, "\nError using fork\n");
      exitUDef(-1);
    }
  }
  return 0;
}
 109:	83 c4 24             	add    $0x24,%esp
 10c:	31 c0                	xor    %eax,%eax
 10e:	5b                   	pop    %ebx
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    
        printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 111:	e8 bc 06 00 00       	call   7d2 <getpid>
 116:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 11d:	00 
 11e:	c7 44 24 04 6c 0c 00 	movl   $0xc6c,0x4(%esp)
 125:	00 
 126:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 12d:	89 44 24 08          	mov    %eax,0x8(%esp)
 131:	e8 8a 07 00 00       	call   8c0 <printf>
        exitUDef(0);
 136:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 13d:	e8 b0 06 00 00       	call   7f2 <exitUDef>
 142:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pid = fork();
 148:	e8 fd 05 00 00       	call   74a <fork>
 14d:	83 c3 01             	add    $0x1,%ebx
    if (pid == 0) { // only the child executed this code
 150:	83 f8 00             	cmp    $0x0,%eax
 153:	0f 84 75 ff ff ff    	je     ce <exitWait+0x2e>
    } else if (pid > 0) { // only the parent executes this code
 159:	7e 35                	jle    190 <exitWait+0xf0>
      ret_pid = wait(&exit_status);
 15b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 15e:	89 04 24             	mov    %eax,(%esp)
 161:	e8 f4 05 00 00       	call   75a <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
 166:	8b 55 f4             	mov    -0xc(%ebp),%edx
 169:	c7 44 24 04 a8 0c 00 	movl   $0xca8,0x4(%esp)
 170:	00 
 171:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 178:	89 54 24 0c          	mov    %edx,0xc(%esp)
 17c:	89 44 24 08          	mov    %eax,0x8(%esp)
 180:	e8 3b 07 00 00       	call   8c0 <printf>
 185:	e9 7a ff ff ff       	jmp    104 <exitWait+0x64>
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(2, "\nError using fork\n");
 190:	c7 44 24 04 ec 0e 00 	movl   $0xeec,0x4(%esp)
 197:	00 
 198:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 19f:	e8 1c 07 00 00       	call   8c0 <printf>
      exitUDef(-1);
 1a4:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 1ab:	e8 42 06 00 00       	call   7f2 <exitUDef>
 1b0:	e9 4f ff ff ff       	jmp    104 <exitWait+0x64>
 1b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <waitPid>:

int waitPid(void){
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
 1c5:	53                   	push   %ebx
 1c6:	83 ec 3c             	sub    $0x3c,%esp
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
  // use this part to test wait(int pid, int* status, int options)

  printf(1, "\n  Part c) testing waitpid(int pid, int* status, int options):\n");
 1c9:	c7 44 24 04 ec 0c 00 	movl   $0xcec,0x4(%esp)
 1d0:	00 
 1d1:	8d 5d d4             	lea    -0x2c(%ebp),%ebx
 1d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1db:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int pid_a[5]={0, 0, 0, 0, 0};
 1de:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 1e5:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 1ec:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 1f3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 1fa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "\n  Part c) testing waitpid(int pid, int* status, int options):\n");
 201:	e8 ba 06 00 00       	call   8c0 <printf>

  for(i = 0; i <5; i++) {
    pid_a[i] = fork();
 206:	e8 3f 05 00 00       	call   74a <fork>
    if (pid_a[i] == 0) { // only the child executed this code
 20b:	85 c0                	test   %eax,%eax
    pid_a[i] = fork();
 20d:	89 03                	mov    %eax,(%ebx)
    if (pid_a[i] == 0) { // only the child executed this code
 20f:	0f 84 db 01 00 00    	je     3f0 <waitPid+0x230>
 215:	83 c3 04             	add    $0x4,%ebx
  for(i = 0; i <5; i++) {
 218:	39 f3                	cmp    %esi,%ebx
 21a:	75 ea                	jne    206 <waitPid+0x46>
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), getpid() + 4);
      exitUDef(getpid() + 4);
    }
  }
       
  sleep(5);
 21c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
  ret_pid = waitpid(pid_a[3], &exit_status, 0);
 223:	8d 5d d0             	lea    -0x30(%ebp),%ebx
  sleep(5);
 226:	e8 b7 05 00 00       	call   7e2 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 22b:	8b 75 e0             	mov    -0x20(%ebp),%esi
 22e:	c7 44 24 04 68 0d 00 	movl   $0xd68,0x4(%esp)
 235:	00 
 236:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 23d:	89 74 24 08          	mov    %esi,0x8(%esp)
 241:	e8 7a 06 00 00       	call   8c0 <printf>
  ret_pid = waitpid(pid_a[3], &exit_status, 0);
 246:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 24a:	89 34 24             	mov    %esi,(%esp)
 24d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 254:	00 
 255:	e8 a0 05 00 00       	call   7fa <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 25a:	8b 55 d0             	mov    -0x30(%ebp),%edx
 25d:	c7 44 24 04 a4 0d 00 	movl   $0xda4,0x4(%esp)
 264:	00 
 265:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 26c:	89 54 24 0c          	mov    %edx,0xc(%esp)
 270:	89 44 24 08          	mov    %eax,0x8(%esp)
 274:	e8 47 06 00 00       	call   8c0 <printf>
  sleep(5);
 279:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 280:	e8 5d 05 00 00       	call   7e2 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 285:	8b 75 d8             	mov    -0x28(%ebp),%esi
 288:	c7 44 24 04 68 0d 00 	movl   $0xd68,0x4(%esp)
 28f:	00 
 290:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 297:	89 74 24 08          	mov    %esi,0x8(%esp)
 29b:	e8 20 06 00 00       	call   8c0 <printf>
  ret_pid = waitpid(pid_a[1], &exit_status, 0);
 2a0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2a4:	89 34 24             	mov    %esi,(%esp)
 2a7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 2ae:	00 
 2af:	e8 46 05 00 00       	call   7fa <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 2b4:	8b 55 d0             	mov    -0x30(%ebp),%edx
 2b7:	c7 44 24 04 a4 0d 00 	movl   $0xda4,0x4(%esp)
 2be:	00 
 2bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c6:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2ca:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ce:	e8 ed 05 00 00       	call   8c0 <printf>
  sleep(5);
 2d3:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 2da:	e8 03 05 00 00       	call   7e2 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 2df:	8b 75 dc             	mov    -0x24(%ebp),%esi
 2e2:	c7 44 24 04 68 0d 00 	movl   $0xd68,0x4(%esp)
 2e9:	00 
 2ea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2f1:	89 74 24 08          	mov    %esi,0x8(%esp)
 2f5:	e8 c6 05 00 00       	call   8c0 <printf>
  ret_pid = waitpid(pid_a[2], &exit_status, 0);
 2fa:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2fe:	89 34 24             	mov    %esi,(%esp)
 301:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 308:	00 
 309:	e8 ec 04 00 00       	call   7fa <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 30e:	8b 55 d0             	mov    -0x30(%ebp),%edx
 311:	c7 44 24 04 a4 0d 00 	movl   $0xda4,0x4(%esp)
 318:	00 
 319:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 320:	89 54 24 0c          	mov    %edx,0xc(%esp)
 324:	89 44 24 08          	mov    %eax,0x8(%esp)
 328:	e8 93 05 00 00       	call   8c0 <printf>
  sleep(5);
 32d:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 334:	e8 a9 04 00 00       	call   7e2 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 339:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 33c:	c7 44 24 04 68 0d 00 	movl   $0xd68,0x4(%esp)
 343:	00 
 344:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 34b:	89 74 24 08          	mov    %esi,0x8(%esp)
 34f:	e8 6c 05 00 00       	call   8c0 <printf>
  ret_pid = waitpid(pid_a[0], &exit_status, 0);
 354:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 358:	89 34 24             	mov    %esi,(%esp)
 35b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 362:	00 
 363:	e8 92 04 00 00       	call   7fa <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 368:	8b 55 d0             	mov    -0x30(%ebp),%edx
 36b:	c7 44 24 04 a4 0d 00 	movl   $0xda4,0x4(%esp)
 372:	00 
 373:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 37a:	89 54 24 0c          	mov    %edx,0xc(%esp)
 37e:	89 44 24 08          	mov    %eax,0x8(%esp)
 382:	e8 39 05 00 00       	call   8c0 <printf>
  sleep(5);
 387:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 38e:	e8 4f 04 00 00       	call   7e2 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 393:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 396:	c7 44 24 04 68 0d 00 	movl   $0xd68,0x4(%esp)
 39d:	00 
 39e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3a5:	89 74 24 08          	mov    %esi,0x8(%esp)
 3a9:	e8 12 05 00 00       	call   8c0 <printf>
  ret_pid = waitpid(pid_a[4], &exit_status, 0);
 3ae:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3b2:	89 34 24             	mov    %esi,(%esp)
 3b5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 3bc:	00 
 3bd:	e8 38 04 00 00       	call   7fa <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 3c2:	8b 55 d0             	mov    -0x30(%ebp),%edx
 3c5:	c7 44 24 04 a4 0d 00 	movl   $0xda4,0x4(%esp)
 3cc:	00 
 3cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3d4:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3d8:	89 44 24 08          	mov    %eax,0x8(%esp)
 3dc:	e8 df 04 00 00       	call   8c0 <printf>
      
  return 0;
}
 3e1:	83 c4 3c             	add    $0x3c,%esp
 3e4:	31 c0                	xor    %eax,%eax
 3e6:	5b                   	pop    %ebx
 3e7:	5e                   	pop    %esi
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	90                   	nop
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), getpid() + 4);
 3f0:	e8 dd 03 00 00       	call   7d2 <getpid>
 3f5:	89 c7                	mov    %eax,%edi
 3f7:	e8 d6 03 00 00       	call   7d2 <getpid>
 3fc:	83 c7 04             	add    $0x4,%edi
 3ff:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 403:	c7 44 24 04 2c 0d 00 	movl   $0xd2c,0x4(%esp)
 40a:	00 
 40b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 412:	89 44 24 08          	mov    %eax,0x8(%esp)
 416:	e8 a5 04 00 00       	call   8c0 <printf>
      exitUDef(getpid() + 4);
 41b:	e8 b2 03 00 00       	call   7d2 <getpid>
 420:	83 c0 04             	add    $0x4,%eax
 423:	89 04 24             	mov    %eax,(%esp)
 426:	e8 c7 03 00 00       	call   7f2 <exitUDef>
 42b:	e9 e5 fd ff ff       	jmp    215 <waitPid+0x55>

00000430 <CELEBW02>:

int CELEBW02(void){
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	83 ec 20             	sub    $0x20,%esp
  printf(1, "\n  Part e) the waitpid option WNOHANG, test program CELEBW02 \n");
 438:	c7 44 24 04 e0 0d 00 	movl   $0xde0,0x4(%esp)
 43f:	00 
 440:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 447:	e8 74 04 00 00       	call   8c0 <printf>
  int pid, retpid;
  int status;

  if ((pid = fork()) < 0)
 44c:	e8 f9 02 00 00       	call   74a <fork>
 451:	85 c0                	test   %eax,%eax
 453:	89 c3                	mov    %eax,%ebx
 455:	0f 88 b5 00 00 00    	js     510 <CELEBW02+0xe0>
 45b:	8d 75 f4             	lea    -0xc(%ebp),%esi
    printf(2, "fork() error");
  else if (pid == 0) {
 45e:	0f 84 8c 00 00 00    	je     4f0 <CELEBW02+0xc0>
 464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
// one statement would have been printed - either "wait() error", or "child is
// still running" or "child exited with status of x". There will be higher
// probability of "child is still running" printed in absence of do..while
// loop because child is kept to sleep for 5 seconds, so till then parent
// can run.
    if ((retpid = waitpid(pid, &status, WNOHANG)) == -1)
 468:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 46f:	00 
 470:	89 74 24 04          	mov    %esi,0x4(%esp)
 474:	89 1c 24             	mov    %ebx,(%esp)
 477:	e8 7e 03 00 00       	call   7fa <waitpid>
 47c:	83 f8 ff             	cmp    $0xffffffff,%eax
 47f:	74 4f                	je     4d0 <CELEBW02+0xa0>
      printf(2, "wait() error");
    else if (retpid == 0) {
 481:	85 c0                	test   %eax,%eax
 483:	75 23                	jne    4a8 <CELEBW02+0x78>
      printf(1, "child is still running \n");
 485:	c7 44 24 04 19 0f 00 	movl   $0xf19,0x4(%esp)
 48c:	00 
 48d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 494:	e8 27 04 00 00       	call   8c0 <printf>
      sleep(1);
 499:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4a0:	e8 3d 03 00 00       	call   7e2 <sleep>
 4a5:	eb c1                	jmp    468 <CELEBW02+0x38>
 4a7:	90                   	nop
    }
    else {
        printf(1, "child exited with status of %d\n", status);
 4a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ab:	c7 44 24 04 20 0e 00 	movl   $0xe20,0x4(%esp)
 4b2:	00 
 4b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4ba:	89 44 24 08          	mov    %eax,0x8(%esp)
 4be:	e8 fd 03 00 00       	call   8c0 <printf>
    }
  } while (retpid == 0);
  
  return 0;
}
 4c3:	83 c4 20             	add    $0x20,%esp
 4c6:	31 c0                	xor    %eax,%eax
 4c8:	5b                   	pop    %ebx
 4c9:	5e                   	pop    %esi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(2, "wait() error");
 4d0:	c7 44 24 04 0c 0f 00 	movl   $0xf0c,0x4(%esp)
 4d7:	00 
 4d8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 4df:	e8 dc 03 00 00       	call   8c0 <printf>
}
 4e4:	83 c4 20             	add    $0x20,%esp
 4e7:	31 c0                	xor    %eax,%eax
 4e9:	5b                   	pop    %ebx
 4ea:	5e                   	pop    %esi
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(5);
 4f0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 4f7:	e8 e6 02 00 00       	call   7e2 <sleep>
    exitUDef(1);
 4fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 503:	e8 ea 02 00 00       	call   7f2 <exitUDef>
 508:	eb b9                	jmp    4c3 <CELEBW02+0x93>
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(2, "fork() error");
 510:	c7 44 24 04 ff 0e 00 	movl   $0xeff,0x4(%esp)
 517:	00 
 518:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 51f:	e8 9c 03 00 00       	call   8c0 <printf>
 524:	eb 9d                	jmp    4c3 <CELEBW02+0x93>
 526:	66 90                	xchg   %ax,%ax
 528:	66 90                	xchg   %ax,%ax
 52a:	66 90                	xchg   %ax,%ax
 52c:	66 90                	xchg   %ax,%ax
 52e:	66 90                	xchg   %ax,%ax

00000530 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 539:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 53a:	89 c2                	mov    %eax,%edx
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 540:	83 c1 01             	add    $0x1,%ecx
 543:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 547:	83 c2 01             	add    $0x1,%edx
 54a:	84 db                	test   %bl,%bl
 54c:	88 5a ff             	mov    %bl,-0x1(%edx)
 54f:	75 ef                	jne    540 <strcpy+0x10>
    ;
  return os;
}
 551:	5b                   	pop    %ebx
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
 554:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 55a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000560 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	8b 55 08             	mov    0x8(%ebp),%edx
 566:	53                   	push   %ebx
 567:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 56a:	0f b6 02             	movzbl (%edx),%eax
 56d:	84 c0                	test   %al,%al
 56f:	74 2d                	je     59e <strcmp+0x3e>
 571:	0f b6 19             	movzbl (%ecx),%ebx
 574:	38 d8                	cmp    %bl,%al
 576:	74 0e                	je     586 <strcmp+0x26>
 578:	eb 2b                	jmp    5a5 <strcmp+0x45>
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 580:	38 c8                	cmp    %cl,%al
 582:	75 15                	jne    599 <strcmp+0x39>
    p++, q++;
 584:	89 d9                	mov    %ebx,%ecx
 586:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 589:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 58c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 58f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 593:	84 c0                	test   %al,%al
 595:	75 e9                	jne    580 <strcmp+0x20>
 597:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 599:	29 c8                	sub    %ecx,%eax
}
 59b:	5b                   	pop    %ebx
 59c:	5d                   	pop    %ebp
 59d:	c3                   	ret    
 59e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 5a1:	31 c0                	xor    %eax,%eax
 5a3:	eb f4                	jmp    599 <strcmp+0x39>
 5a5:	0f b6 cb             	movzbl %bl,%ecx
 5a8:	eb ef                	jmp    599 <strcmp+0x39>
 5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005b0 <strlen>:

uint
strlen(const char *s)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5b6:	80 39 00             	cmpb   $0x0,(%ecx)
 5b9:	74 12                	je     5cd <strlen+0x1d>
 5bb:	31 d2                	xor    %edx,%edx
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
 5c0:	83 c2 01             	add    $0x1,%edx
 5c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 5c7:	89 d0                	mov    %edx,%eax
 5c9:	75 f5                	jne    5c0 <strlen+0x10>
    ;
  return n;
}
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret    
  for(n = 0; s[n]; n++)
 5cd:	31 c0                	xor    %eax,%eax
}
 5cf:	5d                   	pop    %ebp
 5d0:	c3                   	ret    
 5d1:	eb 0d                	jmp    5e0 <memset>
 5d3:	90                   	nop
 5d4:	90                   	nop
 5d5:	90                   	nop
 5d6:	90                   	nop
 5d7:	90                   	nop
 5d8:	90                   	nop
 5d9:	90                   	nop
 5da:	90                   	nop
 5db:	90                   	nop
 5dc:	90                   	nop
 5dd:	90                   	nop
 5de:	90                   	nop
 5df:	90                   	nop

000005e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	8b 55 08             	mov    0x8(%ebp),%edx
 5e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ed:	89 d7                	mov    %edx,%edi
 5ef:	fc                   	cld    
 5f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5f2:	89 d0                	mov    %edx,%eax
 5f4:	5f                   	pop    %edi
 5f5:	5d                   	pop    %ebp
 5f6:	c3                   	ret    
 5f7:	89 f6                	mov    %esi,%esi
 5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000600 <strchr>:

char*
strchr(const char *s, char c)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	8b 45 08             	mov    0x8(%ebp),%eax
 606:	53                   	push   %ebx
 607:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 60a:	0f b6 18             	movzbl (%eax),%ebx
 60d:	84 db                	test   %bl,%bl
 60f:	74 1d                	je     62e <strchr+0x2e>
    if(*s == c)
 611:	38 d3                	cmp    %dl,%bl
 613:	89 d1                	mov    %edx,%ecx
 615:	75 0d                	jne    624 <strchr+0x24>
 617:	eb 17                	jmp    630 <strchr+0x30>
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 620:	38 ca                	cmp    %cl,%dl
 622:	74 0c                	je     630 <strchr+0x30>
  for(; *s; s++)
 624:	83 c0 01             	add    $0x1,%eax
 627:	0f b6 10             	movzbl (%eax),%edx
 62a:	84 d2                	test   %dl,%dl
 62c:	75 f2                	jne    620 <strchr+0x20>
      return (char*)s;
  return 0;
 62e:	31 c0                	xor    %eax,%eax
}
 630:	5b                   	pop    %ebx
 631:	5d                   	pop    %ebp
 632:	c3                   	ret    
 633:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <gets>:

char*
gets(char *buf, int max)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 645:	31 f6                	xor    %esi,%esi
{
 647:	53                   	push   %ebx
 648:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 64b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 64e:	eb 31                	jmp    681 <gets+0x41>
    cc = read(0, &c, 1);
 650:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 657:	00 
 658:	89 7c 24 04          	mov    %edi,0x4(%esp)
 65c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 663:	e8 02 01 00 00       	call   76a <read>
    if(cc < 1)
 668:	85 c0                	test   %eax,%eax
 66a:	7e 1d                	jle    689 <gets+0x49>
      break;
    buf[i++] = c;
 66c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 670:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 672:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 675:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 677:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 67b:	74 0c                	je     689 <gets+0x49>
 67d:	3c 0a                	cmp    $0xa,%al
 67f:	74 08                	je     689 <gets+0x49>
  for(i=0; i+1 < max; ){
 681:	8d 5e 01             	lea    0x1(%esi),%ebx
 684:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 687:	7c c7                	jl     650 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 690:	83 c4 2c             	add    $0x2c,%esp
 693:	5b                   	pop    %ebx
 694:	5e                   	pop    %esi
 695:	5f                   	pop    %edi
 696:	5d                   	pop    %ebp
 697:	c3                   	ret    
 698:	90                   	nop
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	56                   	push   %esi
 6a4:	53                   	push   %ebx
 6a5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6a8:	8b 45 08             	mov    0x8(%ebp),%eax
 6ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 6b2:	00 
 6b3:	89 04 24             	mov    %eax,(%esp)
 6b6:	e8 d7 00 00 00       	call   792 <open>
  if(fd < 0)
 6bb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 6bd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 6bf:	78 27                	js     6e8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 6c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c4:	89 1c 24             	mov    %ebx,(%esp)
 6c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cb:	e8 da 00 00 00       	call   7aa <fstat>
  close(fd);
 6d0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 6d3:	89 c6                	mov    %eax,%esi
  close(fd);
 6d5:	e8 a0 00 00 00       	call   77a <close>
  return r;
 6da:	89 f0                	mov    %esi,%eax
}
 6dc:	83 c4 10             	add    $0x10,%esp
 6df:	5b                   	pop    %ebx
 6e0:	5e                   	pop    %esi
 6e1:	5d                   	pop    %ebp
 6e2:	c3                   	ret    
 6e3:	90                   	nop
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 6e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 6ed:	eb ed                	jmp    6dc <stat+0x3c>
 6ef:	90                   	nop

000006f0 <atoi>:

int
atoi(const char *s)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 6f6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6f7:	0f be 11             	movsbl (%ecx),%edx
 6fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 6fd:	3c 09                	cmp    $0x9,%al
  n = 0;
 6ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 704:	77 17                	ja     71d <atoi+0x2d>
 706:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 708:	83 c1 01             	add    $0x1,%ecx
 70b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 70e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 712:	0f be 11             	movsbl (%ecx),%edx
 715:	8d 5a d0             	lea    -0x30(%edx),%ebx
 718:	80 fb 09             	cmp    $0x9,%bl
 71b:	76 eb                	jbe    708 <atoi+0x18>
  return n;
}
 71d:	5b                   	pop    %ebx
 71e:	5d                   	pop    %ebp
 71f:	c3                   	ret    

00000720 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 720:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 721:	31 d2                	xor    %edx,%edx
{
 723:	89 e5                	mov    %esp,%ebp
 725:	56                   	push   %esi
 726:	8b 45 08             	mov    0x8(%ebp),%eax
 729:	53                   	push   %ebx
 72a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 72d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 730:	85 db                	test   %ebx,%ebx
 732:	7e 12                	jle    746 <memmove+0x26>
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 738:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 73c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 73f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 742:	39 da                	cmp    %ebx,%edx
 744:	75 f2                	jne    738 <memmove+0x18>
  return vdst;
}
 746:	5b                   	pop    %ebx
 747:	5e                   	pop    %esi
 748:	5d                   	pop    %ebp
 749:	c3                   	ret    

0000074a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 74a:	b8 01 00 00 00       	mov    $0x1,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <exit>:
SYSCALL(exit)
 752:	b8 02 00 00 00       	mov    $0x2,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <wait>:
SYSCALL(wait)
 75a:	b8 03 00 00 00       	mov    $0x3,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <pipe>:
SYSCALL(pipe)
 762:	b8 04 00 00 00       	mov    $0x4,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <read>:
SYSCALL(read)
 76a:	b8 05 00 00 00       	mov    $0x5,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <write>:
SYSCALL(write)
 772:	b8 10 00 00 00       	mov    $0x10,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <close>:
SYSCALL(close)
 77a:	b8 15 00 00 00       	mov    $0x15,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <kill>:
SYSCALL(kill)
 782:	b8 06 00 00 00       	mov    $0x6,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    

0000078a <exec>:
SYSCALL(exec)
 78a:	b8 07 00 00 00       	mov    $0x7,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <open>:
SYSCALL(open)
 792:	b8 0f 00 00 00       	mov    $0xf,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <mknod>:
SYSCALL(mknod)
 79a:	b8 11 00 00 00       	mov    $0x11,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    

000007a2 <unlink>:
SYSCALL(unlink)
 7a2:	b8 12 00 00 00       	mov    $0x12,%eax
 7a7:	cd 40                	int    $0x40
 7a9:	c3                   	ret    

000007aa <fstat>:
SYSCALL(fstat)
 7aa:	b8 08 00 00 00       	mov    $0x8,%eax
 7af:	cd 40                	int    $0x40
 7b1:	c3                   	ret    

000007b2 <link>:
SYSCALL(link)
 7b2:	b8 13 00 00 00       	mov    $0x13,%eax
 7b7:	cd 40                	int    $0x40
 7b9:	c3                   	ret    

000007ba <mkdir>:
SYSCALL(mkdir)
 7ba:	b8 14 00 00 00       	mov    $0x14,%eax
 7bf:	cd 40                	int    $0x40
 7c1:	c3                   	ret    

000007c2 <chdir>:
SYSCALL(chdir)
 7c2:	b8 09 00 00 00       	mov    $0x9,%eax
 7c7:	cd 40                	int    $0x40
 7c9:	c3                   	ret    

000007ca <dup>:
SYSCALL(dup)
 7ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 7cf:	cd 40                	int    $0x40
 7d1:	c3                   	ret    

000007d2 <getpid>:
SYSCALL(getpid)
 7d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 7d7:	cd 40                	int    $0x40
 7d9:	c3                   	ret    

000007da <sbrk>:
SYSCALL(sbrk)
 7da:	b8 0c 00 00 00       	mov    $0xc,%eax
 7df:	cd 40                	int    $0x40
 7e1:	c3                   	ret    

000007e2 <sleep>:
SYSCALL(sleep)
 7e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 7e7:	cd 40                	int    $0x40
 7e9:	c3                   	ret    

000007ea <uptime>:
SYSCALL(uptime)
 7ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 7ef:	cd 40                	int    $0x40
 7f1:	c3                   	ret    

000007f2 <exitUDef>:
SYSCALL(exitUDef)
 7f2:	b8 16 00 00 00       	mov    $0x16,%eax
 7f7:	cd 40                	int    $0x40
 7f9:	c3                   	ret    

000007fa <waitpid>:
SYSCALL(waitpid)
 7fa:	b8 17 00 00 00       	mov    $0x17,%eax
 7ff:	cd 40                	int    $0x40
 801:	c3                   	ret    

00000802 <setPriority>:
SYSCALL(setPriority)
 802:	b8 18 00 00 00       	mov    $0x18,%eax
 807:	cd 40                	int    $0x40
 809:	c3                   	ret    

0000080a <getPriority>:
SYSCALL(getPriority)
 80a:	b8 19 00 00 00       	mov    $0x19,%eax
 80f:	cd 40                	int    $0x40
 811:	c3                   	ret    
 812:	66 90                	xchg   %ax,%ax
 814:	66 90                	xchg   %ax,%ax
 816:	66 90                	xchg   %ax,%ax
 818:	66 90                	xchg   %ax,%ax
 81a:	66 90                	xchg   %ax,%ax
 81c:	66 90                	xchg   %ax,%ax
 81e:	66 90                	xchg   %ax,%ax

00000820 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	89 c6                	mov    %eax,%esi
 827:	53                   	push   %ebx
 828:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 82b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 82e:	85 db                	test   %ebx,%ebx
 830:	74 09                	je     83b <printint+0x1b>
 832:	89 d0                	mov    %edx,%eax
 834:	c1 e8 1f             	shr    $0x1f,%eax
 837:	84 c0                	test   %al,%al
 839:	75 75                	jne    8b0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 83b:	89 d0                	mov    %edx,%eax
  neg = 0;
 83d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 844:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 847:	31 ff                	xor    %edi,%edi
 849:	89 ce                	mov    %ecx,%esi
 84b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 84e:	eb 02                	jmp    852 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 850:	89 cf                	mov    %ecx,%edi
 852:	31 d2                	xor    %edx,%edx
 854:	f7 f6                	div    %esi
 856:	8d 4f 01             	lea    0x1(%edi),%ecx
 859:	0f b6 92 39 0f 00 00 	movzbl 0xf39(%edx),%edx
  }while((x /= base) != 0);
 860:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 862:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 865:	75 e9                	jne    850 <printint+0x30>
  if(neg)
 867:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 86a:	89 c8                	mov    %ecx,%eax
 86c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 86f:	85 d2                	test   %edx,%edx
 871:	74 08                	je     87b <printint+0x5b>
    buf[i++] = '-';
 873:	8d 4f 02             	lea    0x2(%edi),%ecx
 876:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 87b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 87e:	66 90                	xchg   %ax,%ax
 880:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 885:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 888:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 88f:	00 
 890:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 894:	89 34 24             	mov    %esi,(%esp)
 897:	88 45 d7             	mov    %al,-0x29(%ebp)
 89a:	e8 d3 fe ff ff       	call   772 <write>
  while(--i >= 0)
 89f:	83 ff ff             	cmp    $0xffffffff,%edi
 8a2:	75 dc                	jne    880 <printint+0x60>
    putc(fd, buf[i]);
}
 8a4:	83 c4 4c             	add    $0x4c,%esp
 8a7:	5b                   	pop    %ebx
 8a8:	5e                   	pop    %esi
 8a9:	5f                   	pop    %edi
 8aa:	5d                   	pop    %ebp
 8ab:	c3                   	ret    
 8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 8b0:	89 d0                	mov    %edx,%eax
 8b2:	f7 d8                	neg    %eax
    neg = 1;
 8b4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 8bb:	eb 87                	jmp    844 <printint+0x24>
 8bd:	8d 76 00             	lea    0x0(%esi),%esi

000008c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8c4:	31 ff                	xor    %edi,%edi
{
 8c6:	56                   	push   %esi
 8c7:	53                   	push   %ebx
 8c8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8cb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 8ce:	8d 45 10             	lea    0x10(%ebp),%eax
{
 8d1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 8d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 8d7:	0f b6 13             	movzbl (%ebx),%edx
 8da:	83 c3 01             	add    $0x1,%ebx
 8dd:	84 d2                	test   %dl,%dl
 8df:	75 39                	jne    91a <printf+0x5a>
 8e1:	e9 c2 00 00 00       	jmp    9a8 <printf+0xe8>
 8e6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8e8:	83 fa 25             	cmp    $0x25,%edx
 8eb:	0f 84 bf 00 00 00    	je     9b0 <printf+0xf0>
  write(fd, &c, 1);
 8f1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 8f4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8fb:	00 
 8fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 900:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 903:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
 906:	e8 67 fe ff ff       	call   772 <write>
 90b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 90e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 912:	84 d2                	test   %dl,%dl
 914:	0f 84 8e 00 00 00    	je     9a8 <printf+0xe8>
    if(state == 0){
 91a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 91c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 91f:	74 c7                	je     8e8 <printf+0x28>
      }
    } else if(state == '%'){
 921:	83 ff 25             	cmp    $0x25,%edi
 924:	75 e5                	jne    90b <printf+0x4b>
      if(c == 'd'){
 926:	83 fa 64             	cmp    $0x64,%edx
 929:	0f 84 31 01 00 00    	je     a60 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 92f:	25 f7 00 00 00       	and    $0xf7,%eax
 934:	83 f8 70             	cmp    $0x70,%eax
 937:	0f 84 83 00 00 00    	je     9c0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 93d:	83 fa 73             	cmp    $0x73,%edx
 940:	0f 84 a2 00 00 00    	je     9e8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 946:	83 fa 63             	cmp    $0x63,%edx
 949:	0f 84 35 01 00 00    	je     a84 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 94f:	83 fa 25             	cmp    $0x25,%edx
 952:	0f 84 e0 00 00 00    	je     a38 <printf+0x178>
  write(fd, &c, 1);
 958:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 95b:	83 c3 01             	add    $0x1,%ebx
 95e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 965:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 966:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 968:	89 44 24 04          	mov    %eax,0x4(%esp)
 96c:	89 34 24             	mov    %esi,(%esp)
 96f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 972:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 976:	e8 f7 fd ff ff       	call   772 <write>
        putc(fd, c);
 97b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 97e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 981:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 988:	00 
 989:	89 44 24 04          	mov    %eax,0x4(%esp)
 98d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 990:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 993:	e8 da fd ff ff       	call   772 <write>
  for(i = 0; fmt[i]; i++){
 998:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 99c:	84 d2                	test   %dl,%dl
 99e:	0f 85 76 ff ff ff    	jne    91a <printf+0x5a>
 9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
 9a8:	83 c4 3c             	add    $0x3c,%esp
 9ab:	5b                   	pop    %ebx
 9ac:	5e                   	pop    %esi
 9ad:	5f                   	pop    %edi
 9ae:	5d                   	pop    %ebp
 9af:	c3                   	ret    
        state = '%';
 9b0:	bf 25 00 00 00       	mov    $0x25,%edi
 9b5:	e9 51 ff ff ff       	jmp    90b <printf+0x4b>
 9ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 9c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 9c3:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
 9c8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 9ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 9d1:	8b 10                	mov    (%eax),%edx
 9d3:	89 f0                	mov    %esi,%eax
 9d5:	e8 46 fe ff ff       	call   820 <printint>
        ap++;
 9da:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 9de:	e9 28 ff ff ff       	jmp    90b <printf+0x4b>
 9e3:	90                   	nop
 9e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 9e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 9eb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 9ef:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 9f1:	b8 32 0f 00 00       	mov    $0xf32,%eax
 9f6:	85 ff                	test   %edi,%edi
 9f8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 9fb:	0f b6 07             	movzbl (%edi),%eax
 9fe:	84 c0                	test   %al,%al
 a00:	74 2a                	je     a2c <printf+0x16c>
 a02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a08:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 a0b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 a0e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 a11:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a18:	00 
 a19:	89 44 24 04          	mov    %eax,0x4(%esp)
 a1d:	89 34 24             	mov    %esi,(%esp)
 a20:	e8 4d fd ff ff       	call   772 <write>
        while(*s != 0){
 a25:	0f b6 07             	movzbl (%edi),%eax
 a28:	84 c0                	test   %al,%al
 a2a:	75 dc                	jne    a08 <printf+0x148>
      state = 0;
 a2c:	31 ff                	xor    %edi,%edi
 a2e:	e9 d8 fe ff ff       	jmp    90b <printf+0x4b>
 a33:	90                   	nop
 a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 a38:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 a3b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 a3d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a44:	00 
 a45:	89 44 24 04          	mov    %eax,0x4(%esp)
 a49:	89 34 24             	mov    %esi,(%esp)
 a4c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 a50:	e8 1d fd ff ff       	call   772 <write>
 a55:	e9 b1 fe ff ff       	jmp    90b <printf+0x4b>
 a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a60:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a63:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
 a68:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 a6b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a72:	8b 10                	mov    (%eax),%edx
 a74:	89 f0                	mov    %esi,%eax
 a76:	e8 a5 fd ff ff       	call   820 <printint>
        ap++;
 a7b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 a7f:	e9 87 fe ff ff       	jmp    90b <printf+0x4b>
        putc(fd, *ap);
 a84:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 a87:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 a89:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 a8b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a92:	00 
 a93:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 a96:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 a99:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 a9c:	89 44 24 04          	mov    %eax,0x4(%esp)
 aa0:	e8 cd fc ff ff       	call   772 <write>
        ap++;
 aa5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 aa9:	e9 5d fe ff ff       	jmp    90b <printf+0x4b>
 aae:	66 90                	xchg   %ax,%ax

00000ab0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ab0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab1:	a1 4c 12 00 00       	mov    0x124c,%eax
{
 ab6:	89 e5                	mov    %esp,%ebp
 ab8:	57                   	push   %edi
 ab9:	56                   	push   %esi
 aba:	53                   	push   %ebx
 abb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 abe:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 ac0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac3:	39 d0                	cmp    %edx,%eax
 ac5:	72 11                	jb     ad8 <free+0x28>
 ac7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ac8:	39 c8                	cmp    %ecx,%eax
 aca:	72 04                	jb     ad0 <free+0x20>
 acc:	39 ca                	cmp    %ecx,%edx
 ace:	72 10                	jb     ae0 <free+0x30>
 ad0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ad4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad6:	73 f0                	jae    ac8 <free+0x18>
 ad8:	39 ca                	cmp    %ecx,%edx
 ada:	72 04                	jb     ae0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 adc:	39 c8                	cmp    %ecx,%eax
 ade:	72 f0                	jb     ad0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ae0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 ae3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 ae6:	39 cf                	cmp    %ecx,%edi
 ae8:	74 1e                	je     b08 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 aea:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 aed:	8b 48 04             	mov    0x4(%eax),%ecx
 af0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 af3:	39 f2                	cmp    %esi,%edx
 af5:	74 28                	je     b1f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 af7:	89 10                	mov    %edx,(%eax)
  freep = p;
 af9:	a3 4c 12 00 00       	mov    %eax,0x124c
}
 afe:	5b                   	pop    %ebx
 aff:	5e                   	pop    %esi
 b00:	5f                   	pop    %edi
 b01:	5d                   	pop    %ebp
 b02:	c3                   	ret    
 b03:	90                   	nop
 b04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 b08:	03 71 04             	add    0x4(%ecx),%esi
 b0b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b0e:	8b 08                	mov    (%eax),%ecx
 b10:	8b 09                	mov    (%ecx),%ecx
 b12:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b15:	8b 48 04             	mov    0x4(%eax),%ecx
 b18:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 b1b:	39 f2                	cmp    %esi,%edx
 b1d:	75 d8                	jne    af7 <free+0x47>
    p->s.size += bp->s.size;
 b1f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 b22:	a3 4c 12 00 00       	mov    %eax,0x124c
    p->s.size += bp->s.size;
 b27:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b2a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b2d:	89 10                	mov    %edx,(%eax)
}
 b2f:	5b                   	pop    %ebx
 b30:	5e                   	pop    %esi
 b31:	5f                   	pop    %edi
 b32:	5d                   	pop    %ebp
 b33:	c3                   	ret    
 b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	57                   	push   %edi
 b44:	56                   	push   %esi
 b45:	53                   	push   %ebx
 b46:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b49:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b4c:	8b 1d 4c 12 00 00    	mov    0x124c,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b52:	8d 48 07             	lea    0x7(%eax),%ecx
 b55:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 b58:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b5a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 b5d:	0f 84 9b 00 00 00    	je     bfe <malloc+0xbe>
 b63:	8b 13                	mov    (%ebx),%edx
 b65:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b68:	39 fe                	cmp    %edi,%esi
 b6a:	76 64                	jbe    bd0 <malloc+0x90>
 b6c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 b73:	bb 00 80 00 00       	mov    $0x8000,%ebx
 b78:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b7b:	eb 0e                	jmp    b8b <malloc+0x4b>
 b7d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b80:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b82:	8b 78 04             	mov    0x4(%eax),%edi
 b85:	39 fe                	cmp    %edi,%esi
 b87:	76 4f                	jbe    bd8 <malloc+0x98>
 b89:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b8b:	3b 15 4c 12 00 00    	cmp    0x124c,%edx
 b91:	75 ed                	jne    b80 <malloc+0x40>
  if(nu < 4096)
 b93:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 b96:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 b9c:	bf 00 10 00 00       	mov    $0x1000,%edi
 ba1:	0f 43 fe             	cmovae %esi,%edi
 ba4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 ba7:	89 04 24             	mov    %eax,(%esp)
 baa:	e8 2b fc ff ff       	call   7da <sbrk>
  if(p == (char*)-1)
 baf:	83 f8 ff             	cmp    $0xffffffff,%eax
 bb2:	74 18                	je     bcc <malloc+0x8c>
  hp->s.size = nu;
 bb4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 bb7:	83 c0 08             	add    $0x8,%eax
 bba:	89 04 24             	mov    %eax,(%esp)
 bbd:	e8 ee fe ff ff       	call   ab0 <free>
  return freep;
 bc2:	8b 15 4c 12 00 00    	mov    0x124c,%edx
      if((p = morecore(nunits)) == 0)
 bc8:	85 d2                	test   %edx,%edx
 bca:	75 b4                	jne    b80 <malloc+0x40>
        return 0;
 bcc:	31 c0                	xor    %eax,%eax
 bce:	eb 20                	jmp    bf0 <malloc+0xb0>
    if(p->s.size >= nunits){
 bd0:	89 d0                	mov    %edx,%eax
 bd2:	89 da                	mov    %ebx,%edx
 bd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 bd8:	39 fe                	cmp    %edi,%esi
 bda:	74 1c                	je     bf8 <malloc+0xb8>
        p->s.size -= nunits;
 bdc:	29 f7                	sub    %esi,%edi
 bde:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 be1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 be4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 be7:	89 15 4c 12 00 00    	mov    %edx,0x124c
      return (void*)(p + 1);
 bed:	83 c0 08             	add    $0x8,%eax
  }
}
 bf0:	83 c4 1c             	add    $0x1c,%esp
 bf3:	5b                   	pop    %ebx
 bf4:	5e                   	pop    %esi
 bf5:	5f                   	pop    %edi
 bf6:	5d                   	pop    %ebp
 bf7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 bf8:	8b 08                	mov    (%eax),%ecx
 bfa:	89 0a                	mov    %ecx,(%edx)
 bfc:	eb e9                	jmp    be7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 bfe:	c7 05 4c 12 00 00 50 	movl   $0x1250,0x124c
 c05:	12 00 00 
    base.s.size = 0;
 c08:	ba 50 12 00 00       	mov    $0x1250,%edx
    base.s.ptr = freep = prevp = &base;
 c0d:	c7 05 50 12 00 00 50 	movl   $0x1250,0x1250
 c14:	12 00 00 
    base.s.size = 0;
 c17:	c7 05 54 12 00 00 00 	movl   $0x0,0x1254
 c1e:	00 00 00 
 c21:	e9 46 ff ff ff       	jmp    b6c <malloc+0x2c>

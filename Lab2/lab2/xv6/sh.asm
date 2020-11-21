
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
       6:	83 ec 10             	sub    $0x10,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
       9:	eb 0e                	jmp    19 <main+0x19>
       b:	90                   	nop
       c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      10:	83 f8 02             	cmp    $0x2,%eax
      13:	0f 8f d4 00 00 00    	jg     ed <main+0xed>
  while((fd = open("console", O_RDWR)) >= 0){
      19:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
      20:	00 
      21:	c7 04 24 69 13 00 00 	movl   $0x1369,(%esp)
      28:	e8 05 0e 00 00       	call   e32 <open>
      2d:	85 c0                	test   %eax,%eax
      2f:	79 df                	jns    10 <main+0x10>
      31:	eb 2a                	jmp    5d <main+0x5d>
      33:	90                   	nop
      34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      38:	80 3d 62 19 00 00 20 	cmpb   $0x20,0x1962
      3f:	90                   	nop
      40:	74 67                	je     a9 <main+0xa9>
      42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      48:	e8 43 01 00 00       	call   190 <fork1>
      4d:	85 c0                	test   %eax,%eax
      4f:	74 3f                	je     90 <main+0x90>
      runcmd(parsecmd(buf));
    wait(0);
      51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      58:	e8 9d 0d 00 00       	call   dfa <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      5d:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
      64:	00 
      65:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
      6c:	e8 8f 00 00 00       	call   100 <getcmd>
      71:	85 c0                	test   %eax,%eax
      73:	78 2f                	js     a4 <main+0xa4>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      75:	80 3d 60 19 00 00 63 	cmpb   $0x63,0x1960
      7c:	75 ca                	jne    48 <main+0x48>
      7e:	80 3d 61 19 00 00 64 	cmpb   $0x64,0x1961
      85:	74 b1                	je     38 <main+0x38>
    if(fork1() == 0)
      87:	e8 04 01 00 00       	call   190 <fork1>
      8c:	85 c0                	test   %eax,%eax
      8e:	75 c1                	jne    51 <main+0x51>
      runcmd(parsecmd(buf));
      90:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
      97:	e8 b4 0a 00 00       	call   b50 <parsecmd>
      9c:	89 04 24             	mov    %eax,(%esp)
      9f:	e8 0c 01 00 00       	call   1b0 <runcmd>
  }
  exit();
      a4:	e8 49 0d 00 00       	call   df2 <exit>
      buf[strlen(buf)-1] = 0;  // chop \n
      a9:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
      b0:	e8 9b 0b 00 00       	call   c50 <strlen>
      if(chdir(buf+3) < 0)
      b5:	c7 04 24 63 19 00 00 	movl   $0x1963,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      bc:	c6 80 5f 19 00 00 00 	movb   $0x0,0x195f(%eax)
      if(chdir(buf+3) < 0)
      c3:	e8 9a 0d 00 00       	call   e62 <chdir>
      c8:	85 c0                	test   %eax,%eax
      ca:	79 91                	jns    5d <main+0x5d>
        printf(2, "cannot cd %s\n", buf+3);
      cc:	c7 44 24 08 63 19 00 	movl   $0x1963,0x8(%esp)
      d3:	00 
      d4:	c7 44 24 04 71 13 00 	movl   $0x1371,0x4(%esp)
      db:	00 
      dc:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      e3:	e8 78 0e 00 00       	call   f60 <printf>
      e8:	e9 70 ff ff ff       	jmp    5d <main+0x5d>
      close(fd);
      ed:	89 04 24             	mov    %eax,(%esp)
      f0:	e8 25 0d 00 00       	call   e1a <close>
      break;
      f5:	e9 63 ff ff ff       	jmp    5d <main+0x5d>
      fa:	66 90                	xchg   %ax,%ax
      fc:	66 90                	xchg   %ax,%ax
      fe:	66 90                	xchg   %ax,%ax

00000100 <getcmd>:
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	56                   	push   %esi
     104:	53                   	push   %ebx
     105:	83 ec 10             	sub    $0x10,%esp
     108:	8b 5d 08             	mov    0x8(%ebp),%ebx
     10b:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     10e:	c7 44 24 04 c8 12 00 	movl   $0x12c8,0x4(%esp)
     115:	00 
     116:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     11d:	e8 3e 0e 00 00       	call   f60 <printf>
  memset(buf, 0, nbuf);
     122:	89 74 24 08          	mov    %esi,0x8(%esp)
     126:	89 1c 24             	mov    %ebx,(%esp)
     129:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     130:	00 
     131:	e8 4a 0b 00 00       	call   c80 <memset>
  gets(buf, nbuf);
     136:	89 74 24 04          	mov    %esi,0x4(%esp)
     13a:	89 1c 24             	mov    %ebx,(%esp)
     13d:	e8 9e 0b 00 00       	call   ce0 <gets>
  if(buf[0] == 0) // EOF
     142:	31 c0                	xor    %eax,%eax
     144:	80 3b 00             	cmpb   $0x0,(%ebx)
     147:	0f 94 c0             	sete   %al
}
     14a:	83 c4 10             	add    $0x10,%esp
     14d:	5b                   	pop    %ebx
  if(buf[0] == 0) // EOF
     14e:	f7 d8                	neg    %eax
}
     150:	5e                   	pop    %esi
     151:	5d                   	pop    %ebp
     152:	c3                   	ret    
     153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <panic>:
}

void
panic(char *s)
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     166:	8b 45 08             	mov    0x8(%ebp),%eax
     169:	c7 44 24 04 65 13 00 	movl   $0x1365,0x4(%esp)
     170:	00 
     171:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     178:	89 44 24 08          	mov    %eax,0x8(%esp)
     17c:	e8 df 0d 00 00       	call   f60 <printf>
  exit();
     181:	e8 6c 0c 00 00       	call   df2 <exit>
     186:	8d 76 00             	lea    0x0(%esi),%esi
     189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <fork1>:
}

int
fork1(void)
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 18             	sub    $0x18,%esp
  int pid;

  pid = fork();
     196:	e8 4f 0c 00 00       	call   dea <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
    panic("fork");
  return pid;
}
     1a0:	c9                   	leave  
     1a1:	c3                   	ret    
    panic("fork");
     1a2:	c7 04 24 cb 12 00 00 	movl   $0x12cb,(%esp)
     1a9:	e8 b2 ff ff ff       	call   160 <panic>
     1ae:	66 90                	xchg   %ax,%ax

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 24             	sub    $0x24,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 6d                	je     22b <runcmd+0x7b>
  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 f3 00 00 00    	ja     2ba <runcmd+0x10a>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 80 13 00 00 	jmp    *0x1380(,%eax,4)
    if(pipe(p) < 0)
     1d0:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1d3:	89 04 24             	mov    %eax,(%esp)
     1d6:	e8 27 0c 00 00       	call   e02 <pipe>
     1db:	85 c0                	test   %eax,%eax
     1dd:	0f 88 e3 00 00 00    	js     2c6 <runcmd+0x116>
    if(fork1() == 0){
     1e3:	e8 a8 ff ff ff       	call   190 <fork1>
     1e8:	85 c0                	test   %eax,%eax
     1ea:	0f 84 3a 01 00 00    	je     32a <runcmd+0x17a>
    if(fork1() == 0){
     1f0:	e8 9b ff ff ff       	call   190 <fork1>
     1f5:	85 c0                	test   %eax,%eax
     1f7:	0f 84 f5 00 00 00    	je     2f2 <runcmd+0x142>
    close(p[0]);
     1fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     200:	89 04 24             	mov    %eax,(%esp)
     203:	e8 12 0c 00 00       	call   e1a <close>
    close(p[1]);
     208:	8b 45 f4             	mov    -0xc(%ebp),%eax
     20b:	89 04 24             	mov    %eax,(%esp)
     20e:	e8 07 0c 00 00       	call   e1a <close>
    wait(0);
     213:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     21a:	e8 db 0b 00 00       	call   dfa <wait>
    wait(0);
     21f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     226:	e8 cf 0b 00 00       	call   dfa <wait>
      exit();
     22b:	e8 c2 0b 00 00       	call   df2 <exit>
    if(fork1() == 0)
     230:	e8 5b ff ff ff       	call   190 <fork1>
     235:	85 c0                	test   %eax,%eax
     237:	75 f2                	jne    22b <runcmd+0x7b>
     239:	eb 74                	jmp    2af <runcmd+0xff>
    if(ecmd->argv[0] == 0)
     23b:	8b 43 04             	mov    0x4(%ebx),%eax
     23e:	85 c0                	test   %eax,%eax
     240:	74 e9                	je     22b <runcmd+0x7b>
    exec(ecmd->argv[0], ecmd->argv);
     242:	8d 53 04             	lea    0x4(%ebx),%edx
     245:	89 54 24 04          	mov    %edx,0x4(%esp)
     249:	89 04 24             	mov    %eax,(%esp)
     24c:	e8 d9 0b 00 00       	call   e2a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     251:	8b 43 04             	mov    0x4(%ebx),%eax
     254:	c7 44 24 04 d7 12 00 	movl   $0x12d7,0x4(%esp)
     25b:	00 
     25c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     263:	89 44 24 08          	mov    %eax,0x8(%esp)
     267:	e8 f4 0c 00 00       	call   f60 <printf>
    break;
     26c:	eb bd                	jmp    22b <runcmd+0x7b>
    if(fork1() == 0)
     26e:	e8 1d ff ff ff       	call   190 <fork1>
     273:	85 c0                	test   %eax,%eax
     275:	74 38                	je     2af <runcmd+0xff>
    wait(0);
     277:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     27e:	e8 77 0b 00 00       	call   dfa <wait>
    runcmd(lcmd->right);
     283:	8b 43 08             	mov    0x8(%ebx),%eax
     286:	89 04 24             	mov    %eax,(%esp)
     289:	e8 22 ff ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     28e:	8b 43 14             	mov    0x14(%ebx),%eax
     291:	89 04 24             	mov    %eax,(%esp)
     294:	e8 81 0b 00 00       	call   e1a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     299:	8b 43 10             	mov    0x10(%ebx),%eax
     29c:	89 44 24 04          	mov    %eax,0x4(%esp)
     2a0:	8b 43 08             	mov    0x8(%ebx),%eax
     2a3:	89 04 24             	mov    %eax,(%esp)
     2a6:	e8 87 0b 00 00       	call   e32 <open>
     2ab:	85 c0                	test   %eax,%eax
     2ad:	78 23                	js     2d2 <runcmd+0x122>
      runcmd(bcmd->cmd);
     2af:	8b 43 04             	mov    0x4(%ebx),%eax
     2b2:	89 04 24             	mov    %eax,(%esp)
     2b5:	e8 f6 fe ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     2ba:	c7 04 24 d0 12 00 00 	movl   $0x12d0,(%esp)
     2c1:	e8 9a fe ff ff       	call   160 <panic>
      panic("pipe");
     2c6:	c7 04 24 f7 12 00 00 	movl   $0x12f7,(%esp)
     2cd:	e8 8e fe ff ff       	call   160 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2d2:	8b 43 08             	mov    0x8(%ebx),%eax
     2d5:	c7 44 24 04 e7 12 00 	movl   $0x12e7,0x4(%esp)
     2dc:	00 
     2dd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2e4:	89 44 24 08          	mov    %eax,0x8(%esp)
     2e8:	e8 73 0c 00 00       	call   f60 <printf>
     2ed:	e9 39 ff ff ff       	jmp    22b <runcmd+0x7b>
      close(0);
     2f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     2f9:	e8 1c 0b 00 00       	call   e1a <close>
      dup(p[0]);
     2fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     301:	89 04 24             	mov    %eax,(%esp)
     304:	e8 61 0b 00 00       	call   e6a <dup>
      close(p[0]);
     309:	8b 45 f0             	mov    -0x10(%ebp),%eax
     30c:	89 04 24             	mov    %eax,(%esp)
     30f:	e8 06 0b 00 00       	call   e1a <close>
      close(p[1]);
     314:	8b 45 f4             	mov    -0xc(%ebp),%eax
     317:	89 04 24             	mov    %eax,(%esp)
     31a:	e8 fb 0a 00 00       	call   e1a <close>
      runcmd(pcmd->right);
     31f:	8b 43 08             	mov    0x8(%ebx),%eax
     322:	89 04 24             	mov    %eax,(%esp)
     325:	e8 86 fe ff ff       	call   1b0 <runcmd>
      close(1);
     32a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     331:	e8 e4 0a 00 00       	call   e1a <close>
      dup(p[1]);
     336:	8b 45 f4             	mov    -0xc(%ebp),%eax
     339:	89 04 24             	mov    %eax,(%esp)
     33c:	e8 29 0b 00 00       	call   e6a <dup>
      close(p[0]);
     341:	8b 45 f0             	mov    -0x10(%ebp),%eax
     344:	89 04 24             	mov    %eax,(%esp)
     347:	e8 ce 0a 00 00       	call   e1a <close>
      close(p[1]);
     34c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     34f:	89 04 24             	mov    %eax,(%esp)
     352:	e8 c3 0a 00 00       	call   e1a <close>
      runcmd(pcmd->left);
     357:	8b 43 04             	mov    0x4(%ebx),%eax
     35a:	89 04 24             	mov    %eax,(%esp)
     35d:	e8 4e fe ff ff       	call   1b0 <runcmd>
     362:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	53                   	push   %ebx
     374:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     377:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     37e:	e8 5d 0e 00 00       	call   11e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     383:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     38a:	00 
     38b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     392:	00 
  cmd = malloc(sizeof(*cmd));
     393:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     395:	89 04 24             	mov    %eax,(%esp)
     398:	e8 e3 08 00 00       	call   c80 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     39d:	89 d8                	mov    %ebx,%eax
  cmd->type = EXEC;
     39f:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
     3a5:	83 c4 14             	add    $0x14,%esp
     3a8:	5b                   	pop    %ebx
     3a9:	5d                   	pop    %ebp
     3aa:	c3                   	ret    
     3ab:	90                   	nop
     3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003b0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	53                   	push   %ebx
     3b4:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3b7:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     3be:	e8 1d 0e 00 00       	call   11e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3c3:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     3ca:	00 
     3cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3d2:	00 
     3d3:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
     3d6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3d8:	e8 a3 08 00 00       	call   c80 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     3e0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ec:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3ef:	8b 45 10             	mov    0x10(%ebp),%eax
     3f2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3f5:	8b 45 14             	mov    0x14(%ebp),%eax
     3f8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3fb:	8b 45 18             	mov    0x18(%ebp),%eax
     3fe:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     401:	83 c4 14             	add    $0x14,%esp
     404:	89 d8                	mov    %ebx,%eax
     406:	5b                   	pop    %ebx
     407:	5d                   	pop    %ebp
     408:	c3                   	ret    
     409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000410 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	53                   	push   %ebx
     414:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     417:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     41e:	e8 bd 0d 00 00       	call   11e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     423:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     42a:	00 
     42b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     432:	00 
     433:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
     436:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     438:	e8 43 08 00 00       	call   c80 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     43d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     440:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     446:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     449:	8b 45 0c             	mov    0xc(%ebp),%eax
     44c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     44f:	83 c4 14             	add    $0x14,%esp
     452:	89 d8                	mov    %ebx,%eax
     454:	5b                   	pop    %ebx
     455:	5d                   	pop    %ebp
     456:	c3                   	ret    
     457:	89 f6                	mov    %esi,%esi
     459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000460 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     460:	55                   	push   %ebp
     461:	89 e5                	mov    %esp,%ebp
     463:	53                   	push   %ebx
     464:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     467:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     46e:	e8 6d 0d 00 00       	call   11e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     473:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     47a:	00 
     47b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     482:	00 
     483:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
     486:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     488:	e8 f3 07 00 00       	call   c80 <memset>
  cmd->type = LIST;
  cmd->left = left;
     48d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     490:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     496:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     499:	8b 45 0c             	mov    0xc(%ebp),%eax
     49c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     49f:	83 c4 14             	add    $0x14,%esp
     4a2:	89 d8                	mov    %ebx,%eax
     4a4:	5b                   	pop    %ebx
     4a5:	5d                   	pop    %ebp
     4a6:	c3                   	ret    
     4a7:	89 f6                	mov    %esi,%esi
     4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004b0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4b0:	55                   	push   %ebp
     4b1:	89 e5                	mov    %esp,%ebp
     4b3:	53                   	push   %ebx
     4b4:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4b7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     4be:	e8 1d 0d 00 00       	call   11e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4c3:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     4ca:	00 
     4cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4d2:	00 
     4d3:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
     4d6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4d8:	e8 a3 07 00 00       	call   c80 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     4dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     4e0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     4e6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     4e9:	83 c4 14             	add    $0x14,%esp
     4ec:	89 d8                	mov    %ebx,%eax
     4ee:	5b                   	pop    %ebx
     4ef:	5d                   	pop    %ebp
     4f0:	c3                   	ret    
     4f1:	eb 0d                	jmp    500 <gettoken>
     4f3:	90                   	nop
     4f4:	90                   	nop
     4f5:	90                   	nop
     4f6:	90                   	nop
     4f7:	90                   	nop
     4f8:	90                   	nop
     4f9:	90                   	nop
     4fa:	90                   	nop
     4fb:	90                   	nop
     4fc:	90                   	nop
     4fd:	90                   	nop
     4fe:	90                   	nop
     4ff:	90                   	nop

00000500 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     500:	55                   	push   %ebp
     501:	89 e5                	mov    %esp,%ebp
     503:	57                   	push   %edi
     504:	56                   	push   %esi
     505:	53                   	push   %ebx
     506:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     509:	8b 45 08             	mov    0x8(%ebp),%eax
{
     50c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     50f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     512:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     514:	39 df                	cmp    %ebx,%edi
     516:	72 0f                	jb     527 <gettoken+0x27>
     518:	eb 24                	jmp    53e <gettoken+0x3e>
     51a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     520:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     523:	39 df                	cmp    %ebx,%edi
     525:	74 17                	je     53e <gettoken+0x3e>
     527:	0f be 07             	movsbl (%edi),%eax
     52a:	c7 04 24 50 19 00 00 	movl   $0x1950,(%esp)
     531:	89 44 24 04          	mov    %eax,0x4(%esp)
     535:	e8 66 07 00 00       	call   ca0 <strchr>
     53a:	85 c0                	test   %eax,%eax
     53c:	75 e2                	jne    520 <gettoken+0x20>
  if(q)
     53e:	85 f6                	test   %esi,%esi
     540:	74 02                	je     544 <gettoken+0x44>
    *q = s;
     542:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     544:	0f b6 0f             	movzbl (%edi),%ecx
     547:	0f be f1             	movsbl %cl,%esi
  switch(*s){
     54a:	80 f9 29             	cmp    $0x29,%cl
  ret = *s;
     54d:	89 f0                	mov    %esi,%eax
  switch(*s){
     54f:	7f 4f                	jg     5a0 <gettoken+0xa0>
     551:	80 f9 28             	cmp    $0x28,%cl
     554:	7d 55                	jge    5ab <gettoken+0xab>
     556:	84 c9                	test   %cl,%cl
     558:	0f 85 ca 00 00 00    	jne    628 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     55e:	8b 45 14             	mov    0x14(%ebp),%eax
     561:	85 c0                	test   %eax,%eax
     563:	74 05                	je     56a <gettoken+0x6a>
    *eq = s;
     565:	8b 45 14             	mov    0x14(%ebp),%eax
     568:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     56a:	39 df                	cmp    %ebx,%edi
     56c:	72 09                	jb     577 <gettoken+0x77>
     56e:	eb 1e                	jmp    58e <gettoken+0x8e>
    s++;
     570:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     573:	39 df                	cmp    %ebx,%edi
     575:	74 17                	je     58e <gettoken+0x8e>
     577:	0f be 07             	movsbl (%edi),%eax
     57a:	c7 04 24 50 19 00 00 	movl   $0x1950,(%esp)
     581:	89 44 24 04          	mov    %eax,0x4(%esp)
     585:	e8 16 07 00 00       	call   ca0 <strchr>
     58a:	85 c0                	test   %eax,%eax
     58c:	75 e2                	jne    570 <gettoken+0x70>
  *ps = s;
     58e:	8b 45 08             	mov    0x8(%ebp),%eax
     591:	89 38                	mov    %edi,(%eax)
  return ret;
}
     593:	83 c4 1c             	add    $0x1c,%esp
     596:	89 f0                	mov    %esi,%eax
     598:	5b                   	pop    %ebx
     599:	5e                   	pop    %esi
     59a:	5f                   	pop    %edi
     59b:	5d                   	pop    %ebp
     59c:	c3                   	ret    
     59d:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     5a0:	80 f9 3e             	cmp    $0x3e,%cl
     5a3:	75 0b                	jne    5b0 <gettoken+0xb0>
    if(*s == '>'){
     5a5:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     5a9:	74 6d                	je     618 <gettoken+0x118>
    s++;
     5ab:	83 c7 01             	add    $0x1,%edi
     5ae:	eb ae                	jmp    55e <gettoken+0x5e>
  switch(*s){
     5b0:	7f 56                	jg     608 <gettoken+0x108>
     5b2:	83 e9 3b             	sub    $0x3b,%ecx
     5b5:	80 f9 01             	cmp    $0x1,%cl
     5b8:	76 f1                	jbe    5ab <gettoken+0xab>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5ba:	39 fb                	cmp    %edi,%ebx
     5bc:	77 2b                	ja     5e9 <gettoken+0xe9>
     5be:	66 90                	xchg   %ax,%ax
     5c0:	eb 3b                	jmp    5fd <gettoken+0xfd>
     5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     5c8:	0f be 07             	movsbl (%edi),%eax
     5cb:	c7 04 24 48 19 00 00 	movl   $0x1948,(%esp)
     5d2:	89 44 24 04          	mov    %eax,0x4(%esp)
     5d6:	e8 c5 06 00 00       	call   ca0 <strchr>
     5db:	85 c0                	test   %eax,%eax
     5dd:	75 1e                	jne    5fd <gettoken+0xfd>
      s++;
     5df:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5e2:	39 df                	cmp    %ebx,%edi
     5e4:	74 17                	je     5fd <gettoken+0xfd>
     5e6:	0f be 07             	movsbl (%edi),%eax
     5e9:	89 44 24 04          	mov    %eax,0x4(%esp)
     5ed:	c7 04 24 50 19 00 00 	movl   $0x1950,(%esp)
     5f4:	e8 a7 06 00 00       	call   ca0 <strchr>
     5f9:	85 c0                	test   %eax,%eax
     5fb:	74 cb                	je     5c8 <gettoken+0xc8>
    ret = 'a';
     5fd:	be 61 00 00 00       	mov    $0x61,%esi
     602:	e9 57 ff ff ff       	jmp    55e <gettoken+0x5e>
     607:	90                   	nop
  switch(*s){
     608:	80 f9 7c             	cmp    $0x7c,%cl
     60b:	74 9e                	je     5ab <gettoken+0xab>
     60d:	8d 76 00             	lea    0x0(%esi),%esi
     610:	eb a8                	jmp    5ba <gettoken+0xba>
     612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      s++;
     618:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     61b:	be 2b 00 00 00       	mov    $0x2b,%esi
     620:	e9 39 ff ff ff       	jmp    55e <gettoken+0x5e>
     625:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     628:	80 f9 26             	cmp    $0x26,%cl
     62b:	75 8d                	jne    5ba <gettoken+0xba>
     62d:	e9 79 ff ff ff       	jmp    5ab <gettoken+0xab>
     632:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	57                   	push   %edi
     644:	56                   	push   %esi
     645:	53                   	push   %ebx
     646:	83 ec 1c             	sub    $0x1c,%esp
     649:	8b 7d 08             	mov    0x8(%ebp),%edi
     64c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     64f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     651:	39 f3                	cmp    %esi,%ebx
     653:	72 0a                	jb     65f <peek+0x1f>
     655:	eb 1f                	jmp    676 <peek+0x36>
     657:	90                   	nop
    s++;
     658:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     65b:	39 f3                	cmp    %esi,%ebx
     65d:	74 17                	je     676 <peek+0x36>
     65f:	0f be 03             	movsbl (%ebx),%eax
     662:	c7 04 24 50 19 00 00 	movl   $0x1950,(%esp)
     669:	89 44 24 04          	mov    %eax,0x4(%esp)
     66d:	e8 2e 06 00 00       	call   ca0 <strchr>
     672:	85 c0                	test   %eax,%eax
     674:	75 e2                	jne    658 <peek+0x18>
  *ps = s;
     676:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     678:	0f be 13             	movsbl (%ebx),%edx
     67b:	31 c0                	xor    %eax,%eax
     67d:	84 d2                	test   %dl,%dl
     67f:	74 17                	je     698 <peek+0x58>
     681:	8b 45 10             	mov    0x10(%ebp),%eax
     684:	89 54 24 04          	mov    %edx,0x4(%esp)
     688:	89 04 24             	mov    %eax,(%esp)
     68b:	e8 10 06 00 00       	call   ca0 <strchr>
     690:	85 c0                	test   %eax,%eax
     692:	0f 95 c0             	setne  %al
     695:	0f b6 c0             	movzbl %al,%eax
}
     698:	83 c4 1c             	add    $0x1c,%esp
     69b:	5b                   	pop    %ebx
     69c:	5e                   	pop    %esi
     69d:	5f                   	pop    %edi
     69e:	5d                   	pop    %ebp
     69f:	c3                   	ret    

000006a0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     6a0:	55                   	push   %ebp
     6a1:	89 e5                	mov    %esp,%ebp
     6a3:	57                   	push   %edi
     6a4:	56                   	push   %esi
     6a5:	53                   	push   %ebx
     6a6:	83 ec 3c             	sub    $0x3c,%esp
     6a9:	8b 75 0c             	mov    0xc(%ebp),%esi
     6ac:	8b 5d 10             	mov    0x10(%ebp),%ebx
     6af:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6b0:	c7 44 24 08 19 13 00 	movl   $0x1319,0x8(%esp)
     6b7:	00 
     6b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     6bc:	89 34 24             	mov    %esi,(%esp)
     6bf:	e8 7c ff ff ff       	call   640 <peek>
     6c4:	85 c0                	test   %eax,%eax
     6c6:	0f 84 9c 00 00 00    	je     768 <parseredirs+0xc8>
    tok = gettoken(ps, es, 0, 0);
     6cc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     6d3:	00 
     6d4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     6db:	00 
     6dc:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     6e0:	89 34 24             	mov    %esi,(%esp)
     6e3:	e8 18 fe ff ff       	call   500 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     6e8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     6ec:	89 34 24             	mov    %esi,(%esp)
    tok = gettoken(ps, es, 0, 0);
     6ef:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     6f1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     6f4:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6f8:	8d 45 e0             	lea    -0x20(%ebp),%eax
     6fb:	89 44 24 08          	mov    %eax,0x8(%esp)
     6ff:	e8 fc fd ff ff       	call   500 <gettoken>
     704:	83 f8 61             	cmp    $0x61,%eax
     707:	75 6a                	jne    773 <parseredirs+0xd3>
      panic("missing file for redirection");
    switch(tok){
     709:	83 ff 3c             	cmp    $0x3c,%edi
     70c:	74 42                	je     750 <parseredirs+0xb0>
     70e:	83 ff 3e             	cmp    $0x3e,%edi
     711:	74 05                	je     718 <parseredirs+0x78>
     713:	83 ff 2b             	cmp    $0x2b,%edi
     716:	75 98                	jne    6b0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     718:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     71f:	00 
     720:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     727:	00 
     728:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     72b:	89 44 24 08          	mov    %eax,0x8(%esp)
     72f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     732:	89 44 24 04          	mov    %eax,0x4(%esp)
     736:	8b 45 08             	mov    0x8(%ebp),%eax
     739:	89 04 24             	mov    %eax,(%esp)
     73c:	e8 6f fc ff ff       	call   3b0 <redircmd>
     741:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     744:	e9 67 ff ff ff       	jmp    6b0 <parseredirs+0x10>
     749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     750:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     757:	00 
     758:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     75f:	00 
     760:	eb c6                	jmp    728 <parseredirs+0x88>
     762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     768:	8b 45 08             	mov    0x8(%ebp),%eax
     76b:	83 c4 3c             	add    $0x3c,%esp
     76e:	5b                   	pop    %ebx
     76f:	5e                   	pop    %esi
     770:	5f                   	pop    %edi
     771:	5d                   	pop    %ebp
     772:	c3                   	ret    
      panic("missing file for redirection");
     773:	c7 04 24 fc 12 00 00 	movl   $0x12fc,(%esp)
     77a:	e8 e1 f9 ff ff       	call   160 <panic>
     77f:	90                   	nop

00000780 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     780:	55                   	push   %ebp
     781:	89 e5                	mov    %esp,%ebp
     783:	57                   	push   %edi
     784:	56                   	push   %esi
     785:	53                   	push   %ebx
     786:	83 ec 3c             	sub    $0x3c,%esp
     789:	8b 75 08             	mov    0x8(%ebp),%esi
     78c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     78f:	c7 44 24 08 1c 13 00 	movl   $0x131c,0x8(%esp)
     796:	00 
     797:	89 34 24             	mov    %esi,(%esp)
     79a:	89 7c 24 04          	mov    %edi,0x4(%esp)
     79e:	e8 9d fe ff ff       	call   640 <peek>
     7a3:	85 c0                	test   %eax,%eax
     7a5:	0f 85 a5 00 00 00    	jne    850 <parseexec+0xd0>
    return parseblock(ps, es);

  ret = execcmd();
     7ab:	e8 c0 fb ff ff       	call   370 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7b0:	89 7c 24 08          	mov    %edi,0x8(%esp)
     7b4:	89 74 24 04          	mov    %esi,0x4(%esp)
     7b8:	89 04 24             	mov    %eax,(%esp)
  ret = execcmd();
     7bb:	89 c3                	mov    %eax,%ebx
     7bd:	89 45 cc             	mov    %eax,-0x34(%ebp)
  ret = parseredirs(ret, ps, es);
     7c0:	e8 db fe ff ff       	call   6a0 <parseredirs>
  argc = 0;
     7c5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  ret = parseredirs(ret, ps, es);
     7cc:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
     7cf:	eb 1d                	jmp    7ee <parseexec+0x6e>
     7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7db:	89 7c 24 08          	mov    %edi,0x8(%esp)
     7df:	89 74 24 04          	mov    %esi,0x4(%esp)
     7e3:	89 04 24             	mov    %eax,(%esp)
     7e6:	e8 b5 fe ff ff       	call   6a0 <parseredirs>
     7eb:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
     7ee:	c7 44 24 08 33 13 00 	movl   $0x1333,0x8(%esp)
     7f5:	00 
     7f6:	89 7c 24 04          	mov    %edi,0x4(%esp)
     7fa:	89 34 24             	mov    %esi,(%esp)
     7fd:	e8 3e fe ff ff       	call   640 <peek>
     802:	85 c0                	test   %eax,%eax
     804:	75 62                	jne    868 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     806:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     809:	89 44 24 0c          	mov    %eax,0xc(%esp)
     80d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     810:	89 44 24 08          	mov    %eax,0x8(%esp)
     814:	89 7c 24 04          	mov    %edi,0x4(%esp)
     818:	89 34 24             	mov    %esi,(%esp)
     81b:	e8 e0 fc ff ff       	call   500 <gettoken>
     820:	85 c0                	test   %eax,%eax
     822:	74 44                	je     868 <parseexec+0xe8>
    if(tok != 'a')
     824:	83 f8 61             	cmp    $0x61,%eax
     827:	75 61                	jne    88a <parseexec+0x10a>
    cmd->argv[argc] = q;
     829:	8b 45 e0             	mov    -0x20(%ebp),%eax
     82c:	83 c3 04             	add    $0x4,%ebx
    argc++;
     82f:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    cmd->argv[argc] = q;
     833:	89 03                	mov    %eax,(%ebx)
    cmd->eargv[argc] = eq;
     835:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     838:	89 43 28             	mov    %eax,0x28(%ebx)
    if(argc >= MAXARGS)
     83b:	83 7d d4 0a          	cmpl   $0xa,-0x2c(%ebp)
     83f:	75 97                	jne    7d8 <parseexec+0x58>
      panic("too many args");
     841:	c7 04 24 25 13 00 00 	movl   $0x1325,(%esp)
     848:	e8 13 f9 ff ff       	call   160 <panic>
     84d:	8d 76 00             	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     850:	89 7c 24 04          	mov    %edi,0x4(%esp)
     854:	89 34 24             	mov    %esi,(%esp)
     857:	e8 84 01 00 00       	call   9e0 <parseblock>
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     85c:	83 c4 3c             	add    $0x3c,%esp
     85f:	5b                   	pop    %ebx
     860:	5e                   	pop    %esi
     861:	5f                   	pop    %edi
     862:	5d                   	pop    %ebp
     863:	c3                   	ret    
     864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     868:	8b 45 cc             	mov    -0x34(%ebp),%eax
     86b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     86e:	8d 04 90             	lea    (%eax,%edx,4),%eax
  cmd->argv[argc] = 0;
     871:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     878:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  return ret;
     87f:	8b 45 d0             	mov    -0x30(%ebp),%eax
}
     882:	83 c4 3c             	add    $0x3c,%esp
     885:	5b                   	pop    %ebx
     886:	5e                   	pop    %esi
     887:	5f                   	pop    %edi
     888:	5d                   	pop    %ebp
     889:	c3                   	ret    
      panic("syntax");
     88a:	c7 04 24 1e 13 00 00 	movl   $0x131e,(%esp)
     891:	e8 ca f8 ff ff       	call   160 <panic>
     896:	8d 76 00             	lea    0x0(%esi),%esi
     899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008a0 <parsepipe>:
{
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	57                   	push   %edi
     8a4:	56                   	push   %esi
     8a5:	53                   	push   %ebx
     8a6:	83 ec 1c             	sub    $0x1c,%esp
     8a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8ac:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parseexec(ps, es);
     8af:	89 1c 24             	mov    %ebx,(%esp)
     8b2:	89 74 24 04          	mov    %esi,0x4(%esp)
     8b6:	e8 c5 fe ff ff       	call   780 <parseexec>
  if(peek(ps, es, "|")){
     8bb:	c7 44 24 08 38 13 00 	movl   $0x1338,0x8(%esp)
     8c2:	00 
     8c3:	89 74 24 04          	mov    %esi,0x4(%esp)
     8c7:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseexec(ps, es);
     8ca:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     8cc:	e8 6f fd ff ff       	call   640 <peek>
     8d1:	85 c0                	test   %eax,%eax
     8d3:	75 0b                	jne    8e0 <parsepipe+0x40>
}
     8d5:	83 c4 1c             	add    $0x1c,%esp
     8d8:	89 f8                	mov    %edi,%eax
     8da:	5b                   	pop    %ebx
     8db:	5e                   	pop    %esi
     8dc:	5f                   	pop    %edi
     8dd:	5d                   	pop    %ebp
     8de:	c3                   	ret    
     8df:	90                   	nop
    gettoken(ps, es, 0, 0);
     8e0:	89 74 24 04          	mov    %esi,0x4(%esp)
     8e4:	89 1c 24             	mov    %ebx,(%esp)
     8e7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8ee:	00 
     8ef:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8f6:	00 
     8f7:	e8 04 fc ff ff       	call   500 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8fc:	89 74 24 04          	mov    %esi,0x4(%esp)
     900:	89 1c 24             	mov    %ebx,(%esp)
     903:	e8 98 ff ff ff       	call   8a0 <parsepipe>
     908:	89 7d 08             	mov    %edi,0x8(%ebp)
     90b:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     90e:	83 c4 1c             	add    $0x1c,%esp
     911:	5b                   	pop    %ebx
     912:	5e                   	pop    %esi
     913:	5f                   	pop    %edi
     914:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     915:	e9 f6 fa ff ff       	jmp    410 <pipecmd>
     91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000920 <parseline>:
{
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	57                   	push   %edi
     924:	56                   	push   %esi
     925:	53                   	push   %ebx
     926:	83 ec 1c             	sub    $0x1c,%esp
     929:	8b 5d 08             	mov    0x8(%ebp),%ebx
     92c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     92f:	89 1c 24             	mov    %ebx,(%esp)
     932:	89 74 24 04          	mov    %esi,0x4(%esp)
     936:	e8 65 ff ff ff       	call   8a0 <parsepipe>
     93b:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     93d:	eb 27                	jmp    966 <parseline+0x46>
     93f:	90                   	nop
    gettoken(ps, es, 0, 0);
     940:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     947:	00 
     948:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     94f:	00 
     950:	89 74 24 04          	mov    %esi,0x4(%esp)
     954:	89 1c 24             	mov    %ebx,(%esp)
     957:	e8 a4 fb ff ff       	call   500 <gettoken>
    cmd = backcmd(cmd);
     95c:	89 3c 24             	mov    %edi,(%esp)
     95f:	e8 4c fb ff ff       	call   4b0 <backcmd>
     964:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     966:	c7 44 24 08 3a 13 00 	movl   $0x133a,0x8(%esp)
     96d:	00 
     96e:	89 74 24 04          	mov    %esi,0x4(%esp)
     972:	89 1c 24             	mov    %ebx,(%esp)
     975:	e8 c6 fc ff ff       	call   640 <peek>
     97a:	85 c0                	test   %eax,%eax
     97c:	75 c2                	jne    940 <parseline+0x20>
  if(peek(ps, es, ";")){
     97e:	c7 44 24 08 36 13 00 	movl   $0x1336,0x8(%esp)
     985:	00 
     986:	89 74 24 04          	mov    %esi,0x4(%esp)
     98a:	89 1c 24             	mov    %ebx,(%esp)
     98d:	e8 ae fc ff ff       	call   640 <peek>
     992:	85 c0                	test   %eax,%eax
     994:	75 0a                	jne    9a0 <parseline+0x80>
}
     996:	83 c4 1c             	add    $0x1c,%esp
     999:	89 f8                	mov    %edi,%eax
     99b:	5b                   	pop    %ebx
     99c:	5e                   	pop    %esi
     99d:	5f                   	pop    %edi
     99e:	5d                   	pop    %ebp
     99f:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     9a0:	89 74 24 04          	mov    %esi,0x4(%esp)
     9a4:	89 1c 24             	mov    %ebx,(%esp)
     9a7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9ae:	00 
     9af:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     9b6:	00 
     9b7:	e8 44 fb ff ff       	call   500 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9bc:	89 74 24 04          	mov    %esi,0x4(%esp)
     9c0:	89 1c 24             	mov    %ebx,(%esp)
     9c3:	e8 58 ff ff ff       	call   920 <parseline>
     9c8:	89 7d 08             	mov    %edi,0x8(%ebp)
     9cb:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     9ce:	83 c4 1c             	add    $0x1c,%esp
     9d1:	5b                   	pop    %ebx
     9d2:	5e                   	pop    %esi
     9d3:	5f                   	pop    %edi
     9d4:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     9d5:	e9 86 fa ff ff       	jmp    460 <listcmd>
     9da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009e0 <parseblock>:
{
     9e0:	55                   	push   %ebp
     9e1:	89 e5                	mov    %esp,%ebp
     9e3:	57                   	push   %edi
     9e4:	56                   	push   %esi
     9e5:	53                   	push   %ebx
     9e6:	83 ec 1c             	sub    $0x1c,%esp
     9e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     9ef:	c7 44 24 08 1c 13 00 	movl   $0x131c,0x8(%esp)
     9f6:	00 
     9f7:	89 1c 24             	mov    %ebx,(%esp)
     9fa:	89 74 24 04          	mov    %esi,0x4(%esp)
     9fe:	e8 3d fc ff ff       	call   640 <peek>
     a03:	85 c0                	test   %eax,%eax
     a05:	74 76                	je     a7d <parseblock+0x9d>
  gettoken(ps, es, 0, 0);
     a07:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a0e:	00 
     a0f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a16:	00 
     a17:	89 74 24 04          	mov    %esi,0x4(%esp)
     a1b:	89 1c 24             	mov    %ebx,(%esp)
     a1e:	e8 dd fa ff ff       	call   500 <gettoken>
  cmd = parseline(ps, es);
     a23:	89 74 24 04          	mov    %esi,0x4(%esp)
     a27:	89 1c 24             	mov    %ebx,(%esp)
     a2a:	e8 f1 fe ff ff       	call   920 <parseline>
  if(!peek(ps, es, ")"))
     a2f:	c7 44 24 08 58 13 00 	movl   $0x1358,0x8(%esp)
     a36:	00 
     a37:	89 74 24 04          	mov    %esi,0x4(%esp)
     a3b:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseline(ps, es);
     a3e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a40:	e8 fb fb ff ff       	call   640 <peek>
     a45:	85 c0                	test   %eax,%eax
     a47:	74 40                	je     a89 <parseblock+0xa9>
  gettoken(ps, es, 0, 0);
     a49:	89 74 24 04          	mov    %esi,0x4(%esp)
     a4d:	89 1c 24             	mov    %ebx,(%esp)
     a50:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a57:	00 
     a58:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a5f:	00 
     a60:	e8 9b fa ff ff       	call   500 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a65:	89 74 24 08          	mov    %esi,0x8(%esp)
     a69:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     a6d:	89 3c 24             	mov    %edi,(%esp)
     a70:	e8 2b fc ff ff       	call   6a0 <parseredirs>
}
     a75:	83 c4 1c             	add    $0x1c,%esp
     a78:	5b                   	pop    %ebx
     a79:	5e                   	pop    %esi
     a7a:	5f                   	pop    %edi
     a7b:	5d                   	pop    %ebp
     a7c:	c3                   	ret    
    panic("parseblock");
     a7d:	c7 04 24 3c 13 00 00 	movl   $0x133c,(%esp)
     a84:	e8 d7 f6 ff ff       	call   160 <panic>
    panic("syntax - missing )");
     a89:	c7 04 24 47 13 00 00 	movl   $0x1347,(%esp)
     a90:	e8 cb f6 ff ff       	call   160 <panic>
     a95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000aa0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	53                   	push   %ebx
     aa4:	83 ec 14             	sub    $0x14,%esp
     aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aaa:	85 db                	test   %ebx,%ebx
     aac:	0f 84 8e 00 00 00    	je     b40 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     ab2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ab5:	77 49                	ja     b00 <nulterminate+0x60>
     ab7:	8b 03                	mov    (%ebx),%eax
     ab9:	ff 24 85 98 13 00 00 	jmp    *0x1398(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ac0:	8b 43 04             	mov    0x4(%ebx),%eax
     ac3:	89 04 24             	mov    %eax,(%esp)
     ac6:	e8 d5 ff ff ff       	call   aa0 <nulterminate>
    nulterminate(lcmd->right);
     acb:	8b 43 08             	mov    0x8(%ebx),%eax
     ace:	89 04 24             	mov    %eax,(%esp)
     ad1:	e8 ca ff ff ff       	call   aa0 <nulterminate>
    break;
     ad6:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ad8:	83 c4 14             	add    $0x14,%esp
     adb:	5b                   	pop    %ebx
     adc:	5d                   	pop    %ebp
     add:	c3                   	ret    
     ade:	66 90                	xchg   %ax,%ax
    for(i=0; ecmd->argv[i]; i++)
     ae0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     ae3:	89 d8                	mov    %ebx,%eax
     ae5:	85 c9                	test   %ecx,%ecx
     ae7:	74 17                	je     b00 <nulterminate+0x60>
     ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
     af0:	8b 50 2c             	mov    0x2c(%eax),%edx
     af3:	83 c0 04             	add    $0x4,%eax
     af6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     af9:	8b 50 04             	mov    0x4(%eax),%edx
     afc:	85 d2                	test   %edx,%edx
     afe:	75 f0                	jne    af0 <nulterminate+0x50>
}
     b00:	83 c4 14             	add    $0x14,%esp
  switch(cmd->type){
     b03:	89 d8                	mov    %ebx,%eax
}
     b05:	5b                   	pop    %ebx
     b06:	5d                   	pop    %ebp
     b07:	c3                   	ret    
    nulterminate(bcmd->cmd);
     b08:	8b 43 04             	mov    0x4(%ebx),%eax
     b0b:	89 04 24             	mov    %eax,(%esp)
     b0e:	e8 8d ff ff ff       	call   aa0 <nulterminate>
}
     b13:	83 c4 14             	add    $0x14,%esp
    break;
     b16:	89 d8                	mov    %ebx,%eax
}
     b18:	5b                   	pop    %ebx
     b19:	5d                   	pop    %ebp
     b1a:	c3                   	ret    
     b1b:	90                   	nop
     b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(rcmd->cmd);
     b20:	8b 43 04             	mov    0x4(%ebx),%eax
     b23:	89 04 24             	mov    %eax,(%esp)
     b26:	e8 75 ff ff ff       	call   aa0 <nulterminate>
    *rcmd->efile = 0;
     b2b:	8b 43 0c             	mov    0xc(%ebx),%eax
     b2e:	c6 00 00             	movb   $0x0,(%eax)
}
     b31:	83 c4 14             	add    $0x14,%esp
    break;
     b34:	89 d8                	mov    %ebx,%eax
}
     b36:	5b                   	pop    %ebx
     b37:	5d                   	pop    %ebp
     b38:	c3                   	ret    
     b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return 0;
     b40:	31 c0                	xor    %eax,%eax
     b42:	eb 94                	jmp    ad8 <nulterminate+0x38>
     b44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b50 <parsecmd>:
{
     b50:	55                   	push   %ebp
     b51:	89 e5                	mov    %esp,%ebp
     b53:	56                   	push   %esi
     b54:	53                   	push   %ebx
     b55:	83 ec 10             	sub    $0x10,%esp
  es = s + strlen(s);
     b58:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b5b:	89 1c 24             	mov    %ebx,(%esp)
     b5e:	e8 ed 00 00 00       	call   c50 <strlen>
     b63:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b65:	8d 45 08             	lea    0x8(%ebp),%eax
     b68:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     b6c:	89 04 24             	mov    %eax,(%esp)
     b6f:	e8 ac fd ff ff       	call   920 <parseline>
  peek(&s, es, "");
     b74:	c7 44 24 08 e6 12 00 	movl   $0x12e6,0x8(%esp)
     b7b:	00 
     b7c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  cmd = parseline(&s, es);
     b80:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b82:	8d 45 08             	lea    0x8(%ebp),%eax
     b85:	89 04 24             	mov    %eax,(%esp)
     b88:	e8 b3 fa ff ff       	call   640 <peek>
  if(s != es){
     b8d:	8b 45 08             	mov    0x8(%ebp),%eax
     b90:	39 d8                	cmp    %ebx,%eax
     b92:	75 11                	jne    ba5 <parsecmd+0x55>
  nulterminate(cmd);
     b94:	89 34 24             	mov    %esi,(%esp)
     b97:	e8 04 ff ff ff       	call   aa0 <nulterminate>
}
     b9c:	83 c4 10             	add    $0x10,%esp
     b9f:	89 f0                	mov    %esi,%eax
     ba1:	5b                   	pop    %ebx
     ba2:	5e                   	pop    %esi
     ba3:	5d                   	pop    %ebp
     ba4:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     ba5:	89 44 24 08          	mov    %eax,0x8(%esp)
     ba9:	c7 44 24 04 5a 13 00 	movl   $0x135a,0x4(%esp)
     bb0:	00 
     bb1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     bb8:	e8 a3 03 00 00       	call   f60 <printf>
    panic("syntax");
     bbd:	c7 04 24 1e 13 00 00 	movl   $0x131e,(%esp)
     bc4:	e8 97 f5 ff ff       	call   160 <panic>
     bc9:	66 90                	xchg   %ax,%ax
     bcb:	66 90                	xchg   %ax,%ax
     bcd:	66 90                	xchg   %ax,%ax
     bcf:	90                   	nop

00000bd0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	8b 45 08             	mov    0x8(%ebp),%eax
     bd6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     bd9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     bda:	89 c2                	mov    %eax,%edx
     bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     be0:	83 c1 01             	add    $0x1,%ecx
     be3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     be7:	83 c2 01             	add    $0x1,%edx
     bea:	84 db                	test   %bl,%bl
     bec:	88 5a ff             	mov    %bl,-0x1(%edx)
     bef:	75 ef                	jne    be0 <strcpy+0x10>
    ;
  return os;
}
     bf1:	5b                   	pop    %ebx
     bf2:	5d                   	pop    %ebp
     bf3:	c3                   	ret    
     bf4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     bfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000c00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	8b 55 08             	mov    0x8(%ebp),%edx
     c06:	53                   	push   %ebx
     c07:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     c0a:	0f b6 02             	movzbl (%edx),%eax
     c0d:	84 c0                	test   %al,%al
     c0f:	74 2d                	je     c3e <strcmp+0x3e>
     c11:	0f b6 19             	movzbl (%ecx),%ebx
     c14:	38 d8                	cmp    %bl,%al
     c16:	74 0e                	je     c26 <strcmp+0x26>
     c18:	eb 2b                	jmp    c45 <strcmp+0x45>
     c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c20:	38 c8                	cmp    %cl,%al
     c22:	75 15                	jne    c39 <strcmp+0x39>
    p++, q++;
     c24:	89 d9                	mov    %ebx,%ecx
     c26:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     c29:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     c2c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     c2f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
     c33:	84 c0                	test   %al,%al
     c35:	75 e9                	jne    c20 <strcmp+0x20>
     c37:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     c39:	29 c8                	sub    %ecx,%eax
}
     c3b:	5b                   	pop    %ebx
     c3c:	5d                   	pop    %ebp
     c3d:	c3                   	ret    
     c3e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
     c41:	31 c0                	xor    %eax,%eax
     c43:	eb f4                	jmp    c39 <strcmp+0x39>
     c45:	0f b6 cb             	movzbl %bl,%ecx
     c48:	eb ef                	jmp    c39 <strcmp+0x39>
     c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c50 <strlen>:

uint
strlen(const char *s)
{
     c50:	55                   	push   %ebp
     c51:	89 e5                	mov    %esp,%ebp
     c53:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     c56:	80 39 00             	cmpb   $0x0,(%ecx)
     c59:	74 12                	je     c6d <strlen+0x1d>
     c5b:	31 d2                	xor    %edx,%edx
     c5d:	8d 76 00             	lea    0x0(%esi),%esi
     c60:	83 c2 01             	add    $0x1,%edx
     c63:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     c67:	89 d0                	mov    %edx,%eax
     c69:	75 f5                	jne    c60 <strlen+0x10>
    ;
  return n;
}
     c6b:	5d                   	pop    %ebp
     c6c:	c3                   	ret    
  for(n = 0; s[n]; n++)
     c6d:	31 c0                	xor    %eax,%eax
}
     c6f:	5d                   	pop    %ebp
     c70:	c3                   	ret    
     c71:	eb 0d                	jmp    c80 <memset>
     c73:	90                   	nop
     c74:	90                   	nop
     c75:	90                   	nop
     c76:	90                   	nop
     c77:	90                   	nop
     c78:	90                   	nop
     c79:	90                   	nop
     c7a:	90                   	nop
     c7b:	90                   	nop
     c7c:	90                   	nop
     c7d:	90                   	nop
     c7e:	90                   	nop
     c7f:	90                   	nop

00000c80 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	8b 55 08             	mov    0x8(%ebp),%edx
     c86:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c87:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c8a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c8d:	89 d7                	mov    %edx,%edi
     c8f:	fc                   	cld    
     c90:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     c92:	89 d0                	mov    %edx,%eax
     c94:	5f                   	pop    %edi
     c95:	5d                   	pop    %ebp
     c96:	c3                   	ret    
     c97:	89 f6                	mov    %esi,%esi
     c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ca0 <strchr>:

char*
strchr(const char *s, char c)
{
     ca0:	55                   	push   %ebp
     ca1:	89 e5                	mov    %esp,%ebp
     ca3:	8b 45 08             	mov    0x8(%ebp),%eax
     ca6:	53                   	push   %ebx
     ca7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
     caa:	0f b6 18             	movzbl (%eax),%ebx
     cad:	84 db                	test   %bl,%bl
     caf:	74 1d                	je     cce <strchr+0x2e>
    if(*s == c)
     cb1:	38 d3                	cmp    %dl,%bl
     cb3:	89 d1                	mov    %edx,%ecx
     cb5:	75 0d                	jne    cc4 <strchr+0x24>
     cb7:	eb 17                	jmp    cd0 <strchr+0x30>
     cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cc0:	38 ca                	cmp    %cl,%dl
     cc2:	74 0c                	je     cd0 <strchr+0x30>
  for(; *s; s++)
     cc4:	83 c0 01             	add    $0x1,%eax
     cc7:	0f b6 10             	movzbl (%eax),%edx
     cca:	84 d2                	test   %dl,%dl
     ccc:	75 f2                	jne    cc0 <strchr+0x20>
      return (char*)s;
  return 0;
     cce:	31 c0                	xor    %eax,%eax
}
     cd0:	5b                   	pop    %ebx
     cd1:	5d                   	pop    %ebp
     cd2:	c3                   	ret    
     cd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ce0 <gets>:

char*
gets(char *buf, int max)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	57                   	push   %edi
     ce4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ce5:	31 f6                	xor    %esi,%esi
{
     ce7:	53                   	push   %ebx
     ce8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
     ceb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
     cee:	eb 31                	jmp    d21 <gets+0x41>
    cc = read(0, &c, 1);
     cf0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     cf7:	00 
     cf8:	89 7c 24 04          	mov    %edi,0x4(%esp)
     cfc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d03:	e8 02 01 00 00       	call   e0a <read>
    if(cc < 1)
     d08:	85 c0                	test   %eax,%eax
     d0a:	7e 1d                	jle    d29 <gets+0x49>
      break;
    buf[i++] = c;
     d0c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
     d10:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
     d12:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
     d15:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
     d17:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     d1b:	74 0c                	je     d29 <gets+0x49>
     d1d:	3c 0a                	cmp    $0xa,%al
     d1f:	74 08                	je     d29 <gets+0x49>
  for(i=0; i+1 < max; ){
     d21:	8d 5e 01             	lea    0x1(%esi),%ebx
     d24:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d27:	7c c7                	jl     cf0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     d29:	8b 45 08             	mov    0x8(%ebp),%eax
     d2c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     d30:	83 c4 2c             	add    $0x2c,%esp
     d33:	5b                   	pop    %ebx
     d34:	5e                   	pop    %esi
     d35:	5f                   	pop    %edi
     d36:	5d                   	pop    %ebp
     d37:	c3                   	ret    
     d38:	90                   	nop
     d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d40 <stat>:

int
stat(const char *n, struct stat *st)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	56                   	push   %esi
     d44:	53                   	push   %ebx
     d45:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d48:	8b 45 08             	mov    0x8(%ebp),%eax
     d4b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     d52:	00 
     d53:	89 04 24             	mov    %eax,(%esp)
     d56:	e8 d7 00 00 00       	call   e32 <open>
  if(fd < 0)
     d5b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
     d5d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     d5f:	78 27                	js     d88 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     d61:	8b 45 0c             	mov    0xc(%ebp),%eax
     d64:	89 1c 24             	mov    %ebx,(%esp)
     d67:	89 44 24 04          	mov    %eax,0x4(%esp)
     d6b:	e8 da 00 00 00       	call   e4a <fstat>
  close(fd);
     d70:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d73:	89 c6                	mov    %eax,%esi
  close(fd);
     d75:	e8 a0 00 00 00       	call   e1a <close>
  return r;
     d7a:	89 f0                	mov    %esi,%eax
}
     d7c:	83 c4 10             	add    $0x10,%esp
     d7f:	5b                   	pop    %ebx
     d80:	5e                   	pop    %esi
     d81:	5d                   	pop    %ebp
     d82:	c3                   	ret    
     d83:	90                   	nop
     d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     d88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     d8d:	eb ed                	jmp    d7c <stat+0x3c>
     d8f:	90                   	nop

00000d90 <atoi>:

int
atoi(const char *s)
{
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d96:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d97:	0f be 11             	movsbl (%ecx),%edx
     d9a:	8d 42 d0             	lea    -0x30(%edx),%eax
     d9d:	3c 09                	cmp    $0x9,%al
  n = 0;
     d9f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     da4:	77 17                	ja     dbd <atoi+0x2d>
     da6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     da8:	83 c1 01             	add    $0x1,%ecx
     dab:	8d 04 80             	lea    (%eax,%eax,4),%eax
     dae:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     db2:	0f be 11             	movsbl (%ecx),%edx
     db5:	8d 5a d0             	lea    -0x30(%edx),%ebx
     db8:	80 fb 09             	cmp    $0x9,%bl
     dbb:	76 eb                	jbe    da8 <atoi+0x18>
  return n;
}
     dbd:	5b                   	pop    %ebx
     dbe:	5d                   	pop    %ebp
     dbf:	c3                   	ret    

00000dc0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     dc0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     dc1:	31 d2                	xor    %edx,%edx
{
     dc3:	89 e5                	mov    %esp,%ebp
     dc5:	56                   	push   %esi
     dc6:	8b 45 08             	mov    0x8(%ebp),%eax
     dc9:	53                   	push   %ebx
     dca:	8b 5d 10             	mov    0x10(%ebp),%ebx
     dcd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
     dd0:	85 db                	test   %ebx,%ebx
     dd2:	7e 12                	jle    de6 <memmove+0x26>
     dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     dd8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     ddc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     ddf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
     de2:	39 da                	cmp    %ebx,%edx
     de4:	75 f2                	jne    dd8 <memmove+0x18>
  return vdst;
}
     de6:	5b                   	pop    %ebx
     de7:	5e                   	pop    %esi
     de8:	5d                   	pop    %ebp
     de9:	c3                   	ret    

00000dea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     dea:	b8 01 00 00 00       	mov    $0x1,%eax
     def:	cd 40                	int    $0x40
     df1:	c3                   	ret    

00000df2 <exit>:
SYSCALL(exit)
     df2:	b8 02 00 00 00       	mov    $0x2,%eax
     df7:	cd 40                	int    $0x40
     df9:	c3                   	ret    

00000dfa <wait>:
SYSCALL(wait)
     dfa:	b8 03 00 00 00       	mov    $0x3,%eax
     dff:	cd 40                	int    $0x40
     e01:	c3                   	ret    

00000e02 <pipe>:
SYSCALL(pipe)
     e02:	b8 04 00 00 00       	mov    $0x4,%eax
     e07:	cd 40                	int    $0x40
     e09:	c3                   	ret    

00000e0a <read>:
SYSCALL(read)
     e0a:	b8 05 00 00 00       	mov    $0x5,%eax
     e0f:	cd 40                	int    $0x40
     e11:	c3                   	ret    

00000e12 <write>:
SYSCALL(write)
     e12:	b8 10 00 00 00       	mov    $0x10,%eax
     e17:	cd 40                	int    $0x40
     e19:	c3                   	ret    

00000e1a <close>:
SYSCALL(close)
     e1a:	b8 15 00 00 00       	mov    $0x15,%eax
     e1f:	cd 40                	int    $0x40
     e21:	c3                   	ret    

00000e22 <kill>:
SYSCALL(kill)
     e22:	b8 06 00 00 00       	mov    $0x6,%eax
     e27:	cd 40                	int    $0x40
     e29:	c3                   	ret    

00000e2a <exec>:
SYSCALL(exec)
     e2a:	b8 07 00 00 00       	mov    $0x7,%eax
     e2f:	cd 40                	int    $0x40
     e31:	c3                   	ret    

00000e32 <open>:
SYSCALL(open)
     e32:	b8 0f 00 00 00       	mov    $0xf,%eax
     e37:	cd 40                	int    $0x40
     e39:	c3                   	ret    

00000e3a <mknod>:
SYSCALL(mknod)
     e3a:	b8 11 00 00 00       	mov    $0x11,%eax
     e3f:	cd 40                	int    $0x40
     e41:	c3                   	ret    

00000e42 <unlink>:
SYSCALL(unlink)
     e42:	b8 12 00 00 00       	mov    $0x12,%eax
     e47:	cd 40                	int    $0x40
     e49:	c3                   	ret    

00000e4a <fstat>:
SYSCALL(fstat)
     e4a:	b8 08 00 00 00       	mov    $0x8,%eax
     e4f:	cd 40                	int    $0x40
     e51:	c3                   	ret    

00000e52 <link>:
SYSCALL(link)
     e52:	b8 13 00 00 00       	mov    $0x13,%eax
     e57:	cd 40                	int    $0x40
     e59:	c3                   	ret    

00000e5a <mkdir>:
SYSCALL(mkdir)
     e5a:	b8 14 00 00 00       	mov    $0x14,%eax
     e5f:	cd 40                	int    $0x40
     e61:	c3                   	ret    

00000e62 <chdir>:
SYSCALL(chdir)
     e62:	b8 09 00 00 00       	mov    $0x9,%eax
     e67:	cd 40                	int    $0x40
     e69:	c3                   	ret    

00000e6a <dup>:
SYSCALL(dup)
     e6a:	b8 0a 00 00 00       	mov    $0xa,%eax
     e6f:	cd 40                	int    $0x40
     e71:	c3                   	ret    

00000e72 <getpid>:
SYSCALL(getpid)
     e72:	b8 0b 00 00 00       	mov    $0xb,%eax
     e77:	cd 40                	int    $0x40
     e79:	c3                   	ret    

00000e7a <sbrk>:
SYSCALL(sbrk)
     e7a:	b8 0c 00 00 00       	mov    $0xc,%eax
     e7f:	cd 40                	int    $0x40
     e81:	c3                   	ret    

00000e82 <sleep>:
SYSCALL(sleep)
     e82:	b8 0d 00 00 00       	mov    $0xd,%eax
     e87:	cd 40                	int    $0x40
     e89:	c3                   	ret    

00000e8a <uptime>:
SYSCALL(uptime)
     e8a:	b8 0e 00 00 00       	mov    $0xe,%eax
     e8f:	cd 40                	int    $0x40
     e91:	c3                   	ret    

00000e92 <exitUDef>:
SYSCALL(exitUDef)
     e92:	b8 16 00 00 00       	mov    $0x16,%eax
     e97:	cd 40                	int    $0x40
     e99:	c3                   	ret    

00000e9a <waitpid>:
SYSCALL(waitpid)
     e9a:	b8 17 00 00 00       	mov    $0x17,%eax
     e9f:	cd 40                	int    $0x40
     ea1:	c3                   	ret    

00000ea2 <setPriority>:
SYSCALL(setPriority)
     ea2:	b8 18 00 00 00       	mov    $0x18,%eax
     ea7:	cd 40                	int    $0x40
     ea9:	c3                   	ret    

00000eaa <getPriority>:
SYSCALL(getPriority)
     eaa:	b8 19 00 00 00       	mov    $0x19,%eax
     eaf:	cd 40                	int    $0x40
     eb1:	c3                   	ret    
     eb2:	66 90                	xchg   %ax,%ax
     eb4:	66 90                	xchg   %ax,%ax
     eb6:	66 90                	xchg   %ax,%ax
     eb8:	66 90                	xchg   %ax,%ax
     eba:	66 90                	xchg   %ax,%ax
     ebc:	66 90                	xchg   %ax,%ax
     ebe:	66 90                	xchg   %ax,%ax

00000ec0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     ec0:	55                   	push   %ebp
     ec1:	89 e5                	mov    %esp,%ebp
     ec3:	57                   	push   %edi
     ec4:	56                   	push   %esi
     ec5:	89 c6                	mov    %eax,%esi
     ec7:	53                   	push   %ebx
     ec8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     ecb:	8b 5d 08             	mov    0x8(%ebp),%ebx
     ece:	85 db                	test   %ebx,%ebx
     ed0:	74 09                	je     edb <printint+0x1b>
     ed2:	89 d0                	mov    %edx,%eax
     ed4:	c1 e8 1f             	shr    $0x1f,%eax
     ed7:	84 c0                	test   %al,%al
     ed9:	75 75                	jne    f50 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     edb:	89 d0                	mov    %edx,%eax
  neg = 0;
     edd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     ee4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
     ee7:	31 ff                	xor    %edi,%edi
     ee9:	89 ce                	mov    %ecx,%esi
     eeb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     eee:	eb 02                	jmp    ef2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
     ef0:	89 cf                	mov    %ecx,%edi
     ef2:	31 d2                	xor    %edx,%edx
     ef4:	f7 f6                	div    %esi
     ef6:	8d 4f 01             	lea    0x1(%edi),%ecx
     ef9:	0f b6 92 b7 13 00 00 	movzbl 0x13b7(%edx),%edx
  }while((x /= base) != 0);
     f00:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
     f02:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     f05:	75 e9                	jne    ef0 <printint+0x30>
  if(neg)
     f07:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
     f0a:	89 c8                	mov    %ecx,%eax
     f0c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
     f0f:	85 d2                	test   %edx,%edx
     f11:	74 08                	je     f1b <printint+0x5b>
    buf[i++] = '-';
     f13:	8d 4f 02             	lea    0x2(%edi),%ecx
     f16:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
     f1b:	8d 79 ff             	lea    -0x1(%ecx),%edi
     f1e:	66 90                	xchg   %ax,%ax
     f20:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
     f25:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
     f28:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f2f:	00 
     f30:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     f34:	89 34 24             	mov    %esi,(%esp)
     f37:	88 45 d7             	mov    %al,-0x29(%ebp)
     f3a:	e8 d3 fe ff ff       	call   e12 <write>
  while(--i >= 0)
     f3f:	83 ff ff             	cmp    $0xffffffff,%edi
     f42:	75 dc                	jne    f20 <printint+0x60>
    putc(fd, buf[i]);
}
     f44:	83 c4 4c             	add    $0x4c,%esp
     f47:	5b                   	pop    %ebx
     f48:	5e                   	pop    %esi
     f49:	5f                   	pop    %edi
     f4a:	5d                   	pop    %ebp
     f4b:	c3                   	ret    
     f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
     f50:	89 d0                	mov    %edx,%eax
     f52:	f7 d8                	neg    %eax
    neg = 1;
     f54:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
     f5b:	eb 87                	jmp    ee4 <printint+0x24>
     f5d:	8d 76 00             	lea    0x0(%esi),%esi

00000f60 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     f60:	55                   	push   %ebp
     f61:	89 e5                	mov    %esp,%ebp
     f63:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     f64:	31 ff                	xor    %edi,%edi
{
     f66:	56                   	push   %esi
     f67:	53                   	push   %ebx
     f68:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f6b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
     f6e:	8d 45 10             	lea    0x10(%ebp),%eax
{
     f71:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
     f74:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
     f77:	0f b6 13             	movzbl (%ebx),%edx
     f7a:	83 c3 01             	add    $0x1,%ebx
     f7d:	84 d2                	test   %dl,%dl
     f7f:	75 39                	jne    fba <printf+0x5a>
     f81:	e9 c2 00 00 00       	jmp    1048 <printf+0xe8>
     f86:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     f88:	83 fa 25             	cmp    $0x25,%edx
     f8b:	0f 84 bf 00 00 00    	je     1050 <printf+0xf0>
  write(fd, &c, 1);
     f91:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     f94:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f9b:	00 
     f9c:	89 44 24 04          	mov    %eax,0x4(%esp)
     fa0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
     fa3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
     fa6:	e8 67 fe ff ff       	call   e12 <write>
     fab:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
     fae:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
     fb2:	84 d2                	test   %dl,%dl
     fb4:	0f 84 8e 00 00 00    	je     1048 <printf+0xe8>
    if(state == 0){
     fba:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
     fbc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
     fbf:	74 c7                	je     f88 <printf+0x28>
      }
    } else if(state == '%'){
     fc1:	83 ff 25             	cmp    $0x25,%edi
     fc4:	75 e5                	jne    fab <printf+0x4b>
      if(c == 'd'){
     fc6:	83 fa 64             	cmp    $0x64,%edx
     fc9:	0f 84 31 01 00 00    	je     1100 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     fcf:	25 f7 00 00 00       	and    $0xf7,%eax
     fd4:	83 f8 70             	cmp    $0x70,%eax
     fd7:	0f 84 83 00 00 00    	je     1060 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     fdd:	83 fa 73             	cmp    $0x73,%edx
     fe0:	0f 84 a2 00 00 00    	je     1088 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     fe6:	83 fa 63             	cmp    $0x63,%edx
     fe9:	0f 84 35 01 00 00    	je     1124 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     fef:	83 fa 25             	cmp    $0x25,%edx
     ff2:	0f 84 e0 00 00 00    	je     10d8 <printf+0x178>
  write(fd, &c, 1);
     ff8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     ffb:	83 c3 01             	add    $0x1,%ebx
     ffe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1005:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1006:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1008:	89 44 24 04          	mov    %eax,0x4(%esp)
    100c:	89 34 24             	mov    %esi,(%esp)
    100f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1012:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1016:	e8 f7 fd ff ff       	call   e12 <write>
        putc(fd, c);
    101b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    101e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1021:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1028:	00 
    1029:	89 44 24 04          	mov    %eax,0x4(%esp)
    102d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    1030:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    1033:	e8 da fd ff ff       	call   e12 <write>
  for(i = 0; fmt[i]; i++){
    1038:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    103c:	84 d2                	test   %dl,%dl
    103e:	0f 85 76 ff ff ff    	jne    fba <printf+0x5a>
    1044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    1048:	83 c4 3c             	add    $0x3c,%esp
    104b:	5b                   	pop    %ebx
    104c:	5e                   	pop    %esi
    104d:	5f                   	pop    %edi
    104e:	5d                   	pop    %ebp
    104f:	c3                   	ret    
        state = '%';
    1050:	bf 25 00 00 00       	mov    $0x25,%edi
    1055:	e9 51 ff ff ff       	jmp    fab <printf+0x4b>
    105a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1060:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1063:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    1068:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    106a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1071:	8b 10                	mov    (%eax),%edx
    1073:	89 f0                	mov    %esi,%eax
    1075:	e8 46 fe ff ff       	call   ec0 <printint>
        ap++;
    107a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    107e:	e9 28 ff ff ff       	jmp    fab <printf+0x4b>
    1083:	90                   	nop
    1084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1088:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    108b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    108f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    1091:	b8 b0 13 00 00       	mov    $0x13b0,%eax
    1096:	85 ff                	test   %edi,%edi
    1098:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    109b:	0f b6 07             	movzbl (%edi),%eax
    109e:	84 c0                	test   %al,%al
    10a0:	74 2a                	je     10cc <printf+0x16c>
    10a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10a8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    10ab:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    10ae:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    10b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    10b8:	00 
    10b9:	89 44 24 04          	mov    %eax,0x4(%esp)
    10bd:	89 34 24             	mov    %esi,(%esp)
    10c0:	e8 4d fd ff ff       	call   e12 <write>
        while(*s != 0){
    10c5:	0f b6 07             	movzbl (%edi),%eax
    10c8:	84 c0                	test   %al,%al
    10ca:	75 dc                	jne    10a8 <printf+0x148>
      state = 0;
    10cc:	31 ff                	xor    %edi,%edi
    10ce:	e9 d8 fe ff ff       	jmp    fab <printf+0x4b>
    10d3:	90                   	nop
    10d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    10d8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    10db:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    10dd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    10e4:	00 
    10e5:	89 44 24 04          	mov    %eax,0x4(%esp)
    10e9:	89 34 24             	mov    %esi,(%esp)
    10ec:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    10f0:	e8 1d fd ff ff       	call   e12 <write>
    10f5:	e9 b1 fe ff ff       	jmp    fab <printf+0x4b>
    10fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1100:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1103:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    1108:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    110b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1112:	8b 10                	mov    (%eax),%edx
    1114:	89 f0                	mov    %esi,%eax
    1116:	e8 a5 fd ff ff       	call   ec0 <printint>
        ap++;
    111b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    111f:	e9 87 fe ff ff       	jmp    fab <printf+0x4b>
        putc(fd, *ap);
    1124:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    1127:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    1129:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    112b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1132:	00 
    1133:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    1136:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    1139:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    113c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1140:	e8 cd fc ff ff       	call   e12 <write>
        ap++;
    1145:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1149:	e9 5d fe ff ff       	jmp    fab <printf+0x4b>
    114e:	66 90                	xchg   %ax,%ax

00001150 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1150:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1151:	a1 c4 19 00 00       	mov    0x19c4,%eax
{
    1156:	89 e5                	mov    %esp,%ebp
    1158:	57                   	push   %edi
    1159:	56                   	push   %esi
    115a:	53                   	push   %ebx
    115b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    115e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1160:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1163:	39 d0                	cmp    %edx,%eax
    1165:	72 11                	jb     1178 <free+0x28>
    1167:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1168:	39 c8                	cmp    %ecx,%eax
    116a:	72 04                	jb     1170 <free+0x20>
    116c:	39 ca                	cmp    %ecx,%edx
    116e:	72 10                	jb     1180 <free+0x30>
    1170:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1172:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1174:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1176:	73 f0                	jae    1168 <free+0x18>
    1178:	39 ca                	cmp    %ecx,%edx
    117a:	72 04                	jb     1180 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    117c:	39 c8                	cmp    %ecx,%eax
    117e:	72 f0                	jb     1170 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1180:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1183:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1186:	39 cf                	cmp    %ecx,%edi
    1188:	74 1e                	je     11a8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    118a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    118d:	8b 48 04             	mov    0x4(%eax),%ecx
    1190:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1193:	39 f2                	cmp    %esi,%edx
    1195:	74 28                	je     11bf <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1197:	89 10                	mov    %edx,(%eax)
  freep = p;
    1199:	a3 c4 19 00 00       	mov    %eax,0x19c4
}
    119e:	5b                   	pop    %ebx
    119f:	5e                   	pop    %esi
    11a0:	5f                   	pop    %edi
    11a1:	5d                   	pop    %ebp
    11a2:	c3                   	ret    
    11a3:	90                   	nop
    11a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    11a8:	03 71 04             	add    0x4(%ecx),%esi
    11ab:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    11ae:	8b 08                	mov    (%eax),%ecx
    11b0:	8b 09                	mov    (%ecx),%ecx
    11b2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    11b5:	8b 48 04             	mov    0x4(%eax),%ecx
    11b8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    11bb:	39 f2                	cmp    %esi,%edx
    11bd:	75 d8                	jne    1197 <free+0x47>
    p->s.size += bp->s.size;
    11bf:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    11c2:	a3 c4 19 00 00       	mov    %eax,0x19c4
    p->s.size += bp->s.size;
    11c7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    11ca:	8b 53 f8             	mov    -0x8(%ebx),%edx
    11cd:	89 10                	mov    %edx,(%eax)
}
    11cf:	5b                   	pop    %ebx
    11d0:	5e                   	pop    %esi
    11d1:	5f                   	pop    %edi
    11d2:	5d                   	pop    %ebp
    11d3:	c3                   	ret    
    11d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	57                   	push   %edi
    11e4:	56                   	push   %esi
    11e5:	53                   	push   %ebx
    11e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    11e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    11ec:	8b 1d c4 19 00 00    	mov    0x19c4,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    11f2:	8d 48 07             	lea    0x7(%eax),%ecx
    11f5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    11f8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    11fa:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    11fd:	0f 84 9b 00 00 00    	je     129e <malloc+0xbe>
    1203:	8b 13                	mov    (%ebx),%edx
    1205:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1208:	39 fe                	cmp    %edi,%esi
    120a:	76 64                	jbe    1270 <malloc+0x90>
    120c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    1213:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1218:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    121b:	eb 0e                	jmp    122b <malloc+0x4b>
    121d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1220:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1222:	8b 78 04             	mov    0x4(%eax),%edi
    1225:	39 fe                	cmp    %edi,%esi
    1227:	76 4f                	jbe    1278 <malloc+0x98>
    1229:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    122b:	3b 15 c4 19 00 00    	cmp    0x19c4,%edx
    1231:	75 ed                	jne    1220 <malloc+0x40>
  if(nu < 4096)
    1233:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1236:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    123c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1241:	0f 43 fe             	cmovae %esi,%edi
    1244:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    1247:	89 04 24             	mov    %eax,(%esp)
    124a:	e8 2b fc ff ff       	call   e7a <sbrk>
  if(p == (char*)-1)
    124f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1252:	74 18                	je     126c <malloc+0x8c>
  hp->s.size = nu;
    1254:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1257:	83 c0 08             	add    $0x8,%eax
    125a:	89 04 24             	mov    %eax,(%esp)
    125d:	e8 ee fe ff ff       	call   1150 <free>
  return freep;
    1262:	8b 15 c4 19 00 00    	mov    0x19c4,%edx
      if((p = morecore(nunits)) == 0)
    1268:	85 d2                	test   %edx,%edx
    126a:	75 b4                	jne    1220 <malloc+0x40>
        return 0;
    126c:	31 c0                	xor    %eax,%eax
    126e:	eb 20                	jmp    1290 <malloc+0xb0>
    if(p->s.size >= nunits){
    1270:	89 d0                	mov    %edx,%eax
    1272:	89 da                	mov    %ebx,%edx
    1274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1278:	39 fe                	cmp    %edi,%esi
    127a:	74 1c                	je     1298 <malloc+0xb8>
        p->s.size -= nunits;
    127c:	29 f7                	sub    %esi,%edi
    127e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1281:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1284:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1287:	89 15 c4 19 00 00    	mov    %edx,0x19c4
      return (void*)(p + 1);
    128d:	83 c0 08             	add    $0x8,%eax
  }
}
    1290:	83 c4 1c             	add    $0x1c,%esp
    1293:	5b                   	pop    %ebx
    1294:	5e                   	pop    %esi
    1295:	5f                   	pop    %edi
    1296:	5d                   	pop    %ebp
    1297:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1298:	8b 08                	mov    (%eax),%ecx
    129a:	89 0a                	mov    %ecx,(%edx)
    129c:	eb e9                	jmp    1287 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    129e:	c7 05 c4 19 00 00 c8 	movl   $0x19c8,0x19c4
    12a5:	19 00 00 
    base.s.size = 0;
    12a8:	ba c8 19 00 00       	mov    $0x19c8,%edx
    base.s.ptr = freep = prevp = &base;
    12ad:	c7 05 c8 19 00 00 c8 	movl   $0x19c8,0x19c8
    12b4:	19 00 00 
    base.s.size = 0;
    12b7:	c7 05 cc 19 00 00 00 	movl   $0x0,0x19cc
    12be:	00 00 00 
    12c1:	e9 46 ff ff ff       	jmp    120c <malloc+0x2c>

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D8225EBE1
	for <lists+samba-technical@lfdr.de>; Sun,  6 Sep 2020 03:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=4wfYIiHgfraG1aswzL56FIde0k9ttDnvl6JRxHBdG3M=; b=wLHGTqyDOLVDnfDL9cYPVl2UK2
	OoamOs9YzDdl4d84HSprzRqL/upqm1pse8FAN+3TbvU9MpPcJTw5avIG6uf6J2JK5HRm3mldLFoyJ
	l9kbnM1cv7/S5cYiiX8ouOXtsDk1jyTQIp/LUZdP3aNDtISOUGkhcof3ROrlV+Ah0auufKs0bYAY0
	TeoF2MJofMQdD3uZmPYFDhl1f3T0yBYZb5kTr8d5lEmYinvHtJXZaqG1hH3Dl8+8OuTqgFiSON8tL
	KwDYl2dRbz62h+jSPqOfs51+SVbiJleScV0gA38BCPscGuYYOg2jGoLK1GvfsdtedD7vk763MEmYj
	FRkH0/pA==;
Received: from localhost ([::1]:56418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kEj4b-004HgI-B2; Sun, 06 Sep 2020 01:02:25 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:34853) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kEj4Q-004HgA-1C
 for samba-technical@lists.samba.org; Sun, 06 Sep 2020 01:02:22 +0000
Received: by mail-lf1-x143.google.com with SMTP id w11so5768965lfn.2
 for <samba-technical@lists.samba.org>; Sat, 05 Sep 2020 18:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:user-agent:mime-version
 :content-disposition;
 bh=4wfYIiHgfraG1aswzL56FIde0k9ttDnvl6JRxHBdG3M=;
 b=Y001ZNsjAG9hQWX2v/nBcRbllTMatQsHOCULfbJrYawemnDXt6BWIHPqYH/IbRl1iI
 cF05cPN1Rh/EYsCyLjLyIQ2P7aaXeDPnQZfSt+65h5ThdeeaWYGmvHLkhJGSg2MTg7J5
 HM1V7seFk2f2P5+AfXyAqW6lQ/gLDKH7xfk589yt46xAYphTUUiPHnXKHifEO4RwzVsV
 +hfTnF7KAVF/YQ0ou6BldUjd7Rv1aBODo8Rvggx0l/n3IphsKgZkns2B/6HBW2V0+D5E
 R8o2fCNzaKcHuaSF2z7AHFdvUjRSB3N8zcWWHlqAu4IOKqW4djrsS8cVga/IXCRPUwNb
 w2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:user-agent
 :mime-version:content-disposition;
 bh=4wfYIiHgfraG1aswzL56FIde0k9ttDnvl6JRxHBdG3M=;
 b=neYUrGZe3THVNyEejZmfgb4OozBsONywGgXzwrAFi8YauYE1LPdgBKPq7N+YCr9lhX
 BErE7N1qbYEE8hDJo4f/4iTvt8NbsqriOejBgxnUO18jDSmdgoCZQZf3rtZDmdKasqx3
 JKYHwLzFZMKtL9dfpVjckzPI/hJjspmUxjsMO9OpE5j600Tu2ldUDKiWEzCdIVE0wN8h
 hPO/Wi3AKeOcc0UW30BgkPCztGLlKUNcn1SNhZRsQ2cCUEfF/QnpEbSgo4BKjQ0TywVO
 UyJS5+m0IsCieBn9LQLmia1HQnFD6sLXSZY3rdqnRn4g9MvhNroLYMUwRovXxAhif/tg
 daww==
X-Gm-Message-State: AOAM532tKZakkbCiGow1v/56jHDP621SYVKSoQCs7HdNf1SSlQrSyg+j
 HPa9Qhi0BrSNJQPFFm4gR3Y4Or5Bsec=
X-Google-Smtp-Source: ABdhPJy4PNWW5Ff7RQvBrFru5v1HFjYnccefaip9Ku3V4NgWxt2+FWJJt/TTDlUUNwYBrcDbld0yVA==
X-Received: by 2002:ac2:546a:: with SMTP id e10mr7073780lfn.100.1599354132213; 
 Sat, 05 Sep 2020 18:02:12 -0700 (PDT)
Received: from tarta.nabijaczleweli.xyz ([139.28.40.42])
 by smtp.gmail.com with ESMTPSA id t13sm3045269ljc.70.2020.09.05.18.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 18:02:10 -0700 (PDT)
Date: Sun, 6 Sep 2020 03:02:08 +0200
To: samba-technical@lists.samba.org
Subject: Signature 8 bytes too late in SMB_COM_READ_ANDX response with
 vers=1.0?
Message-ID: <20200906004219.i32vvhgmoak663ik++@nabtop.nabijaczleweli.xyz>
User-Agent: NeoMutt/20200814
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="febfgth2coeele2j"
Content-Disposition: inline
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: =?utf-8?b?0L3QsNCxIHZpYSBzYW1iYS10ZWNobmljYWw=?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--febfgth2coeele2j
Content-Type: multipart/mixed; boundary="xta6vuywnarozrzx"
Content-Disposition: inline


--xta6vuywnarozrzx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This can be reproduced with Samba 4.9.5 and 4.12.5 from Debian
(and the 4.12.6 relnotes don't mention anything about this);
paired with Linux 4.19.132-1 and 5.7.17-1 (also from Debian);
patches are against 5.7.17-1 but also apply to Linus' tree.

When mounting a share with vers=3D1.0, Linux starts spewing
  CIFS VFS: SMB signature verification returned error =3D -13
in the console.

I've tracked this down to fs/cifs/cifsencrypt.c,
and ended up with the following test diff:
-- >8 --
diff --git a/fs/cifs/cifsencrypt.c b/fs/cifs/cifsencrypt.c
index 9daa256f69d4..8a4b1230456c 100644
--- a/fs/cifs/cifsencrypt.c
+++ b/fs/cifs/cifsencrypt.c
@@ -249,14 +249,15 @@ int cifs_verify_signature(struct smb_rqst *rqst,
 	rc =3D cifs_calc_signature(rqst, server, what_we_think_sig_should_be);
 	mutex_unlock(&server->srv_mutex);

 	if (rc)
 		return rc;

-/*	cifs_dump_mem("what we think it should be: ",
-		      what_we_think_sig_should_be, 16); */
+	cifs_dump_mem("what we think it should be: ", what_we_think_sig_should_be=
, 16);
+	cifs_dump_mem("what we got               : ", server_response_sig, 16);
+	cifs_dbg(VFS, "command 0x%x\n", cifs_pdu->Command);

 	if (memcmp(server_response_sig, what_we_think_sig_should_be, 8))
 		return -EACCES;
 	else
 		return 0;

-- >8 --

Which gave me a lot of commands for which these match,
and one for which it never does:
  00000000: 64f2afd0 dde0c5bb 75ef0a94 80709bd2  ...d.......u..p.
  00000000: 7e2b6743 d6e41c45 64f2afd0 dde0c5bb  Cg+~E......d....
  CIFS VFS: command 0x2e
  CIFS VFS: SMB signature verification returned error =3D -13
  00000000: c98b9132 30252349 39449157 ffc57562  2...I#%0W.D9bu..
  00000000: 3438112b cb8cbaff c98b9132 30252349  +.84....2...I#%0
  CIFS VFS: command 0x2e
  CIFS VFS: SMB signature verification returned error =3D -13
  00000000: acf8acda 8fc2b185 6721020b 8f572a61  ..........!ga*W.
  00000000: a38ab6b3 abb39b3d acf8acda 8fc2b185  ....=3D...........
  CIFS VFS: command 0x2e
  CIFS VFS: SMB signature verification returned error =3D -13
More logs attached (+dump doesn't log command, +cmd only on error,
 +all is as above; suboptimal, I know, but it's what I've got).

Note how the signatures match what Linux expected,
but are offset by 8 bytes in each case.

[MS-CIFS] seems to indicate that 0x2e is SMB_COM_READ_ANDX,
hence the subject.

Tracing the calls, it looks as if the header generation for this command
always ends up in setup_readX_header() in source3/smbd/reply.c,
but I know bugger-all about the Samba code-base or the protocol
in general, so I may be barking up the wrong tree entirely.

Best,
=D0=BD=D0=B0=D0=B1

Please keep me in CC, as I'm not subscribed.

--xta6vuywnarozrzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=journal+dump
Content-Transfer-Encoding: quoted-printable

-- Logs begin at Tue 2020-04-21 03:43:27 CEST, end at Sat 2020-09-05 01:38:=
32 CEST. --
Sep 05 01:35:33 szarotka sudo[9067]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/apt install libjudyd=
ebian1
Sep 05 01:35:33 szarotka sudo[9067]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 01:35:38 szarotka sudo[9067]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 01:35:43 szarotka sudo[9113]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/apt-mark auto libjud=
ydebian1
Sep 05 01:35:43 szarotka sudo[9113]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 01:35:44 szarotka sudo[9113]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 01:35:50 szarotka systemd[1]: netdata.service: Scheduled restart job=
, restart counter is at 750.
Sep 05 01:35:50 szarotka systemd[1]: Stopped Real time performance monitori=
ng.
Sep 05 01:35:50 szarotka systemd[1]: Starting Real time performance monitor=
ing...
Sep 05 01:35:50 szarotka systemd[1]: Started Real time performance monitori=
ng.
Sep 05 01:35:50 szarotka netdata[9126]: CONFIG: cannot load cloud config '/=
var/lib/netdata/cloud.d/cloud.conf'. Running with internal defaults.
Sep 05 01:35:50 szarotka netdata[9126]: 2020-09-05 01:35:50: netdata INFO  =
: MAIN : CONFIG: cannot load cloud config '/var/lib/netdata/cloud.d/cloud.c=
onf'. Running with internal defaults.
Sep 05 01:35:50 szarotka netdata[9126]: SIGNAL: Not enabling reaper
Sep 05 01:35:50 szarotka netdata[9126]: 2020-09-05 01:35:50: netdata INFO  =
: MAIN : SIGNAL: Not enabling reaper
Sep 05 01:35:53 szarotka ebpf.plugin[9243]: Does not have a configuration f=
ile inside `/etc/netdata/ebpf.conf. It will try to load stock file.
Sep 05 01:35:53 szarotka ebpf.plugin[9243]: PROCFILE: Cannot open file '/et=
c/netdata/apps_groups.conf'
Sep 05 01:35:53 szarotka ebpf.plugin[9243]: Cannot read process groups conf=
iguration file '/etc/netdata/apps_groups.conf'. Will try '/usr/lib/netdata/=
conf.d/apps_groups.conf'
Sep 05 01:35:54 szarotka kernel: 00000000: fb7ca063 cfc3ca01 2ac2340e 7cb81=
13c  c.|......4.*<..|
Sep 05 01:35:54 szarotka kernel: 00000000: fb7ca063 cfc3ca01 fb7ca063 cfc3c=
a01  c.|.....c.|.....
Sep 05 01:35:54 szarotka kernel: 00000000: 99dcb519 01862441 d4430ac2 1dfdc=
6bb  ....A$....C.....
Sep 05 01:35:54 szarotka kernel: 00000000: 99dcb519 01862441 99dcb519 01862=
441  ....A$......A$..
Sep 05 01:35:55 szarotka kernel: 00000000: ef2002c2 0ca04069 2f15641e 22e83=
767  .. .i@...d./g7."
Sep 05 01:35:55 szarotka kernel: 00000000: ef2002c2 0ca04069 ef2002c2 0ca04=
069  .. .i@.... .i@..
Sep 05 01:35:56 szarotka kernel: 00000000: 2450d871 753467e7 d98eb12a 99d24=
393  q.P$.g4u*....C..
Sep 05 01:35:56 szarotka kernel: 00000000: 2450d871 753467e7 2450d871 75346=
7e7  q.P$.g4uq.P$.g4u
Sep 05 01:35:57 szarotka kernel: 00000000: f2b69cf9 7953d732 ce025859 a6599=
ff0  ....2.SyYX....Y.
Sep 05 01:35:57 szarotka kernel: 00000000: f2b69cf9 7953d732 f2b69cf9 7953d=
732  ....2.Sy....2.Sy
Sep 05 01:35:58 szarotka kernel: 00000000: 78074f6f 2cbfb7c4 75ed3873 b32c9=
470  oO.x...,s8.up.,.
Sep 05 01:35:58 szarotka kernel: 00000000: 78074f6f 2cbfb7c4 78074f6f 2cbfb=
7c4  oO.x...,oO.x...,
Sep 05 01:35:59 szarotka kernel: 00000000: 2fa96f79 eb7e5ade f1b846cd 0b8b0=
195  yo./.Z~..F......
Sep 05 01:35:59 szarotka kernel: 00000000: 2fa96f79 eb7e5ade 2fa96f79 eb7e5=
ade  yo./.Z~.yo./.Z~.
Sep 05 01:36:00 szarotka kernel: 00000000: ce80bf19 3322e100 e5a9252d 50d0e=
8b9  ......"3-%.....P
Sep 05 01:36:00 szarotka kernel: 00000000: ce80bf19 3322e100 ce80bf19 3322e=
100  ......"3......"3
Sep 05 01:36:01 szarotka kernel: 00000000: 291eafb5 f02d5d92 85b83b6f 5b872=
dfc  ...).]-.o;...-.[
Sep 05 01:36:01 szarotka kernel: 00000000: 291eafb5 f02d5d92 291eafb5 f02d5=
d92  ...).]-....).]-.
Sep 05 01:36:02 szarotka kernel: 00000000: 217cdc2c 49d28f2f 2db416f4 4d7f2=
d3d  ,.|!/..I...-=3D-.M
Sep 05 01:36:02 szarotka kernel: 00000000: 217cdc2c 49d28f2f 217cdc2c 49d28=
f2f  ,.|!/..I,.|!/..I
Sep 05 01:36:03 szarotka kernel: 00000000: eb63d4c8 852f0618 17abf313 93b8f=
13f  ..c.../.....?...
Sep 05 01:36:03 szarotka kernel: 00000000: eb63d4c8 852f0618 eb63d4c8 852f0=
618  ..c.../...c.../.
Sep 05 01:36:04 szarotka ebpf.plugin[9497]: Does not have a configuration f=
ile inside `/etc/netdata/ebpf.conf. It will try to load stock file.
Sep 05 01:36:04 szarotka ebpf.plugin[9497]: PROCFILE: Cannot open file '/et=
c/netdata/apps_groups.conf'
Sep 05 01:36:04 szarotka ebpf.plugin[9497]: Cannot read process groups conf=
iguration file '/etc/netdata/apps_groups.conf'. Will try '/usr/lib/netdata/=
conf.d/apps_groups.conf'
Sep 05 01:36:04 szarotka kernel: 00000000: c02a448a 2f1ec57c a3812016 5db0b=
17e  .D*.|../. ..~..]
Sep 05 01:36:04 szarotka kernel: 00000000: c02a448a 2f1ec57c c02a448a 2f1ec=
57c  .D*.|../.D*.|../
Sep 05 01:36:05 szarotka kernel: 00000000: 366bb3fa 0b99c9bb f97fb0da d957e=
6d9  ..k6..........W.
Sep 05 01:36:05 szarotka kernel: 00000000: 366bb3fa 0b99c9bb 366bb3fa 0b99c=
9bb  ..k6......k6....
Sep 05 01:36:06 szarotka kernel: 00000000: 1d295234 5bec0df0 bcac1c9f 5345a=
8ce  4R)....[......ES
Sep 05 01:36:06 szarotka kernel: 00000000: 1d295234 5bec0df0 1d295234 5bec0=
df0  4R)....[4R)....[
Sep 05 01:36:07 szarotka kernel: 00000000: bd4acd8c c0f298c0 e41d158d f9b6e=
ed8  ..J.............
Sep 05 01:36:07 szarotka kernel: 00000000: bd4acd8c c0f298c0 bd4acd8c c0f29=
8c0  ..J.......J.....
Sep 05 01:36:08 szarotka kernel: 00000000: 260f2407 99d9955b a9dd6060 93243=
047  .$.&[...``..G0$.
Sep 05 01:36:08 szarotka kernel: 00000000: 260f2407 99d9955b 260f2407 99d99=
55b  .$.&[....$.&[...
Sep 05 01:36:09 szarotka kernel: 00000000: e0b6e592 a20c5bdc a19a7eda aef59=
fdf  .....[...~......
Sep 05 01:36:09 szarotka kernel: 00000000: e0b6e592 a20c5bdc e0b6e592 a20c5=
bdc  .....[.......[..
Sep 05 01:36:10 szarotka kernel: 00000000: 206fabdf c5fa6318 aa436f7c 53058=
051  ..o .c..|oC.Q..S
Sep 05 01:36:10 szarotka kernel: 00000000: 206fabdf c5fa6318 206fabdf c5fa6=
318  ..o .c....o .c..
Sep 05 01:36:11 szarotka kernel: 00000000: 408f46f5 865473bf dd187df5 11081=
cc7  .F.@.sT..}......
Sep 05 01:36:11 szarotka kernel: 00000000: 408f46f5 865473bf 408f46f5 86547=
3bf  .F.@.sT..F.@.sT.
Sep 05 01:36:12 szarotka kernel: 00000000: 2278c1ac 142446b3 fbb0989d 89049=
be4  ..x".F$.........
Sep 05 01:36:12 szarotka kernel: 00000000: 2278c1ac 142446b3 2278c1ac 14244=
6b3  ..x".F$...x".F$.
Sep 05 01:36:13 szarotka kernel: 00000000: 8d941a25 ad904c6a 83a0efc1 45dfd=
864  %...jL......d..E
Sep 05 01:36:13 szarotka kernel: 00000000: 8d941a25 ad904c6a 8d941a25 ad904=
c6a  %...jL..%...jL..
Sep 05 01:36:14 szarotka kernel: 00000000: 9e28c489 8fba6f9f ed0610f5 abd53=
b2f  ..(..o....../;..
Sep 05 01:36:14 szarotka kernel: 00000000: 9e28c489 8fba6f9f 9e28c489 8fba6=
f9f  ..(..o....(..o..
Sep 05 01:36:14 szarotka ebpf.plugin[9535]: Does not have a configuration f=
ile inside `/etc/netdata/ebpf.conf. It will try to load stock file.
Sep 05 01:36:14 szarotka ebpf.plugin[9535]: PROCFILE: Cannot open file '/et=
c/netdata/apps_groups.conf'
Sep 05 01:36:14 szarotka ebpf.plugin[9535]: Cannot read process groups conf=
iguration file '/etc/netdata/apps_groups.conf'. Will try '/usr/lib/netdata/=
conf.d/apps_groups.conf'
Sep 05 01:36:15 szarotka kernel: 00000000: 58ea12c4 97cba392 9faba747 6ff6c=
f48  ...X....G...H..o
Sep 05 01:36:15 szarotka kernel: 00000000: 58ea12c4 97cba392 58ea12c4 97cba=
392  ...X.......X....
Sep 05 01:36:16 szarotka kernel: 00000000: fcfce02a f11fa228 ad802741 99631=
172  *...(...A'..r.c.
Sep 05 01:36:16 szarotka kernel: 00000000: fcfce02a f11fa228 fcfce02a f11fa=
228  *...(...*...(...
Sep 05 01:36:17 szarotka kernel: 00000000: ee996e25 c16f2ee7 55081268 f167b=
91a  %n....o.h..U..g.
Sep 05 01:36:17 szarotka kernel: 00000000: ee996e25 c16f2ee7 ee996e25 c16f2=
ee7  %n....o.%n....o.
Sep 05 01:36:18 szarotka kernel: 00000000: c5b450ae b78312f3 fec3e162 a8e15=
ba7  .P......b....[..
Sep 05 01:36:18 szarotka kernel: 00000000: c5b450ae b78312f3 c5b450ae b7831=
2f3  .P.......P......
Sep 05 01:36:19 szarotka kernel: 00000000: ecd57355 785f00e6 cbed4db3 a665c=
9f1  Us...._x.M....e.
Sep 05 01:36:19 szarotka kernel: 00000000: ecd57355 785f00e6 ecd57355 785f0=
0e6  Us...._xUs...._x
Sep 05 01:36:20 szarotka kernel: 00000000: f7f431dc f5cafa41 563e1764 7633e=
19c  .1..A...d.>V..3v
Sep 05 01:36:20 szarotka kernel: 00000000: f7f431dc f5cafa41 f7f431dc f5caf=
a41  .1..A....1..A...
Sep 05 01:36:21 szarotka kernel: 00000000: 7328dda5 236a72af 493f3e14 d25d7=
633  ..(s.rj#.>?I3v].
Sep 05 01:36:21 szarotka kernel: 00000000: 7328dda5 236a72af 7328dda5 236a7=
2af  ..(s.rj#..(s.rj#
Sep 05 01:36:22 szarotka kernel: 00000000: 0a63cdd3 9f94886a 6c4036a0 ac025=
459  ..c.j....6@lYT..
Sep 05 01:36:22 szarotka kernel: 00000000: 0a63cdd3 9f94886a 0a63cdd3 9f948=
86a  ..c.j.....c.j...
Sep 05 01:36:23 szarotka kernel: 00000000: 65714ffb 57bf9f81 e81ffba2 396c7=
529  .Oqe...W....)ul9
Sep 05 01:36:23 szarotka kernel: 00000000: 65714ffb 57bf9f81 65714ffb 57bf9=
f81  .Oqe...W.Oqe...W
Sep 05 01:36:24 szarotka kernel: 00000000: be87f422 df8f1825 8c83e8b1 64f77=
bb6  "...%........{.d
Sep 05 01:36:24 szarotka kernel: 00000000: be87f422 df8f1825 be87f422 df8f1=
825  "...%..."...%...
Sep 05 01:36:24 szarotka ebpf.plugin[9570]: Does not have a configuration f=
ile inside `/etc/netdata/ebpf.conf. It will try to load stock file.
Sep 05 01:36:24 szarotka ebpf.plugin[9570]: PROCFILE: Cannot open file '/et=
c/netdata/apps_groups.conf'
Sep 05 01:36:24 szarotka ebpf.plugin[9570]: Cannot read process groups conf=
iguration file '/etc/netdata/apps_groups.conf'. Will try '/usr/lib/netdata/=
conf.d/apps_groups.conf'
Sep 05 01:36:25 szarotka kernel: 00000000: 015a951f d641fa2e 0b5f05a1 6748b=
774  ..Z...A..._.t.Hg
Sep 05 01:36:25 szarotka kernel: 00000000: 015a951f d641fa2e 015a951f d641f=
a2e  ..Z...A...Z...A.
Sep 05 01:36:25 szarotka sudo[9577]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/systemctl stop netda=
ta
Sep 05 01:36:25 szarotka sudo[9577]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 01:36:25 szarotka systemd[1]: Stopping Real time performance monitor=
ing...
Sep 05 01:36:26 szarotka systemd[1]: netdata.service: Succeeded.
Sep 05 01:36:26 szarotka systemd[1]: Stopped Real time performance monitori=
ng.
Sep 05 01:36:26 szarotka sudo[9577]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 01:36:44 szarotka kernel: 00000000: f6f6a3e2 3ff3bb3e 80c4c1dd 67fd8=
25f  ....>..?...._..g
Sep 05 01:36:44 szarotka kernel: 00000000: f6f6a3e2 3ff3bb3e f6f6a3e2 3ff3b=
b3e  ....>..?....>..?
Sep 05 01:36:44 szarotka sudo[9591]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/sbin/chroot /tmp/owo/
Sep 05 01:36:44 szarotka sudo[9591]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 01:36:44 szarotka kernel: 00000000: f6f0b52c 711250d0 8256e7a2 98de5=
b68  ,....P.q..V.h[..
Sep 05 01:36:44 szarotka kernel: 00000000: f6f0b52c 711250d0 f6f0b52c 71125=
0d0  ,....P.q,....P.q
Sep 05 01:36:44 szarotka kernel: 00000000: 0d72dfa2 5dd84f5c ee694d1b 99c67=
250  ..r.\O.].Mi.Pr..
Sep 05 01:36:44 szarotka kernel: 00000000: 0d72dfa2 5dd84f5c 0d72dfa2 5dd84=
f5c  ..r.\O.]..r.\O.]
Sep 05 01:36:44 szarotka kernel: 00000000: 493c12bd 737aa252 1ebeb9d4 622a7=
c3e  ..<IR.zs....>|*b
Sep 05 01:36:44 szarotka kernel: 00000000: 493c12bd 737aa252 493c12bd 737aa=
252  ..<IR.zs..<IR.zs
Sep 05 01:36:44 szarotka kernel: 00000000: d998ecb6 1ffe1f6c 951355ce 84823=
71e  ....l....U...7..
Sep 05 01:36:44 szarotka kernel: 00000000: d998ecb6 1ffe1f6c d998ecb6 1ffe1=
f6c  ....l.......l...
Sep 05 01:36:44 szarotka kernel: 00000000: 3a33e90e aba5a263 76552113 96269=
3ff  ..3:c....!Uv..&.
Sep 05 01:36:44 szarotka kernel: 00000000: 3a33e90e aba5a263 3a33e90e aba5a=
263  ..3:c.....3:c...
Sep 05 01:36:44 szarotka kernel: 00000000: c7ae94bd 109f45d8 f7c295dd 53683=
8ad  .....E.......8hS
Sep 05 01:36:44 szarotka kernel: 00000000: c7ae94bd 109f45d8 c7ae94bd 109f4=
5d8  .....E.......E..
Sep 05 01:36:44 szarotka kernel: 00000000: caf0dc53 9dd60704 c6fe432e f31ad=
9c8  S........C......
Sep 05 01:36:44 szarotka kernel: 00000000: 26ac1239 2998b4ab caf0dc53 9dd60=
704  9..&...)S.......
Sep 05 01:36:44 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:44 szarotka kernel: 00000000: 4700c2dd 50a190e2 7e9a2f5f c294a=
77b  ...G...P_/.~{...
Sep 05 01:36:44 szarotka kernel: 00000000: 4700c2dd 50a190e2 4700c2dd 50a19=
0e2  ...G...P...G...P
Sep 05 01:36:44 szarotka kernel: 00000000: f4d4660f 7ca40699 64c99d3c caf73=
9d4  .f.....|<..d.9..
Sep 05 01:36:44 szarotka kernel: 00000000: f4d4660f 7ca40699 f4d4660f 7ca40=
699  .f.....|.f.....|
Sep 05 01:36:44 szarotka kernel: 00000000: f0875989 d15a7f28 425a0db3 b3740=
a4a  .Y..(.Z...ZBJ.t.
Sep 05 01:36:44 szarotka kernel: 00000000: f0875989 d15a7f28 f0875989 d15a7=
f28  .Y..(.Z..Y..(.Z.
Sep 05 01:36:44 szarotka kernel: 00000000: cca31375 1f47e493 af711a55 0c4a5=
5ba  u.....G.U.q..UJ.
Sep 05 01:36:44 szarotka kernel: 00000000: cca31375 1f47e493 cca31375 1f47e=
493  u.....G.u.....G.
Sep 05 01:36:44 szarotka kernel: 00000000: 128587d1 15e0b0ad b12fd776 e4da0=
05a  ........v./.Z...
Sep 05 01:36:44 szarotka kernel: 00000000: 128587d1 15e0b0ad 128587d1 15e0b=
0ad  ................
Sep 05 01:36:44 szarotka kernel: 00000000: b7a50df8 d93253f3 2b4519a0 de3e1=
51a  .....S2...E+..>.
Sep 05 01:36:44 szarotka kernel: 00000000: b7a50df8 d93253f3 b7a50df8 d9325=
3f3  .....S2......S2.
Sep 05 01:36:44 szarotka kernel: 00000000: 4f7c0c24 8788f16f 980213ee f4827=
97a  $.|Oo.......zy..
Sep 05 01:36:44 szarotka kernel: 00000000: 4f7c0c24 8788f16f 4f7c0c24 8788f=
16f  $.|Oo...$.|Oo...
Sep 05 01:36:44 szarotka kernel: 00000000: 387c6b3b 3fc1d96f fba924f3 1bdd0=
ee1  ;k|8o..?.$......
Sep 05 01:36:44 szarotka kernel: 00000000: 387c6b3b 3fc1d96f 387c6b3b 3fc1d=
96f  ;k|8o..?;k|8o..?
Sep 05 01:36:44 szarotka kernel: 00000000: 7bde48ea 2a063d0e b2ed3f65 4b370=
f55  .H.{.=3D.*e?..U.7K
Sep 05 01:36:44 szarotka kernel: 00000000: 7bde48ea 2a063d0e 7bde48ea 2a063=
d0e  .H.{.=3D.*.H.{.=3D.*
Sep 05 01:36:44 szarotka kernel: 00000000: 9dd1289b d57be91b 97e51790 76365=
9aa  .(....{......Y6v
Sep 05 01:36:44 szarotka kernel: 00000000: bf2b6f97 ed1f3b45 9dd1289b d57be=
91b  .o+.E;...(....{.
Sep 05 01:36:44 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:44 szarotka kernel: 00000000: 77146285 04342736 79459d7b 12e29=
db3  .b.w6'4.{.Ey....
Sep 05 01:36:44 szarotka kernel: 00000000: 267c4a0c f43a3e8a 77146285 04342=
736  .J|&.>:..b.w6'4.
Sep 05 01:36:44 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:44 szarotka kernel: 00000000: 26bb0b33 263202b8 99713ef7 2b6bf=
0e7  3..&..2&.>q...k+
Sep 05 01:36:44 szarotka kernel: 00000000: 97a8a029 a2fa2147 26bb0b33 26320=
2b8  )...G!..3..&..2&
Sep 05 01:36:44 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:44 szarotka kernel: 00000000: b5ed380d 49b1ce26 ce2a8014 4242f=
383  .8..&..I..*...BB
Sep 05 01:36:44 szarotka kernel: 00000000: 99a087ad 9cc61592 b5ed380d 49b1c=
e26  .........8..&..I
Sep 05 01:36:44 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:44 szarotka kernel: 00000000: eb2f85f8 6350c615 fc92c3ba 6ecec=
5e6  ../...Pc.......n
Sep 05 01:36:44 szarotka kernel: 00000000: 3e05a6b5 e1279dbe eb2f85f8 6350c=
615  ...>..'.../...Pc
Sep 05 01:36:44 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:44 szarotka kernel: 00000000: 86480880 a1bb046e d0b266bd f189e=
c00  ..H.n....f......
Sep 05 01:36:44 szarotka kernel: 00000000: ebf6029c 0cd879e4 86480880 a1bb0=
46e  .....y....H.n...
Sep 05 01:36:44 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:44 szarotka kernel: 00000000: 9eb98a3b e2b30e0d 67ca8cae 7091b=
381  ;..........g...p
Sep 05 01:36:44 szarotka kernel: 00000000: 9eb98a3b e2b30e0d 9eb98a3b e2b30=
e0d  ;.......;.......
Sep 05 01:36:44 szarotka kernel: 00000000: 60a3a2d8 0ed584c4 ebf81b05 54c77=
740  ...`........@w.T
Sep 05 01:36:44 szarotka kernel: 00000000: 60a3a2d8 0ed584c4 60a3a2d8 0ed58=
4c4  ...`.......`....
Sep 05 01:36:44 szarotka kernel: 00000000: 50b32aa7 752315c0 ac9cf146 2b663=
8ac  .*.P..#uF....8f+
Sep 05 01:36:44 szarotka kernel: 00000000: 50b32aa7 752315c0 50b32aa7 75231=
5c0  .*.P..#u.*.P..#u
Sep 05 01:36:45 szarotka kernel: 00000000: 0d781a0a 5b8765d9 b24c389b 47a17=
e8c  ..x..e.[.8L..~.G
Sep 05 01:36:45 szarotka kernel: 00000000: 1f20b242 4dfb4c66 0d781a0a 5b876=
5d9  B. .fL.M..x..e.[
Sep 05 01:36:45 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:45 szarotka kernel: 00000000: 6d8ec888 62021ad1 ffbefbf4 c914b=
e0b  ...m...b........
Sep 05 01:36:45 szarotka kernel: 00000000: 6d8ec888 62021ad1 6d8ec888 62021=
ad1  ...m...b...m...b
Sep 05 01:36:45 szarotka kernel: 00000000: a44f6f53 2776bf20 045f270f 32b82=
19b  SoO. .v'.'_..!.2
Sep 05 01:36:45 szarotka kernel: 00000000: a44f6f53 2776bf20 a44f6f53 2776b=
f20  SoO. .v'SoO. .v'
Sep 05 01:36:45 szarotka kernel: 00000000: 332ea25d 74a4879c 35613a51 ca7d2=
e7d  ]..3...tQ:a5}.}.
Sep 05 01:36:45 szarotka kernel: 00000000: 86ad62ce f06a5a40 332ea25d 74a48=
79c  .b..@Zj.]..3...t
Sep 05 01:36:45 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:45 szarotka kernel: 00000000: f20d3551 717589ce a96c1799 9faec=
8ff  Q5....uq..l.....
Sep 05 01:36:45 szarotka kernel: 00000000: f20d3551 717589ce f20d3551 71758=
9ce  Q5....uqQ5....uq
Sep 05 01:36:45 szarotka kernel: 00000000: 2ca7b14b 36423cfd 185ce1a7 ce542=
539  K..,.<B6..\.9%T.
Sep 05 01:36:45 szarotka kernel: 00000000: 2ca7b14b 36423cfd 2ca7b14b 36423=
cfd  K..,.<B6K..,.<B6
Sep 05 01:36:45 szarotka kernel: 00000000: 7ae1695c d9a80d4b b2fdbbde 9aff0=
161  \i.zK.......a...
Sep 05 01:36:45 szarotka kernel: 00000000: 7ae1695c d9a80d4b 7ae1695c d9a80=
d4b  \i.zK...\i.zK...
Sep 05 01:36:45 szarotka kernel: 00000000: 8f5aba49 727ca14f 77e47f04 1e4e8=
244  I.Z.O.|r...wD.N.
Sep 05 01:36:45 szarotka kernel: 00000000: 8f5aba49 727ca14f 8f5aba49 727ca=
14f  I.Z.O.|rI.Z.O.|r
Sep 05 01:36:45 szarotka kernel: 00000000: 57c38cc2 62b07ba5 1f1d2631 829f3=
504  ...W.{.b1&...5..
Sep 05 01:36:45 szarotka kernel: 00000000: 57c38cc2 62b07ba5 57c38cc2 62b07=
ba5  ...W.{.b...W.{.b
Sep 05 01:36:45 szarotka kernel: 00000000: 0b0416ac 092562da ea3f097c d1f2c=
284  .....b%.|.?.....
Sep 05 01:36:45 szarotka kernel: 00000000: a402d1e8 c95002f5 0b0416ac 09256=
2da  ......P......b%.
Sep 05 01:36:45 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:36:45 szarotka kernel: 00000000: e4636cb1 a8848aaf 75bcf737 7dff5=
ecf  .lc.....7..u.^.}
Sep 05 01:36:45 szarotka kernel: 00000000: 3554c7e9 35526afe e4636cb1 a8848=
aaf  ..T5.jR5.lc.....
Sep 05 01:36:45 szarotka kernel: 00000000: aef54720 5be01373 89c6e338 a8cf3=
e76   G..s..[8...v>..
Sep 05 01:36:45 szarotka kernel: 00000000: 0857b3c6 e8e4191c aef54720 5be01=
373  ..W..... G..s..[
Sep 05 01:36:45 szarotka kernel: 00000000: 4ce70d49 8b4e4aa7 e77d8e18 c1a00=
bac  I..L.JN...}.....
Sep 05 01:36:45 szarotka kernel: 00000000: 4ce70d49 8b4e4aa7 4ce70d49 8b4e4=
aa7  I..L.JN.I..L.JN.
Sep 05 01:36:45 szarotka kernel: 00000000: ef5a52da d8c7e321 adb18a10 64241=
25c  .RZ.!.......\.$d
Sep 05 01:36:45 szarotka kernel: 00000000: ef5a52da d8c7e321 ef5a52da d8c7e=
321  .RZ.!....RZ.!...
Sep 05 01:36:45 szarotka kernel: 00000000: e9888633 f6f60889 7b34c7e0 3229f=
d5c  3.........4{\.)2
Sep 05 01:36:45 szarotka kernel: 00000000: e9888633 f6f60889 e9888633 f6f60=
889  3.......3.......
Sep 05 01:36:45 szarotka kernel: 00000000: 08050e59 42566199 5fe9d57a 1ad70=
05c  Y....aVBz.._\...
Sep 05 01:36:45 szarotka kernel: 00000000: 08050e59 42566199 08050e59 42566=
199  Y....aVBY....aVB
Sep 05 01:36:45 szarotka kernel: 00000000: 46846c1b 2f9d040b d3a3f71d 0efa2=
2f7  .l.F.../....."..
Sep 05 01:36:45 szarotka kernel: 00000000: 46846c1b 2f9d040b 46846c1b 2f9d0=
40b  .l.F.../.l.F.../
Sep 05 01:36:45 szarotka kernel: 00000000: cadafd74 c7a4adcf d919f750 4b41f=
a56  t.......P...V.AK
Sep 05 01:36:45 szarotka kernel: 00000000: 5905802b 23d99b9e cadafd74 c7a4a=
dcf  +..Y...#t.......
Sep 05 01:36:45 szarotka kernel: 00000000: c1e9e62b 23dba029 33cce563 a82c4=
234  +...)..#c..34B,.
Sep 05 01:36:45 szarotka kernel: 00000000: 4dfd6d3c 8882e1fd c1e9e62b 23dba=
029  <m.M....+...)..#
Sep 05 01:36:45 szarotka kernel: 00000000: 7d50d8b9 16b78ea5 970cd685 7d340=
14c  ..P}........L.4}
Sep 05 01:36:45 szarotka kernel: 00000000: 7d50d8b9 16b78ea5 7d50d8b9 16b78=
ea5  ..P}......P}....
Sep 05 01:36:45 szarotka kernel: 00000000: 656a6b35 2b2e45d4 3414a7f2 6be7b=
c7d  5kje.E.+...4}..k
Sep 05 01:36:45 szarotka kernel: 00000000: 656a6b35 2b2e45d4 656a6b35 2b2e4=
5d4  5kje.E.+5kje.E.+
Sep 05 01:36:45 szarotka kernel: 00000000: 07b446d6 758713f5 11200cbd 6019d=
e14  .F.....u.. ....`
Sep 05 01:36:45 szarotka kernel: 00000000: 07b446d6 758713f5 07b446d6 75871=
3f5  .F.....u.F.....u
Sep 05 01:36:45 szarotka kernel: 00000000: 87d04e07 cb5e6787 088c9401 9bbcc=
985  .N...g^.........
Sep 05 01:36:45 szarotka kernel: 00000000: 87d04e07 cb5e6787 87d04e07 cb5e6=
787  .N...g^..N...g^.
Sep 05 01:36:45 szarotka kernel: 00000000: b3442788 d3555dff a587aa65 4e208=
ac2  .'D..]U.e..... N
Sep 05 01:36:45 szarotka kernel: 00000000: b3442788 d3555dff b3442788 d3555=
dff  .'D..]U..'D..]U.
Sep 05 01:36:45 szarotka kernel: 00000000: 23dad534 9c27a223 56b8e78a 50a65=
3bc  4..##.'....V.S.P
Sep 05 01:36:45 szarotka kernel: 00000000: ffe69fda 4fdb6918 23dad534 9c27a=
223  .....i.O4..##.'.
Sep 05 01:36:45 szarotka kernel: 00000000: a4a78a6b b9697ece 1d502a42 f2ae0=
b1c  k....~i.B*P.....
Sep 05 01:36:45 szarotka kernel: 00000000: 8dcc069e 4cee8f04 a4a78a6b b9697=
ece  .......Lk....~i.
Sep 05 01:36:45 szarotka kernel: 00000000: 7f20623e 853360a1 7f19e265 9559c=
d16  >b ..`3.e.....Y.
Sep 05 01:36:45 szarotka kernel: 00000000: e8bb0f82 d2f33106 7f20623e 85336=
0a1  .....1..>b ..`3.
Sep 05 01:36:45 szarotka kernel: 00000000: c61d9605 7716297a aa817e6d 64e17=
9f4  ....z).wm~...y.d
Sep 05 01:36:45 szarotka kernel: 00000000: 175ccd05 8557d1e2 c61d9605 77162=
97a  ..\...W.....z).w
Sep 05 01:36:45 szarotka kernel: 00000000: 694707f6 a54ecf6e 3fc64c92 f083f=
010  ..Gin.N..L.?....
Sep 05 01:36:45 szarotka kernel: 00000000: f01e7b0d 8e613276 694707f6 a54ec=
f6e  .{..v2a...Gin.N.
Sep 05 01:36:45 szarotka kernel: 00000000: 8e7a4573 38a02a12 ed2f708f 28d0a=
358  sEz..*.8.p/.X..(
Sep 05 01:36:45 szarotka kernel: 00000000: 0e2800cc 2c567226 8e7a4573 38a02=
a12  ..(.&rV,sEz..*.8
Sep 05 01:36:45 szarotka kernel: 00000000: 1f148afe 96253638 2b024a42 29fc0=
055  ....86%.BJ.+U..)
Sep 05 01:36:45 szarotka kernel: 00000000: 0a5f4cfd da7ea60e 1f148afe 96253=
638  .L_...~.....86%.
Sep 05 01:36:45 szarotka kernel: 00000000: 120e7d38 c27031a6 82b36203 8da83=
309  8}...1p..b...3..
Sep 05 01:36:45 szarotka kernel: 00000000: d5cb7d55 c9c3592b 120e7d38 c2703=
1a6  U}..+Y..8}...1p.
Sep 05 01:36:45 szarotka kernel: 00000000: 91153aee ca5303a1 1af99b69 e9e33=
8de  .:....S.i....8..
Sep 05 01:36:45 szarotka kernel: 00000000: 38f8033d e44543fa 91153aee ca530=
3a1  =3D..8.CE..:....S.
Sep 05 01:36:45 szarotka kernel: 00000000: 1c26436b 71a44099 f4ab2368 2360b=
090  kC&..@.qh#....`#
Sep 05 01:36:45 szarotka kernel: 00000000: ec2447e9 36b0d4fe 1c26436b 71a44=
099  .G$....6kC&..@.q
Sep 05 01:36:45 szarotka kernel: 00000000: 5d323a81 cca817c5 1825cf1a 23e61=
b28  .:2]......%.(..#
Sep 05 01:36:45 szarotka kernel: 00000000: e780ad7b f3c561a5 5d323a81 cca81=
7c5  {....a...:2]....
Sep 05 01:36:45 szarotka kernel: 00000000: 782444dc 7c0b8dc4 2789d907 89ad3=
ab3  .D$x...|...'.:..
Sep 05 01:36:45 szarotka kernel: 00000000: a1fe4b4d d291d0c0 782444dc 7c0b8=
dc4  MK.......D$x...|
Sep 05 01:36:45 szarotka kernel: 00000000: 4282383b 14268c21 e99903e3 f47f9=
d9d  ;8.B!.&.........
Sep 05 01:36:45 szarotka kernel: 00000000: d721baf2 b7524c16 4282383b 14268=
c21  ..!..LR.;8.B!.&.
Sep 05 01:36:45 szarotka kernel: 00000000: d578e5a6 9e63e69a d68e255b ea2a4=
922  ..x...c.[%.."I*.
Sep 05 01:36:45 szarotka kernel: 00000000: 0a4325e0 938a6747 d578e5a6 9e63e=
69a  .%C.Gg....x...c.
Sep 05 01:36:45 szarotka kernel: 00000000: c2acc222 9704b56d 07e1c701 a4fda=
3b7  "...m...........
Sep 05 01:36:45 szarotka kernel: 00000000: c60817a8 1aec6642 c2acc222 9704b=
56d  ....Bf.."...m...
Sep 05 01:36:45 szarotka kernel: 00000000: 61427a1c 9aef6b57 3ef91c9c 17bbe=
18a  .zBaWk.....>....
Sep 05 01:36:45 szarotka kernel: 00000000: 19926943 f70e1ed4 61427a1c 9aef6=
b57  Ci.......zBaWk..
Sep 05 01:36:45 szarotka kernel: 00000000: efc2dbb1 7059a044 e0b42c80 aa48a=
943  ....D.Yp.,..C.H.
Sep 05 01:36:45 szarotka kernel: 00000000: 787b5522 36760ef1 efc2dbb1 7059a=
044  "U{x..v6....D.Yp
Sep 05 01:36:45 szarotka kernel: 00000000: 60f57b7a 5af2a132 6fb4a0e1 6b7f7=
afa  z{.`2..Z...o.z.k
Sep 05 01:36:45 szarotka kernel: 00000000: 60f57b7a 5af2a132 60f57b7a 5af2a=
132  z{.`2..Zz{.`2..Z
Sep 05 01:36:45 szarotka kernel: 00000000: 17b59b19 1642cbb2 0a526d9a 353ae=
1b5  ......B..mR...:5
Sep 05 01:36:45 szarotka kernel: 00000000: 958ffa7b 71e30379 17b59b19 1642c=
bb2  {...y..q......B.
Sep 05 01:36:45 szarotka kernel: 00000000: 3bf5caa0 3a0bc059 e54fcf49 205bf=
702  ...;Y..:I.O...[=20
Sep 05 01:36:45 szarotka kernel: 00000000: 7b141856 ba77fce4 3bf5caa0 3a0bc=
059  V..{..w....;Y..:
Sep 05 01:36:45 szarotka kernel: 00000000: 6f691901 7a253b4a d4e09742 a45ab=
d6d  ..ioJ;%zB...m.Z.
Sep 05 01:36:45 szarotka kernel: 00000000: 3f2b9255 ac9dfeee 6f691901 7a253=
b4a  U.+?......ioJ;%z
Sep 05 01:36:45 szarotka kernel: 00000000: 44514bf3 f0e5ca64 b8893fcc 72b5a=
ca0  .KQDd....?.....r
Sep 05 01:36:45 szarotka kernel: 00000000: ffeb4ff5 6fc15b42 44514bf3 f0e5c=
a64  .O..B[.o.KQDd...
Sep 05 01:36:45 szarotka kernel: 00000000: 57f9a829 48ac2779 9851503b 349f6=
1ba  )..Wy'.H;PQ..a.4
Sep 05 01:36:45 szarotka kernel: 00000000: cbccd78d b4a846ec 57f9a829 48ac2=
779  .....F..)..Wy'.H
Sep 05 01:36:45 szarotka kernel: 00000000: 59614e8a 95df8c69 6d34b831 b6453=
016  .NaYi...1.4m.0E.
Sep 05 01:36:45 szarotka kernel: 00000000: 59614e8a 95df8c69 59614e8a 95df8=
c69  .NaYi....NaYi...
Sep 05 01:36:45 szarotka kernel: 00000000: d6d09d9f 4260086c 07fc6d06 4cc34=
237  ....l.`B.m..7B.L
Sep 05 01:36:45 szarotka kernel: 00000000: d6d09d9f 4260086c d6d09d9f 42600=
86c  ....l.`B....l.`B
Sep 05 01:36:45 szarotka kernel: 00000000: 75aea77a 3b3ad9b5 cece5da2 74069=
bdc  z..u..:;.].....t
Sep 05 01:36:45 szarotka kernel: 00000000: 34a7b3d3 874e6ff2 75aea77a 3b3ad=
9b5  ...4.oN.z..u..:;
Sep 05 01:36:45 szarotka kernel: 00000000: 6f64a29b 62147298 6016ce69 ef785=
7a6  ..do.r.bi..`.Wx.
Sep 05 01:36:45 szarotka kernel: 00000000: d9a026b3 23c10b06 6f64a29b 62147=
298  .&.....#..do.r.b
Sep 05 01:36:45 szarotka kernel: 00000000: 45853c82 3d67e305 d78b0fcd 58dda=
2ee  .<.E..g=3D.......X
Sep 05 01:36:45 szarotka kernel: 00000000: ac6d608b b62a9871 45853c82 3d67e=
305  .`m.q.*..<.E..g=3D
Sep 05 01:36:45 szarotka kernel: 00000000: 57678c13 156534f9 78c9ee60 81280=
4d4  ..gW.4e.`..x..(.
Sep 05 01:36:45 szarotka kernel: 00000000: 778afce4 52abd855 57678c13 15653=
4f9  ...wU..R..gW.4e.
Sep 05 01:36:45 szarotka kernel: 00000000: 4e571042 209316ad 92fa40d2 ed4a2=
1a5  B.WN... .@...!J.
Sep 05 01:36:45 szarotka kernel: 00000000: d65ffd7e 65b10e85 4e571042 20931=
6ad  ~._....eB.WN...=20
Sep 05 01:36:45 szarotka kernel: 00000000: 204554eb b3754099 3207f336 1c438=
8ea  .TE .@u.6..2..C.
Sep 05 01:36:45 szarotka kernel: 00000000: d6bce53a a416f264 204554eb b3754=
099  :...d....TE .@u.
Sep 05 01:36:45 szarotka kernel: 00000000: 6b948ec3 f31f1c05 8961f21a ef404=
8ca  ...k......a..H@.
Sep 05 01:36:45 szarotka kernel: 00000000: 6b948ec3 f31f1c05 6b948ec3 f31f1=
c05  ...k.......k....
Sep 05 01:36:45 szarotka kernel: 00000000: 156b25ed 9118ffbf 4796d528 ff94b=
676  .%k.....(..Gv...
Sep 05 01:36:45 szarotka kernel: 00000000: 156b25ed 9118ffbf 156b25ed 9118f=
fbf  .%k......%k.....
Sep 05 01:36:45 szarotka kernel: 00000000: 71df9c9e 5c645e3e 46f75b0f f94fd=
fb1  ...q>^d\.[.F..O.
Sep 05 01:36:45 szarotka kernel: 00000000: 03c436e4 4c7d5d3c 71df9c9e 5c645=
e3e  .6..<]}L...q>^d\
Sep 05 01:36:45 szarotka kernel: 00000000: f3e9f5f8 5e9db562 f4feb8f2 80f3a=
b7a  ....b..^....z...
Sep 05 01:36:45 szarotka kernel: 00000000: f3e9f5f8 5e9db562 f3e9f5f8 5e9db=
562  ....b..^....b..^
Sep 05 01:36:45 szarotka kernel: 00000000: 7dedf48c 4a26ec83 685d9e1b 41f17=
0cd  ...}..&J..]h.p.A
Sep 05 01:36:45 szarotka kernel: 00000000: 7dedf48c 4a26ec83 7dedf48c 4a26e=
c83  ...}..&J...}..&J
Sep 05 01:36:45 szarotka kernel: 00000000: 7139d10f acca30c3 871ea754 86a75=
cd5  ..9q.0..T....\..
Sep 05 01:36:45 szarotka kernel: 00000000: 7139d10f acca30c3 7139d10f acca3=
0c3  ..9q.0....9q.0..
Sep 05 01:36:45 szarotka kernel: 00000000: 4839fddc ae9a2169 29d47fb7 9ff15=
f42  ..9Hi!.....)B_..
Sep 05 01:36:45 szarotka kernel: 00000000: 4839fddc ae9a2169 4839fddc ae9a2=
169  ..9Hi!....9Hi!..
Sep 05 01:36:45 szarotka kernel: 00000000: 87b88f37 1b2067da 50a4e5d4 6d13f=
13c  7....g ....P<..m
Sep 05 01:36:45 szarotka kernel: 00000000: 87b88f37 1b2067da 87b88f37 1b206=
7da  7....g .7....g .
Sep 05 01:36:45 szarotka kernel: 00000000: 5c17a89a b87fd673 955f15c3 f5939=
7d4  ...\s....._.....
Sep 05 01:36:45 szarotka kernel: 00000000: 5c17a89a b87fd673 5c17a89a b87fd=
673  ...\s......\s...
Sep 05 01:36:45 szarotka kernel: 00000000: 3c9af6f2 1184386b 3bbc4bc2 1e77a=
30c  ...<k8...K.;..w.
Sep 05 01:36:45 szarotka kernel: 00000000: 3c9af6f2 1184386b 3c9af6f2 11843=
86b  ...<k8.....<k8..
Sep 05 01:36:45 szarotka kernel: 00000000: 54e48920 ca85d2fb d0831ffd 4a271=
e2f   ..T......../.'J
Sep 05 01:36:45 szarotka kernel: 00000000: 54e48920 ca85d2fb 54e48920 ca85d=
2fb   ..T.... ..T....
Sep 05 01:36:45 szarotka kernel: 00000000: 2aabf2df d23a6a5a 3f348747 1a2d9=
656  ...*Zj:.G.4?V.-.
Sep 05 01:36:45 szarotka kernel: 00000000: 2aabf2df d23a6a5a 2aabf2df d23a6=
a5a  ...*Zj:....*Zj:.
Sep 05 01:36:45 szarotka kernel: 00000000: e99cd8f9 db171801 68035d59 2c22f=
052  ........Y].hR.",
Sep 05 01:36:45 szarotka kernel: 00000000: 52781e95 dc8df82e e99cd8f9 db171=
801  ..xR............
Sep 05 01:36:45 szarotka kernel: 00000000: ff885d6b 3c02f966 ede4b23e ceb6b=
32a  k]..f..<>...*...
Sep 05 01:36:45 szarotka kernel: 00000000: 5eebf72e ebe5980a ff885d6b 3c02f=
966  ...^....k]..f..<
Sep 05 01:36:45 szarotka kernel: 00000000: db85cdb1 b04dbf3d d2d3d70a 752ea=
323  ....=3D.M.....#..u
Sep 05 01:36:45 szarotka kernel: 00000000: 8a5e8aad 71ed1247 db85cdb1 b04db=
f3d  ..^.G..q....=3D.M.
Sep 05 01:36:45 szarotka kernel: 00000000: 464bb499 447fe861 cd71e5d6 d9f10=
51f  ..KFa..D..q.....
Sep 05 01:36:45 szarotka kernel: 00000000: 326a5cdd 2fd91b54 464bb499 447fe=
861  .\j2T../..KFa..D
Sep 05 01:36:45 szarotka kernel: 00000000: 69d4151c ecfb353c 395df66d d820d=
c94  ...i<5..m.]9.. .
Sep 05 01:36:45 szarotka kernel: 00000000: 9978a6e1 0766316a 69d4151c ecfb3=
53c  ..x.j1f....i<5..
Sep 05 01:36:45 szarotka kernel: 00000000: 46cea098 0099b9c4 ff776885 fa55b=
090  ...F.....hw...U.
Sep 05 01:36:45 szarotka kernel: 00000000: 57a1d12f 48ec12f2 46cea098 0099b=
9c4  /..W...H...F....
Sep 05 01:36:45 szarotka kernel: 00000000: 0d3fda02 cd8114f2 56070ee0 3c309=
910  ..?........V..0<
Sep 05 01:36:45 szarotka kernel: 00000000: 4a593057 1003d67d 0d3fda02 cd811=
4f2  W0YJ}.....?.....
Sep 05 01:36:45 szarotka kernel: 00000000: ca9b4c74 dcf1a57a 8ee1d355 030aa=
f7e  tL..z...U...~...
Sep 05 01:36:45 szarotka kernel: 00000000: 4b6a8afd 3699c4bf ca9b4c74 dcf1a=
57a  ..jK...6tL..z...
Sep 05 01:36:45 szarotka kernel: 00000000: 7a4645ea dae09228 f2a49983 90e72=
d1c  .EFz(........-..
Sep 05 01:36:45 szarotka kernel: 00000000: e993dbeb bf7c0965 7a4645ea dae09=
228  ....e.|..EFz(...
Sep 05 01:36:45 szarotka kernel: 00000000: ae6b56a6 eb1751d3 d9e8e73d c307a=
16c  .Vk..Q..=3D...l...
Sep 05 01:36:45 szarotka kernel: 00000000: 0d433835 fa3c6fe9 ae6b56a6 eb175=
1d3  58C..o<..Vk..Q..
Sep 05 01:36:45 szarotka kernel: 00000000: afc9dcda 22d63336 5ceed364 d3036=
7a5  ....63."d..\.g..
Sep 05 01:36:45 szarotka kernel: 00000000: c2368d5c ee876418 afc9dcda 22d63=
336  \.6..d......63."
Sep 05 01:36:45 szarotka kernel: 00000000: de1773f3 05601421 9296c92f 6bfe6=
b5b  .s..!.`./...[k.k
Sep 05 01:36:45 szarotka kernel: 00000000: de1773f3 05601421 de1773f3 05601=
421  .s..!.`..s..!.`.
Sep 05 01:36:45 szarotka kernel: 00000000: 205abd59 0e70487d d8d03168 895f0=
3c6  Y.Z }Hp.h1...._.
Sep 05 01:36:45 szarotka kernel: 00000000: 205abd59 0e70487d 205abd59 0e704=
87d  Y.Z }Hp.Y.Z }Hp.
Sep 05 01:36:45 szarotka kernel: 00000000: 4fd7e505 0cbf9521 2adef23d cde62=
1a1  ...O!...=3D..*.!..
Sep 05 01:36:45 szarotka kernel: 00000000: 4fd7e505 0cbf9521 4fd7e505 0cbf9=
521  ...O!......O!...
Sep 05 01:36:45 szarotka kernel: 00000000: f8fac527 347675ed 4d8f6b27 72925=
704  '....uv4'k.M.W.r
Sep 05 01:36:45 szarotka kernel: 00000000: f8fac527 347675ed f8fac527 34767=
5ed  '....uv4'....uv4
Sep 05 01:36:45 szarotka kernel: 00000000: 70b8ccfe 1e5aa51a ecf6b298 859e2=
2ef  ...p..Z......"..
Sep 05 01:36:45 szarotka kernel: 00000000: 70b8ccfe 1e5aa51a 70b8ccfe 1e5aa=
51a  ...p..Z....p..Z.
Sep 05 01:36:45 szarotka kernel: 00000000: 97647ddd 8305538d a8e2eff5 2dd6b=
e16  .}d..S.........-
Sep 05 01:36:45 szarotka kernel: 00000000: 97647ddd 8305538d 97647ddd 83055=
38d  .}d..S...}d..S..
Sep 05 01:36:45 szarotka kernel: 00000000: e9412bb8 e6083cab 0af177ac a5b4d=
347  .+A..<...w..G...
Sep 05 01:36:45 szarotka kernel: 00000000: e7009389 733f5cd9 e9412bb8 e6083=
cab  .....\?s.+A..<..
Sep 05 01:36:45 szarotka kernel: 00000000: 70d80bbb 17701ed7 85260a67 61d38=
e19  ...p..p.g.&....a
Sep 05 01:36:45 szarotka kernel: 00000000: 70d80bbb 17701ed7 70d80bbb 17701=
ed7  ...p..p....p..p.
Sep 05 01:36:45 szarotka kernel: 00000000: d4be917e 24cee634 4d4d56f5 27167=
ede  ~...4..$.VMM.~.'
Sep 05 01:36:45 szarotka kernel: 00000000: d4be917e 24cee634 d4be917e 24cee=
634  ~...4..$~...4..$
Sep 05 01:36:45 szarotka kernel: 00000000: 9b488606 0eaff492 2435bce2 3154f=
076  ..H.......5$v.T1
Sep 05 01:36:45 szarotka kernel: 00000000: b36103b7 c299d7c5 9b488606 0eaff=
492  ..a.......H.....
Sep 05 01:36:45 szarotka kernel: 00000000: 1aed92ec 01715d13 5cf40171 019bd=
c2a  .....]q.q..\*...
Sep 05 01:36:45 szarotka kernel: 00000000: fe527fea 8b0978df 1aed92ec 01715=
d13  ..R..x.......]q.
Sep 05 01:36:45 szarotka kernel: 00000000: 963561ae 9a7e65db b7247ba8 603bc=
1be  .a5..e~..{$...;`
Sep 05 01:36:45 szarotka kernel: 00000000: 963561ae 9a7e65db 963561ae 9a7e6=
5db  .a5..e~..a5..e~.
Sep 05 01:36:45 szarotka kernel: 00000000: 86a54fa5 946c97ea 3033341f bc210=
85d  .O....l..430].!.
Sep 05 01:36:45 szarotka kernel: 00000000: 86a54fa5 946c97ea 86a54fa5 946c9=
7ea  .O....l..O....l.
Sep 05 01:36:45 szarotka kernel: 00000000: 594e7131 12003330 c5524ab6 67384=
77e  1qNY03...JR.~G8g
Sep 05 01:36:45 szarotka kernel: 00000000: 00240417 09739e1c 594e7131 12003=
330  ..$...s.1qNY03..
Sep 05 01:36:45 szarotka kernel: 00000000: 1e547f29 74816c6f 19072dcf d6601=
8d9  ).T.ol.t.-....`.
Sep 05 01:36:45 szarotka kernel: 00000000: 1e547f29 74816c6f 1e547f29 74816=
c6f  ).T.ol.t).T.ol.t
Sep 05 01:36:45 szarotka kernel: 00000000: b9723cde 31f20d7f 8d3e3e0f 7eff0=
6d3  .<r....1.>>....~
Sep 05 01:36:45 szarotka kernel: 00000000: b9723cde 31f20d7f b9723cde 31f20=
d7f  .<r....1.<r....1
Sep 05 01:36:45 szarotka kernel: 00000000: a3332ad2 880cdd59 c1811fa9 43ac0=
a0d  .*3.Y..........C
Sep 05 01:36:45 szarotka kernel: 00000000: a3332ad2 880cdd59 a3332ad2 880cd=
d59  .*3.Y....*3.Y...
Sep 05 01:36:45 szarotka kernel: 00000000: 4d414b7f fe1f6dfa d2dbbc4a 3d91e=
d58  .KAM.m..J...X..=3D
Sep 05 01:36:45 szarotka kernel: 00000000: 4d414b7f fe1f6dfa 4d414b7f fe1f6=
dfa  .KAM.m...KAM.m..
Sep 05 01:36:45 szarotka kernel: 00000000: cb06f502 cb716989 153482e4 c2e75=
aab  .....iq...4..Z..
Sep 05 01:36:45 szarotka kernel: 00000000: cb06f502 cb716989 cb06f502 cb716=
989  .....iq......iq.
Sep 05 01:36:45 szarotka kernel: 00000000: b5554443 fc0a13dd 0dfdc8ad f6e7b=
92e  CDU.............
Sep 05 01:36:45 szarotka kernel: 00000000: 97c87baf 754cd364 b5554443 fc0a1=
3dd  .{..d.LuCDU.....
Sep 05 01:36:45 szarotka kernel: 00000000: 9a59a642 32bfa57e b092d47e aef1b=
6de  B.Y.~..2~.......
Sep 05 01:36:45 szarotka kernel: 00000000: fc9ebb57 135641cf 9a59a642 32bfa=
57e  W....AV.B.Y.~..2
Sep 05 01:36:45 szarotka kernel: 00000000: 18a9a754 654a8ed4 4a2cad43 6a63c=
a03  T.....JeC.,J..cj
Sep 05 01:36:45 szarotka kernel: 00000000: 4018899d d81e22a0 18a9a754 654a8=
ed4  ...@."..T.....Je
Sep 05 01:36:45 szarotka kernel: 00000000: 32d84865 010ccee6 e359b217 616c7=
a27  eH.2......Y.'zla
Sep 05 01:36:45 szarotka kernel: 00000000: 32d84865 010ccee6 32d84865 010cc=
ee6  eH.2....eH.2....
Sep 05 01:36:45 szarotka kernel: 00000000: 3432a431 54095727 d0f6ba1c 021b4=
890  1.24'W.T.....H..
Sep 05 01:36:45 szarotka kernel: 00000000: 3432a431 54095727 3432a431 54095=
727  1.24'W.T1.24'W.T
Sep 05 01:36:45 szarotka kernel: 00000000: b4d8c2e1 1bea4ddc 9965d9cf ba476=
dc8  .....M....e..mG.
Sep 05 01:36:45 szarotka kernel: 00000000: b4d8c2e1 1bea4ddc b4d8c2e1 1bea4=
ddc  .....M.......M..
Sep 05 01:36:45 szarotka kernel: 00000000: 0ddfe621 9aa42ef6 1a905615 abf6f=
5fd  !........V......
Sep 05 01:36:45 szarotka kernel: 00000000: da723d61 e4a5bb1e 0ddfe621 9aa42=
ef6  a=3Dr.....!.......
Sep 05 01:36:45 szarotka kernel: 00000000: 7aa5e4b4 7c45c6e4 e9a95720 b598c=
3bc  ...z..E| W......
Sep 05 01:36:45 szarotka kernel: 00000000: 3149e664 5aab04eb 7aa5e4b4 7c45c=
6e4  d.I1...Z...z..E|
Sep 05 01:36:45 szarotka kernel: 00000000: ece87d08 c07407e7 92853ae5 10dbb=
b7d  .}....t..:..}...
Sep 05 01:36:45 szarotka kernel: 00000000: 868395ff 89e29c38 ece87d08 c0740=
7e7  ....8....}....t.
Sep 05 01:36:45 szarotka kernel: 00000000: e72f45d3 1d789291 1bd5d8e8 1da8c=
5b7  .E/...x.........
Sep 05 01:36:45 szarotka kernel: 00000000: e72f45d3 1d789291 e72f45d3 1d789=
291  .E/...x..E/...x.
Sep 05 01:36:45 szarotka kernel: 00000000: 62920073 2b5976fa b037740f 94a72=
be7  s..b.vY+.t7..+..
Sep 05 01:36:45 szarotka kernel: 00000000: ae14feef ff12a458 62920073 2b597=
6fa  ....X...s..b.vY+
Sep 05 01:36:45 szarotka kernel: 00000000: 713b27ef c54c215b eadc53e8 a4873=
fc1  .';q[!L..S...?..
Sep 05 01:36:45 szarotka kernel: 00000000: 83d33755 c808c81f 713b27ef c54c2=
15b  U7.......';q[!L.
Sep 05 01:36:45 szarotka kernel: 00000000: 4d843348 567c5921 eb4e5575 d4c88=
bc6  H3.M!Y|VuUN.....
Sep 05 01:36:45 szarotka kernel: 00000000: 16397854 2dd63dc9 4d843348 567c5=
921  Tx9..=3D.-H3.M!Y|V
Sep 05 01:36:45 szarotka kernel: 00000000: c9e49a3b c5ffefe4 e0554ef6 31163=
ab0  ;........NU..:.1
Sep 05 01:36:45 szarotka kernel: 00000000: ece2038f 511e7577 c9e49a3b c5ffe=
fe4  ....wu.Q;.......
Sep 05 01:36:45 szarotka kernel: 00000000: 66f0f487 e976726a 2a78d687 b4042=
468  ...fjrv...x*h$..
Sep 05 01:36:45 szarotka kernel: 00000000: 7aa5b9fe 210d254a 66f0f487 e9767=
26a  ...zJ%.!...fjrv.
Sep 05 01:36:45 szarotka kernel: 00000000: e5b53e21 bb46c538 6def08b7 b14c4=
b87  !>..8.F....m.KL.
Sep 05 01:36:45 szarotka kernel: 00000000: 135cae1a 92ec88d9 e5b53e21 bb46c=
538  ..\.....!>..8.F.
Sep 05 01:36:45 szarotka kernel: 00000000: eafc27be 4aaf2855 a73135c8 8226a=
0af  .'..U(.J.51...&.
Sep 05 01:36:45 szarotka kernel: 00000000: 5d78832b de295469 eafc27be 4aaf2=
855  +.x]iT)..'..U(.J
Sep 05 01:36:45 szarotka kernel: 00000000: f68e1c5c 43d70393 91bd70fd bb518=
4ad  \......C.p....Q.
Sep 05 01:36:45 szarotka kernel: 00000000: 7d8ff594 2e331155 f68e1c5c 43d70=
393  ...}U.3.\......C
Sep 05 01:36:45 szarotka kernel: 00000000: 660c09c9 c7b34320 f1cca04d 26df6=
1a5  ...f C..M....a.&
Sep 05 01:36:45 szarotka kernel: 00000000: 660c09c9 c7b34320 660c09c9 c7b34=
320  ...f C.....f C..
Sep 05 01:36:45 szarotka kernel: 00000000: 89d339e3 bebb766d 796a73d1 f6662=
25f  .9..mv...sjy_"f.
Sep 05 01:36:45 szarotka kernel: 00000000: 89d339e3 bebb766d 89d339e3 bebb7=
66d  .9..mv...9..mv..
Sep 05 01:36:45 szarotka kernel: 00000000: 40c5b21b b47a384c 9d4f9699 665a2=
d13  ...@L8z...O..-Zf
Sep 05 01:36:45 szarotka kernel: 00000000: 40c5b21b b47a384c 40c5b21b b47a3=
84c  ...@L8z....@L8z.
Sep 05 01:36:45 szarotka kernel: 00000000: cb4c39af 6b6337a3 afc64b3c ac8d0=
009  .9L..7ck<K......
Sep 05 01:36:45 szarotka kernel: 00000000: cb4c39af 6b6337a3 cb4c39af 6b633=
7a3  .9L..7ck.9L..7ck
Sep 05 01:36:45 szarotka kernel: 00000000: e7d5ba01 fa356902 2dc2d745 ac956=
709  .....i5.E..-.g..
Sep 05 01:36:45 szarotka kernel: 00000000: e7d5ba01 fa356902 e7d5ba01 fa356=
902  .....i5......i5.
Sep 05 01:36:45 szarotka kernel: 00000000: b52668d0 06b3fe2b 9c1c6b85 5df7a=
705  .h&.+....k.....]
Sep 05 01:36:45 szarotka kernel: 00000000: b52668d0 06b3fe2b b52668d0 06b3f=
e2b  .h&.+....h&.+...
Sep 05 01:36:45 szarotka kernel: 00000000: eb1cdb10 c696542f 20c98ed5 9f76c=
4c6  ..../T..... ..v.
Sep 05 01:36:45 szarotka kernel: 00000000: eb1cdb10 c696542f eb1cdb10 c6965=
42f  ..../T....../T..
Sep 05 01:36:45 szarotka kernel: 00000000: 0451ae60 5f5f24a2 6bd4662e 7bad0=
799  `.Q..$__.f.k...{
Sep 05 01:36:45 szarotka kernel: 00000000: 0451ae60 5f5f24a2 0451ae60 5f5f2=
4a2  `.Q..$__`.Q..$__
Sep 05 01:36:45 szarotka kernel: 00000000: 9ef0cd6b 4f2cbca7 854deae7 d8f98=
e85  k.....,O..M.....
Sep 05 01:36:45 szarotka kernel: 00000000: 9ef0cd6b 4f2cbca7 9ef0cd6b 4f2cb=
ca7  k.....,Ok.....,O
Sep 05 01:36:45 szarotka kernel: 00000000: 3b239cb5 97da1ce3 5ca8c31c 804e5=
a2b  ..#;.......\+ZN.
Sep 05 01:36:45 szarotka kernel: 00000000: 3b239cb5 97da1ce3 3b239cb5 97da1=
ce3  ..#;......#;....
Sep 05 01:36:45 szarotka kernel: 00000000: e232650d 45f47f53 9b5915f2 d8eef=
ac3  .e2.S..E..Y.....
Sep 05 01:36:45 szarotka kernel: 00000000: e232650d 45f47f53 e232650d 45f47=
f53  .e2.S..E.e2.S..E
Sep 05 01:36:45 szarotka kernel: 00000000: 03c60295 759a0965 8f747b86 0f78d=
fb4  ....e..u.{t...x.
Sep 05 01:36:45 szarotka kernel: 00000000: e22c6b4b 54632ef9 03c60295 759a0=
965  Kk,...cT....e..u
Sep 05 01:36:45 szarotka kernel: 00000000: a30e1a15 5d3c4ef5 212443e1 0233e=
59b  .....N<].C$!..3.
Sep 05 01:36:45 szarotka kernel: 00000000: a30e1a15 5d3c4ef5 a30e1a15 5d3c4=
ef5  .....N<].....N<]
Sep 05 01:36:45 szarotka kernel: 00000000: 7bf01093 7c79c0ce c8956380 b25f4=
e2e  ...{..y|.c...N_.
Sep 05 01:36:45 szarotka kernel: 00000000: 7bf01093 7c79c0ce 7bf01093 7c79c=
0ce  ...{..y|...{..y|
Sep 05 01:36:45 szarotka kernel: 00000000: 21f7111d 92d3c6fb 5e1d61a2 7e79f=
619  ...!.....a.^..y~
Sep 05 01:36:45 szarotka kernel: 00000000: 24ed86c1 cb7ffddf 21f7111d 92d3c=
6fb  ...$.......!....
Sep 05 01:36:45 szarotka kernel: 00000000: 8e2979d7 07f0a7de 8fff8030 365f0=
f7c  .y).....0...|._6
Sep 05 01:36:45 szarotka kernel: 00000000: 8e2979d7 07f0a7de 8e2979d7 07f0a=
7de  .y)......y).....
Sep 05 01:36:45 szarotka kernel: 00000000: 1320ce6c 96556f58 618910fc 87dc0=
944  l. .XoU....aD...
Sep 05 01:36:45 szarotka kernel: 00000000: 31a8dee5 dc2014fe 1320ce6c 96556=
f58  ...1.. .l. .XoU.
Sep 05 01:36:45 szarotka kernel: 00000000: 3e0c29c0 69250ff7 67c6182f 71946=
004  .).>..%i/..g.`.q
Sep 05 01:36:45 szarotka kernel: 00000000: 644ad29a bec1dce9 3e0c29c0 69250=
ff7  ..Jd.....).>..%i
Sep 05 01:36:45 szarotka kernel: 00000000: 9f9f1429 b54bab37 55e6372f 65331=
f1c  )...7.K./7.U..3e
Sep 05 01:36:45 szarotka kernel: 00000000: 9f9f1429 b54bab37 9f9f1429 b54ba=
b37  )...7.K.)...7.K.
Sep 05 01:36:45 szarotka kernel: 00000000: c15011fb 9a2d51ce 2526b38b 8a408=
798  ..P..Q-...&%..@.
Sep 05 01:36:45 szarotka kernel: 00000000: c15011fb 9a2d51ce c15011fb 9a2d5=
1ce  ..P..Q-...P..Q-.
Sep 05 01:36:45 szarotka kernel: 00000000: e174348f da391c6a 7738f2e1 affe6=
b31  .4t.j.9...8w1k..
Sep 05 01:36:45 szarotka kernel: 00000000: e174348f da391c6a e174348f da391=
c6a  .4t.j.9..4t.j.9.
Sep 05 01:36:45 szarotka kernel: 00000000: b25d8583 8a147d68 c4c60d31 bd614=
427  ..].h}..1...'Da.
Sep 05 01:36:45 szarotka kernel: 00000000: b25d8583 8a147d68 b25d8583 8a147=
d68  ..].h}....].h}..
Sep 05 01:36:45 szarotka kernel: 00000000: 234a6c4a beec961b 746d3244 99c2d=
915  JlJ#....D2mt....
Sep 05 01:36:45 szarotka kernel: 00000000: 234a6c4a beec961b 234a6c4a beec9=
61b  JlJ#....JlJ#....
Sep 05 01:36:45 szarotka kernel: 00000000: 52fc0261 ef985bb0 a44ac064 66e3f=
989  a..R.[..d.J....f
Sep 05 01:36:45 szarotka kernel: 00000000: c058bdbf 1986ff83 52fc0261 ef985=
bb0  ..X.....a..R.[..
Sep 05 01:36:45 szarotka kernel: 00000000: 9858fc7c cbebe0e5 23ad64a8 4ddc9=
ce5  |.X......d.#...M
Sep 05 01:36:45 szarotka kernel: 00000000: 9858fc7c cbebe0e5 9858fc7c cbebe=
0e5  |.X.....|.X.....
Sep 05 01:36:45 szarotka kernel: 00000000: dc44c5f7 30b8d9b5 b0228cdf 517b5=
7ce  ..D....0.."..W{Q
Sep 05 01:36:45 szarotka kernel: 00000000: dc44c5f7 30b8d9b5 dc44c5f7 30b8d=
9b5  ..D....0..D....0
Sep 05 01:36:45 szarotka kernel: 00000000: b0725981 3161f707 708db132 db2f9=
3d2  .Yr...a12..p../.
Sep 05 01:36:45 szarotka kernel: 00000000: b0725981 3161f707 b0725981 3161f=
707  .Yr...a1.Yr...a1
Sep 05 01:36:45 szarotka kernel: 00000000: 9e722fc5 1a6970a0 551907d5 2eb15=
994  ./r..pi....U.Y..
Sep 05 01:36:45 szarotka kernel: 00000000: 749a731f d0cd4b50 9e722fc5 1a697=
0a0  .s.tPK.../r..pi.
Sep 05 01:36:45 szarotka kernel: 00000000: e9043ee3 c02a3718 3626f6b9 a49ef=
51e  .>...7*...&6....
Sep 05 01:36:45 szarotka kernel: 00000000: e9043ee3 c02a3718 e9043ee3 c02a3=
718  .>...7*..>...7*.
Sep 05 01:36:45 szarotka kernel: 00000000: b34a72cc 046d725f 1333e34d 12ff1=
548  .rJ._rm.M.3.H...
Sep 05 01:36:45 szarotka kernel: 00000000: b34a72cc 046d725f b34a72cc 046d7=
25f  .rJ._rm..rJ._rm.
Sep 05 01:36:45 szarotka kernel: 00000000: 1a08c267 dc3f2f4b d4358a90 33582=
65e  g...K/?...5.^&X3
Sep 05 01:36:45 szarotka kernel: 00000000: 1a08c267 dc3f2f4b 1a08c267 dc3f2=
f4b  g...K/?.g...K/?.
Sep 05 01:36:45 szarotka kernel: 00000000: 06b82036 72f18735 fc5c8278 7b24e=
3ad  6 ..5..rx.\...${
Sep 05 01:36:45 szarotka kernel: 00000000: 06b82036 72f18735 06b82036 72f18=
735  6 ..5..r6 ..5..r
Sep 05 01:36:45 szarotka kernel: 00000000: d7b84b61 28b9d74d e5bac256 64644=
ea3  aK..M..(V....Ndd
Sep 05 01:36:45 szarotka kernel: 00000000: 590d7e2b 618861d2 d7b84b61 28b9d=
74d  +~.Y.a.aaK..M..(
Sep 05 01:36:45 szarotka kernel: 00000000: c8207006 539da190 185cf765 5944d=
001  .p ....Se.\...DY
Sep 05 01:36:45 szarotka kernel: 00000000: c8207006 539da190 c8207006 539da=
190  .p ....S.p ....S
Sep 05 01:36:45 szarotka kernel: 00000000: 5c4f2efe 614f5ea6 278739d0 4ee8c=
66b  ..O\.^Oa.9.'k..N
Sep 05 01:36:45 szarotka kernel: 00000000: d2834030 83a0fa00 5c4f2efe 614f5=
ea6  0@........O\.^Oa
Sep 05 01:36:45 szarotka kernel: 00000000: 32cccbc5 eea91c68 e44be50a d36ab=
11a  ...2h.....K...j.
Sep 05 01:36:45 szarotka kernel: 00000000: 32cccbc5 eea91c68 32cccbc5 eea91=
c68  ...2h......2h...
Sep 05 01:36:45 szarotka kernel: 00000000: 67f1c98b deb2f522 94c3154a 6e284=
134  ...g"...J...4A(n
Sep 05 01:36:45 szarotka kernel: 00000000: d274034d bdaa99dd 67f1c98b deb2f=
522  M.t........g"...
Sep 05 01:36:45 szarotka kernel: 00000000: 7091c4c8 be472c3a 584b4875 ca804=
8bf  ...p:,G.uHKX.H..
Sep 05 01:36:45 szarotka kernel: 00000000: 7091c4c8 be472c3a 7091c4c8 be472=
c3a  ...p:,G....p:,G.
Sep 05 01:36:45 szarotka kernel: 00000000: 7973f22a f1816a3d ed80a9e5 918e5=
84a  *.sy=3Dj......JX..
Sep 05 01:36:45 szarotka kernel: 00000000: 7973f22a f1816a3d 7973f22a f1816=
a3d  *.sy=3Dj..*.sy=3Dj..
Sep 05 01:37:36 szarotka kernel: 00000000: ed397c0c f60a06ff 2025788d b3694=
1af  .|9......x% .Ai.
Sep 05 01:37:36 szarotka kernel: 00000000: ed397c0c f60a06ff ed397c0c f60a0=
6ff  .|9......|9.....
Sep 05 01:37:36 szarotka kernel: 00000000: dc6a9535 ad0c4b0d 4c24ef77 dac24=
0cc  5.j..K..w.$L.@..
Sep 05 01:37:36 szarotka kernel: 00000000: dc6a9535 ad0c4b0d dc6a9535 ad0c4=
b0d  5.j..K..5.j..K..
Sep 05 01:37:36 szarotka kernel: 00000000: 3f513caa c83fe1be e2d837ae 4c983=
5bb  .<Q?..?..7...5.L
Sep 05 01:37:36 szarotka kernel: 00000000: 3f513caa c83fe1be 3f513caa c83fe=
1be  .<Q?..?..<Q?..?.
Sep 05 01:37:36 szarotka kernel: 00000000: 07947753 513fc973 bbf0601c 2b458=
c11  Sw..s.?Q.`....E+
Sep 05 01:37:36 szarotka kernel: 00000000: 07947753 513fc973 07947753 513fc=
973  Sw..s.?QSw..s.?Q
Sep 05 01:37:36 szarotka kernel: 00000000: d7396d45 5756af11 1cfb27bf c82b0=
d87  Em9...VW.'....+.
Sep 05 01:37:36 szarotka kernel: 00000000: d7396d45 5756af11 d7396d45 5756a=
f11  Em9...VWEm9...VW
Sep 05 01:37:36 szarotka kernel: 00000000: 91fe1096 d2b5bcd1 f5a54a22 d3b21=
7e9  ........"J......
Sep 05 01:37:36 szarotka kernel: 00000000: 91fe1096 d2b5bcd1 91fe1096 d2b5b=
cd1  ................
Sep 05 01:37:36 szarotka kernel: 00000000: 2cbbbeb6 13733d60 e125ddcd 050a7=
273  ...,`=3Ds...%.sr..
Sep 05 01:37:36 szarotka kernel: 00000000: 2cbbbeb6 13733d60 2cbbbeb6 13733=
d60  ...,`=3Ds....,`=3Ds.
Sep 05 01:37:36 szarotka kernel: 00000000: fa604513 747530fd cbd6d44e 9b3fa=
5a4  .E`..0utN.....?.
Sep 05 01:37:36 szarotka kernel: 00000000: fa604513 747530fd fa604513 74753=
0fd  .E`..0ut.E`..0ut
Sep 05 01:37:36 szarotka kernel: 00000000: 23139109 d5243523 0cc76fd5 a17db=
182  ...##5$..o....}.
Sep 05 01:37:36 szarotka kernel: 00000000: 23139109 d5243523 23139109 d5243=
523  ...##5$....##5$.
Sep 05 01:37:36 szarotka kernel: 00000000: 4b9fe47d 41bb34a9 d7c3605a bd95f=
4c9  }..K.4.AZ`......
Sep 05 01:37:36 szarotka kernel: 00000000: 4b9fe47d 41bb34a9 4b9fe47d 41bb3=
4a9  }..K.4.A}..K.4.A
Sep 05 01:37:36 szarotka kernel: 00000000: d23b6f1b 056c892a 2f18a33e 2f114=
ec1  .o;.*.l.>../.N./
Sep 05 01:37:36 szarotka kernel: 00000000: d23b6f1b 056c892a d23b6f1b 056c8=
92a  .o;.*.l..o;.*.l.
Sep 05 01:37:36 szarotka kernel: 00000000: ee6e8960 098ab352 e09a1dec 5a4dd=
a7e  `.n.R.......~.MZ
Sep 05 01:37:36 szarotka kernel: 00000000: ee6e8960 098ab352 ee6e8960 098ab=
352  `.n.R...`.n.R...
Sep 05 01:37:36 szarotka kernel: 00000000: ed359cc3 9b7d480f 2add22ac 7134f=
d1b  ..5..H}..".*..4q
Sep 05 01:37:36 szarotka kernel: 00000000: 49e2bdc8 36a8ea01 ed359cc3 9b7d4=
80f  ...I...6..5..H}.
Sep 05 01:37:36 szarotka kernel: cifs_readv_callback: 71 callbacks suppress=
ed
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: dc50e3b9 37b2b60b 1aabf3b2 f2759=
855  ..P....7....U.u.
Sep 05 01:37:36 szarotka kernel: 00000000: dc50e3b9 37b2b60b dc50e3b9 37b2b=
60b  ..P....7..P....7
Sep 05 01:37:36 szarotka kernel: 00000000: 68351697 5acd0e4a 9428560b 1a8d7=
6d0  ..5hJ..Z.V(..v..
Sep 05 01:37:36 szarotka kernel: 00000000: 68351697 5acd0e4a 68351697 5acd0=
e4a  ..5hJ..Z..5hJ..Z
Sep 05 01:37:36 szarotka kernel: 00000000: 4c2a94e9 fbcae730 3976dcd3 15cd1=
fb5  ..*L0.....v9....
Sep 05 01:37:36 szarotka kernel: 00000000: 4c2a94e9 fbcae730 4c2a94e9 fbcae=
730  ..*L0.....*L0...
Sep 05 01:37:36 szarotka kernel: 00000000: 1327c229 2f27070a 99731456 9b149=
66f  ).'...'/V.s.o...
Sep 05 01:37:36 szarotka kernel: 00000000: 1327c229 2f27070a 1327c229 2f270=
70a  ).'...'/).'...'/
Sep 05 01:37:36 szarotka kernel: 00000000: 69763870 10017313 681b80f6 2a2a2=
f6e  p8vi.s.....hn/**
Sep 05 01:37:36 szarotka kernel: 00000000: 69763870 10017313 69763870 10017=
313  p8vi.s..p8vi.s..
Sep 05 01:37:36 szarotka kernel: 00000000: 50a7bfd5 fc04d245 ffbc8c5b 8a24d=
34d  ...PE...[...M.$.
Sep 05 01:37:36 szarotka kernel: 00000000: 50a7bfd5 fc04d245 50a7bfd5 fc04d=
245  ...PE......PE...
Sep 05 01:37:36 szarotka kernel: 00000000: b90ebae0 745dc2ab 937bdf16 63b81=
1a9  ......]t..{....c
Sep 05 01:37:36 szarotka kernel: 00000000: b90ebae0 745dc2ab b90ebae0 745dc=
2ab  ......]t......]t
Sep 05 01:37:36 szarotka kernel: 00000000: 586086c5 23017410 0f5a67ca 162eb=
c90  ..`X.t.#.gZ.....
Sep 05 01:37:36 szarotka kernel: 00000000: 45cf2c47 bc4db625 586086c5 23017=
410  G,.E%.M...`X.t.#
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: 7e7a4995 e5f7225c 0a195ed6 aecd6=
7bb  .Iz~\"...^...g..
Sep 05 01:37:36 szarotka kernel: 00000000: 7e7a4995 e5f7225c 7e7a4995 e5f72=
25c  .Iz~\"...Iz~\"..
Sep 05 01:37:36 szarotka kernel: 00000000: ed9f37b8 958dda0b 47c30713 a0b79=
e26  .7.........G&...
Sep 05 01:37:36 szarotka kernel: 00000000: ed9f37b8 958dda0b ed9f37b8 958dd=
a0b  .7.......7......
Sep 05 01:37:36 szarotka kernel: 00000000: 905cac76 0db07137 1d7542b1 d225f=
5aa  v.\.7q...Bu...%.
Sep 05 01:37:36 szarotka kernel: 00000000: 905cac76 0db07137 905cac76 0db07=
137  v.\.7q..v.\.7q..
Sep 05 01:37:36 szarotka kernel: 00000000: b4e862ae a0de49b5 b9b732d4 459be=
af1  .b...I...2.....E
Sep 05 01:37:36 szarotka kernel: 00000000: b4e862ae a0de49b5 b4e862ae a0de4=
9b5  .b...I...b...I..
Sep 05 01:37:36 szarotka kernel: 00000000: 86b8e7f5 36ad9c8c e4896293 c1c2a=
450  .......6.b..P...
Sep 05 01:37:36 szarotka kernel: 00000000: 86b8e7f5 36ad9c8c 86b8e7f5 36ad9=
c8c  .......6.......6
Sep 05 01:37:36 szarotka kernel: 00000000: 9864bd3c ecd815e6 8957cfc2 8e458=
553  <.d.......W.S.E.
Sep 05 01:37:36 szarotka kernel: 00000000: a29a18a5 5f5d9d6a 9864bd3c ecd81=
5e6  ....j.]_<.d.....
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: f2868669 f173e25f b6284273 e7ce9=
60d  i..._.s.sB(.....
Sep 05 01:37:36 szarotka kernel: 00000000: f2868669 f173e25f f2868669 f173e=
25f  i..._.s.i..._.s.
Sep 05 01:37:36 szarotka kernel: 00000000: 24964fbc def321f0 95be78ce 0b907=
172  .O.$.!...x..rq..
Sep 05 01:37:36 szarotka kernel: 00000000: 24964fbc def321f0 24964fbc def32=
1f0  .O.$.!...O.$.!..
Sep 05 01:37:36 szarotka kernel: 00000000: 98420e8a dfdea92b 9beae7a7 185ef=
8e6  ..B.+.........^.
Sep 05 01:37:36 szarotka kernel: 00000000: 98420e8a dfdea92b 98420e8a dfdea=
92b  ..B.+.....B.+...
Sep 05 01:37:36 szarotka kernel: 00000000: fa0b0864 02b0e6e3 b7797350 65fe5=
54b  d.......Psy.KU.e
Sep 05 01:37:36 szarotka kernel: 00000000: 75e933c7 6c4e541f fa0b0864 02b0e=
6e3  .3.u.TNld.......
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: ec987f97 226a17ba 74d66fc7 c5073=
857  ......j".o.tW8..
Sep 05 01:37:36 szarotka kernel: 00000000: 5f961692 61f360c3 ec987f97 226a1=
7ba  ..._.`.a......j"
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: 5e64a37c d760eaa8 d1c85841 c6e52=
947  |.d^..`.AX..G)..
Sep 05 01:37:36 szarotka kernel: 00000000: b8b47ea3 bbaf13f1 5e64a37c d760e=
aa8  .~......|.d^..`.
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: c291f415 98d3a10c ad693f30 caff8=
849  ........0?i.I...
Sep 05 01:37:36 szarotka kernel: 00000000: c291f415 98d3a10c c291f415 98d3a=
10c  ................
Sep 05 01:37:36 szarotka kernel: 00000000: db811cd9 04b778f0 6ac0bdec 3cb56=
84b  .....x.....jKh.<
Sep 05 01:37:36 szarotka kernel: 00000000: db811cd9 04b778f0 db811cd9 04b77=
8f0  .....x.......x..
Sep 05 01:37:36 szarotka kernel: 00000000: ae7d5a3c 169860bd 5c1ff2af 713df=
150  <Z}..`.....\P.=3Dq
Sep 05 01:37:36 szarotka kernel: 00000000: ae7d5a3c 169860bd ae7d5a3c 16986=
0bd  <Z}..`..<Z}..`..
Sep 05 01:37:36 szarotka kernel: 00000000: 108e2cd5 59c76491 5e6a352a 54156=
739  .,...d.Y*5j^9g.T
Sep 05 01:37:36 szarotka kernel: 00000000: 108e2cd5 59c76491 108e2cd5 59c76=
491  .,...d.Y.,...d.Y
Sep 05 01:37:36 szarotka kernel: 00000000: e6d5ae86 2dec4dce 38ce3d3c 97975=
ccc  .....M.-<=3D.8.\..
Sep 05 01:37:36 szarotka kernel: 00000000: e6d5ae86 2dec4dce e6d5ae86 2dec4=
dce  .....M.-.....M.-
Sep 05 01:37:36 szarotka kernel: 00000000: 7dd9812a 36a0c792 71915fa7 c4e33=
3d0  *..}...6._.q.3..
Sep 05 01:37:36 szarotka kernel: 00000000: 7dd9812a 36a0c792 7dd9812a 36a0c=
792  *..}...6*..}...6
Sep 05 01:37:36 szarotka kernel: 00000000: eb90f564 d12b3cb6 7d4e7b55 f5766=
951  d....<+.U{N}Qiv.
Sep 05 01:37:36 szarotka kernel: 00000000: eb90f564 d12b3cb6 eb90f564 d12b3=
cb6  d....<+.d....<+.
Sep 05 01:37:36 szarotka kernel: 00000000: 77e42986 55e13073 1bce7a2e d0bff=
b76  .).ws0.U.z..v...
Sep 05 01:37:36 szarotka kernel: 00000000: 77e42986 55e13073 77e42986 55e13=
073  .).ws0.U.).ws0.U
Sep 05 01:37:36 szarotka kernel: 00000000: bfae83bd 4a5fc1e3 3650b3f5 ecf76=
45f  ......_J..P6_d..
Sep 05 01:37:36 szarotka kernel: 00000000: bfae83bd 4a5fc1e3 bfae83bd 4a5fc=
1e3  ......_J......_J
Sep 05 01:37:36 szarotka kernel: 00000000: 6f34f06c d2dd8483 6114cf4a c6976=
3c1  l.4o....J..a.c..
Sep 05 01:37:36 szarotka kernel: 00000000: 25653891 fcae7fa7 6f34f06c d2dd8=
483  .8e%....l.4o....
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: fef89f76 7989bf11 99c6085f 6426b=
376  v......y_...v.&d
Sep 05 01:37:36 szarotka kernel: 00000000: 552e2b4c 12a72748 fef89f76 7989b=
f11  L+.UH'..v......y
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: 3f71cae2 f926c1da 2e9cf6a2 ba8b7=
9a9  ..q?..&......y..
Sep 05 01:37:36 szarotka kernel: 00000000: 81c07e36 869fbc1a 3f71cae2 f926c=
1da  6~........q?..&.
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: f4c5a7e6 81bb1ba9 b35f330e 35dc3=
21f  .........3_..2.5
Sep 05 01:37:36 szarotka kernel: 00000000: f4c5a7e6 81bb1ba9 f4c5a7e6 81bb1=
ba9  ................
Sep 05 01:37:36 szarotka kernel: 00000000: 5ac2168f dce70bfc f37c586f 92638=
bcf  ...Z....oX|...c.
Sep 05 01:37:36 szarotka kernel: 00000000: 5ac2168f dce70bfc 5ac2168f dce70=
bfc  ...Z.......Z....
Sep 05 01:37:36 szarotka kernel: 00000000: 0308096a 340ba230 a471b2a4 4b8d9=
a8b  j...0..4..q....K
Sep 05 01:37:36 szarotka kernel: 00000000: 0308096a 340ba230 0308096a 340ba=
230  j...0..4j...0..4
Sep 05 01:37:36 szarotka kernel: 00000000: 2abf4e56 993c70de 869b1df3 209db=
c5f  VN.*.p<....._..=20
Sep 05 01:37:36 szarotka kernel: 00000000: 2abf4e56 993c70de 2abf4e56 993c7=
0de  VN.*.p<.VN.*.p<.
Sep 05 01:37:36 szarotka kernel: 00000000: 0660d706 e7fc8597 d0464f83 20b09=
824  ..`......OF.$..=20
Sep 05 01:37:36 szarotka kernel: 00000000: 0660d706 e7fc8597 0660d706 e7fc8=
597  ..`.......`.....
Sep 05 01:37:36 szarotka kernel: 00000000: 2af20b0d 6b584ddf edf600a5 94feb=
d3b  ...*.MXk....;...
Sep 05 01:37:36 szarotka kernel: 00000000: 2af20b0d 6b584ddf 2af20b0d 6b584=
ddf  ...*.MXk...*.MXk
Sep 05 01:37:36 szarotka kernel: 00000000: 801e95ac 6f470e24 e57986ea 3526a=
d77  ....$.Go..y.w.&5
Sep 05 01:37:36 szarotka kernel: 00000000: 801e95ac 6f470e24 801e95ac 6f470=
e24  ....$.Go....$.Go
Sep 05 01:37:36 szarotka kernel: 00000000: cf52289b c913b3d7 053f8a1b 0b932=
8ef  .(R.......?..(..
Sep 05 01:37:36 szarotka kernel: 00000000: cf52289b c913b3d7 cf52289b c913b=
3d7  .(R......(R.....
Sep 05 01:37:36 szarotka kernel: 00000000: c115d706 f9842c82 4d067400 037c1=
9ff  .....,...t.M..|.
Sep 05 01:37:36 szarotka kernel: 00000000: c115d706 f9842c82 c115d706 f9842=
c82  .....,.......,..
Sep 05 01:37:36 szarotka kernel: 00000000: 55921740 0f31de78 8b9f1b31 6a017=
cae  @..Ux.1.1....|.j
Sep 05 01:37:36 szarotka kernel: 00000000: c0830c98 3eacfb5f 55921740 0f31d=
e78  ...._..>@..Ux.1.
Sep 05 01:37:36 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 01:37:36 szarotka kernel: 00000000: 5896b389 618af35a 10017350 28d93=
288  ...XZ..aPs...2.(
Sep 05 01:37:36 szarotka kernel: 00000000: c85c0ff4 3a57aa98 5896b389 618af=
35a  ..\...W:...XZ..a
Sep 05 01:37:36 szarotka kernel: 00000000: 4a7c7c8b b6b7af20 ac4e15f5 c6901=
022  .||J .....N."...
Sep 05 01:37:36 szarotka kernel: 00000000: 0d400686 b721c387 4a7c7c8b b6b7a=
f20  ..@...!..||J ...
Sep 05 01:37:36 szarotka kernel: 00000000: fa0f9aa8 4adcffa7 a94047f2 73dfa=
513  .......J.G@....s
Sep 05 01:37:36 szarotka kernel: 00000000: 26867d6f 3d4039a5 fa0f9aa8 4adcf=
fa7  o}.&.9@=3D.......J
Sep 05 01:37:36 szarotka kernel: 00000000: 9e21c603 a48a31c3 f3287d12 c8a0f=
cda  ..!..1...}(.....
Sep 05 01:37:36 szarotka kernel: 00000000: 007bc45c d29c2fdd 9e21c603 a48a3=
1c3  \.{../....!..1..
Sep 05 01:37:36 szarotka kernel: 00000000: 6df264c4 4648d8ec 8ae94dfa 460f2=
1ab  .d.m..HF.M...!.F
Sep 05 01:37:36 szarotka kernel: 00000000: c60e4b80 5fef8195 6df264c4 4648d=
8ec  .K....._.d.m..HF
Sep 05 01:37:36 szarotka kernel: 00000000: d573aaf8 54a2478f 0f1904e4 4a173=
e1e  ..s..G.T.....>.J
Sep 05 01:37:36 szarotka kernel: 00000000: d573aaf8 54a2478f d573aaf8 54a24=
78f  ..s..G.T..s..G.T
Sep 05 01:37:36 szarotka kernel: 00000000: 6acd50be 1fa5ca85 305891b2 9dbad=
24f  .P.j......X0O...
Sep 05 01:37:36 szarotka kernel: 00000000: cc23406c 1530b1af 6acd50be 1fa5c=
a85  l@#...0..P.j....
Sep 05 01:37:36 szarotka kernel: 00000000: b97b6763 277f963b 3b6dcd8f f038b=
c0c  cg{.;..'..m;..8.
Sep 05 01:37:36 szarotka kernel: 00000000: 6502ea31 c36d113f b97b6763 277f9=
63b  1..e?.m.cg{.;..'
Sep 05 01:37:36 szarotka kernel: 00000000: 90a81a72 e0228000 d33fedf3 2d4dc=
e18  r....."...?...M-
Sep 05 01:37:36 szarotka kernel: 00000000: 90a81a72 e0228000 90a81a72 e0228=
000  r.....".r.....".
Sep 05 01:37:36 szarotka kernel: 00000000: 16493e53 9417cdd8 16c6662d 5a03d=
3cc  S>I.....-f.....Z
Sep 05 01:37:36 szarotka kernel: 00000000: 16493e53 9417cdd8 16493e53 9417c=
dd8  S>I.....S>I.....
Sep 05 01:37:36 szarotka kernel: 00000000: eb1255f3 7b2f14b2 3853267e e7b25=
b76  .U..../{~&S8v[..
Sep 05 01:37:36 szarotka kernel: 00000000: eb1255f3 7b2f14b2 eb1255f3 7b2f1=
4b2  .U..../{.U..../{
Sep 05 01:37:36 szarotka kernel: 00000000: aebe6c48 6b04b083 3e57e743 e4626=
dbb  Hl.....kC.W>.mb.
Sep 05 01:37:36 szarotka kernel: 00000000: aebe6c48 6b04b083 aebe6c48 6b04b=
083  Hl.....kHl.....k
Sep 05 01:37:36 szarotka kernel: 00000000: fbb9cc76 b680d516 d06a66fb 58f69=
017  v........fj....X
Sep 05 01:37:36 szarotka kernel: 00000000: fbb9cc76 b680d516 fbb9cc76 b680d=
516  v.......v.......
Sep 05 01:37:36 szarotka kernel: 00000000: 50ee0452 7e16de60 dc89f89e fe6e8=
c68  R..P`..~....h.n.
Sep 05 01:37:36 szarotka kernel: 00000000: 50ee0452 7e16de60 50ee0452 7e16d=
e60  R..P`..~R..P`..~
Sep 05 01:37:36 szarotka kernel: 00000000: 395b0ed4 55608e77 8f7cd833 a8ecb=
76f  ..[9w.`U3.|.o...
Sep 05 01:37:36 szarotka kernel: 00000000: 395b0ed4 55608e77 395b0ed4 55608=
e77  ..[9w.`U..[9w.`U
Sep 05 01:37:36 szarotka kernel: 00000000: 9a012004 583f9030 62db2c0c 926a4=
8c5  . ..0.?X.,.b.Hj.
Sep 05 01:37:36 szarotka kernel: 00000000: 9a012004 583f9030 9a012004 583f9=
030  . ..0.?X. ..0.?X
Sep 05 01:37:36 szarotka kernel: 00000000: 9d7b2f87 eb517ba0 688af842 437d8=
d31  ./{..{Q.B..h1.}C
Sep 05 01:37:36 szarotka kernel: 00000000: e343e497 307972ac 9d7b2f87 eb517=
ba0  ..C..ry0./{..{Q.
Sep 05 01:37:36 szarotka kernel: 00000000: 27bd757c 60e91eb8 69276e26 fbe56=
a85  |u.'...`&n'i.j..
Sep 05 01:37:36 szarotka kernel: 00000000: 27bd757c 60e91eb8 27bd757c 60e91=
eb8  |u.'...`|u.'...`
Sep 05 01:37:36 szarotka kernel: 00000000: 172492e3 2a5b56c1 4e7b8f52 ff295=
8a9  ..$..V[*R.{N.X).
Sep 05 01:37:36 szarotka kernel: 00000000: 172492e3 2a5b56c1 172492e3 2a5b5=
6c1  ..$..V[*..$..V[*
Sep 05 01:37:36 szarotka kernel: 00000000: d2c2939a b2ec8725 3c707f52 22ac9=
918  ....%...R.p<..."
Sep 05 01:37:36 szarotka kernel: 00000000: d2c2939a b2ec8725 d2c2939a b2ec8=
725  ....%.......%...
Sep 05 01:37:36 szarotka kernel: 00000000: b2eff490 33b09c53 d8b9db91 c16a0=
f23  ....S..3....#.j.
Sep 05 01:37:36 szarotka kernel: 00000000: b2eff490 33b09c53 b2eff490 33b09=
c53  ....S..3....S..3
Sep 05 01:37:36 szarotka kernel: 00000000: 50f03ea1 c23474fa 35bdd2ea 3bf75=
374  .>.P.t4....5tS.;
Sep 05 01:37:36 szarotka kernel: 00000000: 50f03ea1 c23474fa 50f03ea1 c2347=
4fa  .>.P.t4..>.P.t4.
Sep 05 01:37:36 szarotka kernel: 00000000: 6385f80a b70c0efb 5cf0130f 5f33d=
23f  ...c.......\?.3_
Sep 05 01:37:36 szarotka kernel: 00000000: 6385f80a b70c0efb 6385f80a b70c0=
efb  ...c.......c....
Sep 05 01:37:36 szarotka kernel: 00000000: 124c09ea f0ef34d7 8642d2b3 5afd6=
43c  ..L..4....B.<d.Z
Sep 05 01:37:36 szarotka kernel: 00000000: 124c09ea f0ef34d7 124c09ea f0ef3=
4d7  ..L..4....L..4..
Sep 05 01:37:36 szarotka kernel: 00000000: 0802785f 8ba4ba06 24616c18 740e2=
cfb  _x.......la$.,.t
Sep 05 01:37:36 szarotka kernel: 00000000: 0802785f 8ba4ba06 0802785f 8ba4b=
a06  _x......_x......
Sep 05 01:37:36 szarotka kernel: 00000000: ac3e7501 49b0f8c8 84c775e7 a9aca=
7fb  .u>....I.u......
Sep 05 01:37:36 szarotka kernel: 00000000: ac3e7501 49b0f8c8 ac3e7501 49b0f=
8c8  .u>....I.u>....I
Sep 05 01:37:36 szarotka kernel: 00000000: 82ab55af 0bc5a917 1e508f05 00d18=
3a3  .U........P.....
Sep 05 01:37:36 szarotka kernel: 00000000: 82ab55af 0bc5a917 82ab55af 0bc5a=
917  .U.......U......
Sep 05 01:37:36 szarotka kernel: 00000000: 7e65ffd2 1212f014 d1ad5410 e9e1a=
975  ..e~.....T..u...
Sep 05 01:37:36 szarotka kernel: 00000000: 7e65ffd2 1212f014 7e65ffd2 1212f=
014  ..e~......e~....
Sep 05 01:37:36 szarotka kernel: 00000000: d6f64d70 237827cb 416e291b 771f8=
6db  pM...'x#.)nA...w
Sep 05 01:37:36 szarotka kernel: 00000000: d0e0c7bc 3bf84f7f d6f64d70 23782=
7cb  .....O.;pM...'x#
Sep 05 01:37:36 szarotka kernel: 00000000: 61aa1bc9 abd48125 32065331 cb436=
bb8  ...a%...1S.2.kC.
Sep 05 01:37:36 szarotka kernel: 00000000: 4aa3d289 cd69fc40 61aa1bc9 abd48=
125  ...J@.i....a%...
Sep 05 01:37:36 szarotka kernel: 00000000: 4144cf76 e7134f87 3ae85097 e05f2=
973  v.DA.O...P.:s)_.
Sep 05 01:37:36 szarotka kernel: 00000000: 4144cf76 e7134f87 4144cf76 e7134=
f87  v.DA.O..v.DA.O..
Sep 05 01:37:36 szarotka kernel: 00000000: c5c950da 10bcc674 cae0f3b0 2892e=
d9e  .P..t..........(
Sep 05 01:37:36 szarotka kernel: 00000000: 8c48b896 8d8787e3 c5c950da 10bcc=
674  ..H......P..t...
Sep 05 01:37:36 szarotka kernel: 00000000: 439a23ee 2883c8e5 60b9fd7f 26628=
2f2  .#.C...(...`..b&
Sep 05 01:37:36 szarotka kernel: 00000000: 439a23ee 2883c8e5 439a23ee 2883c=
8e5  .#.C...(.#.C...(
Sep 05 01:37:36 szarotka kernel: 00000000: 2e4d0088 41989cc6 d9a82e56 66392=
eae  ..M....AV.....9f
Sep 05 01:37:36 szarotka kernel: 00000000: 2e4d0088 41989cc6 2e4d0088 41989=
cc6  ..M....A..M....A
Sep 05 01:37:36 szarotka kernel: 00000000: 4607328f 58bad140 386a3277 5712e=
068  .2.F@..Xw2j8h..W
Sep 05 01:37:36 szarotka kernel: 00000000: 4607328f 58bad140 4607328f 58bad=
140  .2.F@..X.2.F@..X
Sep 05 01:37:36 szarotka kernel: 00000000: 8d4ef4f1 dce85052 51a57196 cf8c2=
1bc  ..N.RP...q.Q.!..
Sep 05 01:37:36 szarotka kernel: 00000000: 8d4ef4f1 dce85052 8d4ef4f1 dce85=
052  ..N.RP....N.RP..
Sep 05 01:37:36 szarotka kernel: 00000000: dfd6e2f5 3ef9ae71 ba1869d6 98197=
1b1  ....q..>.i...q..
Sep 05 01:37:36 szarotka kernel: 00000000: dfd6e2f5 3ef9ae71 dfd6e2f5 3ef9a=
e71  ....q..>....q..>
Sep 05 01:37:36 szarotka kernel: 00000000: 3c01ec63 11d02e1b a2aac405 3758e=
252  c..<........R.X7
Sep 05 01:37:36 szarotka kernel: 00000000: 3c01ec63 11d02e1b 3c01ec63 11d02=
e1b  c..<....c..<....
Sep 05 01:37:36 szarotka kernel: 00000000: 0d6cdced efa6cdaf fbdad9f7 e3b2a=
565  ..l.........e...
Sep 05 01:37:36 szarotka kernel: 00000000: 0d6cdced efa6cdaf 0d6cdced efa6c=
daf  ..l.......l.....
Sep 05 01:37:40 szarotka kernel: 00000000: 67958aa9 78f489d8 970c4c0e 2e84b=
84f  ...g...x.L..O...
Sep 05 01:37:40 szarotka kernel: 00000000: 67958aa9 78f489d8 67958aa9 78f48=
9d8  ...g...x...g...x
Sep 05 01:37:40 szarotka kernel: 00000000: f8685c8f 0846a41f 30acd218 d9b83=
f44  .\h...F....0D?..
Sep 05 01:37:40 szarotka kernel: 00000000: f8685c8f 0846a41f f8685c8f 0846a=
41f  .\h...F..\h...F.
Sep 05 01:37:40 szarotka kernel: 00000000: 82196b5e 12842813 11ad126b 7bdb3=
eae  ^k...(..k....>.{
Sep 05 01:37:40 szarotka kernel: 00000000: 82196b5e 12842813 82196b5e 12842=
813  ^k...(..^k...(..
Sep 05 01:37:40 szarotka kernel: 00000000: 5e4cdb69 30d86d46 f274e918 a044b=
a24  i.L^Fm.0..t.$.D.
Sep 05 01:37:40 szarotka kernel: 00000000: 5e4cdb69 30d86d46 5e4cdb69 30d86=
d46  i.L^Fm.0i.L^Fm.0
Sep 05 01:37:40 szarotka kernel: 00000000: 7f8401bf 38d20fce cbb2018e f8948=
570  .......8....p...
Sep 05 01:37:40 szarotka kernel: 00000000: 7f8401bf 38d20fce 7f8401bf 38d20=
fce  .......8.......8
Sep 05 01:37:40 szarotka kernel: 00000000: 30852b4f d2b0c20e a08b5a61 41406=
377  O+.0....aZ..wc@A
Sep 05 01:37:40 szarotka kernel: 00000000: 30852b4f d2b0c20e 30852b4f d2b0c=
20e  O+.0....O+.0....
Sep 05 01:37:40 szarotka kernel: 00000000: 05abd0b3 e4cfd9f2 dadfa84c b0ba2=
51f  ........L....%..
Sep 05 01:37:40 szarotka kernel: 00000000: 05abd0b3 e4cfd9f2 05abd0b3 e4cfd=
9f2  ................
Sep 05 01:37:40 szarotka kernel: 00000000: a7160ad8 188d2f63 fa07cde3 7ce06=
4b9  ....c/.......d.|
Sep 05 01:37:40 szarotka kernel: 00000000: a7160ad8 188d2f63 a7160ad8 188d2=
f63  ....c/......c/..
Sep 05 01:37:40 szarotka kernel: 00000000: 19ffab49 12d405c2 f7e3e352 5657d=
59a  I.......R.....WV
Sep 05 01:37:40 szarotka kernel: 00000000: 56223201 9f7368ac 19ffab49 12d40=
5c2  .2"V.hs.I.......
Sep 05 01:37:40 szarotka kernel: 00000000: 5be42286 86b244da 3d387cc2 137eb=
3ca  .".[.D...|8=3D..~.
Sep 05 01:37:40 szarotka kernel: 00000000: 5be42286 86b244da 5be42286 86b24=
4da  .".[.D...".[.D..
Sep 05 01:37:40 szarotka kernel: 00000000: cb172146 e4ae77e9 9ae3946d 10271=
7c9  F!...w..m.....'.
Sep 05 01:37:40 szarotka kernel: 00000000: cb172146 e4ae77e9 cb172146 e4ae7=
7e9  F!...w..F!...w..
Sep 05 01:37:40 szarotka kernel: 00000000: 03c0fed3 744f9e45 2679ec85 783b6=
d44  ....E.Ot..y&Dm;x
Sep 05 01:37:40 szarotka kernel: 00000000: 03c0fed3 744f9e45 03c0fed3 744f9=
e45  ....E.Ot....E.Ot
Sep 05 01:37:40 szarotka kernel: 00000000: cde0fcc9 e8dd3ca9 83a04b87 bcdf3=
22e  .....<...K...2..
Sep 05 01:37:40 szarotka kernel: 00000000: cde0fcc9 e8dd3ca9 cde0fcc9 e8dd3=
ca9  .....<.......<..
Sep 05 01:37:40 szarotka kernel: 00000000: 454c898d 8de5dfcc 2fa00b6a d6646=
129  ..LE....j../)ad.
Sep 05 01:37:40 szarotka kernel: 00000000: 454c898d 8de5dfcc 454c898d 8de5d=
fcc  ..LE......LE....
Sep 05 01:37:40 szarotka kernel: 00000000: 92b216da bb4d4b65 a7a7c613 7e560=
95e  ....eKM.....^.V~
Sep 05 01:37:40 szarotka kernel: 00000000: 92b216da bb4d4b65 92b216da bb4d4=
b65  ....eKM.....eKM.
Sep 05 01:37:40 szarotka kernel: 00000000: 1334c9a7 83df9b2b ff5cc0af 4ab05=
046  ..4.+.....\.FP.J
Sep 05 01:37:40 szarotka kernel: 00000000: 1334c9a7 83df9b2b 1334c9a7 83df9=
b2b  ..4.+.....4.+...
Sep 05 01:37:40 szarotka kernel: 00000000: 1511a942 565fc904 7138a578 2b3b4=
bc8  B....._Vx.8q.K;+
Sep 05 01:37:40 szarotka kernel: 00000000: 1511a942 565fc904 1511a942 565fc=
904  B....._VB....._V
Sep 05 01:37:40 szarotka sudo[9591]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 01:37:46 szarotka sudo[9605]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/umount /tmp/owo
Sep 05 01:37:46 szarotka sudo[9605]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 01:37:46 szarotka kernel: 00000000: bfa5c520 0c73f546 df6c3234 d614a=
91a   ...F.s.42l.....
Sep 05 01:37:46 szarotka kernel: 00000000: bfa5c520 0c73f546 bfa5c520 0c73f=
546   ...F.s. ...F.s.
Sep 05 01:37:46 szarotka kernel: 00000000: 1f64eaa1 a0fb54ba 2a80d800 5d508=
189  ..d..T.....*..P]
Sep 05 01:37:46 szarotka kernel: 00000000: 1f64eaa1 a0fb54ba 1f64eaa1 a0fb5=
4ba  ..d..T....d..T..
Sep 05 01:37:46 szarotka kernel: 00000000: 4f3c4dcc 9f91c8df 299551f6 8929e=
d82  .M<O.....Q.)..).
Sep 05 01:37:46 szarotka kernel: 00000000: 4f3c4dcc 9f91c8df 4f3c4dcc 9f91c=
8df  .M<O.....M<O....
Sep 05 01:37:46 szarotka systemd[681]: tmp-owo.mount: Succeeded.
Sep 05 01:37:46 szarotka kernel: 00000000: a4378799 69c555bd 1eb678ea 72f30=
c6b  ..7..U.i.x..k..r
Sep 05 01:37:46 szarotka kernel: 00000000: a4378799 69c555bd a4378799 69c55=
5bd  ..7..U.i..7..U.i
Sep 05 01:37:46 szarotka systemd[1]: tmp-owo.mount: Succeeded.
Sep 05 01:37:46 szarotka sudo[9605]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 01:37:53 szarotka sudo[9609]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl -e
Sep 05 01:37:53 szarotka sudo[9609]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 01:38:11 szarotka sudo[9609]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 01:38:23 szarotka sudo[9629]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl --since -=
3m
Sep 05 01:38:23 szarotka sudo[9629]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 01:38:27 szarotka sudo[9629]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 01:38:32 szarotka sudo[9632]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl --since -=
3m
Sep 05 01:38:32 szarotka sudo[9632]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)

--xta6vuywnarozrzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=journal+dump+cmd
Content-Transfer-Encoding: quoted-printable

-- Logs begin at Tue 2020-04-21 03:43:27 CEST, end at Sat 2020-09-05 03:10:=
13 CEST. --
Sep 05 03:08:06 szarotka kernel: CIFS: Attempting to mount //tarta/1200-S121
Sep 05 03:08:06 szarotka kernel: CIFS VFS: Use of the less secure dialect v=
ers=3D1.0 is not recommended unless required for access to very old servers
Sep 05 03:08:06 szarotka kernel: 00000000: 23aab1bc 80a5e91d 000471dd 8fa05=
c48  ...#.....q..H\..
Sep 05 03:08:06 szarotka kernel: 00000000: 23aab1bc 80a5e91d 23aab1bc 80a5e=
91d  ...#.......#....
Sep 05 03:08:06 szarotka kernel: 00000000: acaf32d7 45d7ea54 7ff42553 8aed6=
529  .2..T..ES%..)e..
Sep 05 03:08:06 szarotka kernel: 00000000: acaf32d7 45d7ea54 acaf32d7 45d7e=
a54  .2..T..E.2..T..E
Sep 05 03:08:06 szarotka kernel: 00000000: b9c3733f c982f312 6a13f0bd d3fc1=
85c  ?s.........j\...
Sep 05 03:08:06 szarotka kernel: 00000000: b9c3733f c982f312 b9c3733f c982f=
312  ?s......?s......
Sep 05 03:08:06 szarotka kernel: 00000000: 147dcd3f 28f50970 428f3f4e 4d96f=
819  ?.}.p..(N?.B...M
Sep 05 03:08:06 szarotka kernel: 00000000: 147dcd3f 28f50970 147dcd3f 28f50=
970  ?.}.p..(?.}.p..(
Sep 05 03:08:06 szarotka kernel: 00000000: 0f16b894 820f912e 4d2dc372 82ff3=
941  ........r.-MA9..
Sep 05 03:08:06 szarotka kernel: 00000000: 0f16b894 820f912e 0f16b894 820f9=
12e  ................
Sep 05 03:08:06 szarotka kernel: 00000000: 38c121ae bfb3b64c bf828a3f 16cf5=
56f  .!.8L...?...oU..
Sep 05 03:08:06 szarotka kernel: 00000000: 38c121ae bfb3b64c 38c121ae bfb3b=
64c  .!.8L....!.8L...
Sep 05 03:08:06 szarotka kernel: 00000000: 8eac8a71 84103b09 b428a28e 03b96=
a3c  q....;....(.<j..
Sep 05 03:08:06 szarotka kernel: 00000000: 8eac8a71 84103b09 8eac8a71 84103=
b09  q....;..q....;..
Sep 05 03:08:06 szarotka kernel: 00000000: 162610d9 fb554b4f 49050056 34093=
119  ..&.OKU.V..I.1.4
Sep 05 03:08:06 szarotka kernel: 00000000: 162610d9 fb554b4f 162610d9 fb554=
b4f  ..&.OKU...&.OKU.
Sep 05 03:08:06 szarotka kernel: 00000000: 5f11cd20 afc05842 aa76116c 0f07a=
bfa   .._BX..l.v.....
Sep 05 03:08:06 szarotka kernel: 00000000: 5f11cd20 afc05842 5f11cd20 afc05=
842   .._BX.. .._BX..
Sep 05 03:08:06 szarotka kernel: 00000000: 56b556c0 55d50840 5889f03e d568a=
1b3  .V.V@..U>..X..h.
Sep 05 03:08:06 szarotka kernel: 00000000: 56b556c0 55d50840 56b556c0 55d50=
840  .V.V@..U.V.V@..U
Sep 05 03:08:06 szarotka sudo[9887]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 03:08:12 szarotka sudo[9891]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl -f
Sep 05 03:08:12 szarotka sudo[9891]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 03:08:17 szarotka sudo[9893]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/sbin/chroot /tmp/owo/
Sep 05 03:08:17 szarotka sudo[9893]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 03:08:17 szarotka kernel: 00000000: 4465351e e8e292c6 c7e75f90 d0845=
0f7  .5eD....._...P..
Sep 05 03:08:17 szarotka kernel: 00000000: 4465351e e8e292c6 4465351e e8e29=
2c6  .5eD.....5eD....
Sep 05 03:08:17 szarotka kernel: 00000000: 491efef7 90afb81f db64aede b44af=
5e7  ...I......d...J.
Sep 05 03:08:17 szarotka kernel: 00000000: 491efef7 90afb81f 491efef7 90afb=
81f  ...I.......I....
Sep 05 03:08:17 szarotka kernel: 00000000: 9f6971ff d7e3f09d 22c67a19 cbc7d=
dcf  .qi......z."....
Sep 05 03:08:17 szarotka kernel: 00000000: 9f6971ff d7e3f09d 9f6971ff d7e3f=
09d  .qi......qi.....
Sep 05 03:08:17 szarotka kernel: 00000000: fe1586b2 5389bd8c 1efe1a37 d9414=
bfd  .......S7....KA.
Sep 05 03:08:17 szarotka kernel: 00000000: fe1586b2 5389bd8c fe1586b2 5389b=
d8c  .......S.......S
Sep 05 03:08:17 szarotka kernel: 00000000: 4b1ba8ff a408ecce 8a235729 abb41=
d4b  ...K....)W#.K...
Sep 05 03:08:17 szarotka kernel: 00000000: 4b1ba8ff a408ecce 4b1ba8ff a408e=
cce  ...K.......K....
Sep 05 03:08:17 szarotka kernel: 00000000: d059a519 6ad2564d 000e7485 86fa3=
182  ..Y.MV.j.t...1..
Sep 05 03:08:17 szarotka kernel: 00000000: d059a519 6ad2564d d059a519 6ad25=
64d  ..Y.MV.j..Y.MV.j
Sep 05 03:08:17 szarotka kernel: 00000000: 39e51aa5 aa12b425 c4cdcedf 20f94=
434  ...9%.......4D.=20
Sep 05 03:08:17 szarotka kernel: 00000000: 39e51aa5 aa12b425 39e51aa5 aa12b=
425  ...9%......9%...
Sep 05 03:08:17 szarotka kernel: 00000000: 79a21613 eee3ab1c 501f337d a9718=
f46  ...y....}3.PF.q.
Sep 05 03:08:17 szarotka kernel: 00000000: 9238c229 6b1c689f 79a21613 eee3a=
b1c  ).8..h.k...y....
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: a86e9730 057a149c a55dce33 2e075=
6d2  0.n...z.3.]..V..
Sep 05 03:08:17 szarotka kernel: 00000000: a86e9730 057a149c a86e9730 057a1=
49c  0.n...z.0.n...z.
Sep 05 03:08:17 szarotka kernel: 00000000: db8534a4 802a849f ba431545 acfc2=
707  .4....*.E.C..'..
Sep 05 03:08:17 szarotka kernel: 00000000: db8534a4 802a849f db8534a4 802a8=
49f  .4....*..4....*.
Sep 05 03:08:17 szarotka kernel: 00000000: 7eecf6fe deaf9c8a d24a336d bcdd5=
4de  ...~....m3J..T..
Sep 05 03:08:17 szarotka kernel: 00000000: 7eecf6fe deaf9c8a 7eecf6fe deaf9=
c8a  ...~.......~....
Sep 05 03:08:17 szarotka kernel: 00000000: e72f6f8f 453f9837 ccc94c14 ed4d0=
b73  .o/.7.?E.L..s.M.
Sep 05 03:08:17 szarotka kernel: 00000000: e72f6f8f 453f9837 e72f6f8f 453f9=
837  .o/.7.?E.o/.7.?E
Sep 05 03:08:17 szarotka kernel: 00000000: 3ad6e161 595bfa6e 515c114a a2581=
1cb  a..:n.[YJ.\Q..X.
Sep 05 03:08:17 szarotka kernel: 00000000: 3ad6e161 595bfa6e 3ad6e161 595bf=
a6e  a..:n.[Ya..:n.[Y
Sep 05 03:08:17 szarotka kernel: 00000000: 9857d5f7 1f62df50 54666d9d c40bf=
0e1  ..W.P.b..mfT....
Sep 05 03:08:17 szarotka kernel: 00000000: 9857d5f7 1f62df50 9857d5f7 1f62d=
f50  ..W.P.b...W.P.b.
Sep 05 03:08:17 szarotka kernel: 00000000: 7aaf3f1a d2851e47 400597e2 78027=
3eb  .?.zG......@.s.x
Sep 05 03:08:17 szarotka kernel: 00000000: 7aaf3f1a d2851e47 7aaf3f1a d2851=
e47  .?.zG....?.zG...
Sep 05 03:08:17 szarotka kernel: 00000000: 83036e90 9ee4e964 76a4a014 0ba7d=
7be  .n..d......v....
Sep 05 03:08:17 szarotka kernel: 00000000: 83036e90 9ee4e964 83036e90 9ee4e=
964  .n..d....n..d...
Sep 05 03:08:17 szarotka kernel: 00000000: 39511ca5 6d7094a9 696533d9 620f5=
b19  ..Q9..pm.3ei.[.b
Sep 05 03:08:17 szarotka kernel: 00000000: 39511ca5 6d7094a9 39511ca5 6d709=
4a9  ..Q9..pm..Q9..pm
Sep 05 03:08:17 szarotka kernel: 00000000: 64f2afd0 dde0c5bb 75ef0a94 80709=
bd2  ...d.......u..p.
Sep 05 03:08:17 szarotka kernel: 00000000: 7e2b6743 d6e41c45 64f2afd0 dde0c=
5bb  Cg+~E......d....
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: c98b9132 30252349 39449157 ffc57=
562  2...I#%0W.D9bu..
Sep 05 03:08:17 szarotka kernel: 00000000: 3438112b cb8cbaff c98b9132 30252=
349  +.84....2...I#%0
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: acf8acda 8fc2b185 6721020b 8f572=
a61  ..........!ga*W.
Sep 05 03:08:17 szarotka kernel: 00000000: a38ab6b3 abb39b3d acf8acda 8fc2b=
185  ....=3D...........
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: 26312a9f 3c335701 3e349c47 57496=
038  .*1&.W3<G.4>8`IW
Sep 05 03:08:17 szarotka kernel: 00000000: 90941a25 dca19f62 26312a9f 3c335=
701  %...b....*1&.W3<
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: a8e034f0 4ab8d063 f571a33c 855c2=
393  .4..c..J<.q..#\.
Sep 05 03:08:17 szarotka kernel: 00000000: 87620aed 92cda345 a8e034f0 4ab8d=
063  ..b.E....4..c..J
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: eb440f61 711edf3b 9674deb7 4abca=
a06  a.D.;..q..t....J
Sep 05 03:08:17 szarotka kernel: 00000000: f7a348ae f6943f4b eb440f61 711ed=
f3b  .H..K?..a.D.;..q
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: d521f562 59e5423c 5dfe4167 0edcf=
585  b.!.<B.YgA.]....
Sep 05 03:08:17 szarotka kernel: 00000000: d521f562 59e5423c d521f562 59e54=
23c  b.!.<B.Yb.!.<B.Y
Sep 05 03:08:17 szarotka kernel: 00000000: f41999ee a331a6ed b00fcab7 54400=
495  ......1.......@T
Sep 05 03:08:17 szarotka kernel: 00000000: f41999ee a331a6ed f41999ee a331a=
6ed  ......1.......1.
Sep 05 03:08:17 szarotka kernel: 00000000: 4f7c75d0 3f0e567a 2b02b15a 2f7db=
a96  .u|OzV.?Z..+..}/
Sep 05 03:08:17 szarotka kernel: 00000000: 4f7c75d0 3f0e567a 4f7c75d0 3f0e5=
67a  .u|OzV.?.u|OzV.?
Sep 05 03:08:17 szarotka kernel: 00000000: cc6b1de6 e676bcb8 2d32b1f4 1204f=
7b7  ..k...v...2-....
Sep 05 03:08:17 szarotka kernel: 00000000: 1b0185f8 e8d1e175 cc6b1de6 e676b=
cb8  ....u.....k...v.
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: f2606bdd ca2b8240 3df9c4b0 21b5f=
e8c  .k`.@.+....=3D...!
Sep 05 03:08:17 szarotka kernel: 00000000: f2606bdd ca2b8240 f2606bdd ca2b8=
240  .k`.@.+..k`.@.+.
Sep 05 03:08:17 szarotka kernel: 00000000: 48d5cb59 9a9d1aa1 545f96b6 336d0=
7ac  Y..H......_T..m3
Sep 05 03:08:17 szarotka kernel: 00000000: 48d5cb59 9a9d1aa1 48d5cb59 9a9d1=
aa1  Y..H....Y..H....
Sep 05 03:08:17 szarotka kernel: 00000000: 60887d97 055e50f0 d05c98be bd68a=
109  .}.`.P^...\...h.
Sep 05 03:08:17 szarotka kernel: 00000000: c65446cf 69c04402 60887d97 055e5=
0f0  .FT..D.i.}.`.P^.
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: ff938328 26c4cc7e 4b47a846 5be2f=
8fc  (...~..&F.GK...[
Sep 05 03:08:17 szarotka kernel: 00000000: ff938328 26c4cc7e ff938328 26c4c=
c7e  (...~..&(...~..&
Sep 05 03:08:17 szarotka kernel: 00000000: bb0da04a bcc27d82 fa74a383 b405a=
f2b  J....}....t.+...
Sep 05 03:08:17 szarotka kernel: 00000000: bb0da04a bcc27d82 bb0da04a bcc27=
d82  J....}..J....}..
Sep 05 03:08:17 szarotka kernel: 00000000: 78e20d63 464bc15c 642a9f50 8bb94=
8d1  c..x\.KFP.*d.H..
Sep 05 03:08:17 szarotka kernel: 00000000: 78e20d63 464bc15c 78e20d63 464bc=
15c  c..x\.KFc..x\.KF
Sep 05 03:08:17 szarotka kernel: 00000000: 8bdd6396 d9c0f196 512d6ce4 bcc00=
f60  .c.......l-Q`...
Sep 05 03:08:17 szarotka kernel: 00000000: 8bdd6396 d9c0f196 8bdd6396 d9c0f=
196  .c.......c......
Sep 05 03:08:17 szarotka kernel: 00000000: 0adf8713 a834f78d 7cc2684e bad92=
70c  ......4.Nh.|.'..
Sep 05 03:08:17 szarotka kernel: 00000000: 0adf8713 a834f78d 0adf8713 a834f=
78d  ......4.......4.
Sep 05 03:08:17 szarotka kernel: 00000000: 2c0b74e6 d8b9bf56 7c6bc714 ca3c5=
5f7  .t.,V.....k|.U<.
Sep 05 03:08:17 szarotka kernel: 00000000: b5407c81 cf712bae 2c0b74e6 d8b9b=
f56  .|@..+q..t.,V...
Sep 05 03:08:17 szarotka kernel: CIFS VFS: command 0x2e
Sep 05 03:08:17 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 05 03:08:17 szarotka kernel: 00000000: 50571193 752cf294 de2f833a 84140=
e39  ..WP..,u:./.9...
Sep 05 03:08:17 szarotka kernel: 00000000: da6e6896 d4458275 50571193 752cf=
294  .hn.u.E...WP..,u
Sep 05 03:08:17 szarotka kernel: 00000000: ffeafb40 5df39e84 c2f8138b cd707=
131  @......]....1qp.
Sep 05 03:08:17 szarotka kernel: 00000000: 50845a4b 4d9ac875 ffeafb40 5df39=
e84  KZ.Pu..M@......]
Sep 05 03:08:17 szarotka kernel: 00000000: ba7b722b 5a5f7ba4 976007df ec4a3=
5de  +r{..{_Z..`..5J.
Sep 05 03:08:17 szarotka kernel: 00000000: ba7b722b 5a5f7ba4 ba7b722b 5a5f7=
ba4  +r{..{_Z+r{..{_Z
Sep 05 03:08:17 szarotka kernel: 00000000: aa736cb6 40200f37 15afc483 d8c05=
fc6  .ls.7. @....._..
Sep 05 03:08:17 szarotka kernel: 00000000: aa736cb6 40200f37 aa736cb6 40200=
f37  .ls.7. @.ls.7. @
Sep 05 03:08:17 szarotka kernel: 00000000: 8cf208f6 9c0c1be8 142ee198 fa5ff=
ac1  .............._.
Sep 05 03:08:17 szarotka kernel: 00000000: 8cf208f6 9c0c1be8 8cf208f6 9c0c1=
be8  ................
Sep 05 03:08:17 szarotka kernel: 00000000: 3546f05c 3f44a470 aea8d29e c1744=
888  \.F5p.D?.....Ht.
Sep 05 03:08:17 szarotka kernel: 00000000: 3546f05c 3f44a470 3546f05c 3f44a=
470  \.F5p.D?\.F5p.D?
Sep 05 03:08:17 szarotka kernel: 00000000: 5023c0e0 6dc6acca 480204ec b47f0=
7ce  ..#P...m...H....
Sep 05 03:08:17 szarotka kernel: 00000000: 5023c0e0 6dc6acca 5023c0e0 6dc6a=
cca  ..#P...m..#P...m
Sep 05 03:08:17 szarotka kernel: 00000000: 65b023d5 48c53d79 0e0db2fc a781a=
a36  .#.ey=3D.H....6...
Sep 05 03:08:17 szarotka kernel: 00000000: 3fa9b309 3def5edd 65b023d5 48c53=
d79  ...?.^.=3D.#.ey=3D.H
Sep 05 03:08:17 szarotka kernel: 00000000: d0a009e3 b353b07e a07051ac 68926=
c16  ....~.S..Qp..l.h
Sep 05 03:08:17 szarotka kernel: 00000000: eaa34cdc 70a42eb9 d0a009e3 b353b=
07e  .L.....p....~.S.
Sep 05 03:08:17 szarotka kernel: 00000000: d85ca09a aaef1116 4c6a2ffe 33b94=
c5d  ..\....../jL]L.3
Sep 05 03:08:17 szarotka kernel: 00000000: d85ca09a aaef1116 d85ca09a aaef1=
116  ..\.......\.....
Sep 05 03:08:17 szarotka kernel: 00000000: d36ee2dd 06bad070 9a72cc44 1ce7a=
ae0  ..n.p...D.r.....
Sep 05 03:08:17 szarotka kernel: 00000000: d36ee2dd 06bad070 d36ee2dd 06bad=
070  ..n.p.....n.p...
Sep 05 03:08:17 szarotka kernel: 00000000: 806de1eb 9fec0869 a2019ca5 fd8db=
703  ..m.i...........
Sep 05 03:08:17 szarotka kernel: 00000000: 806de1eb 9fec0869 806de1eb 9fec0=
869  ..m.i.....m.i...
Sep 05 03:08:17 szarotka kernel: 00000000: 7ba64513 646c28c1 74d5d216 879b0=
d90  .E.{.(ld...t....
Sep 05 03:08:17 szarotka kernel: 00000000: 7ba64513 646c28c1 7ba64513 646c2=
8c1  .E.{.(ld.E.{.(ld
Sep 05 03:08:17 szarotka kernel: 00000000: 366611a4 2129975a 7947d6c2 84f2e=
94f  ..f6Z.)!..GyO...
Sep 05 03:08:17 szarotka kernel: 00000000: 366611a4 2129975a 366611a4 21299=
75a  ..f6Z.)!..f6Z.)!
Sep 05 03:08:17 szarotka kernel: 00000000: e9397a7b 53825e3a 2d63588d a57f0=
ebe  {z9.:^.S.Xc-....
Sep 05 03:08:17 szarotka kernel: 00000000: 3518f578 ca9ae56b e9397a7b 53825=
e3a  x..5k...{z9.:^.S
Sep 05 03:08:17 szarotka kernel: 00000000: 66b75338 7cc58e7f b3086a8c 667c0=
7d2  8S.f...|.j....|f
Sep 05 03:08:17 szarotka kernel: 00000000: f1512463 22937239 66b75338 7cc58=
e7f  c$Q.9r."8S.f...|
Sep 05 03:08:17 szarotka kernel: 00000000: 52cc8668 39178c64 213c4090 96adb=
9a2  h..Rd..9.@<!....
Sep 05 03:08:17 szarotka kernel: 00000000: 70e80320 6e34f889 52cc8668 39178=
c64   ..p..4nh..Rd..9
Sep 05 03:08:17 szarotka kernel: 00000000: de73b439 d121091c 47080094 8a80c=
b1a  9.s...!....G....
Sep 05 03:08:17 szarotka kernel: 00000000: 15d7a7b2 bce7b7eb de73b439 d1210=
91c  ........9.s...!.
Sep 05 03:08:17 szarotka kernel: 00000000: bda9fc8d 11240e39 acf9853f bf352=
d23  ....9.$.?...#-5.
Sep 05 03:08:17 szarotka kernel: 00000000: fa6d47ef 73471b26 bda9fc8d 11240=
e39  .Gm.&.Gs....9.$.
Sep 05 03:08:17 szarotka kernel: 00000000: e4f9ab9e da728e50 962894f7 efa48=
35d  ....P.r...(.]...
Sep 05 03:08:17 szarotka kernel: 00000000: 7c238ec9 aa0dd8d6 e4f9ab9e da728=
e50  ..#|........P.r.
Sep 05 03:08:17 szarotka kernel: 00000000: 90d8f1c9 790a0f09 c6f85d3d 6c78d=
c8f  .......y=3D]....xl
Sep 05 03:08:17 szarotka kernel: 00000000: 74a0322b 75969fdc 90d8f1c9 790a0=
f09  +2.t...u.......y
Sep 05 03:08:17 szarotka kernel: 00000000: 97923ccd feb937ae b9065bf1 4136f=
43f  .<...7...[..?.6A
Sep 05 03:08:17 szarotka kernel: 00000000: f67b8402 91a85165 97923ccd feb93=
7ae  ..{.eQ...<...7..
Sep 05 03:08:17 szarotka kernel: 00000000: 55118969 3e18a595 fe43f01e d135b=
f44  i..U...>..C.D.5.
Sep 05 03:08:17 szarotka kernel: 00000000: b0d489e7 94a51787 55118969 3e18a=
595  ........i..U...>
Sep 05 03:08:17 szarotka kernel: 00000000: 79a5b666 cf822399 5e9cca56 2e99e=
5d2  f..y.#..V..^....
Sep 05 03:08:17 szarotka kernel: 00000000: ac21ecf7 80e42d0f 79a5b666 cf822=
399  ..!..-..f..y.#..
Sep 05 03:08:17 szarotka kernel: 00000000: 5bf748dd c0538c46 7a6e6bf3 cb29c=
f9d  .H.[F.S..knz..).
Sep 05 03:08:17 szarotka kernel: 00000000: a1b13a27 57e34dbf 5bf748dd c0538=
c46  ':...M.W.H.[F.S.
Sep 05 03:08:17 szarotka kernel: 00000000: ae6f806d 3baee7a2 ee0217d1 ef5fa=
4a4  m.o....;......_.
Sep 05 03:08:17 szarotka kernel: 00000000: 2d2963ab 26b1755c ae6f806d 3baee=
7a2  .c)-\u.&m.o....;
Sep 05 03:08:17 szarotka kernel: 00000000: 78d6bac2 59d035c6 9fa812b5 157f1=
6ca  ...x.5.Y........
Sep 05 03:08:17 szarotka kernel: 00000000: 6a3f9c34 fac2fc69 78d6bac2 59d03=
5c6  4.?ji......x.5.Y
Sep 05 03:08:17 szarotka kernel: 00000000: 5cb6f57e 1d3f8bfa 63495340 a609c=
1f7  ~..\..?.@SIc....
Sep 05 03:08:17 szarotka kernel: 00000000: eb1c3d72 d64c3b69 5cb6f57e 1d3f8=
bfa  r=3D..i;L.~..\..?.
Sep 05 03:08:17 szarotka kernel: 00000000: b158812b e54bb9ff fb0a8d33 70c98=
3e3  +.X...K.3......p
Sep 05 03:08:17 szarotka kernel: 00000000: 5836a41d e498a40c b158812b e54bb=
9ff  ..6X....+.X...K.
Sep 05 03:08:17 szarotka kernel: 00000000: 9a7ff858 25c4a1d1 ec5800c8 28645=
8d0  X......%..X..Xd(
Sep 05 03:08:17 szarotka kernel: 00000000: db16e482 5849439f 9a7ff858 25c4a=
1d1  .....CIXX......%
Sep 05 03:08:17 szarotka kernel: 00000000: 61e80653 7ae28f1e 76a0486a 179da=
213  S..a...zjH.v....
Sep 05 03:08:17 szarotka kernel: 00000000: fbca7e1a 1ad1e826 61e80653 7ae28=
f1e  .~..&...S..a...z
Sep 05 03:08:17 szarotka kernel: 00000000: 7da5791b 020b7cb0 8298dbf1 d1cc9=
bcf  .y.}.|..........
Sep 05 03:08:17 szarotka kernel: 00000000: 7da5791b 020b7cb0 7da5791b 020b7=
cb0  .y.}.|...y.}.|..
Sep 05 03:08:17 szarotka kernel: 00000000: 8055ff1d 3c88668d a52e5283 8471a=
b3a  ..U..f.<.R..:.q.
Sep 05 03:08:17 szarotka kernel: 00000000: 41b8a51d 43ca0963 8055ff1d 3c886=
68d  ...Ac..C..U..f.<
Sep 05 03:08:17 szarotka kernel: 00000000: 12384d77 7329305b 94325ced 50aea=
544  wM8.[0)s.\2.D..P
Sep 05 03:08:17 szarotka kernel: 00000000: 1bae42fe e957988b 12384d77 73293=
05b  .B....W.wM8.[0)s
Sep 05 03:08:17 szarotka kernel: 00000000: dadfc546 096f5863 93ab66a0 c7090=
cb1  F...cXo..f......
Sep 05 03:08:17 szarotka kernel: 00000000: a4494ea2 1f470f61 dadfc546 096f5=
863  .NI.a.G.F...cXo.
Sep 05 03:08:17 szarotka kernel: 00000000: 1b4c45d0 a099fd3b 8c94bc14 1eaed=
5dc  .EL.;...........
Sep 05 03:08:17 szarotka kernel: 00000000: 88d1af28 49fd254c 1b4c45d0 a099f=
d3b  (...L%.I.EL.;...
Sep 05 03:08:17 szarotka kernel: 00000000: 9f13353a 8420360b d9258e1c ca93e=
e27  :5...6 ...%.'...
Sep 05 03:08:17 szarotka kernel: 00000000: 17891f5e ea04d20c 9f13353a 84203=
60b  ^.......:5...6 .
Sep 05 03:08:17 szarotka kernel: 00000000: 2838e7f6 e2cb6440 d8fd5646 e9933=
599  ..8(@d..FV...5..
Sep 05 03:08:17 szarotka kernel: 00000000: 2838e7f6 e2cb6440 2838e7f6 e2cb6=
440  ..8(@d....8(@d..
Sep 05 03:08:17 szarotka kernel: 00000000: ad5fed54 08d1aac1 19541975 36fa1=
b8e  T._.....u.T....6
Sep 05 03:08:17 szarotka kernel: 00000000: ad5fed54 08d1aac1 ad5fed54 08d1a=
ac1  T._.....T._.....
Sep 05 03:08:17 szarotka kernel: 00000000: d9c6b7b2 44b964fb 32979184 3ba35=
03d  .....d.D...2=3DP.;
Sep 05 03:08:17 szarotka kernel: 00000000: 19cc86bd 4b9890ba d9c6b7b2 44b96=
4fb  .......K.....d.D
Sep 05 03:08:17 szarotka kernel: 00000000: 4422ea11 d5cc897e a64078cd a5638=
233  .."D~....x@.3.c.
Sep 05 03:08:17 szarotka kernel: 00000000: bb1b6597 4acbe629 4422ea11 d5cc8=
97e  .e..)..J.."D~...
Sep 05 03:08:17 szarotka kernel: 00000000: 38785248 bf77af96 3830e943 a6d62=
fb1  HRx8..w.C.08./..
Sep 05 03:08:17 szarotka kernel: 00000000: be4f22d3 8e8546e1 38785248 bf77a=
f96  ."O..F..HRx8..w.
Sep 05 03:08:17 szarotka kernel: 00000000: c47e13e4 b440ee82 d2291928 0a314=
526  ..~...@.(.).&E1.
Sep 05 03:08:17 szarotka kernel: 00000000: 2cbb2788 16793d0c c47e13e4 b440e=
e82  .'.,.=3Dy...~...@.
Sep 05 03:08:17 szarotka kernel: 00000000: 571c4c08 7b9a8cf5 6ce3a7a5 15b4c=
3a7  .L.W...{...l....
Sep 05 03:08:17 szarotka kernel: 00000000: 5f02e08a 7d3e55d0 571c4c08 7b9a8=
cf5  ..._.U>}.L.W...{
Sep 05 03:08:17 szarotka kernel: 00000000: d09d45e1 324f19bc c25030d8 c11f6=
f14  .E....O2.0P..o..
Sep 05 03:08:17 szarotka kernel: 00000000: 6fc61868 989978ab d09d45e1 324f1=
9bc  h..o.x...E....O2
Sep 05 03:08:17 szarotka kernel: 00000000: 19ff4008 d6c54cbb d5335d52 08bfa=
c65  .@...L..R]3.e...
Sep 05 03:08:17 szarotka kernel: 00000000: 19ff4008 d6c54cbb 19ff4008 d6c54=
cbb  .@...L...@...L..
Sep 05 03:08:17 szarotka kernel: 00000000: bce9f950 5fc229a3 70bd9513 58dbc=
a34  P....)._...p4..X
Sep 05 03:08:17 szarotka kernel: 00000000: bce9f950 5fc229a3 bce9f950 5fc22=
9a3  P....)._P....)._
Sep 05 03:08:17 szarotka kernel: 00000000: 4e8a15f8 45efb183 386e43c4 5b9da=
9cd  ...N...E.Cn8...[
Sep 05 03:08:17 szarotka kernel: 00000000: b186f67c 61729e23 4e8a15f8 45efb=
183  |...#.ra...N...E
Sep 05 03:08:17 szarotka kernel: 00000000: eb97adde 173b2285 46fb0e0a fa083=
99e  .....";....F.9..
Sep 05 03:08:17 szarotka kernel: 00000000: eb97adde 173b2285 eb97adde 173b2=
285  .....";......";.
Sep 05 03:08:17 szarotka kernel: 00000000: 1bc5a9c5 88eaa199 02db0282 aa01d=
d01  ................
Sep 05 03:08:17 szarotka kernel: 00000000: 1bc5a9c5 88eaa199 1bc5a9c5 88eaa=
199  ................
Sep 05 03:08:17 szarotka kernel: 00000000: 659addd7 de404a6a 995a0d63 7c5cd=
dc3  ...ejJ@.c.Z...\|
Sep 05 03:08:17 szarotka kernel: 00000000: 659addd7 de404a6a 659addd7 de404=
a6a  ...ejJ@....ejJ@.
Sep 05 03:08:17 szarotka kernel: 00000000: f95c812b 90b5a52a fe637b57 e2834=
e4d  +.\.*...W{c.MN..
Sep 05 03:08:17 szarotka kernel: 00000000: f95c812b 90b5a52a f95c812b 90b5a=
52a  +.\.*...+.\.*...
Sep 05 03:08:17 szarotka kernel: 00000000: 26eaef26 1a07aa68 a163d05e e179c=
9a8  &..&h...^.c...y.
Sep 05 03:08:17 szarotka kernel: 00000000: 26eaef26 1a07aa68 26eaef26 1a07a=
a68  &..&h...&..&h...
Sep 05 03:08:17 szarotka kernel: 00000000: 73021314 0512f218 a2468e95 4f158=
659  ...s......F.Y..O
Sep 05 03:08:17 szarotka kernel: 00000000: 73021314 0512f218 73021314 0512f=
218  ...s.......s....
Sep 05 03:08:17 szarotka kernel: 00000000: d52e49d4 3a8b6e03 dddfde2b c0e7b=
03f  .I...n.:+...?...
Sep 05 03:08:17 szarotka kernel: 00000000: d52e49d4 3a8b6e03 d52e49d4 3a8b6=
e03  .I...n.:.I...n.:
Sep 05 03:08:17 szarotka kernel: 00000000: b2657360 922b5a7e 3da594d6 c2921=
797  `se.~Z+....=3D....
Sep 05 03:08:17 szarotka kernel: 00000000: b2657360 922b5a7e b2657360 922b5=
a7e  `se.~Z+.`se.~Z+.
Sep 05 03:08:17 szarotka kernel: 00000000: e518b69f 5cc2a1cf 1edff755 f2669=
425  .......\U...%.f.
Sep 05 03:08:17 szarotka kernel: 00000000: e518b69f 5cc2a1cf e518b69f 5cc2a=
1cf  .......\.......\
Sep 05 03:08:17 szarotka kernel: 00000000: 31954570 c90e8abe 78c739cc 62fdc=
69a  pE.1.....9.x...b
Sep 05 03:08:17 szarotka kernel: 00000000: 7c3fffaa 1936f961 31954570 c90e8=
abe  ..?|a.6.pE.1....
Sep 05 03:08:17 szarotka kernel: 00000000: 4093a278 400f35f4 d6d52470 5a1af=
2ca  x..@.5.@p$.....Z
Sep 05 03:08:17 szarotka kernel: 00000000: b1e8cdcd 1ebad691 4093a278 400f3=
5f4  ........x..@.5.@
Sep 05 03:08:17 szarotka kernel: 00000000: b621e5ea 35457fd3 be33e9ad 062cd=
96c  ..!...E5..3.l.,.
Sep 05 03:08:17 szarotka kernel: 00000000: 2dc9981d 3a10448d b621e5ea 35457=
fd3  ...-.D.:..!...E5
Sep 05 03:08:17 szarotka kernel: 00000000: 80622d21 683d47fd cb7a84be fd6d4=
f03  !-b..G=3Dh..z..Om.
Sep 05 03:08:17 szarotka kernel: 00000000: 383a703d be38aba4 80622d21 683d4=
7fd  =3Dp:8..8.!-b..G=3Dh
Sep 05 03:08:17 szarotka kernel: 00000000: 08c28cd4 462fe335 b224d7d5 ee176=
a3e  ....5./F..$.>j..
Sep 05 03:08:17 szarotka kernel: 00000000: 896390d8 89f4d639 08c28cd4 462fe=
335  ..c.9.......5./F
Sep 05 03:08:17 szarotka kernel: 00000000: 8a870447 9f1cabeb 689f2f0f ae5fb=
bf8  G......../.h.._.
Sep 05 03:08:17 szarotka kernel: 00000000: 69de920f dcd1926b 8a870447 9f1ca=
beb  ...ik...G.......
Sep 05 03:08:17 szarotka kernel: 00000000: 12ee5239 98ecfc02 d9563b38 878a7=
e9c  9R......8;V..~..
Sep 05 03:08:17 szarotka kernel: 00000000: f98c8b55 3869d2de 12ee5239 98ecf=
c02  U.....i89R......
Sep 05 03:08:17 szarotka kernel: 00000000: 38f21b23 9dc5781f f0800fa6 98dbc=
b38  #..8.x......8...
Sep 05 03:08:17 szarotka kernel: 00000000: d1c388a9 e7dbce94 38f21b23 9dc57=
81f  ........#..8.x..
Sep 05 03:08:17 szarotka kernel: 00000000: 0d2d029d 32fb1251 067eabbd 5d9fb=
a4e  ..-.Q..2..~.N..]
Sep 05 03:08:17 szarotka kernel: 00000000: a03151f6 07792773 0d2d029d 32fb1=
251  .Q1.s'y...-.Q..2
Sep 05 03:08:17 szarotka kernel: 00000000: 582c714c 4f01b823 ac42b130 6aebf=
c81  Lq,X#..O0.B....j
Sep 05 03:08:17 szarotka kernel: 00000000: c47740fa ce52d257 582c714c 4f01b=
823  .@w.W.R.Lq,X#..O
Sep 05 03:08:17 szarotka kernel: 00000000: 42d7457b 0d1f4f33 1fed6780 c2cdf=
24e  {E.B3O...g..N...
Sep 05 03:08:17 szarotka kernel: 00000000: 0ba20ed2 0fbad62a 42d7457b 0d1f4=
f33  ....*...{E.B3O..
Sep 05 03:08:17 szarotka kernel: 00000000: 94564425 9f30da21 ca884af8 02980=
57f  %DV.!.0..J......
Sep 05 03:08:17 szarotka kernel: 00000000: 94564425 9f30da21 94564425 9f30d=
a21  %DV.!.0.%DV.!.0.
Sep 05 03:08:17 szarotka kernel: 00000000: 67dfa864 c4ac38eb 98df01b1 56c42=
d40  d..g.8......@-.V
Sep 05 03:08:17 szarotka kernel: 00000000: 67dfa864 c4ac38eb 67dfa864 c4ac3=
8eb  d..g.8..d..g.8..
Sep 05 03:08:17 szarotka kernel: 00000000: 3025a0f7 45b29289 ac950f5e ab755=
97e  ..%0...E^...~Yu.
Sep 05 03:08:17 szarotka kernel: 00000000: 3025a0f7 45b29289 3025a0f7 45b29=
289  ..%0...E..%0...E
Sep 05 03:08:17 szarotka kernel: 00000000: 447db521 ef9d3751 850071cc cbbea=
5cc  !.}DQ7...q......
Sep 05 03:08:17 szarotka kernel: 00000000: 447db521 ef9d3751 447db521 ef9d3=
751  !.}DQ7..!.}DQ7..
Sep 05 03:08:17 szarotka kernel: 00000000: 260fb9f4 0324af63 e4418360 9896f=
ed7  ...&c.$.`.A.....
Sep 05 03:08:17 szarotka kernel: 00000000: 260fb9f4 0324af63 260fb9f4 0324a=
f63  ...&c.$....&c.$.
Sep 05 03:08:17 szarotka kernel: 00000000: d15ea2ee dc7478cf 8096b729 a05c8=
a1f  ..^..xt.).....\.
Sep 05 03:08:17 szarotka kernel: 00000000: d15ea2ee dc7478cf d15ea2ee dc747=
8cf  ..^..xt...^..xt.
Sep 05 03:08:17 szarotka kernel: 00000000: d8cc4a04 61ba9dbc d3deb2fc 7c185=
1e3  .J.....a.....Q.|
Sep 05 03:08:17 szarotka kernel: 00000000: 8f378cd5 113836f0 d8cc4a04 61ba9=
dbc  ..7..68..J.....a
Sep 05 03:08:17 szarotka kernel: 00000000: d94e5d6c b4c8e655 dc8d9a39 858d9=
70e  l]N.U...9.......
Sep 05 03:08:17 szarotka kernel: 00000000: d94e5d6c b4c8e655 d94e5d6c b4c8e=
655  l]N.U...l]N.U...
Sep 05 03:08:17 szarotka kernel: 00000000: ed95b0eb 6f121b9f 51ef36e9 22bdd=
569  .......o.6.Qi.."
Sep 05 03:08:17 szarotka kernel: 00000000: ed95b0eb 6f121b9f ed95b0eb 6f121=
b9f  .......o.......o
Sep 05 03:08:17 szarotka kernel: 00000000: fde8efc9 63c11833 b071c274 43419=
614  ....3..ct.q...AC
Sep 05 03:08:17 szarotka kernel: 00000000: 6c89ee32 5e2584a4 fde8efc9 63c11=
833  2..l..%^....3..c
Sep 05 03:08:17 szarotka kernel: 00000000: 33168b83 b5d54b07 25dd8925 03c36=
4eb  ...3.K..%..%.d..
Sep 05 03:08:17 szarotka kernel: 00000000: 8524f7f5 96d70136 33168b83 b5d54=
b07  ..$.6......3.K..
Sep 05 03:08:17 szarotka kernel: 00000000: 6e187c1c 7f5df0ec 2dff5724 3549e=
aed  .|.n..].$W.-..I5
Sep 05 03:08:17 szarotka kernel: 00000000: 6e187c1c 7f5df0ec 6e187c1c 7f5df=
0ec  .|.n..]..|.n..].
Sep 05 03:08:17 szarotka kernel: 00000000: 7d10462e f28501c8 1872eebe 40b91=
ccc  .F.}......r....@
Sep 05 03:08:17 szarotka kernel: 00000000: 7d10462e f28501c8 7d10462e f2850=
1c8  .F.}.....F.}....
Sep 05 03:08:17 szarotka kernel: 00000000: e35136a6 f0e56fbc 284b4b96 39750=
856  .6Q..o...KK(V.u9
Sep 05 03:08:17 szarotka kernel: 00000000: da8b6d36 b99148c6 e35136a6 f0e56=
fbc  6m...H...6Q..o..
Sep 05 03:08:17 szarotka kernel: 00000000: 5884d60f 42742757 fef69db3 edfe7=
63d  ...XW'tB....=3Dv..
Sep 05 03:08:17 szarotka kernel: 00000000: 5884d60f 42742757 5884d60f 42742=
757  ...XW'tB...XW'tB
Sep 05 03:08:17 szarotka kernel: 00000000: 349a6145 ba40dbfe aa48f8b6 2f776=
f5b  Ea.4..@...H.[ow/
Sep 05 03:08:17 szarotka kernel: 00000000: 349a6145 ba40dbfe 349a6145 ba40d=
bfe  Ea.4..@.Ea.4..@.
Sep 05 03:08:17 szarotka kernel: 00000000: 22c27cc5 a41584ed 6287ba61 26075=
d70  .|."....a..bp].&
Sep 05 03:08:17 szarotka kernel: 00000000: 22c27cc5 a41584ed 22c27cc5 a4158=
4ed  .|.".....|."....
Sep 05 03:08:17 szarotka kernel: 00000000: 68619341 4f00761c 90433aad 54f48=
24d  A.ah.v.O.:C.M..T
Sep 05 03:08:17 szarotka kernel: 00000000: 68619341 4f00761c 68619341 4f007=
61c  A.ah.v.OA.ah.v.O
Sep 05 03:08:17 szarotka kernel: 00000000: 7e5b9f9f 2aeebd15 657562f9 563ec=
b0a  ..[~...*.bue..>V
Sep 05 03:08:17 szarotka kernel: 00000000: 7e5b9f9f 2aeebd15 7e5b9f9f 2aeeb=
d15  ..[~...*..[~...*
Sep 05 03:08:17 szarotka kernel: 00000000: f9268ef6 251dce3d 26d281f6 40036=
2e9  ..&.=3D..%...&.b.@
Sep 05 03:08:17 szarotka kernel: 00000000: 043d8dfa 48a1d998 f9268ef6 251dc=
e3d  ..=3D....H..&.=3D..%
Sep 05 03:08:17 szarotka kernel: 00000000: f8dbd5d7 89deaf15 2595f774 13f6f=
43e  ........t..%>...
Sep 05 03:08:17 szarotka kernel: 00000000: e688b17b 7be2be6e f8dbd5d7 89dea=
f15  {...n..{........
Sep 05 03:08:17 szarotka kernel: 00000000: 57524c34 fd499790 2a36414c 80894=
917  4LRW..I.LA6*.I..
Sep 05 03:08:17 szarotka kernel: 00000000: 5fafde47 6ace01a8 57524c34 fd499=
790  G.._...j4LRW..I.
Sep 05 03:08:17 szarotka kernel: 00000000: 18074332 1f0964d3 1ad32d78 d558b=
e9f  2C...d..x-....X.
Sep 05 03:08:17 szarotka kernel: 00000000: 18074332 1f0964d3 18074332 1f096=
4d3  2C...d..2C...d..
Sep 05 03:08:17 szarotka kernel: 00000000: ef3d7281 d7421b09 c39ba85b 02e93=
9ea  .r=3D...B.[....9..
Sep 05 03:08:17 szarotka kernel: 00000000: ef3d7281 d7421b09 ef3d7281 d7421=
b09  .r=3D...B..r=3D...B.
Sep 05 03:08:17 szarotka kernel: 00000000: e4be6d38 1a5efaed fcd089ae d4799=
fd0  8m....^.......y.
Sep 05 03:08:17 szarotka kernel: 00000000: e4be6d38 1a5efaed e4be6d38 1a5ef=
aed  8m....^.8m....^.
Sep 05 03:08:17 szarotka kernel: 00000000: 1d45d52b 9341bdfe 5214f632 9f74a=
bac  +.E...A.2..R..t.
Sep 05 03:08:17 szarotka kernel: 00000000: ccfcc2cd af1e12af 1d45d52b 9341b=
dfe  ........+.E...A.
Sep 05 03:08:17 szarotka kernel: 00000000: a52f9e75 4e47aa97 408d7b6c 69dc0=
85d  u./...GNl{.@]..i
Sep 05 03:08:17 szarotka kernel: 00000000: 1625a410 40368cdb a52f9e75 4e47a=
a97  ..%...6@u./...GN
Sep 05 03:08:17 szarotka kernel: 00000000: 965ad26c 7d4de486 ff5d533a a9b1f=
c9e  l.Z...M}:S].....
Sep 05 03:08:17 szarotka kernel: 00000000: d05e1aed a1fbbdc1 965ad26c 7d4de=
486  ..^.....l.Z...M}
Sep 05 03:08:17 szarotka kernel: 00000000: 4a97228b adef4fea 445df772 f908f=
92c  .".J.O..r.]D,...
Sep 05 03:08:17 szarotka kernel: 00000000: 4a97228b adef4fea 4a97228b adef4=
fea  .".J.O...".J.O..
Sep 05 03:08:17 szarotka kernel: 00000000: c281a4b6 c5660b40 0c5eff3a d5a8a=
9eb  ....@.f.:.^.....
Sep 05 03:08:17 szarotka kernel: 00000000: 4c9e345c 7dad7a27 c281a4b6 c5660=
b40  \4.L'z.}....@.f.
Sep 05 03:08:17 szarotka kernel: 00000000: 717cd351 f68e0c8f 0a6f0d20 c0b81=
7fd  Q.|q.... .o.....
Sep 05 03:08:17 szarotka kernel: 00000000: b69890d2 56a176ce 717cd351 f68e0=
c8f  .....v.VQ.|q....
Sep 05 03:08:17 szarotka kernel: 00000000: 8593e8b8 d1aec401 dcd30fd9 e84da=
63f  ............?.M.
Sep 05 03:08:17 szarotka kernel: 00000000: 2c9bd14f 586a8976 8593e8b8 d1aec=
401  O..,v.jX........
Sep 05 03:08:17 szarotka kernel: 00000000: 3c7864cc 4baf3cae 2b1a7700 c8eb5=
1a4  .dx<.<.K.w.+.Q..
Sep 05 03:08:17 szarotka kernel: 00000000: bffc5997 865ec828 3c7864cc 4baf3=
cae  .Y..(.^..dx<.<.K
Sep 05 03:08:17 szarotka kernel: 00000000: b191af47 e57b0eeb 24b4af64 57d90=
052  G.....{.d..$R..W
Sep 05 03:08:17 szarotka kernel: 00000000: 10c2c7ea 81729866 b191af47 e57b0=
eeb  ....f.r.G.....{.
Sep 05 03:08:17 szarotka kernel: 00000000: 821a46a9 96c8983e 13aa7727 5d962=
34f  .F..>...'w..O#.]
Sep 05 03:08:17 szarotka kernel: 00000000: b333dd5a cfaa7631 821a46a9 96c89=
83e  Z.3.1v...F..>...
Sep 05 03:08:17 szarotka kernel: 00000000: 21e80c3b fe72aec1 258e502e d4d33=
614  ;..!..r..P.%.6..
Sep 05 03:08:17 szarotka kernel: 00000000: b3be3e40 47ddcd5f 21e80c3b fe72a=
ec1  @>.._..G;..!..r.
Sep 05 03:08:17 szarotka kernel: 00000000: 8c83eb26 3aadc1a1 3962fe86 923cc=
321  &......:..b9!.<.
Sep 05 03:08:17 szarotka kernel: 00000000: cabf4fdc b0eaac32 8c83eb26 3aadc=
1a1  .O..2...&......:
Sep 05 03:08:17 szarotka kernel: 00000000: 8cf8bacc 252c68f8 6c6a36d9 466ab=
309  .....h,%.6jl..jF
Sep 05 03:08:17 szarotka kernel: 00000000: 8cf8bacc 252c68f8 8cf8bacc 252c6=
8f8  .....h,%.....h,%
Sep 05 03:08:17 szarotka kernel: 00000000: 3985e88e 6bc0a1ba abc2d0d7 5384c=
81f  ...9...k.......S
Sep 05 03:08:17 szarotka kernel: 00000000: 3985e88e 6bc0a1ba 3985e88e 6bc0a=
1ba  ...9...k...9...k
Sep 05 03:08:17 szarotka kernel: 00000000: 0eed2f2a a106edb9 4e89dab4 d88e9=
d17  */.........N....
Sep 05 03:08:17 szarotka kernel: 00000000: 0eed2f2a a106edb9 0eed2f2a a106e=
db9  */......*/......
Sep 05 03:08:17 szarotka kernel: 00000000: d349780b 78b6d156 84eb0187 fb4b6=
359  .xI.V..x....YcK.
Sep 05 03:08:17 szarotka kernel: 00000000: d349780b 78b6d156 d349780b 78b6d=
156  .xI.V..x.xI.V..x
Sep 05 03:08:17 szarotka kernel: 00000000: ca9d4207 f18c5418 8147f586 55184=
17f  .B...T....G..A.U
Sep 05 03:08:17 szarotka kernel: 00000000: ca9d4207 f18c5418 ca9d4207 f18c5=
418  .B...T...B...T..
Sep 05 03:08:17 szarotka kernel: 00000000: 4b5e5f6f 6bbdb3c6 fb7a488b ec61c=
56a  o_^K...k.Hz.j.a.
Sep 05 03:08:17 szarotka kernel: 00000000: 4b5e5f6f 6bbdb3c6 4b5e5f6f 6bbdb=
3c6  o_^K...ko_^K...k
Sep 05 03:08:17 szarotka kernel: 00000000: 16bd911e 1fbfc121 c3b27a71 9db58=
46a  ....!...qz..j...
Sep 05 03:08:17 szarotka kernel: 00000000: 16bd911e 1fbfc121 16bd911e 1fbfc=
121  ....!.......!...
Sep 05 03:08:17 szarotka kernel: 00000000: 6b763731 27ac2017 bea571a4 89214=
8b0  17vk. .'.q...H!.
Sep 05 03:08:17 szarotka kernel: 00000000: 6b763731 27ac2017 6b763731 27ac2=
017  17vk. .'17vk. .'
Sep 05 03:08:17 szarotka kernel: 00000000: ac5e053f fff9d290 fcdd07d6 41ce9=
d5a  ?.^.........Z..A
Sep 05 03:08:17 szarotka kernel: 00000000: ac5e053f fff9d290 ac5e053f fff9d=
290  ?.^.....?.^.....
Sep 05 03:08:17 szarotka kernel: 00000000: 97adca69 d493f950 557719b0 737ef=
882  i...P.....wU..~s
Sep 05 03:08:17 szarotka kernel: 00000000: 97adca69 d493f950 97adca69 d493f=
950  i...P...i...P...
Sep 05 03:08:17 szarotka kernel: 00000000: 14971521 6fb20aee 3903af72 f911d=
859  !......or..9Y...
Sep 05 03:08:17 szarotka kernel: 00000000: 14971521 6fb20aee 14971521 6fb20=
aee  !......o!......o
Sep 05 03:08:17 szarotka kernel: 00000000: 4676f9b1 49cf26c3 c91c9cad 6053e=
4bd  ..vF.&.I......S`
Sep 05 03:08:17 szarotka kernel: 00000000: f8bbbc63 523a31cd 4676f9b1 49cf2=
6c3  c....1:R..vF.&.I
Sep 05 03:08:17 szarotka kernel: 00000000: e2221c10 e167ac4d 50759b19 d356f=
dfd  ..".M.g...uP..V.
Sep 05 03:08:17 szarotka kernel: 00000000: e2221c10 e167ac4d e2221c10 e167a=
c4d  ..".M.g...".M.g.
Sep 05 03:08:17 szarotka kernel: 00000000: 170a64a9 46e04aba f0c1cb09 5074f=
c1d  .d...J.F......tP
Sep 05 03:08:17 szarotka kernel: 00000000: 170a64a9 46e04aba 170a64a9 46e04=
aba  .d...J.F.d...J.F
Sep 05 03:08:17 szarotka kernel: 00000000: 2d6033d3 270ae883 cc4cc036 db738=
3ba  .3`-...'6.L...s.
Sep 05 03:08:17 szarotka kernel: 00000000: d5560d44 b2db1ec7 2d6033d3 270ae=
883  D.V......3`-...'
Sep 05 03:08:17 szarotka kernel: 00000000: 21add343 6588ac93 ad75ff40 a79bc=
9a2  C..!...e@.u.....
Sep 05 03:08:17 szarotka kernel: 00000000: 21add343 6588ac93 21add343 6588a=
c93  C..!...eC..!...e
Sep 05 03:08:17 szarotka kernel: 00000000: 8ef683ea 5564e586 afa26643 f24e4=
5ea  ......dUCf...EN.
Sep 05 03:08:17 szarotka kernel: 00000000: 967c42d3 254a07c7 8ef683ea 5564e=
586  .B|...J%......dU
Sep 05 03:08:17 szarotka kernel: 00000000: e254a604 2c37ef22 2f90069b 27177=
c29  ..T.".7,.../)|.'
Sep 05 03:08:17 szarotka kernel: 00000000: fee875c3 3af9d010 e254a604 2c37e=
f22  .u.....:..T.".7,
Sep 05 03:08:17 szarotka kernel: 00000000: 5b01fb34 2e9d9375 273bc8e5 63fa4=
ddc  4..[u.....;'.M.c
Sep 05 03:08:17 szarotka kernel: 00000000: 5b01fb34 2e9d9375 5b01fb34 2e9d9=
375  4..[u...4..[u...
Sep 05 03:08:17 szarotka kernel: 00000000: b06544f1 b0a328cf 26102011 deca6=
5d2  .De..(... .&.e..
Sep 05 03:08:17 szarotka kernel: 00000000: b06544f1 b0a328cf b06544f1 b0a32=
8cf  .De..(...De..(..
Sep 05 03:08:17 szarotka kernel: 00000000: e4440c2e cc977a28 b45c08e7 afef7=
e5e  ..D.(z....\.^~..
Sep 05 03:08:17 szarotka kernel: 00000000: e4440c2e cc977a28 e4440c2e cc977=
a28  ..D.(z....D.(z..
Sep 05 03:08:17 szarotka kernel: 00000000: 97d6810b 79d6ce59 9e5e25bb 7a5dc=
ea0  ....Y..y.%^...]z
Sep 05 03:08:17 szarotka kernel: 00000000: 97d6810b 79d6ce59 97d6810b 79d6c=
e59  ....Y..y....Y..y
Sep 05 03:08:17 szarotka kernel: 00000000: a859991e 39422907 d1a9ee87 3eb1a=
31a  ..Y..)B9.......>
Sep 05 03:08:17 szarotka kernel: 00000000: a859991e 39422907 a859991e 39422=
907  ..Y..)B9..Y..)B9
Sep 05 03:08:17 szarotka kernel: 00000000: 3b43dad3 49eba16d f59e4315 ee8f9=
979  ..C;m..I.C..y...
Sep 05 03:08:17 szarotka kernel: 00000000: b9d4bf05 af19cb23 3b43dad3 49eba=
16d  ....#.....C;m..I
Sep 05 03:08:17 szarotka kernel: 00000000: 75ab111b 3ba4793a cb0cc2c7 43593=
1ef  ...u:y.;.....1YC
Sep 05 03:08:17 szarotka kernel: 00000000: 75ab111b 3ba4793a 75ab111b 3ba47=
93a  ...u:y.;...u:y.;
Sep 05 03:08:17 szarotka kernel: 00000000: 27425269 5323ecfc c8c87008 a7603=
c21  iRB'..#S.p..!<`.
Sep 05 03:08:17 szarotka kernel: 00000000: 27425269 5323ecfc 27425269 5323e=
cfc  iRB'..#SiRB'..#S
Sep 05 03:08:17 szarotka kernel: 00000000: d86cd30f 8ba4220f 7c02cca9 c3898=
b15  ..l..".....|....
Sep 05 03:08:17 szarotka kernel: 00000000: d86cd30f 8ba4220f d86cd30f 8ba42=
20f  ..l.."....l.."..
Sep 05 03:08:17 szarotka kernel: 00000000: 322991d7 5efc9429 8819eec1 68eb2=
f2d  ..)2)..^....-/.h
Sep 05 03:08:17 szarotka kernel: 00000000: cd0e5a83 a7b0db10 322991d7 5efc9=
429  .Z........)2)..^
Sep 05 03:08:17 szarotka kernel: 00000000: 65682968 ab969574 d5eadf3e 8ae6c=
03c  h)het...>...<...
Sep 05 03:08:17 szarotka kernel: 00000000: 65682968 ab969574 65682968 ab969=
574  h)het...h)het...
Sep 05 03:08:17 szarotka kernel: 00000000: a731b4eb 60377ffc 6e02fcf4 95355=
b3e  ..1...7`...n>[5.
Sep 05 03:08:17 szarotka kernel: 00000000: a731b4eb 60377ffc a731b4eb 60377=
ffc  ..1...7`..1...7`
Sep 05 03:08:17 szarotka kernel: 00000000: fbc240fc 8d797615 151a84a9 5ce9f=
b28  .@...vy.....(..\
Sep 05 03:08:17 szarotka kernel: 00000000: fbc240fc 8d797615 fbc240fc 8d797=
615  .@...vy..@...vy.
Sep 05 03:08:17 szarotka kernel: 00000000: 7fa45538 43776760 33f735b4 fb305=
70f  8U..`gwC.5.3.W0.
Sep 05 03:08:17 szarotka kernel: 00000000: 7fa45538 43776760 7fa45538 43776=
760  8U..`gwC8U..`gwC
Sep 05 03:08:17 szarotka kernel: 00000000: e3b348a2 891c3ff2 ef26fd35 1af6f=
7eb  .H...?..5.&.....
Sep 05 03:08:17 szarotka kernel: 00000000: 5850c0e6 9bd72568 e3b348a2 891c3=
ff2  ..PXh%...H...?..
Sep 05 03:08:17 szarotka kernel: 00000000: 2130b40a 6d1a1e78 6ad8a5bb dfa1f=
733  ..0!x..m...j3...
Sep 05 03:08:17 szarotka kernel: 00000000: 2130b40a 6d1a1e78 2130b40a 6d1a1=
e78  ..0!x..m..0!x..m
Sep 05 03:08:17 szarotka kernel: 00000000: d5e6442b e49b8288 47c65dae b09f3=
f31  +D.......].G1?..
Sep 05 03:08:17 szarotka kernel: 00000000: 18d79360 73cc3a8c d5e6442b e49b8=
288  `....:.s+D......
Sep 05 03:08:17 szarotka kernel: 00000000: d0707bd3 2fc6a675 7f73bf7e 107f9=
26e  .{p.u../~.s.n...
Sep 05 03:08:17 szarotka kernel: 00000000: d0707bd3 2fc6a675 d0707bd3 2fc6a=
675  .{p.u../.{p.u../
Sep 05 03:08:17 szarotka kernel: 00000000: ce9ccad8 4f87786d a958ea29 b57f4=
f6f  ....mx.O).X.oO..
Sep 05 03:08:17 szarotka kernel: 00000000: c7374ebf 62be24a6 ce9ccad8 4f877=
86d  .N7..$.b....mx.O
Sep 05 03:08:17 szarotka kernel: 00000000: b129fefb a1c6e4ff 2e9fd886 d227b=
eb4  ..)...........'.
Sep 05 03:08:17 szarotka kernel: 00000000: b129fefb a1c6e4ff b129fefb a1c6e=
4ff  ..).......).....
Sep 05 03:08:17 szarotka kernel: 00000000: 6248d9d4 f640fe8e f3b77c66 c8509=
c6a  ..Hb..@.f|..j.P.
Sep 05 03:08:17 szarotka kernel: 00000000: 6248d9d4 f640fe8e 6248d9d4 f640f=
e8e  ..Hb..@...Hb..@.
Sep 05 03:08:32 szarotka kernel: 00000000: cbb754ad da66d9ff f2903324 0e4cf=
041  .T....f.$3..A.L.
Sep 05 03:08:32 szarotka kernel: 00000000: cbb754ad da66d9ff cbb754ad da66d=
9ff  .T....f..T....f.
Sep 05 03:08:32 szarotka kernel: 00000000: 884a39e2 065c9c8a 684c6b4f 46274=
5c8  .9J...\.OkLh.E'F
Sep 05 03:08:32 szarotka kernel: 00000000: 884a39e2 065c9c8a 884a39e2 065c9=
c8a  .9J...\..9J...\.
Sep 05 03:08:32 szarotka kernel: 00000000: 8e45decb 787063fb 294f3db4 8e582=
f2a  ..E..cpx.=3DO)*/X.
Sep 05 03:08:32 szarotka kernel: 00000000: 8e45decb 787063fb 8e45decb 78706=
3fb  ..E..cpx..E..cpx
Sep 05 03:08:32 szarotka sudo[9893]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 03:08:32 szarotka kernel: 00000000: 6dc00315 c0b3c855 841ed5b5 fccb3=
7ac  ...mU........7..
Sep 05 03:08:32 szarotka kernel: 00000000: 6dc00315 c0b3c855 6dc00315 c0b3c=
855  ...mU......mU...
Sep 05 03:08:32 szarotka kernel: 00000000: f6bd14c2 3813e7c9 8bffd0e1 179b7=
650  .......8....Pv..
Sep 05 03:08:32 szarotka kernel: 00000000: f6bd14c2 3813e7c9 f6bd14c2 3813e=
7c9  .......8.......8
Sep 05 03:08:32 szarotka kernel: 00000000: a7120728 3c51844e b6293066 6ab76=
53c  (...N.Q<f0).<e.j
Sep 05 03:08:32 szarotka kernel: 00000000: a7120728 3c51844e a7120728 3c518=
44e  (...N.Q<(...N.Q<
Sep 05 03:08:34 szarotka sudo[9895]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/umount /tmp/owo
Sep 05 03:08:34 szarotka sudo[9895]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 03:08:34 szarotka kernel: 00000000: 2dbbb533 5f65f0cb e9eac534 ed744=
4a4  3..-..e_4....Dt.
Sep 05 03:08:34 szarotka kernel: 00000000: 2dbbb533 5f65f0cb 2dbbb533 5f65f=
0cb  3..-..e_3..-..e_
Sep 05 03:08:34 szarotka kernel: 00000000: aeb5d468 da6ccc09 8a03a862 0dba9=
a7b  h.....l.b...{...
Sep 05 03:08:34 szarotka kernel: 00000000: aeb5d468 da6ccc09 aeb5d468 da6cc=
c09  h.....l.h.....l.
Sep 05 03:08:34 szarotka systemd[681]: tmp-owo.mount: Succeeded.
Sep 05 03:08:34 szarotka systemd[1]: tmp-owo.mount: Succeeded.
Sep 05 03:08:34 szarotka kernel: 00000000: 5a88c04a 71291bcd 5dca380c 59d07=
956  J..Z..)q.8.]Vy.Y
Sep 05 03:08:34 szarotka kernel: 00000000: 5a88c04a 71291bcd 5a88c04a 71291=
bcd  J..Z..)qJ..Z..)q
Sep 05 03:08:34 szarotka kernel: 00000000: b5f3d6c0 7cd3c5c4 cd51f1e3 90f36=
1d9  .......|..Q..a..
Sep 05 03:08:34 szarotka kernel: 00000000: b5f3d6c0 7cd3c5c4 b5f3d6c0 7cd3c=
5c4  .......|.......|
Sep 05 03:08:34 szarotka sudo[9895]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 03:08:35 szarotka sudo[9899]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/sbin/rmmod cifs
Sep 05 03:08:35 szarotka sudo[9899]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 03:08:35 szarotka kernel: Key type cifs.idmap unregistered
Sep 05 03:08:35 szarotka kernel: Key type cifs.spnego unregistered
Sep 05 03:08:35 szarotka kernel: FS-Cache: Netfs 'cifs' unregistered from c=
aching
Sep 05 03:08:35 szarotka sudo[9899]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 03:08:38 szarotka sshd[9869]: Received disconnect from 192.168.1.250=
 port 49250:11: disconnected by user
Sep 05 03:08:38 szarotka sshd[9869]: Disconnected from user nabijaczleweli =
192.168.1.250 port 49250
Sep 05 03:08:38 szarotka sshd[9863]: pam_unix(sshd:session): session closed=
 for user nabijaczleweli
Sep 05 03:08:38 szarotka systemd-logind[592]: Session 28 logged out. Waitin=
g for processes to exit.
Sep 05 03:08:38 szarotka sudo[9891]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 03:08:38 szarotka systemd[1]: session-28.scope: Succeeded.
Sep 05 03:08:38 szarotka systemd-logind[592]: Removed session 28.
Sep 05 03:09:22 szarotka sshd[9903]: Accepted publickey for nabijaczleweli =
=66rom 192.168.1.250 port 49262 ssh2: RSA SHA256:b9IWedWj34KhQwmtDAJn3BWb56=
vRpLUfMjDEsuukuZw
Sep 05 03:09:22 szarotka sshd[9903]: pam_unix(sshd:session): session opened=
 for user nabijaczleweli by (uid=3D0)
Sep 05 03:09:22 szarotka systemd-logind[592]: New session 29 of user nabija=
czleweli.
Sep 05 03:09:22 szarotka systemd[1]: Started Session 29 of user nabijaczlew=
eli.
Sep 05 03:09:35 szarotka sudo[9918]: pam_unix(sudo:auth): Couldn't open /et=
c/securetty: No such file or directory
Sep 05 03:09:39 szarotka sudo[9918]: pam_unix(sudo:auth): Couldn't open /et=
c/securetty: No such file or directory
Sep 05 03:09:39 szarotka sudo[9918]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl -e
Sep 05 03:09:39 szarotka sudo[9918]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 03:09:56 szarotka sudo[9918]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 03:10:08 szarotka sudo[9927]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl --since S=
ep 05 03:08:06
Sep 05 03:10:08 szarotka sudo[9927]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)
Sep 05 03:10:08 szarotka sudo[9927]: pam_unix(sudo:session): session closed=
 for user root
Sep 05 03:10:13 szarotka sudo[9929]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D/=
home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl --since 0=
3:08:06
Sep 05 03:10:13 szarotka sudo[9929]: pam_unix(sudo:session): session opened=
 for user root by nabijaczleweli(uid=3D0)

--xta6vuywnarozrzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=journal+dump+cmd+all
Content-Transfer-Encoding: quoted-printable

-- Logs begin at Tue 2020-04-21 03:43:27 CEST, end at Sun 2020-09-06 00:21:=
55 CEST. --
Sep 06 00:08:56 szarotka sudo[17853]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D=
/home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/sbin/mount.cifs //tarta=
/1200-S121 /tmp/owo/ -o vers=3D1.0,user=3D1200-S121,pass=3D1200-S121
Sep 06 00:08:56 szarotka sudo[17853]: pam_unix(sudo:session): session opene=
d for user root by nabijaczleweli(uid=3D0)
Sep 06 00:08:56 szarotka kernel: CIFS: Attempting to mount //tarta/1200-S121
Sep 06 00:08:56 szarotka kernel: CIFS VFS: Use of the less secure dialect v=
ers=3D1.0 is not recommended unless required for access to very old servers
Sep 06 00:08:56 szarotka kernel: 00000000: 77d6a5c4 2e21cdee 634b0214 edd34=
98f  ...w..!...Kc.I..
Sep 06 00:08:56 szarotka kernel: 00000000: 77d6a5c4 2e21cdee 77d6a5c4 2e21c=
dee  ...w..!....w..!.
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x75
Sep 06 00:08:56 szarotka kernel: 00000000: dabbc2c6 3b09a58c 15a6ce94 7e4ff=
e5d  .......;....].O~
Sep 06 00:08:56 szarotka kernel: 00000000: dabbc2c6 3b09a58c dabbc2c6 3b09a=
58c  .......;.......;
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x75
Sep 06 00:08:56 szarotka kernel: 00000000: 7baecd67 2197cf11 744ccdba 1cee4=
55d  g..{...!..Lt]E..
Sep 06 00:08:56 szarotka kernel: 00000000: 7baecd67 2197cf11 7baecd67 2197c=
f11  g..{...!g..{...!
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:08:56 szarotka kernel: 00000000: 3c7eb06e 81dd8311 4110511e cdbe7=
e28  n.~<.....Q.A(~..
Sep 06 00:08:56 szarotka kernel: 00000000: 3c7eb06e 81dd8311 3c7eb06e 81dd8=
311  n.~<....n.~<....
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:08:56 szarotka kernel: 00000000: b086cb63 b6ac30f3 be3f706b 288b6=
d49  c....0..kp?.Im.(
Sep 06 00:08:56 szarotka kernel: 00000000: b086cb63 b6ac30f3 b086cb63 b6ac3=
0f3  c....0..c....0..
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:08:56 szarotka kernel: 00000000: a91f4ced 1b208bc2 829e36f8 4ef83=
11f  .L.... ..6...1.N
Sep 06 00:08:56 szarotka kernel: 00000000: a91f4ced 1b208bc2 a91f4ced 1b208=
bc2  .L.... ..L.... .
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:08:56 szarotka kernel: 00000000: c52f4521 84be3111 5f574488 24b12=
bec  !E/..1...DW_.+.$
Sep 06 00:08:56 szarotka kernel: 00000000: c52f4521 84be3111 c52f4521 84be3=
111  !E/..1..!E/..1..
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:08:56 szarotka kernel: 00000000: 19827ae2 c7b96076 24a13937 a56fd=
127  .z..v`..79.$'.o.
Sep 06 00:08:56 szarotka kernel: 00000000: 19827ae2 c7b96076 19827ae2 c7b96=
076  .z..v`...z..v`..
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:08:56 szarotka kernel: 00000000: 1af71bee 89bc03c6 db710bf0 e553f=
08b  ..........q...S.
Sep 06 00:08:56 szarotka kernel: 00000000: 1af71bee 89bc03c6 1af71bee 89bc0=
3c6  ................
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:08:56 szarotka kernel: 00000000: 5039f811 90664730 deffe324 3c1cd=
c86  ..9P0Gf.$......<
Sep 06 00:08:56 szarotka kernel: 00000000: 5039f811 90664730 5039f811 90664=
730  ..9P0Gf...9P0Gf.
Sep 06 00:08:56 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:08:56 szarotka sudo[17853]: pam_unix(sudo:session): session close=
d for user root
Sep 06 00:09:06 szarotka sudo[17858]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D=
/home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl -f
Sep 06 00:09:06 szarotka sudo[17858]: pam_unix(sudo:session): session opene=
d for user root by nabijaczleweli(uid=3D0)
Sep 06 00:09:12 szarotka sudo[17860]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D=
/home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/sbin/chroot /tmp/owo/
Sep 06 00:09:12 szarotka sudo[17860]: pam_unix(sudo:session): session opene=
d for user root by nabijaczleweli(uid=3D0)
Sep 06 00:09:12 szarotka kernel: 00000000: 56a07070 f0f82afe c2ebc662 ec116=
944  pp.V.*..b...Di..
Sep 06 00:09:12 szarotka kernel: 00000000: 56a07070 f0f82afe 56a07070 f0f82=
afe  pp.V.*..pp.V.*..
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:09:12 szarotka kernel: 00000000: d7f37274 84845c29 d12bcac4 45a68=
472  tr..)\....+.r..E
Sep 06 00:09:12 szarotka kernel: 00000000: d7f37274 84845c29 d7f37274 84845=
c29  tr..)\..tr..)\..
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:09:12 szarotka kernel: 00000000: 1e91d8d0 39bb3983 2a60d291 dc7f6=
f86  .....9.9..`*.o..
Sep 06 00:09:12 szarotka kernel: 00000000: 1e91d8d0 39bb3983 1e91d8d0 39bb3=
983  .....9.9.....9.9
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:09:12 szarotka kernel: 00000000: 3ba0e1a9 b4f23062 b4b0107b 853a3=
b81  ...;b0..{....;:.
Sep 06 00:09:12 szarotka kernel: 00000000: 3ba0e1a9 b4f23062 3ba0e1a9 b4f23=
062  ...;b0.....;b0..
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:09:12 szarotka kernel: 00000000: 56c9c8b5 81a40152 5d059ddc e2157=
3fc  ...VR......].s..
Sep 06 00:09:12 szarotka kernel: 00000000: 56c9c8b5 81a40152 56c9c8b5 81a40=
152  ...VR......VR...
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:09:12 szarotka kernel: 00000000: 8e0d94ef 8c421424 c61578d2 226e0=
42e  ....$.B..x....n"
Sep 06 00:09:12 szarotka kernel: 00000000: 8e0d94ef 8c421424 8e0d94ef 8c421=
424  ....$.B.....$.B.
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:09:12 szarotka kernel: 00000000: 20c59b37 3faef478 61d5581a 470b9=
950  7.. x..?.X.aP..G
Sep 06 00:09:12 szarotka kernel: 00000000: 20c59b37 3faef478 20c59b37 3faef=
478  7.. x..?7.. x..?
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:09:12 szarotka kernel: 00000000: 0ab45184 f662b143 46edaa0e 6b24c=
798  .Q..C.b....F..$k
Sep 06 00:09:12 szarotka kernel: 00000000: 67853960 d38f76ca 0ab45184 f662b=
143  `9.g.v...Q..C.b.
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x2e
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: bc924d41 b038e3f8 d0fcc0d5 8c155=
ce6  AM....8......\..
Sep 06 00:09:12 szarotka kernel: 00000000: bc924d41 b038e3f8 bc924d41 b038e=
3f8  AM....8.AM....8.
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:09:12 szarotka kernel: 00000000: 8db94678 ad3e0be4 d8d28aad 92d2e=
a7d  xF....>.....}...
Sep 06 00:09:12 szarotka kernel: 00000000: 8db94678 ad3e0be4 8db94678 ad3e0=
be4  xF....>.xF....>.
Sep 06 00:09:12 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:09:12 szarotka kernel: 00000000: 6510bb4c 3ed78c92 2f0e8c60 191b5=
381  L..e...>`../.S..
Sep 06 00:09:12 szarotka kernel: 00000000: 6510bb4c 3ed78c92 6510bb4c 3ed78=
c92  L..e...>L..e...>
Sep 06 00:09:12 szarotka kernel: 00000000: b5470aae a1a83b2c 6be5e6e3 83b85=
8b6  ..G.,;.....k.X..
Sep 06 00:09:12 szarotka kernel: 00000000: b5470aae a1a83b2c b5470aae a1a83=
b2c  ..G.,;....G.,;..
Sep 06 00:09:12 szarotka kernel: 00000000: 7c944047 a292ea6f 0bf90f97 556b4=
c96  G@.|o........LkU
Sep 06 00:09:12 szarotka kernel: 00000000: 7c944047 a292ea6f 7c944047 a292e=
a6f  G@.|o...G@.|o...
Sep 06 00:09:12 szarotka kernel: 00000000: ab90ce26 45cda0e1 3c8a4963 90e9e=
09c  &......EcI.<....
Sep 06 00:09:12 szarotka kernel: 00000000: ab90ce26 45cda0e1 ab90ce26 45cda=
0e1  &......E&......E
Sep 06 00:09:12 szarotka kernel: 00000000: 17c4f095 3a091413 c84696fb 15347=
d13  .......:..F..}4.
Sep 06 00:09:12 szarotka kernel: 00000000: 17c4f095 3a091413 17c4f095 3a091=
413  .......:.......:
Sep 06 00:09:12 szarotka kernel: 00000000: c28fa264 4f900840 396d0bf5 f267a=
7db  d...@..O..m9..g.
Sep 06 00:09:12 szarotka kernel: 00000000: c28fa264 4f900840 c28fa264 4f900=
840  d...@..Od...@..O
Sep 06 00:09:12 szarotka kernel: 00000000: 25276a57 c55f2e1f 2c02e968 09950=
aed  Wj'%.._.h..,....
Sep 06 00:09:12 szarotka kernel: 00000000: 25276a57 c55f2e1f 25276a57 c55f2=
e1f  Wj'%.._.Wj'%.._.
Sep 06 00:09:12 szarotka kernel: 00000000: 442786c3 4cc89622 75eb9237 08cf1=
c52  ..'D"..L7..uR...
Sep 06 00:09:12 szarotka kernel: 00000000: da598ed6 509c7db2 442786c3 4cc89=
622  ..Y..}.P..'D"..L
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: 99378aaf dc06d4ad 59a6cb67 44605=
898  ..7.....g..Y.X`D
Sep 06 00:09:12 szarotka kernel: 00000000: a9c29f25 9ca93c1b 99378aaf dc06d=
4ad  %....<....7.....
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: 307eba9c 48575774 1bb4dc48 f4fa8=
754  ..~0tWWHH...T...
Sep 06 00:09:12 szarotka kernel: 00000000: a0940989 cd8e8fb7 307eba9c 48575=
774  ..........~0tWWH
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: 63a4b847 2a3e7e5d e5b7b075 ada29=
afc  G..c]~>*u.......
Sep 06 00:09:12 szarotka kernel: 00000000: 1ef05ea7 ce71091f 63a4b847 2a3e7=
e5d  .^....q.G..c]~>*
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: 2ad2f034 1164d4cf aedca4ee 5f913=
2f7  4..*..d......2._
Sep 06 00:09:12 szarotka kernel: 00000000: e8620387 565c8537 2ad2f034 1164d=
4cf  ..b.7.\V4..*..d.
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: 9819d967 00284049 a2e850f0 997af=
802  g...I@(..P....z.
Sep 06 00:09:12 szarotka kernel: 00000000: 5aa41541 13b591a0 9819d967 00284=
049  A..Z....g...I@(.
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: 69ebeeb0 bc25eed0 fba51187 2e270=
1fe  ...i..%.......'.
Sep 06 00:09:12 szarotka kernel: 00000000: 69ebeeb0 bc25eed0 69ebeeb0 bc25e=
ed0  ...i..%....i..%.
Sep 06 00:09:12 szarotka kernel: 00000000: d6386bde 5f3eeb2c fbce6a6a 95af5=
c8c  .k8.,.>_jj...\..
Sep 06 00:09:12 szarotka kernel: 00000000: d6386bde 5f3eeb2c d6386bde 5f3ee=
b2c  .k8.,.>_.k8.,.>_
Sep 06 00:09:12 szarotka kernel: 00000000: 053fbd10 436e93b3 27a8d8a1 5d3d5=
f96  ..?...nC...'._=3D]
Sep 06 00:09:12 szarotka kernel: 00000000: 053fbd10 436e93b3 053fbd10 436e9=
3b3  ..?...nC..?...nC
Sep 06 00:09:12 szarotka kernel: 00000000: 9370f0d9 13d73520 45a8b308 a94ca=
9f7  ..p. 5.....E..L.
Sep 06 00:09:12 szarotka kernel: 00000000: 111fb05d f638914b 9370f0d9 13d73=
520  ]...K.8...p. 5..
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: 9d24fcb5 1ede4044 baa0fd72 6d50d=
ecc  ..$.D@..r.....Pm
Sep 06 00:09:12 szarotka kernel: 00000000: 9d24fcb5 1ede4044 9d24fcb5 1ede4=
044  ..$.D@....$.D@..
Sep 06 00:09:12 szarotka kernel: 00000000: c3761ed7 04eb22ad c68d3f4d 0a9c7=
33b  ..v.."..M?..;s..
Sep 06 00:09:12 szarotka kernel: 00000000: c3761ed7 04eb22ad c3761ed7 04eb2=
2ad  ..v.."....v.."..
Sep 06 00:09:12 szarotka kernel: 00000000: 6b6969d7 8749a0ba 1ad7eba0 dbbd2=
363  .iik..I.....c#..
Sep 06 00:09:12 szarotka kernel: 00000000: 2461ec88 d97d2297 6b6969d7 8749a=
0ba  ..a$."}..iik..I.
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: cd0e468a 581df2c5 c50948dd f0d17=
5bc  .F.....X.H...u..
Sep 06 00:09:12 szarotka kernel: 00000000: cd0e468a 581df2c5 cd0e468a 581df=
2c5  .F.....X.F.....X
Sep 06 00:09:12 szarotka kernel: 00000000: 57b16ab6 8c74a7d8 0718a098 8371e=
939  .j.W..t.....9.q.
Sep 06 00:09:12 szarotka kernel: 00000000: 57b16ab6 8c74a7d8 57b16ab6 8c74a=
7d8  .j.W..t..j.W..t.
Sep 06 00:09:12 szarotka kernel: 00000000: 42f118e0 7be1d2e5 6f048f7f 1d844=
c23  ...B...{...o#L..
Sep 06 00:09:12 szarotka kernel: 00000000: 42f118e0 7be1d2e5 42f118e0 7be1d=
2e5  ...B...{...B...{
Sep 06 00:09:12 szarotka kernel: 00000000: 0640ec6a 2fb7ac1c 83b28070 26aa7=
790  j.@..../p....w.&
Sep 06 00:09:12 szarotka kernel: 00000000: 0640ec6a 2fb7ac1c 0640ec6a 2fb7a=
c1c  j.@..../j.@..../
Sep 06 00:09:12 szarotka kernel: 00000000: 4cfb96ec 90df6a33 f8fa00dd 9d87d=
132  ...L3j......2...
Sep 06 00:09:12 szarotka kernel: 00000000: 4cfb96ec 90df6a33 4cfb96ec 90df6=
a33  ...L3j.....L3j..
Sep 06 00:09:12 szarotka kernel: 00000000: a4b2304c c8e6912d 888de5d8 df1b7=
31e  L0..-........s..
Sep 06 00:09:12 szarotka kernel: 00000000: a4837db0 a8c39b04 a4b2304c c8e69=
12d  .}......L0..-...
Sep 06 00:09:12 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:09:12 szarotka kernel: 00000000: c163ca6d f15d6b3f b0ef70b0 dc172=
2ce  m.c.?k]..p..."..
Sep 06 00:09:12 szarotka kernel: 00000000: e369f34c 07190222 c163ca6d f15d6=
b3f  L.i."...m.c.?k].
Sep 06 00:09:12 szarotka kernel: 00000000: 71fd0178 a3205a4b b7ed26b7 c6551=
6f7  x..qKZ ..&....U.
Sep 06 00:09:12 szarotka kernel: 00000000: a87bd380 2cea4af9 71fd0178 a3205=
a4b  ..{..J.,x..qKZ .
Sep 06 00:09:12 szarotka kernel: 00000000: 1ea24066 2661ad26 c456dea9 147b4=
314  f@..&.a&..V..C{.
Sep 06 00:09:12 szarotka kernel: 00000000: 1ea24066 2661ad26 1ea24066 2661a=
d26  f@..&.a&f@..&.a&
Sep 06 00:09:12 szarotka kernel: 00000000: bdc81d3d 876e56df 27a82dc1 09675=
a0d  =3D....Vn..-.'.Zg.
Sep 06 00:09:12 szarotka kernel: 00000000: bdc81d3d 876e56df bdc81d3d 876e5=
6df  =3D....Vn.=3D....Vn.
Sep 06 00:09:12 szarotka kernel: 00000000: f9d636c6 349c8181 d1fba84b a4fe3=
d3c  .6.....4K...<=3D..
Sep 06 00:09:12 szarotka kernel: 00000000: f9d636c6 349c8181 f9d636c6 349c8=
181  .6.....4.6.....4
Sep 06 00:09:12 szarotka kernel: 00000000: 4474f2ca 03880883 49c88a48 328d5=
241  ..tD....H..IAR.2
Sep 06 00:09:12 szarotka kernel: 00000000: 4474f2ca 03880883 4474f2ca 03880=
883  ..tD......tD....
Sep 06 00:09:12 szarotka kernel: 00000000: d06c16f6 92f3110b 7e99fa16 68027=
996  ..l........~.y.h
Sep 06 00:09:12 szarotka kernel: 00000000: d06c16f6 92f3110b d06c16f6 92f31=
10b  ..l.......l.....
Sep 06 00:09:12 szarotka kernel: 00000000: 44d47b64 c119a58f 04e77b8b bcb32=
c9d  d{.D.....{...,..
Sep 06 00:09:12 szarotka kernel: 00000000: 36d5028c b57955e8 44d47b64 c119a=
58f  ...6.Uy.d{.D....
Sep 06 00:09:12 szarotka kernel: 00000000: e3744d3c 49835a2b 4307d4a8 a3787=
bed  <Mt.+Z.I...C.{x.
Sep 06 00:09:12 szarotka kernel: 00000000: 57706254 5ea38d50 e3744d3c 49835=
a2b  TbpWP..^<Mt.+Z.I
Sep 06 00:09:12 szarotka kernel: 00000000: 46227398 a16f19e2 55b0e0fc 2d673=
93a  .s"F..o....U:9g-
Sep 06 00:09:12 szarotka kernel: 00000000: 46227398 a16f19e2 46227398 a16f1=
9e2  .s"F..o..s"F..o.
Sep 06 00:09:12 szarotka kernel: 00000000: 1f48ebb1 3d156cf1 4178aa69 a04d5=
e74  ..H..l.=3Di.xAt^M.
Sep 06 00:09:12 szarotka kernel: 00000000: 1f48ebb1 3d156cf1 1f48ebb1 3d156=
cf1  ..H..l.=3D..H..l.=3D
Sep 06 00:09:12 szarotka kernel: 00000000: 19a7b81b 2e62946a 47674b96 e67f6=
0d2  ....j.b..KgG.`..
Sep 06 00:09:12 szarotka kernel: 00000000: 19a7b81b 2e62946a 19a7b81b 2e629=
46a  ....j.b.....j.b.
Sep 06 00:09:12 szarotka kernel: 00000000: 70076614 e4aa33f4 921ca43d 66f65=
8a9  .f.p.3..=3D....X.f
Sep 06 00:09:12 szarotka kernel: 00000000: 70076614 e4aa33f4 70076614 e4aa3=
3f4  .f.p.3...f.p.3..
Sep 06 00:09:12 szarotka kernel: 00000000: 93e1dc6d 5d03e3b0 fa0255e0 9baea=
fec  m......].U......
Sep 06 00:09:12 szarotka kernel: 00000000: 93e1dc6d 5d03e3b0 93e1dc6d 5d03e=
3b0  m......]m......]
Sep 06 00:09:12 szarotka kernel: 00000000: e6925bc7 7ed5a148 f21f94a3 bf0c6=
f38  .[..H..~....8o..
Sep 06 00:09:12 szarotka kernel: 00000000: 75ccd913 ee2624eb e6925bc7 7ed5a=
148  ...u.$&..[..H..~
Sep 06 00:09:12 szarotka kernel: 00000000: a222daa4 fd9f7597 fd6c8873 6b74d=
0de  .."..u..s.l...tk
Sep 06 00:09:12 szarotka kernel: 00000000: 0b9a22d2 d967d0fb a222daa4 fd9f7=
597  ."....g..."..u..
Sep 06 00:09:12 szarotka kernel: 00000000: 00267b5a e6838fff f6787de0 c4271=
6b0  Z{&......}x...'.
Sep 06 00:09:12 szarotka kernel: 00000000: e745a6c0 b8824908 00267b5a e6838=
fff  ..E..I..Z{&.....
Sep 06 00:09:12 szarotka kernel: 00000000: 4152835e c239e9a2 e5934905 4ee7c=
477  ^.RA..9..I..w..N
Sep 06 00:09:12 szarotka kernel: 00000000: c8fd9825 f059c5f8 4152835e c239e=
9a2  %.....Y.^.RA..9.
Sep 06 00:09:12 szarotka kernel: 00000000: bce15b59 ff11f300 2c560700 5908d=
f85  Y[........V,...Y
Sep 06 00:09:12 szarotka kernel: 00000000: 1283b069 ab4624d1 bce15b59 ff11f=
300  i....$F.Y[......
Sep 06 00:09:12 szarotka kernel: 00000000: 183e6399 e00b87bc a34bedeb 3de0b=
ea8  .c>.......K....=3D
Sep 06 00:09:12 szarotka kernel: 00000000: 75c1a42b 067f4725 183e6399 e00b8=
7bc  +..u%G...c>.....
Sep 06 00:09:12 szarotka kernel: 00000000: a17e6a15 e4dfd6af 1c4319ad 3825d=
e6f  .j~.......C.o.%8
Sep 06 00:09:12 szarotka kernel: 00000000: dd588885 4aeee3cd a17e6a15 e4dfd=
6af  ..X....J.j~.....
Sep 06 00:09:12 szarotka kernel: 00000000: 06cb1ea8 45f0b70e e5b77646 d546f=
0ed  .......EFv....F.
Sep 06 00:09:12 szarotka kernel: 00000000: a53d50af 8068b674 06cb1ea8 45f0b=
70e  .P=3D.t.h........E
Sep 06 00:09:12 szarotka kernel: 00000000: 68a58111 cdfc8ffc 01ece881 ad3cf=
df8  ...h..........<.
Sep 06 00:09:12 szarotka kernel: 00000000: 1b9064e7 65353baa 68a58111 cdfc8=
ffc  .d...;5e...h....
Sep 06 00:09:12 szarotka kernel: 00000000: 90f5f248 e8b44dd2 423a2ae1 5cfac=
bc8  H....M...*:B...\
Sep 06 00:09:12 szarotka kernel: 00000000: e257110b 332efbae 90f5f248 e8b44=
dd2  ..W....3H....M..
Sep 06 00:09:12 szarotka kernel: 00000000: 60911079 15800fab fbf94c42 b8619=
52f  y..`....BL../.a.
Sep 06 00:09:12 szarotka kernel: 00000000: 8aac1cb7 dfceb662 60911079 15800=
fab  ....b...y..`....
Sep 06 00:09:12 szarotka kernel: 00000000: ff638e93 e72e7d88 6ed7b89d 2d2a9=
b76  ..c..}.....nv.*-
Sep 06 00:09:12 szarotka kernel: 00000000: d4415554 8c51729a ff638e93 e72e7=
d88  TUA..rQ...c..}..
Sep 06 00:09:12 szarotka kernel: 00000000: dbba8a42 03d604c7 3951c849 484ca=
ef7  B.......I.Q9..LH
Sep 06 00:09:12 szarotka kernel: 00000000: a417da10 4599d3d2 dbba8a42 03d60=
4c7  .......EB.......
Sep 06 00:09:12 szarotka kernel: 00000000: e4f52aac c59e3d50 95bee664 20777=
09e  .*..P=3D..d....pw=20
Sep 06 00:09:12 szarotka kernel: 00000000: 7f6fd6ae 47f98128 e4f52aac c59e3=
d50  ..o.(..G.*..P=3D..
Sep 06 00:09:12 szarotka kernel: 00000000: 16076eb4 423136b6 ad4a2476 02f24=
b90  .n...61Bv$J..K..
Sep 06 00:09:12 szarotka kernel: 00000000: 7ee2f410 73d4f407 16076eb4 42313=
6b6  ...~...s.n...61B
Sep 06 00:09:12 szarotka kernel: 00000000: 65d1e16e e55d97a6 96b9a2d4 672ea=
b5a  n..e..].....Z..g
Sep 06 00:09:12 szarotka kernel: 00000000: bc48467a 28933fd6 65d1e16e e55d9=
7a6  zFH..?.(n..e..].
Sep 06 00:09:12 szarotka kernel: 00000000: af185b5e f4eba000 9d9a68b0 f093b=
3fd  ^[.......h......
Sep 06 00:09:12 szarotka kernel: 00000000: 28f9e9f4 05fd73c2 af185b5e f4eba=
000  ...(.s..^[......
Sep 06 00:09:12 szarotka kernel: 00000000: d95bc7b7 67f08d3d 7a7b0547 fca4a=
7df  ..[.=3D..gG.{z....
Sep 06 00:09:12 szarotka kernel: 00000000: d95bc7b7 67f08d3d d95bc7b7 67f08=
d3d  ..[.=3D..g..[.=3D..g
Sep 06 00:09:12 szarotka kernel: 00000000: 4b543e0d e9d8cb41 83dc2b1c 7b298=
251  .>TKA....+..Q.){
Sep 06 00:09:12 szarotka kernel: 00000000: 195a0060 962e6db4 4b543e0d e9d8c=
b41  `.Z..m...>TKA...
Sep 06 00:09:12 szarotka kernel: 00000000: 342aa0bd dc111b21 31788fd1 577eb=
864  ..*4!.....x1d.~W
Sep 06 00:09:12 szarotka kernel: 00000000: fda9b0e3 c1222512 342aa0bd dc111=
b21  .....%"...*4!...
Sep 06 00:09:12 szarotka kernel: 00000000: 25a0ee40 3f0e9087 7554d3c1 6c7e6=
c66  @..%...?..Tufl~l
Sep 06 00:09:12 szarotka kernel: 00000000: f3aa93e0 231f86bf 25a0ee40 3f0e9=
087  .......#@..%...?
Sep 06 00:09:12 szarotka kernel: 00000000: 295aebca 086a9456 9db8a5e6 8d6f2=
6a5  ..Z)V.j......&o.
Sep 06 00:09:12 szarotka kernel: 00000000: 5f311b45 6149e388 295aebca 086a9=
456  E.1_..Ia..Z)V.j.
Sep 06 00:09:12 szarotka kernel: 00000000: ffeb54d0 3d793659 3bb2b982 54dea=
049  .T..Y6y=3D...;I..T
Sep 06 00:09:12 szarotka kernel: 00000000: ad07560b 9dc6cdc5 ffeb54d0 3d793=
659  .V.......T..Y6y=3D
Sep 06 00:09:12 szarotka kernel: 00000000: 6bdd7738 0dae6396 9f03a2c4 e1abd=
f3e  8w.k.c......>...
Sep 06 00:09:12 szarotka kernel: 00000000: 6bdd7738 0dae6396 6bdd7738 0dae6=
396  8w.k.c..8w.k.c..
Sep 06 00:09:12 szarotka kernel: 00000000: 9983e3c4 1d89ea07 8629d957 5593c=
48e  ........W.)....U
Sep 06 00:09:12 szarotka kernel: 00000000: 9983e3c4 1d89ea07 9983e3c4 1d89e=
a07  ................
Sep 06 00:09:12 szarotka kernel: 00000000: 2bead155 b0083949 6b6a2da7 184ef=
f22  U..+I9...-jk".N.
Sep 06 00:09:12 szarotka kernel: 00000000: 2101a493 36a25ca3 2bead155 b0083=
949  ...!.\.6U..+I9..
Sep 06 00:09:12 szarotka kernel: 00000000: 56e07bf9 4b42a4be b3fb3c54 817a1=
2e6  .{.V..BKT<....z.
Sep 06 00:09:12 szarotka kernel: 00000000: d9e17a19 a79042c3 56e07bf9 4b42a=
4be  .z...B...{.V..BK
Sep 06 00:09:12 szarotka kernel: 00000000: 3f7139be e6c2ecfb 9bc019fd 64477=
aab  .9q?.........zGd
Sep 06 00:09:12 szarotka kernel: 00000000: e14b18b4 cfc7e683 3f7139be e6c2e=
cfb  ..K......9q?....
Sep 06 00:09:12 szarotka kernel: 00000000: bab8ad9d 77f65cfb cbc3d2f1 bafae=
66e  .....\.w....n...
Sep 06 00:09:12 szarotka kernel: 00000000: a4377e24 6a49900b bab8ad9d 77f65=
cfb  $~7...Ij.....\.w
Sep 06 00:09:12 szarotka kernel: 00000000: d8a51aa4 79eedb9c ce3b22ea bdbb8=
f27  .......y.";.'...
Sep 06 00:09:12 szarotka kernel: 00000000: d33ee65c cebbe5eb d8a51aa4 79eed=
b9c  \.>............y
Sep 06 00:09:12 szarotka kernel: 00000000: df90c095 ae1dfdfd 308d457d f497a=
591  ........}E.0....
Sep 06 00:09:12 szarotka kernel: 00000000: 0a0333e3 2438f574 df90c095 ae1df=
dfd  .3..t.8$........
Sep 06 00:09:12 szarotka kernel: 00000000: 135b1888 98611a24 8cf38c4f 73bba=
f3b  ..[.$.a.O...;..s
Sep 06 00:09:12 szarotka kernel: 00000000: 135b1888 98611a24 135b1888 98611=
a24  ..[.$.a...[.$.a.
Sep 06 00:09:12 szarotka kernel: 00000000: 51cbac2a b59b5c42 a2f3da53 10990=
6bb  *..QB\..S.......
Sep 06 00:09:12 szarotka kernel: 00000000: 51cbac2a b59b5c42 51cbac2a b59b5=
c42  *..QB\..*..QB\..
Sep 06 00:09:12 szarotka kernel: 00000000: be15664b 6aac687d 152939e6 b8a68=
d0f  Kf..}h.j.9).....
Sep 06 00:09:12 szarotka kernel: 00000000: a7f6a897 8cda0770 be15664b 6aac6=
87d  ....p...Kf..}h.j
Sep 06 00:09:12 szarotka kernel: 00000000: db4b5570 2da0bdd1 78312582 ac0e0=
795  pUK....-.%1x....
Sep 06 00:09:12 szarotka kernel: 00000000: db4b5570 2da0bdd1 db4b5570 2da0b=
dd1  pUK....-pUK....-
Sep 06 00:09:12 szarotka kernel: 00000000: 59b1a3e0 fdc404d4 ec8714ce 3ef1e=
ccc  ...Y...........>
Sep 06 00:09:12 szarotka kernel: 00000000: 59b1a3e0 fdc404d4 59b1a3e0 fdc40=
4d4  ...Y.......Y....
Sep 06 00:09:12 szarotka kernel: 00000000: 1d5caf38 9254e326 d5dfdf03 3bd48=
f35  8.\.&.T.....5..;
Sep 06 00:09:12 szarotka kernel: 00000000: 1d5caf38 9254e326 1d5caf38 9254e=
326  8.\.&.T.8.\.&.T.
Sep 06 00:09:12 szarotka kernel: 00000000: ac9cc098 56f0f10d 5434ca47 6090c=
dda  .......VG.4T...`
Sep 06 00:09:12 szarotka kernel: 00000000: ac9cc098 56f0f10d ac9cc098 56f0f=
10d  .......V.......V
Sep 06 00:09:12 szarotka kernel: 00000000: 80e7420f 6e349b48 9d9f6743 1101e=
33d  .B..H.4nCg..=3D...
Sep 06 00:09:12 szarotka kernel: 00000000: 80e7420f 6e349b48 80e7420f 6e349=
b48  .B..H.4n.B..H.4n
Sep 06 00:09:12 szarotka kernel: 00000000: 1bf86201 faaa2832 ed3b5bd0 bd3b6=
09f  .b..2(...[;..`;.
Sep 06 00:09:12 szarotka kernel: 00000000: 1bf86201 faaa2832 1bf86201 faaa2=
832  .b..2(...b..2(..
Sep 06 00:09:12 szarotka kernel: 00000000: 0d6e1392 fe5b8ef7 12a8eb8d efaba=
c38  ..n...[.....8...
Sep 06 00:09:12 szarotka kernel: 00000000: 0d6e1392 fe5b8ef7 0d6e1392 fe5b8=
ef7  ..n...[...n...[.
Sep 06 00:09:12 szarotka kernel: 00000000: 0dcd27c8 030062e2 c5c00710 44c12=
8e7  .'...b.......(.D
Sep 06 00:09:12 szarotka kernel: 00000000: 0dcd27c8 030062e2 0dcd27c8 03006=
2e2  .'...b...'...b..
Sep 06 00:09:12 szarotka kernel: 00000000: 0cda46a3 1dc1af1c 2a4cdd50 83dcb=
f3e  .F......P.L*>...
Sep 06 00:09:12 szarotka kernel: 00000000: 0cda46a3 1dc1af1c 0cda46a3 1dc1a=
f1c  .F.......F......
Sep 06 00:09:12 szarotka kernel: 00000000: 0e96e3c5 d21bf6a6 42729446 6cdbe=
83b  ........F.rB;..l
Sep 06 00:09:12 szarotka kernel: 00000000: 71ecc3a4 97c174be 0e96e3c5 d21bf=
6a6  ...q.t..........
Sep 06 00:09:12 szarotka kernel: 00000000: c195263b 4f4ac88c 6f38d718 d0dd7=
a17  ;&....JO..8o.z..
Sep 06 00:09:12 szarotka kernel: 00000000: c9d3e2e1 5405b77a c195263b 4f4ac=
88c  ....z..T;&....JO
Sep 06 00:09:12 szarotka kernel: 00000000: 291a91c7 6f10a2dc c6ac978b aefca=
ca5  ...)...o........
Sep 06 00:09:12 szarotka kernel: 00000000: 2d8a5f23 262d2cc3 291a91c7 6f10a=
2dc  #_.-.,-&...)...o
Sep 06 00:09:12 szarotka kernel: 00000000: 57e9a935 20b19aa8 8a67905f 86faf=
da0  5..W... _.g.....
Sep 06 00:09:12 szarotka kernel: 00000000: 7446b4f7 15c74742 57e9a935 20b19=
aa8  ..FtBG..5..W...=20
Sep 06 00:09:12 szarotka kernel: 00000000: d2644964 0be4e84f 430b0e40 e8b42=
2e9  dId.O...@..C."..
Sep 06 00:09:12 szarotka kernel: 00000000: 207c823f adf96016 d2644964 0be4e=
84f  ?.| .`..dId.O...
Sep 06 00:09:12 szarotka kernel: 00000000: 403d6c62 d200ef25 f24f3ddc d5417=
cbb  bl=3D@%....=3DO..|A.
Sep 06 00:09:12 szarotka kernel: 00000000: ceaaa059 03ffdbe7 403d6c62 d200e=
f25  Y.......bl=3D@%...
Sep 06 00:09:12 szarotka kernel: 00000000: f2e43c1a 7d7114ad f9167e7a 1438c=
a43  .<....q}z~..C.8.
Sep 06 00:09:12 szarotka kernel: 00000000: 7ade1677 e6d801b6 f2e43c1a 7d711=
4ad  w..z.....<....q}
Sep 06 00:09:12 szarotka kernel: 00000000: 10935383 5687110f a6523eb0 935c3=
5e3  .S.....V.>R..5\.
Sep 06 00:09:12 szarotka kernel: 00000000: 3a328cb1 c09e2e54 10935383 56871=
10f  ..2:T....S.....V
Sep 06 00:09:12 szarotka kernel: 00000000: 619757a2 01b68602 7e6c12de 5f91b=
aa2  .W.a......l~..._
Sep 06 00:09:12 szarotka kernel: 00000000: 79a3a748 a81d8143 619757a2 01b68=
602  H..yC....W.a....
Sep 06 00:09:12 szarotka kernel: 00000000: 405d4d60 78b8b899 5ce7bd50 eca81=
f8a  `M]@...xP..\....
Sep 06 00:09:12 szarotka kernel: 00000000: 6e34a0fa a8ac2972 405d4d60 78b8b=
899  ..4nr)..`M]@...x
Sep 06 00:09:12 szarotka kernel: 00000000: 7e219541 1d04b8b4 9dbdf884 1f769=
c49  A.!~........I.v.
Sep 06 00:09:12 szarotka kernel: 00000000: 3e0f51ab 2e60a7a8 7e219541 1d04b=
8b4  .Q.>..`.A.!~....
Sep 06 00:09:12 szarotka kernel: 00000000: d2f6dcfd 238fbb91 74b3e102 ad44a=
7b6  .......#...t..D.
Sep 06 00:09:12 szarotka kernel: 00000000: d2f6dcfd 238fbb91 d2f6dcfd 238fb=
b91  .......#.......#
Sep 06 00:09:12 szarotka kernel: 00000000: 85c7ac12 7ab7973b 6a2e39c6 162e9=
cf6  ....;..z.9.j....
Sep 06 00:09:12 szarotka kernel: 00000000: 85c7ac12 7ab7973b 85c7ac12 7ab79=
73b  ....;..z....;..z
Sep 06 00:09:12 szarotka kernel: 00000000: 563b59ab 518b83cf 41eec2f5 61024=
231  .Y;V...Q...A1B.a
Sep 06 00:09:12 szarotka kernel: 00000000: 563b59ab 518b83cf 563b59ab 518b8=
3cf  .Y;V...Q.Y;V...Q
Sep 06 00:09:12 szarotka kernel: 00000000: e80769c4 db4447fd 33afad72 c4e85=
258  .i...GD.r..3XR..
Sep 06 00:09:12 szarotka kernel: 00000000: e80769c4 db4447fd e80769c4 db444=
7fd  .i...GD..i...GD.
Sep 06 00:09:12 szarotka kernel: 00000000: 06eb327a 83b93db5 10428f6c fb31b=
556  z2...=3D..l.B.V.1.
Sep 06 00:09:12 szarotka kernel: 00000000: 06eb327a 83b93db5 06eb327a 83b93=
db5  z2...=3D..z2...=3D..
Sep 06 00:09:12 szarotka kernel: 00000000: 9b610355 b81488fc c706e537 b02ee=
397  U.a.....7.......
Sep 06 00:09:12 szarotka kernel: 00000000: 9b610355 b81488fc 9b610355 b8148=
8fc  U.a.....U.a.....
Sep 06 00:09:12 szarotka kernel: 00000000: a463bdf0 55068472 226b6bfb 0e175=
0b7  ..c.r..U.kk".P..
Sep 06 00:09:12 szarotka kernel: 00000000: 49d85b65 9abba609 a463bdf0 55068=
472  e[.I......c.r..U
Sep 06 00:09:12 szarotka kernel: 00000000: f4ae7b18 ddd37251 37420a93 eaf62=
1c9  .{..Qr....B7.!..
Sep 06 00:09:12 szarotka kernel: 00000000: f4ae7b18 ddd37251 f4ae7b18 ddd37=
251  .{..Qr...{..Qr..
Sep 06 00:09:12 szarotka kernel: 00000000: 28805aaf f58368e8 62324fcd f755b=
cda  .Z.(.h...O2b..U.
Sep 06 00:09:12 szarotka kernel: 00000000: 28805aaf f58368e8 28805aaf f5836=
8e8  .Z.(.h...Z.(.h..
Sep 06 00:09:12 szarotka kernel: 00000000: bad436b5 dadb3db7 265613b4 f0972=
cad  .6...=3D....V&.,..
Sep 06 00:09:12 szarotka kernel: 00000000: 333c6f9f 9ee8e945 bad436b5 dadb3=
db7  .o<3E....6...=3D..
Sep 06 00:09:12 szarotka kernel: 00000000: 33609966 f0225b08 c765cc0f a7a7d=
325  f.`3.["...e.%...
Sep 06 00:09:12 szarotka kernel: 00000000: 6bfca16c bfb24df9 33609966 f0225=
b08  l..k.M..f.`3.[".
Sep 06 00:09:12 szarotka kernel: 00000000: a8667118 ea2e4204 f92ff8a8 d893e=
173  .qf..B..../.s...
Sep 06 00:09:12 szarotka kernel: 00000000: a8667118 ea2e4204 a8667118 ea2e4=
204  .qf..B...qf..B..
Sep 06 00:09:12 szarotka kernel: 00000000: 0956953d b3d1f0fa f14c0275 54d17=
b21  =3D.V.....u.L.!{.T
Sep 06 00:09:12 szarotka kernel: 00000000: 0956953d b3d1f0fa 0956953d b3d1f=
0fa  =3D.V.....=3D.V.....
Sep 06 00:09:12 szarotka kernel: 00000000: 2a07ea6e 8e342f90 2fc0cc71 30a6c=
4e6  n..*./4.q../...0
Sep 06 00:09:12 szarotka kernel: 00000000: c15622cb 0a6bfcba 2a07ea6e 8e342=
f90  ."V...k.n..*./4.
Sep 06 00:09:12 szarotka kernel: 00000000: ee376b24 bf38538e cb12952e 43319=
5c3  $k7..S8.......1C
Sep 06 00:09:12 szarotka kernel: 00000000: ee376b24 bf38538e ee376b24 bf385=
38e  $k7..S8.$k7..S8.
Sep 06 00:09:12 szarotka kernel: 00000000: 77e8ed47 2627b13d 2d481bf8 6031e=
e62  G..w=3D.'&..H-b.1`
Sep 06 00:09:12 szarotka kernel: 00000000: 77e8ed47 2627b13d 77e8ed47 2627b=
13d  G..w=3D.'&G..w=3D.'&
Sep 06 00:09:12 szarotka kernel: 00000000: 0ef4a0b0 3b1aab6d eefbb785 dc423=
4ba  ....m..;.....4B.
Sep 06 00:09:12 szarotka kernel: 00000000: 0ef4a0b0 3b1aab6d 0ef4a0b0 3b1aa=
b6d  ....m..;....m..;
Sep 06 00:09:12 szarotka kernel: 00000000: 436bfd46 6b77c055 ed70bd79 13c9c=
64c  F.kCU.wky.p.L...
Sep 06 00:09:12 szarotka kernel: 00000000: 436bfd46 6b77c055 436bfd46 6b77c=
055  F.kCU.wkF.kCU.wk
Sep 06 00:09:12 szarotka kernel: 00000000: dd4b905c bf6052ce 9a682eb3 f21f7=
991  \.K..R`...h..y..
Sep 06 00:09:12 szarotka kernel: 00000000: dd4b905c bf6052ce dd4b905c bf605=
2ce  \.K..R`.\.K..R`.
Sep 06 00:09:12 szarotka kernel: 00000000: 82836631 0f8a9431 3b06821b 45f00=
ba2  1f..1......;...E
Sep 06 00:09:12 szarotka kernel: 00000000: f868efd3 9ec24a8b 82836631 0f8a9=
431  ..h..J..1f..1...
Sep 06 00:09:12 szarotka kernel: 00000000: ae35fa82 661ef968 d08a2244 9563b=
8ac  ..5.h..fD"....c.
Sep 06 00:09:12 szarotka kernel: 00000000: ed1d6912 c8ebabc8 ae35fa82 661ef=
968  .i........5.h..f
Sep 06 00:09:12 szarotka kernel: 00000000: dd6b7235 520f9e18 b004d9fe 5e855=
3f1  5rk....R.....S.^
Sep 06 00:09:12 szarotka kernel: 00000000: 6342b637 34a95bc2 dd6b7235 520f9=
e18  7.Bc.[.45rk....R
Sep 06 00:09:12 szarotka kernel: 00000000: 17ddb3b3 f7bb1331 7ee22387 ec3f4=
3bd  ....1....#.~.C?.
Sep 06 00:09:12 szarotka kernel: 00000000: 17ddb3b3 f7bb1331 17ddb3b3 f7bb1=
331  ....1.......1...
Sep 06 00:09:12 szarotka kernel: 00000000: 58eabc2d 4520debe 64f36bb1 f8a29=
dce  -..X.. E.k.d....
Sep 06 00:09:12 szarotka kernel: 00000000: 58eabc2d 4520debe 58eabc2d 4520d=
ebe  -..X.. E-..X.. E
Sep 06 00:09:12 szarotka kernel: 00000000: a657cfb6 8e4e2dbc 181b0523 90aff=
174  ..W..-N.#...t...
Sep 06 00:09:12 szarotka kernel: 00000000: a657cfb6 8e4e2dbc a657cfb6 8e4e2=
dbc  ..W..-N...W..-N.
Sep 06 00:09:12 szarotka kernel: 00000000: 79485d19 9967d2f7 2d8c8885 01571=
d7a  .]Hy..g....-z.W.
Sep 06 00:09:12 szarotka kernel: 00000000: 41da05e8 80221b3b 79485d19 9967d=
2f7  ...A;."..]Hy..g.
Sep 06 00:09:12 szarotka kernel: 00000000: 2a5786dc 12658cf8 217f4af1 05982=
330  ..W*..e..J.!0#..
Sep 06 00:09:12 szarotka kernel: 00000000: a6e21c10 46dc6064 2a5786dc 12658=
cf8  ....d`.F..W*..e.
Sep 06 00:09:12 szarotka kernel: 00000000: fe9c4592 8dba9a5d 4bfa4031 ad69d=
e84  .E..]...1@.K..i.
Sep 06 00:09:12 szarotka kernel: 00000000: e8bbf89b d82e829d fe9c4592 8dba9=
a5d  .........E..]...
Sep 06 00:09:12 szarotka kernel: 00000000: f6d6ad53 99cf4df7 6f17848c 94875=
266  S....M.....ofR..
Sep 06 00:09:12 szarotka kernel: 00000000: f6d6ad53 99cf4df7 f6d6ad53 99cf4=
df7  S....M..S....M..
Sep 06 00:09:12 szarotka kernel: 00000000: 00c179b5 ced1bbd2 f602d8ce bf7c4=
67a  .y..........zF|.
Sep 06 00:09:12 szarotka kernel: 00000000: a63c7a9b 858e1442 00c179b5 ced1b=
bd2  .z<.B....y......
Sep 06 00:09:12 szarotka kernel: 00000000: b1acd055 28d88b5f 23fafebd 81f22=
436  U..._..(...#6$..
Sep 06 00:09:12 szarotka kernel: 00000000: 67954159 a902c0a6 b1acd055 28d88=
b5f  YA.g....U..._..(
Sep 06 00:09:12 szarotka kernel: 00000000: c67468b2 141c40f8 cf38fba2 ff7b1=
25c  .ht..@....8.\.{.
Sep 06 00:09:12 szarotka kernel: 00000000: 7cdae1c2 cf3fe9ff c67468b2 141c4=
0f8  ...|..?..ht..@..
Sep 06 00:09:12 szarotka kernel: 00000000: 666b4847 3282e4fc ab3d2bc8 ad564=
57a  GHkf...2.+=3D.zEV.
Sep 06 00:09:12 szarotka kernel: 00000000: 24fd38ad 5e6e55a4 666b4847 3282e=
4fc  .8.$.Un^GHkf...2
Sep 06 00:09:12 szarotka kernel: 00000000: c66b39fe 201487f2 a90ce443 4e912=
b22  .9k.... C..."+.N
Sep 06 00:09:12 szarotka kernel: 00000000: d07b884c 0199e913 c66b39fe 20148=
7f2  L.{......9k....=20
Sep 06 00:09:12 szarotka kernel: 00000000: e9671205 9a502096 ecbe5848 23a27=
f21  ..g.. P.HX..!..#
Sep 06 00:09:12 szarotka kernel: 00000000: 66ee5674 ca595e82 e9671205 9a502=
096  tV.f.^Y...g.. P.
Sep 06 00:09:12 szarotka kernel: 00000000: dfbbd3f4 c18ca9d8 86142e1c 2ed82=
682  .............&..
Sep 06 00:09:12 szarotka kernel: 00000000: 3c678dfb 8a0fc0b0 dfbbd3f4 c18ca=
9d8  ..g<............
Sep 06 00:09:12 szarotka kernel: 00000000: a9d44159 33f2d89a 8c215f44 c0413=
851  YA.....3D_!.Q8A.
Sep 06 00:09:12 szarotka kernel: 00000000: bc54837e 0021d35f a9d44159 33f2d=
89a  ~.T._.!.YA.....3
Sep 06 00:09:12 szarotka kernel: 00000000: 2210db33 0cc485e8 01173a67 8227d=
85c  3.."....g:..\.'.
Sep 06 00:09:12 szarotka kernel: 00000000: 2210db33 0cc485e8 2210db33 0cc48=
5e8  3.."....3.."....
Sep 06 00:09:12 szarotka kernel: 00000000: de894d7d fb17c8e6 47079871 32917=
b7d  }M......q..G}{.2
Sep 06 00:09:12 szarotka kernel: 00000000: de894d7d fb17c8e6 de894d7d fb17c=
8e6  }M......}M......
Sep 06 00:09:12 szarotka kernel: 00000000: 46e037d0 c1c36609 d6b23f92 6ffbb=
50c  .7.F.f...?.....o
Sep 06 00:09:12 szarotka kernel: 00000000: 46e037d0 c1c36609 46e037d0 c1c36=
609  .7.F.f...7.F.f..
Sep 06 00:09:12 szarotka kernel: 00000000: 65e432fa 8d4115c8 2344c420 a79bf=
883  .2.e..A. .D#....
Sep 06 00:09:12 szarotka kernel: 00000000: 65e432fa 8d4115c8 65e432fa 8d411=
5c8  .2.e..A..2.e..A.
Sep 06 00:09:12 szarotka kernel: 00000000: e88bead7 292c2773 6c62b01c a37a5=
a7a  ....s',)..blzZz.
Sep 06 00:09:12 szarotka kernel: 00000000: e88bead7 292c2773 e88bead7 292c2=
773  ....s',)....s',)
Sep 06 00:09:12 szarotka kernel: 00000000: d0d0f6d4 2e35aff1 d567c8cc 89f5a=
1c1  ......5...g.....
Sep 06 00:09:12 szarotka kernel: 00000000: d0d0f6d4 2e35aff1 d0d0f6d4 2e35a=
ff1  ......5.......5.
Sep 06 00:09:12 szarotka kernel: 00000000: 21d9c310 5c628aa1 b9f00e83 def9d=
af4  ...!..b\........
Sep 06 00:09:12 szarotka kernel: 00000000: 21d9c310 5c628aa1 21d9c310 5c628=
aa1  ...!..b\...!..b\
Sep 06 00:09:12 szarotka kernel: 00000000: aa3fca85 f51a0444 c7bf8b09 52ae5=
acc  ..?.D........Z.R
Sep 06 00:09:12 szarotka kernel: 00000000: aa3fca85 f51a0444 aa3fca85 f51a0=
444  ..?.D.....?.D...
Sep 06 00:09:12 szarotka kernel: 00000000: ba54dfe2 b4e7a00f a5e6af52 0ff93=
83e  ..T.....R...>8..
Sep 06 00:09:12 szarotka kernel: 00000000: ba54dfe2 b4e7a00f ba54dfe2 b4e7a=
00f  ..T.......T.....
Sep 06 00:09:12 szarotka kernel: 00000000: b10df2e4 9a10dec1 87c9d952 837a7=
578  ........R...xuz.
Sep 06 00:09:12 szarotka kernel: 00000000: b10df2e4 9a10dec1 b10df2e4 9a10d=
ec1  ................
Sep 06 00:09:12 szarotka kernel: 00000000: 5612aa7e 7a568a67 529f95e7 784c7=
ba4  ~..Vg.Vz...R.{Lx
Sep 06 00:09:12 szarotka kernel: 00000000: 5612aa7e 7a568a67 5612aa7e 7a568=
a67  ~..Vg.Vz~..Vg.Vz
Sep 06 00:09:12 szarotka kernel: 00000000: 81ae2b94 cef986b0 dfb1ae59 568ca=
42e  .+......Y......V
Sep 06 00:09:12 szarotka kernel: 00000000: 3a5768c5 edb05d36 81ae2b94 cef98=
6b0  .hW:6]...+......
Sep 06 00:09:12 szarotka kernel: 00000000: a05bc404 6163fe1d a2adbd24 da4b1=
17e  ..[...ca$...~.K.
Sep 06 00:09:12 szarotka kernel: 00000000: a05bc404 6163fe1d a05bc404 6163f=
e1d  ..[...ca..[...ca
Sep 06 00:09:12 szarotka kernel: 00000000: db07b5db 43f38deb e61f630c 5378f=
715  .......C.c....xS
Sep 06 00:09:12 szarotka kernel: 00000000: db07b5db 43f38deb db07b5db 43f38=
deb  .......C.......C
Sep 06 00:09:12 szarotka kernel: 00000000: 0ebf69bb 6471b464 55f9ac27 a08c1=
5ab  .i..d.qd'..U....
Sep 06 00:09:12 szarotka kernel: 00000000: 8cfca850 a1850d3f 0ebf69bb 6471b=
464  P...?....i..d.qd
Sep 06 00:09:12 szarotka kernel: 00000000: 434fc1af 0603e02d 09dd49be b5745=
646  ..OC-....I..FVt.
Sep 06 00:09:12 szarotka kernel: 00000000: 434fc1af 0603e02d 434fc1af 0603e=
02d  ..OC-.....OC-...
Sep 06 00:09:12 szarotka kernel: 00000000: 2186e9e8 c99fb0bf 13b7a258 0e478=
a3f  ...!....X...?.G.
Sep 06 00:09:12 szarotka kernel: 00000000: 2dff74ca cfd260f2 2186e9e8 c99fb=
0bf  .t.-.`.....!....
Sep 06 00:09:12 szarotka kernel: 00000000: 32717e5d 8091d6f3 6f22891b 41970=
123  ]~q2......"o#..A
Sep 06 00:09:12 szarotka kernel: 00000000: 929246b5 559fb588 32717e5d 8091d=
6f3  .F.....U]~q2....
Sep 06 00:09:12 szarotka kernel: 00000000: aea5a604 64461d2c 828caa98 92a46=
d09  ....,.Fd.....m..
Sep 06 00:09:12 szarotka kernel: 00000000: aea5a604 64461d2c aea5a604 64461=
d2c  ....,.Fd....,.Fd
Sep 06 00:09:12 szarotka kernel: 00000000: 6084baa7 62363d34 d5a99a19 ae033=
3b1  ...`4=3D6b.....3..
Sep 06 00:09:12 szarotka kernel: 00000000: 6084baa7 62363d34 6084baa7 62363=
d34  ...`4=3D6b...`4=3D6b
Sep 06 00:09:12 szarotka kernel: 00000000: bd7dd08d 4d808301 0366da71 ec049=
6b2  ..}....Mq.f.....
Sep 06 00:09:12 szarotka kernel: 00000000: bd7dd08d 4d808301 bd7dd08d 4d808=
301  ..}....M..}....M
Sep 06 00:09:12 szarotka kernel: 00000000: 5e988d41 8deaeb0f eb1c84ed e7a0d=
095  A..^............
Sep 06 00:09:12 szarotka kernel: 00000000: 5e988d41 8deaeb0f 5e988d41 8deae=
b0f  A..^....A..^....
Sep 06 00:09:12 szarotka kernel: 00000000: 6a74a29b ec1f6ccd 84305d47 8ddae=
6ff  ..tj.l..G]0.....
Sep 06 00:09:12 szarotka kernel: 00000000: 6a74a29b ec1f6ccd 6a74a29b ec1f6=
ccd  ..tj.l....tj.l..
Sep 06 00:09:12 szarotka kernel: 00000000: 129e9748 9f1274ac 5968de95 a9cad=
90b  H....t....hY....
Sep 06 00:09:12 szarotka kernel: 00000000: 05afdc4d 28119798 129e9748 9f127=
4ac  M......(H....t..
Sep 06 00:09:12 szarotka kernel: 00000000: 7b6d4a01 9aabe011 af373324 6e483=
00c  .Jm{....$37..0Hn
Sep 06 00:09:12 szarotka kernel: 00000000: 7b6d4a01 9aabe011 7b6d4a01 9aabe=
011  .Jm{.....Jm{....
Sep 06 00:09:12 szarotka kernel: 00000000: 33ee5fe9 7afdac60 c36ed570 6532c=
756  ._.3`..zp.n.V.2e
Sep 06 00:09:12 szarotka kernel: 00000000: 33ee5fe9 7afdac60 33ee5fe9 7afda=
c60  ._.3`..z._.3`..z
Sep 06 00:09:12 szarotka kernel: 00000000: 2ee1ef06 8f1504cb 8e8727bb 0a82e=
df0  .........'......
Sep 06 00:09:12 szarotka kernel: 00000000: 2ee1ef06 8f1504cb 2ee1ef06 8f150=
4cb  ................
Sep 06 00:09:12 szarotka kernel: 00000000: 36085c75 81f8d72d 96e16a9f 2b630=
85a  u\.6-....j..Z.c+
Sep 06 00:09:12 szarotka kernel: 00000000: 88d7bcab 8ddaffcd 36085c75 81f8d=
72d  ........u\.6-...
Sep 06 00:09:12 szarotka kernel: 00000000: 76bec5c5 63f0d51b 1ece5a24 8752f=
b65  ...v...c$Z..e.R.
Sep 06 00:09:12 szarotka kernel: 00000000: 76bec5c5 63f0d51b 76bec5c5 63f0d=
51b  ...v...c...v...c
Sep 06 00:09:12 szarotka kernel: 00000000: e92438c8 d15625a2 7d39dfb9 9b996=
c82  .8$..%V...9}.l..
Sep 06 00:09:12 szarotka kernel: 00000000: e92438c8 d15625a2 e92438c8 d1562=
5a2  .8$..%V..8$..%V.
Sep 06 00:09:12 szarotka kernel: 00000000: 6676ec57 91e95dc0 8c82d5e3 8fe0d=
2dd  W.vf.]..........
Sep 06 00:09:12 szarotka kernel: 00000000: 6676ec57 91e95dc0 6676ec57 91e95=
dc0  W.vf.]..W.vf.]..
Sep 06 00:09:12 szarotka kernel: 00000000: 3148140d eeab96b6 8829b4a6 fb1b7=
5c2  ..H1......)..u..
Sep 06 00:09:12 szarotka kernel: 00000000: 3148140d eeab96b6 3148140d eeab9=
6b6  ..H1......H1....
Sep 06 00:09:12 szarotka kernel: 00000000: fd27dea6 91262f05 05abe204 e69a3=
bad  ..'../&......;..
Sep 06 00:09:12 szarotka kernel: 00000000: f5d753f6 8aec5bef fd27dea6 91262=
f05  .S...[....'../&.
Sep 06 00:09:12 szarotka kernel: 00000000: c1759590 da061b02 023b6271 ec411=
7e3  ..u.....qb;...A.
Sep 06 00:09:12 szarotka kernel: 00000000: c1759590 da061b02 c1759590 da061=
b02  ..u.......u.....
Sep 06 00:09:12 szarotka kernel: 00000000: 0f72fcfc dcad5180 c8fe39e5 897b8=
60f  ..r..Q...9....{.
Sep 06 00:09:12 szarotka kernel: 00000000: 8f28ad71 ce3cf497 0f72fcfc dcad5=
180  q.(...<...r..Q..
Sep 06 00:09:12 szarotka kernel: 00000000: fe93fb4e fae87a52 84512954 9f0ac=
cfd  N...Rz..T)Q.....
Sep 06 00:09:12 szarotka kernel: 00000000: fe93fb4e fae87a52 fe93fb4e fae87=
a52  N...Rz..N...Rz..
Sep 06 00:09:12 szarotka kernel: 00000000: 60d68888 fe14c72f f5523b61 ecf26=
42d  ...`/...a;R.-d..
Sep 06 00:09:12 szarotka kernel: 00000000: 87e862ad c2ff7e7e 60d68888 fe14c=
72f  .b..~~.....`/...
Sep 06 00:09:12 szarotka kernel: 00000000: 5485444a dad8263e df061d9f f9bc5=
6fb  JD.T>&.......V..
Sep 06 00:09:12 szarotka kernel: 00000000: 5485444a dad8263e 5485444a dad82=
63e  JD.T>&..JD.T>&..
Sep 06 00:09:12 szarotka kernel: 00000000: d0424fdb fa57ebfb 10f4eb6e 56ccb=
f39  .OB...W.n...9..V
Sep 06 00:09:12 szarotka kernel: 00000000: d0424fdb fa57ebfb d0424fdb fa57e=
bfb  .OB...W..OB...W.
Sep 06 00:10:24 szarotka kernel: 00000000: b43df768 4f33fc40 8e742273 9ed85=
36e  h.=3D.@.3Os"t.nS..
Sep 06 00:10:24 szarotka kernel: 00000000: b43df768 4f33fc40 b43df768 4f33f=
c40  h.=3D.@.3Oh.=3D.@.3O
Sep 06 00:10:24 szarotka kernel: cifs_verify_signature: 170 callbacks suppr=
essed
Sep 06 00:10:24 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:24 szarotka kernel: 00000000: ea25f65d d5769a29 adc9be93 75422=
1d8  ].%.).v......!Bu
Sep 06 00:10:24 szarotka kernel: 00000000: ea25f65d d5769a29 ea25f65d d5769=
a29  ].%.).v.].%.).v.
Sep 06 00:10:24 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:24 szarotka kernel: 00000000: c9c4e0a5 3f817b57 1f10b57d d8e0b=
cf5  ....W{.?}.......
Sep 06 00:10:24 szarotka kernel: 00000000: c9c4e0a5 3f817b57 c9c4e0a5 3f817=
b57  ....W{.?....W{.?
Sep 06 00:10:24 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:29 szarotka kernel: 00000000: eb93ed1d f1488912 24c9bbb5 5964d=
98d  ......H....$..dY
Sep 06 00:10:29 szarotka kernel: 00000000: eb93ed1d f1488912 eb93ed1d f1488=
912  ......H.......H.
Sep 06 00:10:29 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:29 szarotka kernel: 00000000: dfcf5131 ee5d6485 870ef1f5 c7749=
507  1Q...d].......t.
Sep 06 00:10:29 szarotka kernel: 00000000: dfcf5131 ee5d6485 dfcf5131 ee5d6=
485  1Q...d].1Q...d].
Sep 06 00:10:29 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:29 szarotka kernel: 00000000: 068e1db3 bab2a35f 2c7a54d0 72aad=
dbe  ...._....Tz,...r
Sep 06 00:10:29 szarotka kernel: 00000000: 068e1db3 bab2a35f 068e1db3 bab2a=
35f  ...._......._...
Sep 06 00:10:29 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:29 szarotka kernel: 00000000: ccf4e003 c35498f2 3545d5ff bf7c9=
069  ......T...E5i.|.
Sep 06 00:10:29 szarotka kernel: 00000000: ccf4e003 c35498f2 ccf4e003 c3549=
8f2  ......T.......T.
Sep 06 00:10:29 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:29 szarotka kernel: 00000000: 937a7f67 9fa71211 98e4cb3e c9805=
212  g.z.....>....R..
Sep 06 00:10:29 szarotka kernel: 00000000: 937a7f67 9fa71211 937a7f67 9fa71=
211  g.z.....g.z.....
Sep 06 00:10:29 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:29 szarotka kernel: 00000000: 56a390a5 40755395 ba0f82e3 3aab7=
281  ...V.Su@.....r.:
Sep 06 00:10:29 szarotka kernel: 00000000: 56a390a5 40755395 56a390a5 40755=
395  ...V.Su@...V.Su@
Sep 06 00:10:29 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:29 szarotka kernel: 00000000: 297d9302 322edf34 a9885bf2 eb867=
490  ..})4..2.[...t..
Sep 06 00:10:29 szarotka kernel: 00000000: 297d9302 322edf34 297d9302 322ed=
f34  ..})4..2..})4..2
Sep 06 00:10:29 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:10:29 szarotka kernel: 00000000: ef1d995c 05ae04f6 dd6f6185 0f06a=
092  \........ao.....
Sep 06 00:10:29 szarotka kernel: 00000000: ef1d995c 05ae04f6 ef1d995c 05ae0=
4f6  \.......\.......
Sep 06 00:10:29 szarotka kernel: 00000000: 8a956146 b47af897 6d75d2c3 83675=
45d  Fa....z...um]Tg.
Sep 06 00:10:29 szarotka kernel: 00000000: 8a956146 b47af897 8a956146 b47af=
897  Fa....z.Fa....z.
Sep 06 00:10:29 szarotka kernel: 00000000: 3b40fdad f1d6f302 5e6c3165 1e7d7=
5aa  ..@;....e1l^.u}.
Sep 06 00:10:29 szarotka kernel: 00000000: 3b40fdad f1d6f302 3b40fdad f1d6f=
302  ..@;......@;....
Sep 06 00:10:29 szarotka kernel: 00000000: 6b3cf470 43e07a29 679e104f 44c4b=
3c4  p.<k)z.CO..g...D
Sep 06 00:10:29 szarotka kernel: 00000000: 6b3cf470 43e07a29 6b3cf470 43e07=
a29  p.<k)z.Cp.<k)z.C
Sep 06 00:10:29 szarotka kernel: 00000000: 1292761e c4d95cf3 3b034a1e 4fc83=
962  .v...\...J.;b9.O
Sep 06 00:10:29 szarotka kernel: 00000000: 1292761e c4d95cf3 1292761e c4d95=
cf3  .v...\...v...\..
Sep 06 00:10:29 szarotka kernel: 00000000: 9d980e47 989e6f6a 0f94b8cf 71656=
44d  G...jo......Mdeq
Sep 06 00:10:29 szarotka kernel: 00000000: 772b5fea 45dff12d 9d980e47 989e6=
f6a  ._+w-..EG...jo..
Sep 06 00:10:29 szarotka kernel: cifs_readv_callback: 71 callbacks suppress=
ed
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: 1be34779 20ceddc6 fb8ec2df 00bca=
abc  yG..... ........
Sep 06 00:10:29 szarotka kernel: 00000000: 1be34779 20ceddc6 1be34779 20ced=
dc6  yG..... yG.....=20
Sep 06 00:10:29 szarotka kernel: 00000000: 2afa1784 94606f07 a81765b3 c37d2=
68e  ...*.o`..e...&}.
Sep 06 00:10:29 szarotka kernel: 00000000: 2afa1784 94606f07 2afa1784 94606=
f07  ...*.o`....*.o`.
Sep 06 00:10:29 szarotka kernel: 00000000: d4162e58 9acc5e2d e5e7e07d 0737e=
0ae  X...-^..}.....7.
Sep 06 00:10:29 szarotka kernel: 00000000: d4162e58 9acc5e2d d4162e58 9acc5=
e2d  X...-^..X...-^..
Sep 06 00:10:29 szarotka kernel: 00000000: 0dbf5dbd fab648c6 598e5bab 32138=
9d6  .]...H...[.Y...2
Sep 06 00:10:29 szarotka kernel: 00000000: 0dbf5dbd fab648c6 0dbf5dbd fab64=
8c6  .]...H...]...H..
Sep 06 00:10:29 szarotka kernel: 00000000: 27c8bf38 08b66532 f6bd2f5f dd1d1=
7d2  8..'2e.._/......
Sep 06 00:10:29 szarotka kernel: 00000000: 27c8bf38 08b66532 27c8bf38 08b66=
532  8..'2e..8..'2e..
Sep 06 00:10:29 szarotka kernel: 00000000: 0e3a4940 b00ff000 67c47ba6 dc6cf=
c8a  @I:......{.g..l.
Sep 06 00:10:29 szarotka kernel: 00000000: 0e3a4940 b00ff000 0e3a4940 b00ff=
000  @I:.....@I:.....
Sep 06 00:10:29 szarotka kernel: 00000000: 78591a14 6a6d9b99 77133f7d f053c=
a45  ..Yx..mj}?.wE.S.
Sep 06 00:10:29 szarotka kernel: 00000000: 78591a14 6a6d9b99 78591a14 6a6d9=
b99  ..Yx..mj..Yx..mj
Sep 06 00:10:29 szarotka kernel: 00000000: 18d651d7 70a090a5 da0a2e40 c67c2=
c2d  .Q.....p@...-,|.
Sep 06 00:10:29 szarotka kernel: 00000000: d982d36f 2b2b137b 18d651d7 70a09=
0a5  o...{.++.Q.....p
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: 08059316 7c5e55db f1d4be41 14fbf=
a46  .....U^|A...F...
Sep 06 00:10:29 szarotka kernel: 00000000: 08059316 7c5e55db 08059316 7c5e5=
5db  .....U^|.....U^|
Sep 06 00:10:29 szarotka kernel: 00000000: 98a2789d 3d0a2cf8 59787fc1 4c140=
2d5  .x...,.=3D..xY...L
Sep 06 00:10:29 szarotka kernel: 00000000: 98a2789d 3d0a2cf8 98a2789d 3d0a2=
cf8  .x...,.=3D.x...,.=3D
Sep 06 00:10:29 szarotka kernel: 00000000: 669ab71e 2a06db3f 7916c3ed 83391=
3e7  ...f?..*...y..9.
Sep 06 00:10:29 szarotka kernel: 00000000: 669ab71e 2a06db3f 669ab71e 2a06d=
b3f  ...f?..*...f?..*
Sep 06 00:10:29 szarotka kernel: 00000000: 5bc6a196 ce7260c3 3abdb165 aff82=
f9a  ...[.`r.e..:./..
Sep 06 00:10:29 szarotka kernel: 00000000: 5bc6a196 ce7260c3 5bc6a196 ce726=
0c3  ...[.`r....[.`r.
Sep 06 00:10:29 szarotka kernel: 00000000: 25bef9d1 176ae129 25e144e7 bbb2e=
f54  ...%).j..D.%T...
Sep 06 00:10:29 szarotka kernel: 00000000: 25bef9d1 176ae129 25bef9d1 176ae=
129  ...%).j....%).j.
Sep 06 00:10:29 szarotka kernel: 00000000: 7c393191 e600d888 8eaa832c 01e6c=
b8b  .19|....,.......
Sep 06 00:10:29 szarotka kernel: 00000000: 2e38078e 6a9df1de 7c393191 e600d=
888  ..8....j.19|....
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: 31c1fd7d 025496e1 240fb706 d58aa=
ae4  }..1..T....$....
Sep 06 00:10:29 szarotka kernel: 00000000: 31c1fd7d 025496e1 31c1fd7d 02549=
6e1  }..1..T.}..1..T.
Sep 06 00:10:29 szarotka kernel: 00000000: 5da790f5 a47a055a f7cbcd9a 66abb=
542  ...]Z.z.....B..f
Sep 06 00:10:29 szarotka kernel: 00000000: 5da790f5 a47a055a 5da790f5 a47a0=
55a  ...]Z.z....]Z.z.
Sep 06 00:10:29 szarotka kernel: 00000000: 1dccddc9 8632cef1 078da414 4121b=
e73  ......2.....s.!A
Sep 06 00:10:29 szarotka kernel: 00000000: 1dccddc9 8632cef1 1dccddc9 8632c=
ef1  ......2.......2.
Sep 06 00:10:29 szarotka kernel: 00000000: 7213ee97 c73dce06 13b67362 29234=
ea9  ...r..=3D.bs...N#)
Sep 06 00:10:29 szarotka kernel: 00000000: 61430959 70269c8f 7213ee97 c73dc=
e06  Y.Ca..&p...r..=3D.
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: d1538655 09b215e4 51e81497 f59ec=
579  U.S........Qy...
Sep 06 00:10:29 szarotka kernel: 00000000: cc9c8f7b 6a1b5b01 d1538655 09b21=
5e4  {....[.jU.S.....
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: ee7a1fff 2493df69 c1e6f5a8 42cbe=
200  ..z.i..$.......B
Sep 06 00:10:29 szarotka kernel: 00000000: 1d3ee219 350ff9cd ee7a1fff 2493d=
f69  ..>....5..z.i..$
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: 63db6cf7 ff98c1d6 5e82cd36 51f9d=
508  .l.c....6..^...Q
Sep 06 00:10:29 szarotka kernel: 00000000: 63db6cf7 ff98c1d6 63db6cf7 ff98c=
1d6  .l.c.....l.c....
Sep 06 00:10:29 szarotka kernel: 00000000: 20e1bac9 341d26dd ed8a41c3 4f0d5=
ec0  ... .&.4.A...^.O
Sep 06 00:10:29 szarotka kernel: 00000000: 20e1bac9 341d26dd 20e1bac9 341d2=
6dd  ... .&.4... .&.4
Sep 06 00:10:29 szarotka kernel: 00000000: 4bb6efd5 87a01f0b 47eda563 bb68b=
0ad  ...K....c..G..h.
Sep 06 00:10:29 szarotka kernel: 00000000: 4bb6efd5 87a01f0b 4bb6efd5 87a01=
f0b  ...K.......K....
Sep 06 00:10:29 szarotka kernel: 00000000: e60fba88 3a1ee96b e81f6837 ea3d9=
4b1  ....k..:7h....=3D.
Sep 06 00:10:29 szarotka kernel: 00000000: e60fba88 3a1ee96b e60fba88 3a1ee=
96b  ....k..:....k..:
Sep 06 00:10:29 szarotka kernel: 00000000: 37a503d5 18f82ad5 20183259 07225=
f0c  ...7.*..Y2. ._".
Sep 06 00:10:29 szarotka kernel: 00000000: 37a503d5 18f82ad5 37a503d5 18f82=
ad5  ...7.*.....7.*..
Sep 06 00:10:29 szarotka kernel: 00000000: 27b91478 0b89eda0 ab660601 1be9f=
012  x..'......f.....
Sep 06 00:10:29 szarotka kernel: 00000000: 27b91478 0b89eda0 27b91478 0b89e=
da0  x..'....x..'....
Sep 06 00:10:29 szarotka kernel: 00000000: c7220034 1467ef25 e4817cd3 8ca3c=
f03  4.".%.g..|......
Sep 06 00:10:29 szarotka kernel: 00000000: c7220034 1467ef25 c7220034 1467e=
f25  4.".%.g.4.".%.g.
Sep 06 00:10:29 szarotka kernel: 00000000: c67d9c25 05cbd591 7d266503 bc324=
dc6  %.}......e&}.M2.
Sep 06 00:10:29 szarotka kernel: 00000000: c67d9c25 05cbd591 c67d9c25 05cbd=
591  %.}.....%.}.....
Sep 06 00:10:29 szarotka kernel: 00000000: dd7603f8 3a52afd8 d0d8d292 d07e8=
0d3  ..v...R:......~.
Sep 06 00:10:29 szarotka kernel: 00000000: dd7603f8 3a52afd8 dd7603f8 3a52a=
fd8  ..v...R:..v...R:
Sep 06 00:10:29 szarotka kernel: 00000000: 479e831a fc12667c 9133249c 8409d=
94b  ...G|f...$3.K...
Sep 06 00:10:29 szarotka kernel: 00000000: 00968c67 53b86662 479e831a fc126=
67c  g...bf.S...G|f..
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: 25235f65 8044feaa afdc3d63 9ee41=
e10  e_#%..D.c=3D......
Sep 06 00:10:29 szarotka kernel: 00000000: caf8a81b 6b0384a2 25235f65 8044f=
eaa  .......ke_#%..D.
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: c8cef132 fd28ac81 2dd60e53 92123=
e48  2.....(.S..-H>..
Sep 06 00:10:29 szarotka kernel: 00000000: b80ec5c5 9ed1ae13 c8cef132 fd28a=
c81  ........2.....(.
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: 885fcc7f 0fd835f8 7ab2f6f1 25541=
cc3  .._..5.....z..T%
Sep 06 00:10:29 szarotka kernel: 00000000: 885fcc7f 0fd835f8 885fcc7f 0fd83=
5f8  .._..5...._..5..
Sep 06 00:10:29 szarotka kernel: 00000000: 0fbaf5ed 6077ec92 6559f9d3 a92ec=
2cf  ......w`..Ye....
Sep 06 00:10:29 szarotka kernel: 00000000: 0fbaf5ed 6077ec92 0fbaf5ed 6077e=
c92  ......w`......w`
Sep 06 00:10:29 szarotka kernel: 00000000: 5f5008b0 29abfec9 13bf758a 7847e=
1d7  ..P_...).u....Gx
Sep 06 00:10:29 szarotka kernel: 00000000: 5f5008b0 29abfec9 5f5008b0 29abf=
ec9  ..P_...)..P_...)
Sep 06 00:10:29 szarotka kernel: 00000000: 2cd9da53 6ffcd5cb db5f7507 53fb9=
cdb  S..,...o.u_....S
Sep 06 00:10:29 szarotka kernel: 00000000: 2cd9da53 6ffcd5cb 2cd9da53 6ffcd=
5cb  S..,...oS..,...o
Sep 06 00:10:29 szarotka kernel: 00000000: 0e34f83f 9cc3145e 8630a7f8 e79f8=
153  ?.4.^.....0.S...
Sep 06 00:10:29 szarotka kernel: 00000000: 0e34f83f 9cc3145e 0e34f83f 9cc31=
45e  ?.4.^...?.4.^...
Sep 06 00:10:29 szarotka kernel: 00000000: 89687068 5c2e4c22 44b48390 fa7eb=
bd8  hph."L.\...D..~.
Sep 06 00:10:29 szarotka kernel: 00000000: 89687068 5c2e4c22 89687068 5c2e4=
c22  hph."L.\hph."L.\
Sep 06 00:10:29 szarotka kernel: 00000000: 6e259e55 c9dca68d 0012c196 1d144=
5ed  U.%n.........E..
Sep 06 00:10:29 szarotka kernel: 00000000: 6e259e55 c9dca68d 6e259e55 c9dca=
68d  U.%n....U.%n....
Sep 06 00:10:29 szarotka kernel: 00000000: bb26c255 01f43e24 63961c92 186a6=
44c  U.&.$>.....cLdj.
Sep 06 00:10:29 szarotka kernel: 00000000: bb26c255 01f43e24 bb26c255 01f43=
e24  U.&.$>..U.&.$>..
Sep 06 00:10:29 szarotka kernel: 00000000: 0bb912ca 05fee88d 6e1dc753 dce01=
7ff  ........S..n....
Sep 06 00:10:29 szarotka kernel: 00000000: 0bb912ca 05fee88d 0bb912ca 05fee=
88d  ................
Sep 06 00:10:29 szarotka kernel: 00000000: 5969d138 85be6b43 ed0c068b b1197=
ffb  8.iYCk..........
Sep 06 00:10:29 szarotka kernel: 00000000: 317593e8 60b2b7b8 5969d138 85be6=
b43  ..u1...`8.iYCk..
Sep 06 00:10:29 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:10:29 szarotka kernel: 00000000: c82a3c37 433edbaa 0ae27d17 2a6a3=
a86  7<*...>C.}...:j*
Sep 06 00:10:29 szarotka kernel: 00000000: 694091b7 3d1fc741 c82a3c37 433ed=
baa  ..@iA..=3D7<*...>C
Sep 06 00:10:29 szarotka kernel: 00000000: b04b0652 21c9803c f099febe 7c5d4=
4d9  R.K.<..!.....D]|
Sep 06 00:10:29 szarotka kernel: 00000000: b11f62e6 9d5c0bac b04b0652 21c98=
03c  .b....\.R.K.<..!
Sep 06 00:10:29 szarotka kernel: 00000000: 7408122b cfb2e341 c72aebbb 78c83=
8e1  +..tA.....*..8.x
Sep 06 00:10:29 szarotka kernel: 00000000: 4cb12fee 73eb6646 7408122b cfb2e=
341  ./.LFf.s+..tA...
Sep 06 00:10:29 szarotka kernel: 00000000: f0891f52 46f8ca1b af94565d 6f3fc=
832  R......F]V..2.?o
Sep 06 00:10:29 szarotka kernel: 00000000: 315896d3 fac6b8ed f0891f52 46f8c=
a1b  ..X1....R......F
Sep 06 00:10:29 szarotka kernel: 00000000: af23ed57 a87b68d1 f1e47521 9d9f1=
af9  W.#..h{.!u......
Sep 06 00:10:29 szarotka kernel: 00000000: af23ed57 a87b68d1 af23ed57 a87b6=
8d1  W.#..h{.W.#..h{.
Sep 06 00:10:29 szarotka kernel: 00000000: b72ec43d 83e6d29a 17c0257f 98c6e=
fe7  =3D........%......
Sep 06 00:10:29 szarotka kernel: 00000000: 6805ad87 9c302e25 b72ec43d 83e6d=
29a  ...h%.0.=3D.......
Sep 06 00:10:29 szarotka kernel: 00000000: 24051500 d3bd28fa f017b739 7a7e2=
cb3  ...$.(..9....,~z
Sep 06 00:10:29 szarotka kernel: 00000000: cc3c45a9 31904e1f 24051500 d3bd2=
8fa  .E<..N.1...$.(..
Sep 06 00:10:29 szarotka kernel: 00000000: 413e61e2 7236a955 d1a392c8 42faf=
4e9  .a>AU.6r.......B
Sep 06 00:10:29 szarotka kernel: 00000000: 8a2de7b8 a88997cf 413e61e2 7236a=
955  ..-......a>AU.6r
Sep 06 00:10:29 szarotka kernel: 00000000: de25f256 d8de723c e1383e94 9d1c2=
0fa  V.%.<r...>8.. ..
Sep 06 00:10:29 szarotka kernel: 00000000: de25f256 d8de723c de25f256 d8de7=
23c  V.%.<r..V.%.<r..
Sep 06 00:10:29 szarotka kernel: 00000000: 35e082d6 6e10d673 bee29cf7 18352=
592  ...5s..n.....%5.
Sep 06 00:10:29 szarotka kernel: 00000000: 35e082d6 6e10d673 35e082d6 6e10d=
673  ...5s..n...5s..n
Sep 06 00:10:29 szarotka kernel: 00000000: 8c65ae21 4b96ba13 57cbb6b0 96a69=
83b  !.e....K...W;...
Sep 06 00:10:29 szarotka kernel: 00000000: 8c65ae21 4b96ba13 8c65ae21 4b96b=
a13  !.e....K!.e....K
Sep 06 00:10:29 szarotka kernel: 00000000: ab593f23 3f7a06b8 068b39be ad9a1=
136  #?Y...z?.9..6...
Sep 06 00:10:29 szarotka kernel: 00000000: ab593f23 3f7a06b8 ab593f23 3f7a0=
6b8  #?Y...z?#?Y...z?
Sep 06 00:10:29 szarotka kernel: 00000000: 8d46f908 8a1cd4d8 c860e8b7 e0a6e=
4d8  ..F.......`.....
Sep 06 00:10:29 szarotka kernel: 00000000: 8d46f908 8a1cd4d8 8d46f908 8a1cd=
4d8  ..F.......F.....
Sep 06 00:10:29 szarotka kernel: 00000000: 083a2243 c26ef1c1 188e4e5d 7968c=
53b  C":...n.]N..;.hy
Sep 06 00:10:29 szarotka kernel: 00000000: 083a2243 c26ef1c1 083a2243 c26ef=
1c1  C":...n.C":...n.
Sep 06 00:10:29 szarotka kernel: 00000000: cc88f74d 0eb5cd2b 98af29fa d009d=
5c8  M...+....)......
Sep 06 00:10:29 szarotka kernel: 00000000: cc88f74d 0eb5cd2b cc88f74d 0eb5c=
d2b  M...+...M...+...
Sep 06 00:10:29 szarotka kernel: 00000000: b6f205f2 5aa891d1 bc8f4fd5 35ea4=
fcd  .......Z.O...O.5
Sep 06 00:10:29 szarotka kernel: 00000000: b6f205f2 5aa891d1 b6f205f2 5aa89=
1d1  .......Z.......Z
Sep 06 00:10:29 szarotka kernel: 00000000: 26092387 edd3057e 14d05b02 92648=
b95  .#.&~....[....d.
Sep 06 00:10:29 szarotka kernel: 00000000: 04cdc17e 2073baec 26092387 edd30=
57e  ~.....s .#.&~...
Sep 06 00:10:29 szarotka kernel: 00000000: dfc9b08d 0d802315 fe058e3a e1bb1=
95c  .....#..:...\...
Sep 06 00:10:29 szarotka kernel: 00000000: dfc9b08d 0d802315 dfc9b08d 0d802=
315  .....#.......#..
Sep 06 00:10:29 szarotka kernel: 00000000: 0c79cc60 52745969 552de479 7c174=
22e  `.y.iYtRy.-U.B.|
Sep 06 00:10:29 szarotka kernel: 00000000: 0c79cc60 52745969 0c79cc60 52745=
969  `.y.iYtR`.y.iYtR
Sep 06 00:10:29 szarotka kernel: 00000000: 230abcfc f9c6e8a8 7495f0ec 6f220=
a4a  ...#.......tJ."o
Sep 06 00:10:29 szarotka kernel: 00000000: 230abcfc f9c6e8a8 230abcfc f9c6e=
8a8  ...#.......#....
Sep 06 00:10:29 szarotka kernel: 00000000: a8aab03e c6f2c8bb 1807de7c 1c28b=
7e4  >.......|.....(.
Sep 06 00:10:29 szarotka kernel: 00000000: a8aab03e c6f2c8bb a8aab03e c6f2c=
8bb  >.......>.......
Sep 06 00:10:29 szarotka kernel: 00000000: 14c40e11 09e10a21 2674f5f6 9a7cf=
ddf  ....!.....t&..|.
Sep 06 00:10:29 szarotka kernel: 00000000: 14c40e11 09e10a21 14c40e11 09e10=
a21  ....!.......!...
Sep 06 00:10:29 szarotka kernel: 00000000: 205e16ba e67e9487 268d308f 15c82=
cdf  ..^ ..~..0.&.,..
Sep 06 00:10:29 szarotka kernel: 00000000: 205e16ba e67e9487 205e16ba e67e9=
487  ..^ ..~...^ ..~.
Sep 06 00:10:29 szarotka kernel: 00000000: e8e73884 96c47b1b 17b471ea 20d26=
ffb  .8...{...q...o.=20
Sep 06 00:10:29 szarotka kernel: 00000000: e8e73884 96c47b1b e8e73884 96c47=
b1b  .8...{...8...{..
Sep 06 00:10:29 szarotka kernel: 00000000: 999b208c 2f9207b8 005a5c9c 14677=
84e  . ...../.\Z.Nxg.
Sep 06 00:10:29 szarotka kernel: 00000000: 999b208c 2f9207b8 999b208c 2f920=
7b8  . ...../. ...../
Sep 06 00:10:29 szarotka kernel: 00000000: 36058e8c 67842075 44eaea4f 5f469=
a5a  ...6u .gO..DZ.F_
Sep 06 00:10:29 szarotka kernel: 00000000: 36058e8c 67842075 36058e8c 67842=
075  ...6u .g...6u .g
Sep 06 00:10:29 szarotka kernel: 00000000: 9d5e738d aaf05edd 3ff7068b b9e73=
8a3  .s^..^.....?.8..
Sep 06 00:10:29 szarotka kernel: 00000000: 9d5e738d aaf05edd 9d5e738d aaf05=
edd  .s^..^...s^..^..
Sep 06 00:10:29 szarotka kernel: 00000000: b2f75441 36f3a822 f2b18d2f c21dd=
55f  AT.."..6/..._...
Sep 06 00:10:29 szarotka kernel: 00000000: b2f75441 36f3a822 b2f75441 36f3a=
822  AT.."..6AT.."..6
Sep 06 00:10:29 szarotka kernel: 00000000: 549ef786 f266a17b 0be6928a 38a90=
9de  ...T{.f........8
Sep 06 00:10:29 szarotka kernel: 00000000: 00f2fc77 6228f0cf 549ef786 f266a=
17b  w.....(b...T{.f.
Sep 06 00:10:29 szarotka kernel: 00000000: 1c52292b ed9b8dc5 938a19d2 69a06=
5e3  +)R..........e.i
Sep 06 00:10:29 szarotka kernel: 00000000: 7e1c0f65 865db441 1c52292b ed9b8=
dc5  e..~A.].+)R.....
Sep 06 00:10:29 szarotka kernel: 00000000: c22dd861 4eff0626 2b80f6a6 394c5=
a68  a.-.&..N...+hZL9
Sep 06 00:10:29 szarotka kernel: 00000000: c22dd861 4eff0626 c22dd861 4eff0=
626  a.-.&..Na.-.&..N
Sep 06 00:10:29 szarotka kernel: 00000000: fc46a9ab 2762b4c9 27ec340f bc184=
bb3  ..F...b'.4.'.K..
Sep 06 00:10:29 szarotka kernel: 00000000: 6efdc1be c9acfabf fc46a9ab 2762b=
4c9  ...n......F...b'
Sep 06 00:10:29 szarotka kernel: 00000000: b874d03d c8ba4566 86727612 b4efe=
34f  =3D.t.fE...vr.O...
Sep 06 00:10:29 szarotka kernel: 00000000: b874d03d c8ba4566 b874d03d c8ba4=
566  =3D.t.fE..=3D.t.fE..
Sep 06 00:10:29 szarotka kernel: 00000000: 00120b5b 5bb8c8c9 19db54bc dc2e6=
75e  [......[.T..^g..
Sep 06 00:10:29 szarotka kernel: 00000000: 00120b5b 5bb8c8c9 00120b5b 5bb8c=
8c9  [......[[......[
Sep 06 00:10:29 szarotka kernel: 00000000: c78d00da 9863a020 0c91b9e9 20c70=
c71  .... .c.....q..=20
Sep 06 00:10:29 szarotka kernel: 00000000: c78d00da 9863a020 c78d00da 9863a=
020  .... .c..... .c.
Sep 06 00:10:29 szarotka kernel: 00000000: 7e1211d6 dc792cc7 e0b44b5f 312c5=
6a5  ...~.,y._K...V,1
Sep 06 00:10:29 szarotka kernel: 00000000: 7e1211d6 dc792cc7 7e1211d6 dc792=
cc7  ...~.,y....~.,y.
Sep 06 00:10:29 szarotka kernel: 00000000: 7a74263d 8b77a762 3ed75eee 15255=
28a  =3D&tzb.w..^.>.R%.
Sep 06 00:10:29 szarotka kernel: 00000000: 7a74263d 8b77a762 7a74263d 8b77a=
762  =3D&tzb.w.=3D&tzb.w.
Sep 06 00:10:29 szarotka kernel: 00000000: 36754fbf 82205a57 d1b89887 b6435=
5e7  .Ou6WZ ......UC.
Sep 06 00:10:29 szarotka kernel: 00000000: 36754fbf 82205a57 36754fbf 82205=
a57  .Ou6WZ ..Ou6WZ .
Sep 06 00:10:29 szarotka kernel: 00000000: 3ea385ad 2c4ba6e5 9a30d1cb c73a1=
7cc  ...>..K,..0...:.
Sep 06 00:10:29 szarotka kernel: 00000000: 3ea385ad 2c4ba6e5 3ea385ad 2c4ba=
6e5  ...>..K,...>..K,
Sep 06 00:17:01 szarotka systemd[1]: Condition check resulted in systemd-cr=
on hourly script service being skipped.
Sep 06 00:17:01 szarotka systemd[1]: Reached target systemd-cron hourly tar=
get.
Sep 06 00:17:01 szarotka systemd[1]: Stopped target systemd-cron hourly tar=
get.
Sep 06 00:20:01 szarotka kernel: 00000000: 92415be0 0e459929 59d65622 4f7f7=
64f  .[A.).E."V.YOv.O
Sep 06 00:20:01 szarotka kernel: 00000000: 92415be0 0e459929 92415be0 0e459=
929  .[A.).E..[A.).E.
Sep 06 00:20:01 szarotka kernel: cifs_verify_signature: 87 callbacks suppre=
ssed
Sep 06 00:20:01 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:01 szarotka kernel: 00000000: 6adc057b 05e43a42 d848440a 80624=
06a  {..jB:...DH.j@b.
Sep 06 00:20:01 szarotka kernel: 00000000: 6adc057b 05e43a42 6adc057b 05e43=
a42  {..jB:..{..jB:..
Sep 06 00:20:01 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:01 szarotka kernel: 00000000: 56f75f15 617d6d2b 165eab96 21763=
953  ._.V+m}a..^.S9v!
Sep 06 00:20:01 szarotka kernel: 00000000: 56f75f15 617d6d2b 56f75f15 617d6=
d2b  ._.V+m}a._.V+m}a
Sep 06 00:20:01 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:08 szarotka kernel: 00000000: 2cb97f84 81870814 91da16e3 ad2cc=
181  ...,..........,.
Sep 06 00:20:08 szarotka kernel: 00000000: 2cb97f84 81870814 2cb97f84 81870=
814  ...,.......,....
Sep 06 00:20:08 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:08 szarotka kernel: 00000000: 94687d43 45cc2c6a 0cfb6165 e952d=
ff5  C}h.j,.Eea....R.
Sep 06 00:20:08 szarotka kernel: 00000000: 94687d43 45cc2c6a 94687d43 45cc2=
c6a  C}h.j,.EC}h.j,.E
Sep 06 00:20:08 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:10 szarotka kernel: 00000000: d5857e14 9d1ed9fe b618b5e4 b8f74=
561  .~..........aE..
Sep 06 00:20:10 szarotka kernel: 00000000: d5857e14 9d1ed9fe d5857e14 9d1ed=
9fe  .~.......~......
Sep 06 00:20:10 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:10 szarotka kernel: 00000000: 5a7d3788 87c85953 5938bf0e fcdd2=
370  .7}ZSY....8Yp#..
Sep 06 00:20:10 szarotka kernel: 00000000: 5a7d3788 87c85953 5a7d3788 87c85=
953  .7}ZSY...7}ZSY..
Sep 06 00:20:10 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:10 szarotka kernel: 00000000: 56cdfb4f 8bab81cf e4e1fbd1 9c78c=
13c  O..V........<.x.
Sep 06 00:20:10 szarotka kernel: 00000000: 56cdfb4f 8bab81cf 56cdfb4f 8bab8=
1cf  O..V....O..V....
Sep 06 00:20:10 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:10 szarotka kernel: 00000000: 013f05bb 0e008542 6b9f7932 c2538=
5e8  ..?.B...2y.k..S.
Sep 06 00:20:10 szarotka kernel: 00000000: 013f05bb 0e008542 013f05bb 0e008=
542  ..?.B.....?.B...
Sep 06 00:20:10 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:10 szarotka kernel: 00000000: e6b940a3 02848729 c24ad337 17793=
258  .@..)...7.J.X2y.
Sep 06 00:20:10 szarotka kernel: 00000000: 8da61318 4242fefd e6b940a3 02848=
729  ......BB.@..)...
Sep 06 00:20:10 szarotka kernel: CIFS VFS: command 0x2e
Sep 06 00:20:10 szarotka kernel: cifs_readv_callback: 11 callbacks suppress=
ed
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: e355af85 21fc0588 6593720e e387d=
adc  ..U....!.r.e....
Sep 06 00:20:10 szarotka kernel: 00000000: e355af85 21fc0588 e355af85 21fc0=
588  ..U....!..U....!
Sep 06 00:20:10 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:10 szarotka kernel: 00000000: b73e1b8e e8e8c7ae 5136fd6c c2b78=
fc5  ..>.....l.6Q....
Sep 06 00:20:10 szarotka kernel: 00000000: b73e1b8e e8e8c7ae b73e1b8e e8e8c=
7ae  ..>.......>.....
Sep 06 00:20:10 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:10 szarotka kernel: 00000000: 2da15c23 43f78be9 28ef1360 90800=
e3f  #\.-...C`..(?...
Sep 06 00:20:10 szarotka kernel: 00000000: 2da15c23 43f78be9 2da15c23 43f78=
be9  #\.-...C#\.-...C
Sep 06 00:20:10 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:10 szarotka kernel: 00000000: 67206311 51c14aad 3758c345 96a66=
6e8  .c g.J.QE.X7.f..
Sep 06 00:20:10 szarotka kernel: 00000000: 67206311 51c14aad 67206311 51c14=
aad  .c g.J.Q.c g.J.Q
Sep 06 00:20:10 szarotka kernel: 00000000: 82785f81 677d653a eefe0a0e 25e64=
1ea  ._x.:e}g.....A.%
Sep 06 00:20:10 szarotka kernel: 00000000: 82785f81 677d653a 82785f81 677d6=
53a  ._x.:e}g._x.:e}g
Sep 06 00:20:10 szarotka kernel: 00000000: a035b4c2 5982dc62 f229f3cf 89077=
a43  ..5.b..Y..).Cz..
Sep 06 00:20:10 szarotka kernel: 00000000: a035b4c2 5982dc62 a035b4c2 5982d=
c62  ..5.b..Y..5.b..Y
Sep 06 00:20:10 szarotka kernel: 00000000: a165771e f08bc20d 3c63e92f bbb70=
f01  .we...../.c<....
Sep 06 00:20:10 szarotka kernel: 00000000: a165771e f08bc20d a165771e f08bc=
20d  .we......we.....
Sep 06 00:20:10 szarotka kernel: 00000000: 8c42c390 3bb903da b83fe4b5 9ad40=
e2d  ..B....;..?.-...
Sep 06 00:20:10 szarotka kernel: 00000000: 17df690e 45616d61 8c42c390 3bb90=
3da  .i..amaE..B....;
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: 454ce107 4976fd80 f861d1e2 007e8=
521  ..LE..vI..a.!.~.
Sep 06 00:20:10 szarotka kernel: 00000000: 454ce107 4976fd80 454ce107 4976f=
d80  ..LE..vI..LE..vI
Sep 06 00:20:10 szarotka kernel: 00000000: 6e7e16aa 99c19e43 5dd5e5b6 9f973=
f57  ..~nC......]W?..
Sep 06 00:20:10 szarotka kernel: 00000000: 6e7e16aa 99c19e43 6e7e16aa 99c19=
e43  ..~nC.....~nC...
Sep 06 00:20:10 szarotka kernel: 00000000: 46f247ab 48997e03 30c8722f a07d8=
cb3  .G.F.~.H/r.0..}.
Sep 06 00:20:10 szarotka kernel: 00000000: 46f247ab 48997e03 46f247ab 48997=
e03  .G.F.~.H.G.F.~.H
Sep 06 00:20:10 szarotka kernel: 00000000: b46c439d db5c582c ddb6080b 46431=
618  .Cl.,X\.......CF
Sep 06 00:20:10 szarotka kernel: 00000000: b46c439d db5c582c b46c439d db5c5=
82c  .Cl.,X\..Cl.,X\.
Sep 06 00:20:10 szarotka kernel: 00000000: 952ea75c 64a04ddd 0f84a3de 0feac=
3b7  \....M.d........
Sep 06 00:20:10 szarotka kernel: 00000000: 952ea75c 64a04ddd 952ea75c 64a04=
ddd  \....M.d\....M.d
Sep 06 00:20:10 szarotka kernel: 00000000: adb93b0f e9f1cd14 5a535847 2c023=
ade  .;......GXSZ.:.,
Sep 06 00:20:10 szarotka kernel: 00000000: a7ea0b55 f395e8fc adb93b0f e9f1c=
d14  U........;......
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: c3bb7f13 8a83729c e81a0767 09d28=
93d  .....r..g...=3D...
Sep 06 00:20:10 szarotka kernel: 00000000: c3bb7f13 8a83729c c3bb7f13 8a837=
29c  .....r.......r..
Sep 06 00:20:10 szarotka kernel: 00000000: 371746d0 372b65f1 90ad1008 fd688=
fb4  .F.7.e+7......h.
Sep 06 00:20:10 szarotka kernel: 00000000: 371746d0 372b65f1 371746d0 372b6=
5f1  .F.7.e+7.F.7.e+7
Sep 06 00:20:10 szarotka kernel: 00000000: a2120c70 89f5171e 70cfc668 552ff=
43e  p.......h..p>./U
Sep 06 00:20:10 szarotka kernel: 00000000: a2120c70 89f5171e a2120c70 89f51=
71e  p.......p.......
Sep 06 00:20:10 szarotka kernel: 00000000: 86844820 3305daeb 85f530b3 a08f0=
267   H.....3.0..g...
Sep 06 00:20:10 szarotka kernel: 00000000: 35e7debd c54ed3a9 86844820 3305d=
aeb  ...5..N. H.....3
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: d52d640e f855fbe4 c367b0fc 2bd5c=
21c  .d-...U...g....+
Sep 06 00:20:10 szarotka kernel: 00000000: c195ed57 4260129e d52d640e f855f=
be4  W.....`B.d-...U.
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: 3264f62d 6686699d da2ac26a bfb2d=
143  -.d2.i.fj.*.C...
Sep 06 00:20:10 szarotka kernel: 00000000: 70782a3c b18fc49c 3264f62d 66866=
99d  <*xp....-.d2.i.f
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: f4c274d6 8927834e d55a49d7 2181a=
f8e  .t..N.'..IZ....!
Sep 06 00:20:10 szarotka kernel: 00000000: f4c274d6 8927834e f4c274d6 89278=
34e  .t..N.'..t..N.'.
Sep 06 00:20:10 szarotka kernel: 00000000: d5af40ec cd55a98c c4368985 501f0=
e64  .@....U...6.d..P
Sep 06 00:20:10 szarotka kernel: 00000000: d5af40ec cd55a98c d5af40ec cd55a=
98c  .@....U..@....U.
Sep 06 00:20:10 szarotka kernel: 00000000: 65212152 d7abfb30 606dc2b6 4a39d=
24a  R!!e0.....m`J.9J
Sep 06 00:20:10 szarotka kernel: 00000000: 65212152 d7abfb30 65212152 d7abf=
b30  R!!e0...R!!e0...
Sep 06 00:20:10 szarotka kernel: 00000000: defd03cd 9bcfadfa 56568d2f 8acba=
8fa  ......../.VV....
Sep 06 00:20:10 szarotka kernel: 00000000: defd03cd 9bcfadfa defd03cd 9bcfa=
dfa  ................
Sep 06 00:20:10 szarotka kernel: 00000000: 45f46281 071651a7 0722e5fc 92734=
840  .b.E.Q....".@Hs.
Sep 06 00:20:10 szarotka kernel: 00000000: 45f46281 071651a7 45f46281 07165=
1a7  .b.E.Q...b.E.Q..
Sep 06 00:20:10 szarotka kernel: 00000000: ff5533aa 5d38fbb8 765ff968 4c0ac=
c67  .3U...8]h._vg..L
Sep 06 00:20:10 szarotka kernel: 00000000: ff5533aa 5d38fbb8 ff5533aa 5d38f=
bb8  .3U...8].3U...8]
Sep 06 00:20:10 szarotka kernel: 00000000: 4ae68cc3 11649065 759a930a c7fdf=
d5d  ...Je.d....u]...
Sep 06 00:20:10 szarotka kernel: 00000000: 4ae68cc3 11649065 4ae68cc3 11649=
065  ...Je.d....Je.d.
Sep 06 00:20:10 szarotka kernel: 00000000: 0cccc08c ddb3e02a 5b0e24a5 b774b=
4d7  ....*....$.[..t.
Sep 06 00:20:10 szarotka kernel: 00000000: 0cccc08c ddb3e02a 0cccc08c ddb3e=
02a  ....*.......*...
Sep 06 00:20:10 szarotka kernel: 00000000: 20b83972 07f53e16 82484058 ba083=
056  r9. .>..X@H.V0..
Sep 06 00:20:10 szarotka kernel: 00000000: 20b83972 07f53e16 20b83972 07f53=
e16  r9. .>..r9. .>..
Sep 06 00:20:10 szarotka kernel: 00000000: 002101cb f86d0e62 b093863a a5c09=
bb5  ..!.b.m.:.......
Sep 06 00:20:10 szarotka kernel: 00000000: b1810db3 edb9859d 002101cb f86d0=
e62  ..........!.b.m.
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: 58e1324c 7efd6843 816cce09 b1be3=
8ce  L2.XCh.~..l..8..
Sep 06 00:20:10 szarotka kernel: 00000000: 667a236b 348b833d 58e1324c 7efd6=
843  k#zf=3D..4L2.XCh.~
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: 648260ae d16f1f11 ccf6d066 baedf=
d70  .`.d..o.f...p...
Sep 06 00:20:10 szarotka kernel: 00000000: 7f35548a bee51b5b 648260ae d16f1=
f11  .T5.[....`.d..o.
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: 62f1416f 56be8456 ce61cf43 f7618=
945  oA.bV..VC.a.E.a.
Sep 06 00:20:10 szarotka kernel: 00000000: 62f1416f 56be8456 62f1416f 56be8=
456  oA.bV..VoA.bV..V
Sep 06 00:20:10 szarotka kernel: 00000000: c7fe11b4 1f112adf 967a1935 73bff=
aa8  .....*..5.z....s
Sep 06 00:20:10 szarotka kernel: 00000000: c7fe11b4 1f112adf c7fe11b4 1f112=
adf  .....*.......*..
Sep 06 00:20:10 szarotka kernel: 00000000: 15f21f5b 7db92b33 ffd27eac 3b293=
ec5  [...3+.}.~...>);
Sep 06 00:20:10 szarotka kernel: 00000000: 15f21f5b 7db92b33 15f21f5b 7db92=
b33  [...3+.}[...3+.}
Sep 06 00:20:10 szarotka kernel: 00000000: 1bdc8513 08d35bb8 50a7fa77 dfbda=
d63  .....[..w..Pc...
Sep 06 00:20:10 szarotka kernel: 00000000: 1bdc8513 08d35bb8 1bdc8513 08d35=
bb8  .....[.......[..
Sep 06 00:20:10 szarotka kernel: 00000000: 7726c4ec 8986353f 9327e859 6e0d5=
3b0  ..&w?5..Y.'..S.n
Sep 06 00:20:10 szarotka kernel: 00000000: 7726c4ec 8986353f 7726c4ec 89863=
53f  ..&w?5....&w?5..
Sep 06 00:20:10 szarotka kernel: 00000000: ce91d2e8 d688d562 9fd8f844 1de9a=
1e0  ....b...D.......
Sep 06 00:20:10 szarotka kernel: 00000000: ce91d2e8 d688d562 ce91d2e8 d688d=
562  ....b.......b...
Sep 06 00:20:10 szarotka kernel: 00000000: eecd7c83 fecef4b3 05aeaa7b a9ba0=
a3e  .|......{...>...
Sep 06 00:20:10 szarotka kernel: 00000000: eecd7c83 fecef4b3 eecd7c83 fecef=
4b3  .|.......|......
Sep 06 00:20:10 szarotka kernel: 00000000: 6501f672 f6468c8e 3292c371 6a747=
c6a  r..e..F.q..2j|tj
Sep 06 00:20:10 szarotka kernel: 00000000: 6501f672 f6468c8e 6501f672 f6468=
c8e  r..e..F.r..e..F.
Sep 06 00:20:10 szarotka kernel: 00000000: ff050d17 da61288a 385d9459 446a3=
975  .....(a.Y.]8u9jD
Sep 06 00:20:10 szarotka kernel: 00000000: ff050d17 da61288a ff050d17 da612=
88a  .....(a......(a.
Sep 06 00:20:10 szarotka kernel: 00000000: f8e0f0f0 1146eead d31dd153 6933e=
734  ......F.S...4.3i
Sep 06 00:20:10 szarotka kernel: 00000000: 1cc1e19e 85141eb3 f8e0f0f0 1146e=
ead  ..............F.
Sep 06 00:20:10 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:10 szarotka kernel: 00000000: dc87a619 553bbe43 397b126c 8c812=
999  ....C.;Ul.{9.)..
Sep 06 00:20:10 szarotka kernel: 00000000: f181c588 49da2e03 dc87a619 553bb=
e43  .......I....C.;U
Sep 06 00:20:10 szarotka kernel: 00000000: 4db0dfd0 77e7012d 22349d82 d33c4=
173  ...M-..w..4"sA<.
Sep 06 00:20:10 szarotka kernel: 00000000: 50c2398d d9cb12db 4db0dfd0 77e70=
12d  .9.P.......M-..w
Sep 06 00:20:10 szarotka kernel: 00000000: 7a42ab7a 81a81d5d 8d63e8e0 eccaf=
530  z.Bz].....c.0...
Sep 06 00:20:10 szarotka kernel: 00000000: 892ce41a 20c1413c 7a42ab7a 81a81=
d5d  ..,.<A. z.Bz]...
Sep 06 00:20:10 szarotka kernel: 00000000: a6e517b0 cd7852a1 9266c573 ffe8e=
ba3  .....Rx.s.f.....
Sep 06 00:20:10 szarotka kernel: 00000000: a6e517b0 cd7852a1 a6e517b0 cd785=
2a1  .....Rx......Rx.
Sep 06 00:20:10 szarotka kernel: 00000000: 9d3188c5 a9e73b52 ff139f24 9f64c=
ae2  ..1.R;..$.....d.
Sep 06 00:20:10 szarotka kernel: 00000000: af695208 71c97759 9d3188c5 a9e73=
b52  .Ri.Yw.q..1.R;..
Sep 06 00:20:10 szarotka kernel: 00000000: 197509f9 fd897a30 cdd75d36 9d963=
6f1  ..u.0z..6]...6..
Sep 06 00:20:10 szarotka kernel: 00000000: fac166c5 942b986a 197509f9 fd897=
a30  .f..j.+...u.0z..
Sep 06 00:20:10 szarotka kernel: 00000000: ff819698 68c1e043 84e21690 36f69=
697  ....C..h.......6
Sep 06 00:20:10 szarotka kernel: 00000000: cc14caa4 609e9cc6 ff819698 68c1e=
043  .......`....C..h
Sep 06 00:20:10 szarotka kernel: 00000000: 8f1ed7f3 f5708daf 68b13047 19a7b=
45d  ......p.G0.h]...
Sep 06 00:20:10 szarotka kernel: 00000000: 70b62256 f5038a5c 8f1ed7f3 f5708=
daf  V".p\.........p.
Sep 06 00:20:10 szarotka kernel: 00000000: f966b9c8 7732b8cc 3f5eb410 8ecb9=
125  ..f...2w..^?%...
Sep 06 00:20:10 szarotka kernel: 00000000: f966b9c8 7732b8cc f966b9c8 7732b=
8cc  ..f...2w..f...2w
Sep 06 00:20:10 szarotka kernel: 00000000: 19291bd5 8bc55536 15353187 80ca7=
55d  ..).6U...15.]u..
Sep 06 00:20:10 szarotka kernel: 00000000: 19291bd5 8bc55536 19291bd5 8bc55=
536  ..).6U....).6U..
Sep 06 00:20:10 szarotka kernel: 00000000: a14c95dd 9a16c297 b68e935c d20cd=
c2a  ..L.....\...*...
Sep 06 00:20:10 szarotka kernel: 00000000: a14c95dd 9a16c297 a14c95dd 9a16c=
297  ..L.......L.....
Sep 06 00:20:10 szarotka kernel: 00000000: 0a4d59cf 96e95c1c 564ba13e f5561=
ef3  .YM..\..>.KV..V.
Sep 06 00:20:10 szarotka kernel: 00000000: 0a4d59cf 96e95c1c 0a4d59cf 96e95=
c1c  .YM..\...YM..\..
Sep 06 00:20:10 szarotka kernel: 00000000: 38d02686 a49e268c 1ce9894c a36ce=
5c7  .&.8.&..L.....l.
Sep 06 00:20:10 szarotka kernel: 00000000: 38d02686 a49e268c 38d02686 a49e2=
68c  .&.8.&...&.8.&..
Sep 06 00:20:10 szarotka kernel: 00000000: 291efd01 1df9cddc aca2cbb3 2c40c=
5b7  ...)..........@,
Sep 06 00:20:10 szarotka kernel: 00000000: 291efd01 1df9cddc 291efd01 1df9c=
ddc  ...).......)....
Sep 06 00:20:10 szarotka kernel: 00000000: 7986943b a2a9f71c 9be1ed4f c3bd1=
1ae  ;..y....O.......
Sep 06 00:20:10 szarotka kernel: 00000000: 7986943b a2a9f71c 7986943b a2a9f=
71c  ;..y....;..y....
Sep 06 00:20:10 szarotka kernel: 00000000: 7ac90c18 a32ed953 1331532d 0c2e8=
bae  ...zS...-S1.....
Sep 06 00:20:10 szarotka kernel: 00000000: 7ac90c18 a32ed953 7ac90c18 a32ed=
953  ...zS......zS...
Sep 06 00:20:10 szarotka kernel: 00000000: 9716e238 2cf13348 251f1ace eef02=
2e4  8...H3.,...%."..
Sep 06 00:20:10 szarotka kernel: 00000000: fd24636c d50bde55 9716e238 2cf13=
348  lc$.U...8...H3.,
Sep 06 00:20:10 szarotka kernel: 00000000: 8f57b70a c3073486 9149b073 fc8e7=
236  ..W..4..s.I.6r..
Sep 06 00:20:10 szarotka kernel: 00000000: 8f57b70a c3073486 8f57b70a c3073=
486  ..W..4....W..4..
Sep 06 00:20:10 szarotka kernel: 00000000: 0d34a0f3 a1fc6bfe e315e7b2 36c1a=
488  ..4..k.........6
Sep 06 00:20:10 szarotka kernel: 00000000: 0d34a0f3 a1fc6bfe 0d34a0f3 a1fc6=
bfe  ..4..k....4..k..
Sep 06 00:20:10 szarotka kernel: 00000000: 2456af4a 46a65ba0 62e3a0a0 b16de=
437  J.V$.[.F...b7.m.
Sep 06 00:20:10 szarotka kernel: 00000000: 2456af4a 46a65ba0 2456af4a 46a65=
ba0  J.V$.[.FJ.V$.[.F
Sep 06 00:20:10 szarotka kernel: 00000000: 74903f2a 39131342 5061b62f 59535=
97a  *?.tB..9/.aPzYSY
Sep 06 00:20:10 szarotka kernel: 00000000: 74903f2a 39131342 74903f2a 39131=
342  *?.tB..9*?.tB..9
Sep 06 00:20:10 szarotka kernel: 00000000: cb743916 950ca7ed 7c3c8eae 55f1a=
42f  .9t.......<|/..U
Sep 06 00:20:10 szarotka kernel: 00000000: cb743916 950ca7ed cb743916 950ca=
7ed  .9t......9t.....
Sep 06 00:20:10 szarotka kernel: 00000000: e1e3a566 9457fdf7 147da6b6 c2f57=
e69  f.....W...}.i~..
Sep 06 00:20:10 szarotka kernel: 00000000: e1e3a566 9457fdf7 e1e3a566 9457f=
df7  f.....W.f.....W.
Sep 06 00:20:10 szarotka kernel: 00000000: 7dbc8a98 525bbaf0 c787e6a5 4e940=
2c7  ...}..[R.......N
Sep 06 00:20:10 szarotka kernel: 00000000: 7dbc8a98 525bbaf0 7dbc8a98 525bb=
af0  ...}..[R...}..[R
Sep 06 00:20:10 szarotka kernel: 00000000: cc159392 3dae403b 557ebf0a 02031=
e89  ....;@.=3D..~U....
Sep 06 00:20:10 szarotka kernel: 00000000: cc159392 3dae403b cc159392 3dae4=
03b  ....;@.=3D....;@.=3D
Sep 06 00:20:10 szarotka kernel: 00000000: 66a31bb9 28ed14c9 f982045c 901c4=
fa9  ...f...(\....O..
Sep 06 00:20:10 szarotka kernel: 00000000: 66a31bb9 28ed14c9 66a31bb9 28ed1=
4c9  ...f...(...f...(
Sep 06 00:20:10 szarotka kernel: 00000000: 93306852 7259db97 53afa871 74f55=
704  Rh0...Yrq..S.W.t
Sep 06 00:20:10 szarotka kernel: 00000000: 93306852 7259db97 93306852 7259d=
b97  Rh0...YrRh0...Yr
Sep 06 00:20:10 szarotka kernel: 00000000: 69eb01ae 255d65df 40138e44 be930=
388  ...i.e]%D..@....
Sep 06 00:20:10 szarotka kernel: 00000000: 69eb01ae 255d65df 69eb01ae 255d6=
5df  ...i.e]%...i.e]%
Sep 06 00:20:10 szarotka kernel: 00000000: d6ed6ef3 0530404a 4bc91320 9845b=
91f  .n..J@0. ..K..E.
Sep 06 00:20:10 szarotka kernel: 00000000: d6ed6ef3 0530404a d6ed6ef3 05304=
04a  .n..J@0..n..J@0.
Sep 06 00:20:10 szarotka kernel: 00000000: 1aaa35c6 51db7565 3bbf9cae 6774a=
559  .5..eu.Q...;Y.tg
Sep 06 00:20:10 szarotka kernel: 00000000: 1aaa35c6 51db7565 1aaa35c6 51db7=
565  .5..eu.Q.5..eu.Q
Sep 06 00:20:10 szarotka kernel: 00000000: d56a3bc9 d8d47f1d 65e32d16 63ac1=
4cf  .;j......-.e...c
Sep 06 00:20:10 szarotka kernel: 00000000: 2a6b9f54 f340c164 d56a3bc9 d8d47=
f1d  T.k*d.@..;j.....
Sep 06 00:20:10 szarotka kernel: 00000000: 2f306653 6a98640d 26086bec 90bf2=
73f  Sf0/.d.j.k.&?'..
Sep 06 00:20:10 szarotka kernel: 00000000: 2f306653 6a98640d 2f306653 6a986=
40d  Sf0/.d.jSf0/.d.j
Sep 06 00:20:10 szarotka kernel: 00000000: e8012231 3c68db5e 1e51d22b 25560=
36f  1"..^.h<+.Q.o.V%
Sep 06 00:20:10 szarotka kernel: 00000000: e8012231 3c68db5e e8012231 3c68d=
b5e  1"..^.h<1"..^.h<
Sep 06 00:20:10 szarotka kernel: 00000000: 42fc219d 95a199fc 318cb6be cca65=
d42  .!.B.......1B]..
Sep 06 00:20:10 szarotka kernel: 00000000: 42fc219d 95a199fc 42fc219d 95a19=
9fc  .!.B.....!.B....
Sep 06 00:20:10 szarotka kernel: 00000000: 0360d042 b6fa7e5e 2e6972a4 e4367=
f4e  B.`.^~...ri.N.6.
Sep 06 00:20:10 szarotka kernel: 00000000: 0360d042 b6fa7e5e 0360d042 b6fa7=
e5e  B.`.^~..B.`.^~..
Sep 06 00:20:10 szarotka kernel: 00000000: 9b313bcb ad9bb8ea 75e7e685 dcdd2=
43f  .;1........u?$..
Sep 06 00:20:10 szarotka kernel: 00000000: 9b313bcb ad9bb8ea 9b313bcb ad9bb=
8ea  .;1......;1.....
Sep 06 00:20:10 szarotka kernel: 00000000: 7d3bff0e be80c132 b905cb81 bc0ae=
2c2  ..;}2...........
Sep 06 00:20:10 szarotka kernel: 00000000: 7d3bff0e be80c132 7d3bff0e be80c=
132  ..;}2.....;}2...
Sep 06 00:20:10 szarotka kernel: 00000000: 4be66030 27283bfb de9db544 96c10=
b5b  0`.K.;('D...[...
Sep 06 00:20:10 szarotka kernel: 00000000: 4be66030 27283bfb 4be66030 27283=
bfb  0`.K.;('0`.K.;('
Sep 06 00:20:15 szarotka kernel: 00000000: 1151325f 7afec112 09cf0701 68611=
08a  _2Q....z......ah
Sep 06 00:20:15 szarotka kernel: 00000000: 1151325f 7afec112 1151325f 7afec=
112  _2Q....z_2Q....z
Sep 06 00:20:15 szarotka kernel: cifs_verify_signature: 77 callbacks suppre=
ssed
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:15 szarotka kernel: 00000000: e21543ca 368bb56b 8c75d49a 82366=
332  .C..k..6..u.2c6.
Sep 06 00:20:15 szarotka kernel: 00000000: e21543ca 368bb56b e21543ca 368bb=
56b  .C..k..6.C..k..6
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:15 szarotka kernel: 00000000: 39a64b62 1a1bc835 7ead2c5d 55530=
12b  bK.95...],.~+.SU
Sep 06 00:20:15 szarotka kernel: 00000000: 39a64b62 1a1bc835 39a64b62 1a1bc=
835  bK.95...bK.95...
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:15 szarotka kernel: 00000000: 31cfd710 997c5954 89166641 f9e0e=
237  ...1TY|.Af..7...
Sep 06 00:20:15 szarotka kernel: 00000000: 31cfd710 997c5954 31cfd710 997c5=
954  ...1TY|....1TY|.
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:15 szarotka kernel: 00000000: f3cf8ed2 fa2d0999 05c298ab 86de8=
eb0  ......-.........
Sep 06 00:20:15 szarotka kernel: 00000000: 14c5fcac 4e37b6cb f3cf8ed2 fa2d0=
999  ......7N......-.
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x2e
Sep 06 00:20:15 szarotka kernel: 00000000: 878b97de 235414f7 903e2abf 9fa72=
271  ......T#.*>.q"..
Sep 06 00:20:15 szarotka kernel: 00000000: 878b97de 235414f7 878b97de 23541=
4f7  ......T#......T#
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:15 szarotka kernel: 00000000: bac4b055 a4632d96 c4d5a327 ec4ae=
784  U....-c.'.....J.
Sep 06 00:20:15 szarotka kernel: 00000000: bac4b055 a4632d96 bac4b055 a4632=
d96  U....-c.U....-c.
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:15 szarotka kernel: 00000000: b6795390 05dd5ba0 e127e807 b8347=
d3b  .Sy..[....'.;}4.
Sep 06 00:20:15 szarotka kernel: 00000000: b6795390 05dd5ba0 b6795390 05dd5=
ba0  .Sy..[...Sy..[..
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:15 szarotka kernel: 00000000: 44c04fa9 46501669 411e2650 198c9=
262  .O.Di.PFP&.Ab...
Sep 06 00:20:15 szarotka kernel: 00000000: 44c04fa9 46501669 44c04fa9 46501=
669  .O.Di.PF.O.Di.PF
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:15 szarotka kernel: 00000000: bb559458 fcc76497 fd82592b 16808=
73d  X.U..d..+Y..=3D...
Sep 06 00:20:15 szarotka kernel: 00000000: bb559458 fcc76497 bb559458 fcc76=
497  X.U..d..X.U..d..
Sep 06 00:20:15 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:15 szarotka kernel: 00000000: c4b942dd 2493d90a 77a53a68 5139c=
463  .B.....$h:.wc.9Q
Sep 06 00:20:15 szarotka kernel: 00000000: c4b942dd 2493d90a c4b942dd 2493d=
90a  .B.....$.B.....$
Sep 06 00:20:15 szarotka kernel: 00000000: 23a674c9 adb75365 930c23b9 29c11=
eb3  .t.#eS...#.....)
Sep 06 00:20:15 szarotka kernel: 00000000: 23a674c9 adb75365 23a674c9 adb75=
365  .t.#eS...t.#eS..
Sep 06 00:20:15 szarotka kernel: 00000000: ba3cca76 7339d398 543cdded 3707d=
56e  v.<...9s..<Tn..7
Sep 06 00:20:15 szarotka kernel: 00000000: b56f9ca3 e143c055 ba3cca76 7339d=
398  ..o.U.C.v.<...9s
Sep 06 00:20:15 szarotka kernel: 00000000: 57ccc292 76754c9c 331a0749 3083e=
f1d  ...W.LuvI..3...0
Sep 06 00:20:15 szarotka kernel: 00000000: 57ccc292 76754c9c 57ccc292 76754=
c9c  ...W.Luv...W.Luv
Sep 06 00:20:15 szarotka kernel: 00000000: 7802267a 04c64af4 249563ee 28f9b=
fc9  z&.x.J...c.$...(
Sep 06 00:20:15 szarotka kernel: 00000000: 7802267a 04c64af4 7802267a 04c64=
af4  z&.x.J..z&.x.J..
Sep 06 00:20:15 szarotka kernel: 00000000: 8b8f50c6 1c473502 63bcb98e 4a290=
64e  .P...5G....cN.)J
Sep 06 00:20:15 szarotka kernel: 00000000: 8b8f50c6 1c473502 8b8f50c6 1c473=
502  .P...5G..P...5G.
Sep 06 00:20:15 szarotka kernel: 00000000: ac47e1b6 5f93e2b1 32b34c19 7c5bf=
8d6  ..G...._.L.2..[|
Sep 06 00:20:15 szarotka kernel: 00000000: ac47e1b6 5f93e2b1 ac47e1b6 5f93e=
2b1  ..G...._..G...._
Sep 06 00:20:15 szarotka kernel: 00000000: b70cd7a4 d007fedd 94028d63 d333a=
0a3  ........c.....3.
Sep 06 00:20:15 szarotka kernel: 00000000: b70cd7a4 d007fedd b70cd7a4 d007f=
edd  ................
Sep 06 00:20:15 szarotka kernel: 00000000: a27bcb79 1717f7c6 5b419522 20936=
276  y.{.....".A[vb.=20
Sep 06 00:20:15 szarotka kernel: 00000000: f6faf076 0ec25d45 a27bcb79 1717f=
7c6  v...E]..y.{.....
Sep 06 00:20:15 szarotka kernel: 00000000: 9855ecf5 7ab8904a fb8c5254 9f2b6=
4e3  ..U.J..zTR...d+.
Sep 06 00:20:15 szarotka kernel: 00000000: 9855ecf5 7ab8904a 9855ecf5 7ab89=
04a  ..U.J..z..U.J..z
Sep 06 00:20:15 szarotka kernel: 00000000: 1f1ed7e3 06a2f571 2b21767e e7b1e=
be8  ....q...~v!+....
Sep 06 00:20:15 szarotka kernel: 00000000: 1f1ed7e3 06a2f571 1f1ed7e3 06a2f=
571  ....q.......q...
Sep 06 00:20:15 szarotka kernel: 00000000: e50dfead d09341b5 667168c2 226e3=
2e4  .....A...hqf.2n"
Sep 06 00:20:15 szarotka kernel: 00000000: e50dfead d09341b5 e50dfead d0934=
1b5  .....A.......A..
Sep 06 00:20:15 szarotka kernel: 00000000: bfe7a292 5b1e8443 efe6281b 9f47d=
0bd  ....C..[.(....G.
Sep 06 00:20:15 szarotka kernel: 00000000: 9cb3b417 38bf5d39 bfe7a292 5b1e8=
443  ....9].8....C..[
Sep 06 00:20:15 szarotka kernel: 00000000: 108d45f6 cc60bd6c 6796c20b 7945f=
0af  .E..l.`....g..Ey
Sep 06 00:20:15 szarotka kernel: 00000000: 4ca2094a c664f387 108d45f6 cc60b=
d6c  J..L..d..E..l.`.
Sep 06 00:20:15 szarotka kernel: 00000000: 5640bddb f01fbcdc d57351f0 28e50=
9fc  ..@V.....Qs....(
Sep 06 00:20:15 szarotka kernel: 00000000: 4cdcbece 6de80c89 5640bddb f01fb=
cdc  ...L...m..@V....
Sep 06 00:20:15 szarotka kernel: 00000000: f8b13121 73258cee 54df24e5 51785=
c54  !1....%s.$.TT\xQ
Sep 06 00:20:15 szarotka kernel: 00000000: f8b13121 73258cee f8b13121 73258=
cee  !1....%s!1....%s
Sep 06 00:20:15 szarotka kernel: 00000000: 1413fd03 a0fb09a0 f7e4b58b 1df95=
6dd  .............V..
Sep 06 00:20:15 szarotka kernel: 00000000: 1413fd03 a0fb09a0 1413fd03 a0fb0=
9a0  ................
Sep 06 00:20:15 szarotka kernel: 00000000: 69d5b8f6 609eae2d bc8c57c9 2319b=
d9a  ...i-..`.W.....#
Sep 06 00:20:15 szarotka kernel: 00000000: 69d5b8f6 609eae2d 69d5b8f6 609ea=
e2d  ...i-..`...i-..`
Sep 06 00:20:15 szarotka kernel: 00000000: ee498ab0 9f134250 a676bc03 6507f=
029  ..I.PB....v.)..e
Sep 06 00:20:15 szarotka kernel: 00000000: ee498ab0 9f134250 ee498ab0 9f134=
250  ..I.PB....I.PB..
Sep 06 00:20:15 szarotka kernel: 00000000: 5b672b21 c77a64e6 aa07277d d23b2=
f36  !+g[.dz.}'..6/;.
Sep 06 00:20:15 szarotka kernel: 00000000: 5b672b21 c77a64e6 5b672b21 c77a6=
4e6  !+g[.dz.!+g[.dz.
Sep 06 00:20:15 szarotka kernel: 00000000: c71a9f4a 1a894fc7 ae209b6a d62cd=
161  J....O..j. .a.,.
Sep 06 00:20:15 szarotka kernel: 00000000: c71a9f4a 1a894fc7 c71a9f4a 1a894=
fc7  J....O..J....O..
Sep 06 00:20:15 szarotka kernel: 00000000: 9faca794 5042f38b cfb36678 3be5c=
1ec  ......BPxf.....;
Sep 06 00:20:15 szarotka kernel: 00000000: 9faca794 5042f38b 9faca794 5042f=
38b  ......BP......BP
Sep 06 00:20:15 szarotka kernel: 00000000: 52b1e2c5 0efd476c 7629998d 5cdce=
8dd  ...RlG....)v...\
Sep 06 00:20:15 szarotka kernel: 00000000: 52b1e2c5 0efd476c 52b1e2c5 0efd4=
76c  ...RlG.....RlG..
Sep 06 00:20:15 szarotka kernel: 00000000: 0a812469 05005891 083ff196 5f5d7=
8d5  i$...X....?..x]_
Sep 06 00:20:15 szarotka kernel: 00000000: 0a812469 05005891 0a812469 05005=
891  i$...X..i$...X..
Sep 06 00:20:15 szarotka kernel: 00000000: 57290402 3f597a88 1513971d cf56c=
4be  ..)W.zY?......V.
Sep 06 00:20:15 szarotka kernel: 00000000: 70f99020 a221e67f 57290402 3f597=
a88   ..p..!...)W.zY?
Sep 06 00:20:15 szarotka kernel: 00000000: 04e22c23 e802ca07 20fc2435 9ae42=
be4  #,......5$. .+..
Sep 06 00:20:15 szarotka kernel: 00000000: ab05f5f5 88fd117e 04e22c23 e802c=
a07  ....~...#,......
Sep 06 00:20:15 szarotka kernel: 00000000: 2d58a4ae cfa6d6e9 09576c71 cec1b=
744  ..X-....qlW.D...
Sep 06 00:20:15 szarotka kernel: 00000000: e5289e77 ae5b51ad 2d58a4ae cfa6d=
6e9  w.(..Q[...X-....
Sep 06 00:20:15 szarotka kernel: 00000000: fa0901de 198c90d3 3adc63bd af839=
37a  .........c.:z...
Sep 06 00:20:15 szarotka kernel: 00000000: fa0901de 198c90d3 fa0901de 198c9=
0d3  ................
Sep 06 00:20:15 szarotka kernel: 00000000: a140ac95 1ce11b3b 0cd2fa5b 32516=
b2d  ..@.;...[...-kQ2
Sep 06 00:20:15 szarotka kernel: 00000000: a140ac95 1ce11b3b a140ac95 1ce11=
b3b  ..@.;.....@.;...
Sep 06 00:20:15 szarotka kernel: 00000000: b338575e c1b34b0c f90aaf95 5df9c=
ce9  ^W8..K.........]
Sep 06 00:20:15 szarotka kernel: 00000000: b338575e c1b34b0c b338575e c1b34=
b0c  ^W8..K..^W8..K..
Sep 06 00:20:15 szarotka kernel: 00000000: f6b769e3 e4cd3a80 68d18762 a8191=
432  .i...:..b..h2...
Sep 06 00:20:15 szarotka kernel: 00000000: f6b769e3 e4cd3a80 f6b769e3 e4cd3=
a80  .i...:...i...:..
Sep 06 00:20:15 szarotka kernel: 00000000: e284d9ff 0a710e9c 16f74384 d05f8=
1b0  ......q..C...._.
Sep 06 00:20:15 szarotka kernel: 00000000: e284d9ff 0a710e9c e284d9ff 0a710=
e9c  ......q.......q.
Sep 06 00:20:15 szarotka kernel: 00000000: 0b4b8b4f e19bc1b2 37226419 9659e=
828  O.K......d"7(.Y.
Sep 06 00:20:15 szarotka kernel: 00000000: 0b4b8b4f e19bc1b2 0b4b8b4f e19bc=
1b2  O.K.....O.K.....
Sep 06 00:20:15 szarotka kernel: 00000000: 31d7d576 61dcc9eb 4f5e1785 1486f=
171  v..1...a..^Oq...
Sep 06 00:20:15 szarotka kernel: 00000000: 31d7d576 61dcc9eb 31d7d576 61dcc=
9eb  v..1...av..1...a
Sep 06 00:20:15 szarotka kernel: 00000000: 3e2f0073 8c6091dc 9b4b383d 7b631=
386  s./>..`.=3D8K...c{
Sep 06 00:20:15 szarotka kernel: 00000000: 3e2f0073 8c6091dc 3e2f0073 8c609=
1dc  s./>..`.s./>..`.
Sep 06 00:20:15 szarotka kernel: 00000000: b82aad68 4d199789 e7ef5cc3 aed61=
243  h.*....M.\..C...
Sep 06 00:20:15 szarotka kernel: 00000000: b82aad68 4d199789 b82aad68 4d199=
789  h.*....Mh.*....M
Sep 06 00:20:15 szarotka kernel: 00000000: e94004cc 212cb11c 569e0f45 4223a=
02f  ..@...,!E..V/.#B
Sep 06 00:20:15 szarotka kernel: 00000000: c8f96402 92deb59b e94004cc 212cb=
11c  .d........@...,!
Sep 06 00:20:15 szarotka kernel: 00000000: efa17124 5e99508d 9e066071 9c06a=
619  $q...P.^q`......
Sep 06 00:20:15 szarotka kernel: 00000000: a2418100 c7052ba7 efa17124 5e995=
08d  ..A..+..$q...P.^
Sep 06 00:20:15 szarotka kernel: 00000000: 0ee72a93 42d27ed6 1176f361 e29ad=
699  .*...~.Ba.v.....
Sep 06 00:20:15 szarotka kernel: 00000000: 291cfd69 cfe610a4 0ee72a93 42d27=
ed6  i..).....*...~.B
Sep 06 00:20:15 szarotka kernel: 00000000: b30cd629 6ecbf2b9 76513e25 fb799=
e88  )......n%>Qv..y.
Sep 06 00:20:15 szarotka kernel: 00000000: 8dd691aa d19841f0 b30cd629 6ecbf=
2b9  .....A..)......n
Sep 06 00:20:15 szarotka kernel: 00000000: 4c64ee92 47b47904 2be3d44f d0433=
704  ..dL.y.GO..+.7C.
Sep 06 00:20:15 szarotka kernel: 00000000: 4c64ee92 47b47904 4c64ee92 47b47=
904  ..dL.y.G..dL.y.G
Sep 06 00:20:15 szarotka kernel: 00000000: c228091e f85ff342 8ea52b3d 34eb4=
dac  ..(.B._.=3D+...M.4
Sep 06 00:20:15 szarotka kernel: 00000000: 2fb935b6 2992e456 c228091e f85ff=
342  .5./V..)..(.B._.
Sep 06 00:20:15 szarotka kernel: 00000000: 8176bcf0 d021a796 d967bdda 5558e=
b61  ..v...!...g.a.XU
Sep 06 00:20:15 szarotka kernel: 00000000: 6efe15c1 02cba85c 8176bcf0 d021a=
796  ...n\.....v...!.
Sep 06 00:20:15 szarotka kernel: 00000000: 6d5e0d60 f90ce915 535e94ab 06e83=
a4b  `.^m......^SK:..
Sep 06 00:20:15 szarotka kernel: 00000000: f18a28ba b352beb6 6d5e0d60 f90ce=
915  .(....R.`.^m....
Sep 06 00:20:15 szarotka kernel: 00000000: f77e7c83 0230391a 048dc69d cac29=
f09  .|~..90.........
Sep 06 00:20:15 szarotka kernel: 00000000: 17e07700 fd566cc4 f77e7c83 02303=
91a  .w...lV..|~..90.
Sep 06 00:20:15 szarotka kernel: 00000000: bfde09e8 e41c983e e37d6118 34303=
a69  ....>....a}.i:04
Sep 06 00:20:15 szarotka kernel: 00000000: bfde09e8 e41c983e bfde09e8 e41c9=
83e  ....>.......>...
Sep 06 00:20:15 szarotka kernel: 00000000: 29658628 870c307a c5dd0a40 75945=
0b6  (.e)z0..@....P.u
Sep 06 00:20:15 szarotka kernel: 00000000: 29658628 870c307a 29658628 870c3=
07a  (.e)z0..(.e)z0..
Sep 06 00:20:15 szarotka kernel: 00000000: c04ca711 6ac5e77d 8e085b24 79289=
d3b  ..L.}..j$[..;.(y
Sep 06 00:20:15 szarotka kernel: 00000000: c04ca711 6ac5e77d c04ca711 6ac5e=
77d  ..L.}..j..L.}..j
Sep 06 00:20:15 szarotka kernel: 00000000: 431b1894 64cc87a0 b006ec5e 3c308=
f43  ...C...d^...C.0<
Sep 06 00:20:15 szarotka kernel: 00000000: 431b1894 64cc87a0 431b1894 64cc8=
7a0  ...C...d...C...d
Sep 06 00:20:15 szarotka kernel: 00000000: da64e5d4 c54771c6 81623c99 31a6d=
d66  ..d..qG..<b.f..1
Sep 06 00:20:15 szarotka kernel: 00000000: da64e5d4 c54771c6 da64e5d4 c5477=
1c6  ..d..qG...d..qG.
Sep 06 00:20:15 szarotka kernel: 00000000: 6f30b6e0 57302bc2 3216b867 92219=
750  ..0o.+0Wg..2P.!.
Sep 06 00:20:15 szarotka kernel: 00000000: 6f30b6e0 57302bc2 6f30b6e0 57302=
bc2  ..0o.+0W..0o.+0W
Sep 06 00:20:15 szarotka kernel: 00000000: 0208bab0 70e5f2f0 3648da30 50a2d=
218  .......p0.H6...P
Sep 06 00:20:15 szarotka kernel: 00000000: 0208bab0 70e5f2f0 0208bab0 70e5f=
2f0  .......p.......p
Sep 06 00:20:15 szarotka kernel: 00000000: 56c1a0b2 6c07eccd 8ae39eef c8afc=
e5b  ...V...l....[...
Sep 06 00:20:15 szarotka kernel: 00000000: 56c1a0b2 6c07eccd 56c1a0b2 6c07e=
ccd  ...V...l...V...l
Sep 06 00:20:15 szarotka kernel: 00000000: 6812f59e e5230c59 4e167450 5b065=
3f6  ...hY.#.Pt.N.S.[
Sep 06 00:20:15 szarotka kernel: 00000000: ace03539 00f2ed0c 6812f59e e5230=
c59  95.........hY.#.
Sep 06 00:20:15 szarotka kernel: 00000000: 41b93f89 ce64e8f9 ff0cf504 d9444=
8d8  .?.A..d......HD.
Sep 06 00:20:15 szarotka kernel: 00000000: 41b93f89 ce64e8f9 41b93f89 ce64e=
8f9  .?.A..d..?.A..d.
Sep 06 00:20:15 szarotka kernel: 00000000: 25d8a8f0 7843a86c 5f981569 3cfbc=
b08  ...%l.Cxi.._...<
Sep 06 00:20:15 szarotka kernel: 00000000: 25d8a8f0 7843a86c 25d8a8f0 7843a=
86c  ...%l.Cx...%l.Cx
Sep 06 00:20:15 szarotka kernel: 00000000: 342c88b3 279cd1c0 f6521b4c 1bf32=
3a0  ..,4...'L.R..#..
Sep 06 00:20:15 szarotka kernel: 00000000: 342c88b3 279cd1c0 342c88b3 279cd=
1c0  ..,4...'..,4...'
Sep 06 00:20:15 szarotka kernel: 00000000: 8346258f f563e781 59731e8d 58724=
5f8  .%F...c...sY.ErX
Sep 06 00:20:15 szarotka kernel: 00000000: 8346258f f563e781 8346258f f563e=
781  .%F...c..%F...c.
Sep 06 00:20:15 szarotka kernel: 00000000: 2dff0ac9 3e6b6241 1e3cd92e 5ca89=
a94  ...-Abk>..<....\
Sep 06 00:20:15 szarotka kernel: 00000000: 2dff0ac9 3e6b6241 2dff0ac9 3e6b6=
241  ...-Abk>...-Abk>
Sep 06 00:20:15 szarotka kernel: 00000000: ee5ff535 19a9b820 713d4ada e1f9e=
103  5._. ....J=3Dq....
Sep 06 00:20:15 szarotka kernel: 00000000: ee5ff535 19a9b820 ee5ff535 19a9b=
820  5._. ...5._. ...
Sep 06 00:20:15 szarotka kernel: 00000000: aff4808a ce1fc22b 6eec1da5 82491=
3a0  ....+......n..I.
Sep 06 00:20:15 szarotka kernel: 00000000: aff4808a ce1fc22b aff4808a ce1fc=
22b  ....+.......+...
Sep 06 00:20:15 szarotka kernel: 00000000: af8ee5ac f94bd97f b687ada2 7694f=
bf2  ......K........v
Sep 06 00:20:15 szarotka kernel: 00000000: af8ee5ac f94bd97f af8ee5ac f94bd=
97f  ......K.......K.
Sep 06 00:20:15 szarotka kernel: 00000000: f5b130d4 12a8b330 0fc81d7a 7399e=
c52  .0..0...z...R..s
Sep 06 00:20:15 szarotka kernel: 00000000: f5b130d4 12a8b330 f5b130d4 12a8b=
330  .0..0....0..0...
Sep 06 00:20:15 szarotka kernel: 00000000: 877caf26 f03d8612 abbab510 30ccb=
70e  &.|...=3D........0
Sep 06 00:20:15 szarotka kernel: 00000000: 877caf26 f03d8612 877caf26 f03d8=
612  &.|...=3D.&.|...=3D.
Sep 06 00:20:15 szarotka kernel: 00000000: 5a88aa37 efcb4b52 df0ff0a7 ae4dc=
3bf  7..ZRK........M.
Sep 06 00:20:15 szarotka kernel: 00000000: 5a88aa37 efcb4b52 5a88aa37 efcb4=
b52  7..ZRK..7..ZRK..
Sep 06 00:20:15 szarotka kernel: 00000000: b78097aa 0338bdb2 b2435dfe 97b69=
34d  ......8..]C.M...
Sep 06 00:20:15 szarotka kernel: 00000000: b78097aa 0338bdb2 b78097aa 0338b=
db2  ......8.......8.
Sep 06 00:20:15 szarotka kernel: 00000000: f972f158 3ee65d56 bc5d10e8 18b22=
b66  X.r.V].>..].f+..
Sep 06 00:20:15 szarotka kernel: 00000000: f972f158 3ee65d56 f972f158 3ee65=
d56  X.r.V].>X.r.V].>
Sep 06 00:20:15 szarotka kernel: 00000000: da98ce42 c038f8ba 1cb920a9 8e386=
e02  B.....8.. ...n8.
Sep 06 00:20:15 szarotka kernel: 00000000: da98ce42 c038f8ba da98ce42 c038f=
8ba  B.....8.B.....8.
Sep 06 00:20:15 szarotka kernel: 00000000: 64c2911f f7ccf722 68833e18 6ca62=
337  ...d"....>.h7#.l
Sep 06 00:20:15 szarotka kernel: 00000000: 64c2911f f7ccf722 64c2911f f7ccf=
722  ...d"......d"...
Sep 06 00:20:15 szarotka kernel: 00000000: 9741eb84 b6404bec 0c078915 3ff83=
883  ..A..K@......8.?
Sep 06 00:20:15 szarotka kernel: 00000000: 9741eb84 b6404bec 9741eb84 b6404=
bec  ..A..K@...A..K@.
Sep 06 00:20:15 szarotka kernel: 00000000: dc4efcdd c91e94ee afba194f e9d75=
56c  ..N.....O...lU..
Sep 06 00:20:15 szarotka kernel: 00000000: dc4efcdd c91e94ee dc4efcdd c91e9=
4ee  ..N.......N.....
Sep 06 00:20:15 szarotka kernel: 00000000: 3d30301b 3793a39a c3f96183 ee902=
54c  .00=3D...7.a..L%..
Sep 06 00:20:15 szarotka kernel: 00000000: 3d30301b 3793a39a 3d30301b 3793a=
39a  .00=3D...7.00=3D...7
Sep 06 00:20:15 szarotka kernel: 00000000: 2ebd1956 d37f2d63 25914b78 f4657=
33c  V...c-..xK.%<se.
Sep 06 00:20:15 szarotka kernel: 00000000: 2ebd1956 d37f2d63 2ebd1956 d37f2=
d63  V...c-..V...c-..
Sep 06 00:20:15 szarotka kernel: 00000000: a572759a 068f1c33 6adbee98 7fca2=
a57  .ur.3......jW*..
Sep 06 00:20:15 szarotka kernel: 00000000: a572759a 068f1c33 a572759a 068f1=
c33  .ur.3....ur.3...
Sep 06 00:20:15 szarotka kernel: 00000000: 6144cd12 54cdd683 8cb55a3a 5e2d1=
027  ..Da...T:Z..'.-^
Sep 06 00:20:15 szarotka kernel: 00000000: 6144cd12 54cdd683 6144cd12 54cdd=
683  ..Da...T..Da...T
Sep 06 00:20:15 szarotka kernel: 00000000: 2617d2c1 93bf4bd7 d8a82112 2215e=
a4c  ...&.K...!..L.."
Sep 06 00:20:15 szarotka kernel: 00000000: 2617d2c1 93bf4bd7 2617d2c1 93bf4=
bd7  ...&.K.....&.K..
Sep 06 00:20:15 szarotka kernel: 00000000: bee05481 a8656c22 f7b02a5a 63fc7=
9d6  .T.."le.Z*...y.c
Sep 06 00:20:15 szarotka kernel: 00000000: 79bcc7f3 b023d011 bee05481 a8656=
c22  ...y..#..T.."le.
Sep 06 00:20:15 szarotka kernel: 00000000: 4264ae9e e31e23c1 30787959 bc878=
ca6  ..dB.#..Yyx0....
Sep 06 00:20:15 szarotka kernel: 00000000: 4264ae9e e31e23c1 4264ae9e e31e2=
3c1  ..dB.#....dB.#..
Sep 06 00:20:15 szarotka kernel: 00000000: aa201102 6f47a9e8 3c3a1e2d ded19=
357  .. ...Go-.:<W...
Sep 06 00:20:15 szarotka kernel: 00000000: aa201102 6f47a9e8 aa201102 6f47a=
9e8  .. ...Go.. ...Go
Sep 06 00:20:15 szarotka kernel: 00000000: 14844cf2 07a2eade d46fba9e cb24e=
ff2  .L........o...$.
Sep 06 00:20:15 szarotka kernel: 00000000: 4cc2b762 b9d557c5 14844cf2 07a2e=
ade  b..L.W...L......
Sep 06 00:20:15 szarotka kernel: 00000000: 04c6c718 eab372e3 57e69326 f02ca=
51a  .....r..&..W..,.
Sep 06 00:20:15 szarotka kernel: 00000000: 04c6c718 eab372e3 04c6c718 eab37=
2e3  .....r.......r..
Sep 06 00:20:15 szarotka kernel: 00000000: d3d7d5ae 536ce0e6 ccad1300 79be7=
4b2  ......lS.....t.y
Sep 06 00:20:15 szarotka kernel: 00000000: d3d7d5ae 536ce0e6 d3d7d5ae 536ce=
0e6  ......lS......lS
Sep 06 00:20:15 szarotka kernel: 00000000: 5ce45620 70be6695 aded078f df30a=
b70   V.\.f.p....p.0.
Sep 06 00:20:15 szarotka kernel: 00000000: 5ce45620 70be6695 5ce45620 70be6=
695   V.\.f.p V.\.f.p
Sep 06 00:20:15 szarotka kernel: 00000000: 339624fd 6a733822 cd264b4b 14ecb=
a78  .$.3"8sjKK&.x...
Sep 06 00:20:15 szarotka kernel: 00000000: 339624fd 6a733822 339624fd 6a733=
822  .$.3"8sj.$.3"8sj
Sep 06 00:20:15 szarotka kernel: 00000000: 29e04f39 917095ae cb804966 3709b=
89e  9O.)..p.fI.....7
Sep 06 00:20:15 szarotka kernel: 00000000: 29e04f39 917095ae 29e04f39 91709=
5ae  9O.)..p.9O.)..p.
Sep 06 00:20:15 szarotka kernel: 00000000: 7e8505b6 5652ec1c 95854bc7 14145=
b60  ...~..RV.K..`[..
Sep 06 00:20:15 szarotka kernel: 00000000: 7e8505b6 5652ec1c 7e8505b6 5652e=
c1c  ...~..RV...~..RV
Sep 06 00:20:15 szarotka kernel: 00000000: 49cdab0b 1cf3e4be 82b93dc3 037d4=
5e6  ...I.....=3D...E}.
Sep 06 00:20:15 szarotka kernel: 00000000: 49cdab0b 1cf3e4be 49cdab0b 1cf3e=
4be  ...I.......I....
Sep 06 00:20:15 szarotka kernel: 00000000: a68c36d0 63508acb e3dab0ff 5c767=
38f  .6....Pc.....sv\
Sep 06 00:20:15 szarotka kernel: 00000000: a5420f92 c0232be1 a68c36d0 63508=
acb  ..B..+#..6....Pc
Sep 06 00:20:15 szarotka kernel: 00000000: 5b2d7788 98258ddd 3fbba994 51afa=
57f  .w-[..%....?...Q
Sep 06 00:20:15 szarotka kernel: 00000000: 5b2d7788 98258ddd 5b2d7788 98258=
ddd  .w-[..%..w-[..%.
Sep 06 00:20:15 szarotka kernel: 00000000: 326e4af9 70572f94 e68d9d6d 50b9f=
c1f  .Jn2./Wpm......P
Sep 06 00:20:15 szarotka kernel: 00000000: 326e4af9 70572f94 326e4af9 70572=
f94  .Jn2./Wp.Jn2./Wp
Sep 06 00:20:15 szarotka kernel: 00000000: 9f8f60f0 4f077d94 5cdf5af1 b021a=
cb3  .`...}.O.Z.\..!.
Sep 06 00:20:15 szarotka kernel: 00000000: 9f8f60f0 4f077d94 9f8f60f0 4f077=
d94  .`...}.O.`...}.O
Sep 06 00:20:15 szarotka kernel: 00000000: de6432d3 1e430dff 646e40cd ceac1=
622  .2d...C..@nd"...
Sep 06 00:20:15 szarotka kernel: 00000000: de6432d3 1e430dff de6432d3 1e430=
dff  .2d...C..2d...C.
Sep 06 00:20:15 szarotka kernel: 00000000: df9a9c25 b9da7513 9985b704 59ed2=
372  %....u......r#.Y
Sep 06 00:20:15 szarotka kernel: 00000000: df9a9c25 b9da7513 df9a9c25 b9da7=
513  %....u..%....u..
Sep 06 00:20:15 szarotka kernel: 00000000: 417b3f33 e769511b 489b1861 edfe9=
8c6  3?{A.Qi.a..H....
Sep 06 00:20:15 szarotka kernel: 00000000: 6d0e140d ff5ca373 417b3f33 e7695=
11b  ...ms.\.3?{A.Qi.
Sep 06 00:20:15 szarotka kernel: 00000000: 94c30975 d144e60b 8c29f5f9 93407=
e04  u.....D...)..~@.
Sep 06 00:20:15 szarotka kernel: 00000000: 94c30975 d144e60b 94c30975 d144e=
60b  u.....D.u.....D.
Sep 06 00:20:15 szarotka kernel: 00000000: 010b60a3 5142480d c473f0a2 cf0e8=
a4b  .`...HBQ..s.K...
Sep 06 00:20:15 szarotka kernel: 00000000: 010b60a3 5142480d 010b60a3 51424=
80d  .`...HBQ.`...HBQ
Sep 06 00:20:15 szarotka kernel: 00000000: 7646ee96 e9061f0f ab4bebb4 4c763=
ff9  ..Fv......K..?vL
Sep 06 00:20:15 szarotka kernel: 00000000: 7646ee96 e9061f0f 7646ee96 e9061=
f0f  ..Fv......Fv....
Sep 06 00:20:15 szarotka kernel: 00000000: 2ff3e223 c91404df 7c9c22ed a9009=
cea  #../.....".|....
Sep 06 00:20:15 szarotka kernel: 00000000: 2ff3e223 c91404df 2ff3e223 c9140=
4df  #../....#../....
Sep 06 00:20:15 szarotka kernel: 00000000: 9753f2a9 0648e9e1 aae6413d d8ca2=
f78  ..S...H.=3DA..x/..
Sep 06 00:20:15 szarotka kernel: 00000000: 9753f2a9 0648e9e1 9753f2a9 0648e=
9e1  ..S...H...S...H.
Sep 06 00:20:15 szarotka kernel: 00000000: 99d0aa21 0f870410 bd5c2c93 98ff4=
4bf  !........,\..D..
Sep 06 00:20:15 szarotka kernel: 00000000: 99d0aa21 0f870410 99d0aa21 0f870=
410  !.......!.......
Sep 06 00:20:15 szarotka kernel: 00000000: a0cbbe4b a30fa9b2 2332f6b1 f91d7=
9d4  K.........2#.y..
Sep 06 00:20:15 szarotka kernel: 00000000: a0cbbe4b a30fa9b2 a0cbbe4b a30fa=
9b2  K.......K.......
Sep 06 00:20:15 szarotka kernel: 00000000: e55d935c 12b94c50 edfd888e 7c248=
70a  \.].PL........$|
Sep 06 00:20:15 szarotka kernel: 00000000: 8989e732 baf6fda9 e55d935c 12b94=
c50  2.......\.].PL..
Sep 06 00:20:15 szarotka kernel: 00000000: 40100ded c10cf037 3aa0a1bc 0dc89=
001  ...@7......:....
Sep 06 00:20:15 szarotka kernel: 00000000: 40100ded c10cf037 40100ded c10cf=
037  ...@7......@7...
Sep 06 00:20:15 szarotka kernel: 00000000: f25068ad 5a98293e c4cebfb2 4e1c0=
5e8  .hP.>).Z.......N
Sep 06 00:20:15 szarotka kernel: 00000000: bc6defde 7dd00419 f25068ad 5a982=
93e  ..m....}.hP.>).Z
Sep 06 00:20:15 szarotka kernel: 00000000: 3a33bffc b225ab1b 6ed204c0 a50a6=
1ed  ..3:..%....n.a..
Sep 06 00:20:15 szarotka kernel: 00000000: 3a33bffc b225ab1b 3a33bffc b225a=
b1b  ..3:..%...3:..%.
Sep 06 00:20:15 szarotka kernel: 00000000: bc2acb47 1fd31dab 9a5fdf5f 8caa1=
bc8  G.*....._._.....
Sep 06 00:20:15 szarotka kernel: 00000000: bc2acb47 1fd31dab bc2acb47 1fd31=
dab  G.*.....G.*.....
Sep 06 00:20:15 szarotka kernel: 00000000: d5ce4844 4277e99e 1ae0d246 acb41=
b56  DH....wBF...V...
Sep 06 00:20:15 szarotka kernel: 00000000: d5ce4844 4277e99e d5ce4844 4277e=
99e  DH....wBDH....wB
Sep 06 00:20:15 szarotka kernel: 00000000: ce9b71e4 0de2f5b6 93f671fd 79b87=
3c8  .q.......q...s.y
Sep 06 00:20:15 szarotka kernel: 00000000: ce9b71e4 0de2f5b6 ce9b71e4 0de2f=
5b6  .q.......q......
Sep 06 00:20:15 szarotka kernel: 00000000: e235be8d 742f83c3 aee9b124 7d4ee=
17a  ..5.../t$...z.N}
Sep 06 00:20:15 szarotka kernel: 00000000: e235be8d 742f83c3 e235be8d 742f8=
3c3  ..5.../t..5.../t
Sep 06 00:20:15 szarotka kernel: 00000000: 9fb6217c 00a6f433 fc0250de 4a13e=
ec2  |!..3....P.....J
Sep 06 00:20:15 szarotka kernel: 00000000: 9fb6217c 00a6f433 9fb6217c 00a6f=
433  |!..3...|!..3...
Sep 06 00:20:15 szarotka kernel: 00000000: 2963acdb 9c6a7413 2f2e4f15 366f4=
d25  ..c).tj..O./%Mo6
Sep 06 00:20:15 szarotka kernel: 00000000: 2963acdb 9c6a7413 2963acdb 9c6a7=
413  ..c).tj...c).tj.
Sep 06 00:20:15 szarotka kernel: 00000000: cea5f4a8 76bd9656 978bf8c6 48156=
ce8  ....V..v.....l.H
Sep 06 00:20:15 szarotka kernel: 00000000: cea5f4a8 76bd9656 cea5f4a8 76bd9=
656  ....V..v....V..v
Sep 06 00:20:25 szarotka kernel: 00000000: 52723837 acc60a7a 392be11b 9f92d=
6ca  78rRz.....+9....
Sep 06 00:20:25 szarotka kernel: 00000000: 52723837 acc60a7a 52723837 acc60=
a7a  78rRz...78rRz...
Sep 06 00:20:25 szarotka kernel: cifs_verify_signature: 112 callbacks suppr=
essed
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: 3ca66e69 d7aa5c60 58f9af48 5c342=
171  in.<`\..H..Xq!4\
Sep 06 00:20:25 szarotka kernel: 00000000: 3ca66e69 d7aa5c60 3ca66e69 d7aa5=
c60  in.<`\..in.<`\..
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: 229a430a 512a7e06 dde3513e ebfac=
fd9  .C.".~*Q>Q......
Sep 06 00:20:25 szarotka kernel: 00000000: 229a430a 512a7e06 229a430a 512a7=
e06  .C.".~*Q.C.".~*Q
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: 923c620a f27f685c f66b7047 67a5a=
2b1  .b<.\h..Gpk....g
Sep 06 00:20:25 szarotka kernel: 00000000: 923c620a f27f685c 923c620a f27f6=
85c  .b<.\h...b<.\h..
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: 5cf22f33 5ae4c2f1 0bcf6dde c1b86=
a53  3/.\...Z.m..Sj..
Sep 06 00:20:25 szarotka kernel: 00000000: 5cf22f33 5ae4c2f1 5cf22f33 5ae4c=
2f1  3/.\...Z3/.\...Z
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: cfc5d951 cbc6a3de 4437b1e5 952bf=
724  Q.........7D$.+.
Sep 06 00:20:25 szarotka kernel: 00000000: cfc5d951 cbc6a3de cfc5d951 cbc6a=
3de  Q.......Q.......
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: e38c0bb8 410a7daf 1b38a238 1a993=
982  .....}.A8.8..9..
Sep 06 00:20:25 szarotka kernel: 00000000: e38c0bb8 410a7daf e38c0bb8 410a7=
daf  .....}.A.....}.A
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: fc1a63e7 29b8dac2 b77bb2d4 26458=
618  .c.....)..{...E&
Sep 06 00:20:25 szarotka kernel: 00000000: fc1a63e7 29b8dac2 fc1a63e7 29b8d=
ac2  .c.....).c.....)
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: 6d18bb57 e956c40c 11ce7798 8b71f=
147  W..m..V..w..G.q.
Sep 06 00:20:25 szarotka kernel: 00000000: 6d18bb57 e956c40c 6d18bb57 e956c=
40c  W..m..V.W..m..V.
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: 0d579197 f01c81bc 78419052 d04b5=
fc5  ..W.....R.Ax._K.
Sep 06 00:20:25 szarotka kernel: 00000000: 0d579197 f01c81bc 0d579197 f01c8=
1bc  ..W.......W.....
Sep 06 00:20:25 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:25 szarotka kernel: 00000000: 27210dd8 be7cf7dd 2db2d2cd a741d=
fe6  ..!'..|....-..A.
Sep 06 00:20:25 szarotka kernel: 00000000: 27210dd8 be7cf7dd 27210dd8 be7cf=
7dd  ..!'..|...!'..|.
Sep 06 00:20:25 szarotka kernel: 00000000: 4ed330e9 aa5e0497 960598a6 b083d=
a69  .0.N..^.....i...
Sep 06 00:20:25 szarotka kernel: 00000000: 4ed330e9 aa5e0497 4ed330e9 aa5e0=
497  .0.N..^..0.N..^.
Sep 06 00:20:25 szarotka kernel: 00000000: b8953d5e 276bbef4 167c2c9d 3c258=
e21  ^=3D....k'.,|.!.%<
Sep 06 00:20:25 szarotka kernel: 00000000: d2fa2a74 9039c12a b8953d5e 276bb=
ef4  t*..*.9.^=3D....k'
Sep 06 00:20:25 szarotka kernel: cifs_readv_callback: 33 callbacks suppress=
ed
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: 2a53818a 406ebe85 9545e3cc 7af2c=
59f  ..S*..n@..E....z
Sep 06 00:20:25 szarotka kernel: 00000000: 2a53818a 406ebe85 2a53818a 406eb=
e85  ..S*..n@..S*..n@
Sep 06 00:20:25 szarotka kernel: 00000000: b626e58a f036deaa f35f94c7 c9979=
41a  ..&...6..._.....
Sep 06 00:20:25 szarotka kernel: 00000000: b626e58a f036deaa b626e58a f036d=
eaa  ..&...6...&...6.
Sep 06 00:20:25 szarotka kernel: 00000000: b4b2ef73 2dc35d14 a3fac161 fbe95=
b2c  s....].-a...,[..
Sep 06 00:20:25 szarotka kernel: 00000000: b4b2ef73 2dc35d14 b4b2ef73 2dc35=
d14  s....].-s....].-
Sep 06 00:20:25 szarotka kernel: 00000000: 0ad8a900 4c863037 c9789c0f 820d3=
659  ....70.L..x.Y6..
Sep 06 00:20:25 szarotka kernel: 00000000: 0ad8a900 4c863037 0ad8a900 4c863=
037  ....70.L....70.L
Sep 06 00:20:25 szarotka kernel: 00000000: 57e27517 ff6a2e65 1a5fb282 f0131=
03c  .u.We.j..._.<...
Sep 06 00:20:25 szarotka kernel: 00000000: 57e27517 ff6a2e65 57e27517 ff6a2=
e65  .u.We.j..u.We.j.
Sep 06 00:20:25 szarotka kernel: 00000000: ae5babf4 df105f25 8f0ecd9f 92d38=
ecc  ..[.%_..........
Sep 06 00:20:25 szarotka kernel: 00000000: ae5babf4 df105f25 ae5babf4 df105=
f25  ..[.%_....[.%_..
Sep 06 00:20:25 szarotka kernel: 00000000: c5292278 19c37a0f 31acd0ec c053d=
158  x")..z.....1X.S.
Sep 06 00:20:25 szarotka kernel: 00000000: c5292278 19c37a0f c5292278 19c37=
a0f  x")..z..x")..z..
Sep 06 00:20:25 szarotka kernel: 00000000: 0c0c9b8b 89dfcd62 8e80d79b 094b2=
691  ....b........&K.
Sep 06 00:20:25 szarotka kernel: 00000000: 1c8ce110 0b45056e 0c0c9b8b 89dfc=
d62  ....n.E.....b...
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: bf1cf6fd 302e1dc5 a3b2c050 5a55b=
997  .......0P.....UZ
Sep 06 00:20:25 szarotka kernel: 00000000: bf1cf6fd 302e1dc5 bf1cf6fd 302e1=
dc5  .......0.......0
Sep 06 00:20:25 szarotka kernel: 00000000: d499f827 1bcef075 fd03e619 0fd76=
240  '...u.......@b..
Sep 06 00:20:25 szarotka kernel: 00000000: d499f827 1bcef075 d499f827 1bcef=
075  '...u...'...u...
Sep 06 00:20:25 szarotka kernel: 00000000: e61a6803 c195387e 00da2746 bb592=
fdb  .h..~8..F'.../Y.
Sep 06 00:20:25 szarotka kernel: 00000000: e61a6803 c195387e e61a6803 c1953=
87e  .h..~8...h..~8..
Sep 06 00:20:25 szarotka kernel: 00000000: 19c169b4 f889d4c8 2151379f cbdb9=
d1f  .i.......7Q!....
Sep 06 00:20:25 szarotka kernel: 00000000: 19c169b4 f889d4c8 19c169b4 f889d=
4c8  .i.......i......
Sep 06 00:20:25 szarotka kernel: 00000000: fd608d1c 50daf89a 91fe9f75 33d26=
9a1  ..`....Pu....i.3
Sep 06 00:20:25 szarotka kernel: 00000000: fd608d1c 50daf89a fd608d1c 50daf=
89a  ..`....P..`....P
Sep 06 00:20:25 szarotka kernel: 00000000: 041e12c4 0912a87a 0c2d7578 2fb8a=
f44  ....z...xu-.D../
Sep 06 00:20:25 szarotka kernel: 00000000: bb0637f3 4304ec5c 041e12c4 0912a=
87a  .7..\..C....z...
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: 4b0ee010 150f6901 cc7845a1 b70f8=
55d  ...K.i...Ex.]...
Sep 06 00:20:25 szarotka kernel: 00000000: 4b0ee010 150f6901 4b0ee010 150f6=
901  ...K.i.....K.i..
Sep 06 00:20:25 szarotka kernel: 00000000: 86c3386f 37af5d60 a33d5015 fc2f8=
e2a  o8..`].7.P=3D.*./.
Sep 06 00:20:25 szarotka kernel: 00000000: 86c3386f 37af5d60 86c3386f 37af5=
d60  o8..`].7o8..`].7
Sep 06 00:20:25 szarotka kernel: 00000000: 5a8eb650 d7db69ac ff11408c b8133=
f0a  P..Z.i...@...?..
Sep 06 00:20:25 szarotka kernel: 00000000: 5a8eb650 d7db69ac 5a8eb650 d7db6=
9ac  P..Z.i..P..Z.i..
Sep 06 00:20:25 szarotka kernel: 00000000: 8d06abf1 4bb6ccc5 31286113 8a461=
bba  .......K.a(1..F.
Sep 06 00:20:25 szarotka kernel: 00000000: 8d06abf1 4bb6ccc5 8d06abf1 4bb6c=
cc5  .......K.......K
Sep 06 00:20:25 szarotka kernel: 00000000: 190e4ffc 8c3a43ee e59938d0 aad59=
582  .O...C:..8......
Sep 06 00:20:25 szarotka kernel: 00000000: 190e4ffc 8c3a43ee 190e4ffc 8c3a4=
3ee  .O...C:..O...C:.
Sep 06 00:20:25 szarotka kernel: 00000000: 833b705b d82e88a4 f52acd28 a7d41=
1ed  [p;.....(.*.....
Sep 06 00:20:25 szarotka kernel: 00000000: b31a51c2 d2c1c483 833b705b d82e8=
8a4  .Q......[p;.....
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: d08c313d 2065b1ba 36c458d5 b1ffc=
26e  =3D1....e .X.6n...
Sep 06 00:20:25 szarotka kernel: 00000000: 6acb4e4c d63330ca d08c313d 2065b=
1ba  LN.j.03.=3D1....e=20
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: 776a51a0 062a092f 1967a151 c1ca2=
cc1  .Qjw/.*.Q.g..,..
Sep 06 00:20:25 szarotka kernel: 00000000: c30c557a 4f2dca11 776a51a0 062a0=
92f  zU....-O.Qjw/.*.
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: d36e8223 33902f2d a80fe1d4 75830=
395  #.n.-/.3.......u
Sep 06 00:20:25 szarotka kernel: 00000000: d36e8223 33902f2d d36e8223 33902=
f2d  #.n.-/.3#.n.-/.3
Sep 06 00:20:25 szarotka kernel: 00000000: c14acdd5 43a80109 a6370d03 bb763=
187  ..J....C..7..1v.
Sep 06 00:20:25 szarotka kernel: 00000000: c14acdd5 43a80109 c14acdd5 43a80=
109  ..J....C..J....C
Sep 06 00:20:25 szarotka kernel: 00000000: 41f49e80 01f24d38 525a34c2 d9ea3=
a42  ...A8M...4ZRB:..
Sep 06 00:20:25 szarotka kernel: 00000000: 41f49e80 01f24d38 41f49e80 01f24=
d38  ...A8M.....A8M..
Sep 06 00:20:25 szarotka kernel: 00000000: a25ff7d4 7220f62a bf9a0976 9f968=
fff  .._.*. rv.......
Sep 06 00:20:25 szarotka kernel: 00000000: a25ff7d4 7220f62a a25ff7d4 7220f=
62a  .._.*. r.._.*. r
Sep 06 00:20:25 szarotka kernel: 00000000: 9d21afed 098539b0 7678ee92 3e537=
830  ..!..9....xv0xS>
Sep 06 00:20:25 szarotka kernel: 00000000: 9d21afed 098539b0 9d21afed 09853=
9b0  ..!..9....!..9..
Sep 06 00:20:25 szarotka kernel: 00000000: 09493709 4b1041b2 1c241940 d75c3=
3fe  .7I..A.K@.$..3\.
Sep 06 00:20:25 szarotka kernel: 00000000: 1de23842 4d9f406c 09493709 4b104=
1b2  B8..l@.M.7I..A.K
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: 0c39f462 18236039 311112d4 fd968=
99c  b.9.9`#....1....
Sep 06 00:20:25 szarotka kernel: 00000000: 0a33ca76 d00970d6 0c39f462 18236=
039  v.3..p..b.9.9`#.
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: 58a290ca 11d3e036 b85be71a 03a16=
deb  ...X6.....[..m..
Sep 06 00:20:25 szarotka kernel: 00000000: 58a290ca 11d3e036 58a290ca 11d3e=
036  ...X6......X6...
Sep 06 00:20:25 szarotka kernel: 00000000: 2f3ad8e5 b79d4c60 b5dd37f9 583a2=
af7  ..:/`L...7...*:X
Sep 06 00:20:25 szarotka kernel: 00000000: 2f3ad8e5 b79d4c60 2f3ad8e5 b79d4=
c60  ..:/`L....:/`L..
Sep 06 00:20:25 szarotka kernel: 00000000: 6dad6545 c7586b9f 915eba1d c0dc0=
335  Ee.m.kX...^.5...
Sep 06 00:20:25 szarotka kernel: 00000000: 6dad6545 c7586b9f 6dad6545 c7586=
b9f  Ee.m.kX.Ee.m.kX.
Sep 06 00:20:25 szarotka kernel: 00000000: 0a975f9d 2f03a9ae 4adb0979 fd4dd=
f62  ._...../y..Jb.M.
Sep 06 00:20:25 szarotka kernel: 00000000: 0a975f9d 2f03a9ae 0a975f9d 2f03a=
9ae  ._...../._...../
Sep 06 00:20:25 szarotka kernel: 00000000: 6ff038e3 2352c2fb c1eea8b8 c22c8=
6e7  .8.o..R#......,.
Sep 06 00:20:25 szarotka kernel: 00000000: 6ff038e3 2352c2fb 6ff038e3 2352c=
2fb  .8.o..R#.8.o..R#
Sep 06 00:20:25 szarotka kernel: 00000000: 3733ecad ccbafbda ca4ff24a 48b19=
f2c  ..37....J.O.,..H
Sep 06 00:20:25 szarotka kernel: 00000000: 7deb87ae 1bfe526a 3733ecad ccbaf=
bda  ...}jR....37....
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: 100fe999 895cd351 ad7fd927 0d221=
a41  ....Q.\.'...A.".
Sep 06 00:20:25 szarotka kernel: 00000000: 7435ca61 08302ec8 100fe999 895cd=
351  a.5t..0.....Q.\.
Sep 06 00:20:25 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:25 szarotka kernel: 00000000: ca72c16f 3b145b50 8f47f808 b47d6=
0c0  o.r.P[.;..G..`}.
Sep 06 00:20:25 szarotka kernel: 00000000: 7958d0ce 354ed615 ca72c16f 3b145=
b50  ..Xy..N5o.r.P[.;
Sep 06 00:20:25 szarotka kernel: 00000000: 3dfca56a 2c7ea244 acfd22d1 11ff0=
ee1  j..=3DD.~,."......
Sep 06 00:20:25 szarotka kernel: 00000000: 3dfca56a 2c7ea244 3dfca56a 2c7ea=
244  j..=3DD.~,j..=3DD.~,
Sep 06 00:20:25 szarotka kernel: 00000000: cd75cb1b 82b829af 87446121 20d7c=
7f6  ..u..)..!aD....=20
Sep 06 00:20:25 szarotka kernel: 00000000: cd75cb1b 82b829af cd75cb1b 82b82=
9af  ..u..)....u..)..
Sep 06 00:20:25 szarotka kernel: 00000000: b18168ac 011e20c2 902d807d 2dccf=
87e  .h... ..}.-.~..-
Sep 06 00:20:25 szarotka kernel: 00000000: b18168ac 011e20c2 b18168ac 011e2=
0c2  .h... ...h... ..
Sep 06 00:20:25 szarotka kernel: 00000000: 92bafceb c8cf93e1 36d22fca fb834=
512  ........./.6.E..
Sep 06 00:20:25 szarotka kernel: 00000000: 92bafceb c8cf93e1 92bafceb c8cf9=
3e1  ................
Sep 06 00:20:25 szarotka kernel: 00000000: 000b33d6 d4e60033 03733789 b31e0=
096  .3..3....7s.....
Sep 06 00:20:25 szarotka kernel: 00000000: 000b33d6 d4e60033 000b33d6 d4e60=
033  .3..3....3..3...
Sep 06 00:20:25 szarotka kernel: 00000000: dea5e90a 0aa1a5c6 7f647b04 9f5f3=
083  .........{d..0_.
Sep 06 00:20:25 szarotka kernel: 00000000: dea5e90a 0aa1a5c6 dea5e90a 0aa1a=
5c6  ................
Sep 06 00:20:25 szarotka kernel: 00000000: 554fa643 fa7bf9c5 5c522b4c 3e1e4=
9aa  C.OU..{.L+R\.I.>
Sep 06 00:20:25 szarotka kernel: 00000000: 554fa643 fa7bf9c5 554fa643 fa7bf=
9c5  C.OU..{.C.OU..{.
Sep 06 00:20:25 szarotka kernel: 00000000: 07dae438 c6acdc4c d0d4a82a 870d2=
ab6  8...L...*....*..
Sep 06 00:20:25 szarotka kernel: 00000000: 07dae438 c6acdc4c 07dae438 c6acd=
c4c  8...L...8...L...
Sep 06 00:20:25 szarotka kernel: 00000000: a364744c efb13aa7 095eacd7 973e5=
8d3  Ltd..:....^..X>.
Sep 06 00:20:25 szarotka kernel: 00000000: a364744c efb13aa7 a364744c efb13=
aa7  Ltd..:..Ltd..:..
Sep 06 00:20:25 szarotka kernel: 00000000: d15e0cd3 73b8a61c 57dd929f 2cf8a=
559  ..^....s...WY..,
Sep 06 00:20:25 szarotka kernel: 00000000: d15e0cd3 73b8a61c d15e0cd3 73b8a=
61c  ..^....s..^....s
Sep 06 00:20:25 szarotka kernel: 00000000: f1183605 1cfa855b 7d56d63e 68a13=
492  .6..[...>.V}.4.h
Sep 06 00:20:25 szarotka kernel: 00000000: f1183605 1cfa855b f1183605 1cfa8=
55b  .6..[....6..[...
Sep 06 00:20:25 szarotka kernel: 00000000: ed784a36 0b3496c0 90808373 26e03=
fbf  6Jx...4.s....?.&
Sep 06 00:20:25 szarotka kernel: 00000000: ed784a36 0b3496c0 ed784a36 0b349=
6c0  6Jx...4.6Jx...4.
Sep 06 00:20:25 szarotka kernel: 00000000: fd89fc16 a38deeca e5addf88 cd5ad=
16c  ............l.Z.
Sep 06 00:20:25 szarotka kernel: 00000000: fd89fc16 a38deeca fd89fc16 a38de=
eca  ................
Sep 06 00:20:25 szarotka kernel: 00000000: cc8ac8c6 b066002d 2d4ef04e c09cd=
d4c  ....-.f.N.N-L...
Sep 06 00:20:25 szarotka kernel: 00000000: 748d232f e70bc9a0 cc8ac8c6 b0660=
02d  /#.t........-.f.
Sep 06 00:20:25 szarotka kernel: 00000000: 983f12c1 038f82f7 bca7ac3a 859fb=
9de  ..?.....:.......
Sep 06 00:20:25 szarotka kernel: 00000000: 54f8d901 5780b625 983f12c1 038f8=
2f7  ...T%..W..?.....
Sep 06 00:20:25 szarotka kernel: 00000000: 8bdf5635 49c9b00b a347964a ad615=
1c7  5V.....IJ.G..Qa.
Sep 06 00:20:25 szarotka kernel: 00000000: 34038c0f 55245dc0 8bdf5635 49c9b=
00b  ...4.]$U5V.....I
Sep 06 00:20:25 szarotka kernel: 00000000: a8989788 8ec3ea19 0ab527cd 1a714=
e38  .........'..8Nq.
Sep 06 00:20:25 szarotka kernel: 00000000: a8989788 8ec3ea19 a8989788 8ec3e=
a19  ................
Sep 06 00:20:25 szarotka kernel: 00000000: 79cd75f9 2f29d14b 5e8f8327 706cd=
85a  .u.yK.)/'..^Z.lp
Sep 06 00:20:25 szarotka kernel: 00000000: b9f9ac1e 28277268 79cd75f9 2f29d=
14b  ....hr'(.u.yK.)/
Sep 06 00:20:25 szarotka kernel: 00000000: 21bb058b 9cedb190 1854718d 885a8=
8e7  ...!.....qT...Z.
Sep 06 00:20:25 szarotka kernel: 00000000: 21bb058b 9cedb190 21bb058b 9cedb=
190  ...!.......!....
Sep 06 00:20:25 szarotka kernel: 00000000: 74c78585 47338a4c dcfdc253 42da0=
915  ...tL.3GS......B
Sep 06 00:20:25 szarotka kernel: 00000000: 74c78585 47338a4c 74c78585 47338=
a4c  ...tL.3G...tL.3G
Sep 06 00:20:25 szarotka kernel: 00000000: 1aa4f9b4 5c3b9883 ebf5aa21 1dc02=
30c  ......;\!....#..
Sep 06 00:20:25 szarotka kernel: 00000000: 1aa4f9b4 5c3b9883 1aa4f9b4 5c3b9=
883  ......;\......;\
Sep 06 00:20:25 szarotka kernel: 00000000: b51d269c 86efa035 fcf8a08f 3ca35=
30f  .&..5........S.<
Sep 06 00:20:25 szarotka kernel: 00000000: b51d269c 86efa035 b51d269c 86efa=
035  .&..5....&..5...
Sep 06 00:20:25 szarotka kernel: 00000000: 35ddf110 315a295b f9688cc2 ae430=
c28  ...5[)Z1..h.(.C.
Sep 06 00:20:25 szarotka kernel: 00000000: 35ddf110 315a295b 35ddf110 315a2=
95b  ...5[)Z1...5[)Z1
Sep 06 00:20:25 szarotka kernel: 00000000: b8336f68 fe088b35 81d9f721 334a1=
d8c  ho3.5...!.....J3
Sep 06 00:20:25 szarotka kernel: 00000000: b8336f68 fe088b35 b8336f68 fe088=
b35  ho3.5...ho3.5...
Sep 06 00:20:25 szarotka kernel: 00000000: 06cad86c 074f5003 d06371c8 71ede=
046  l....PO..qc.F..q
Sep 06 00:20:25 szarotka kernel: 00000000: 06cad86c 074f5003 06cad86c 074f5=
003  l....PO.l....PO.
Sep 06 00:20:25 szarotka kernel: 00000000: b5269fe9 44eedf43 1e7c2167 8cbe9=
243  ..&.C..Dg!|.C...
Sep 06 00:20:25 szarotka kernel: 00000000: b5269fe9 44eedf43 b5269fe9 44eed=
f43  ..&.C..D..&.C..D
Sep 06 00:20:25 szarotka kernel: 00000000: d06dfdfa 83701f4a 4fbe2631 5ca1b=
59e  ..m.J.p.1&.O...\
Sep 06 00:20:25 szarotka kernel: 00000000: d06dfdfa 83701f4a d06dfdfa 83701=
f4a  ..m.J.p...m.J.p.
Sep 06 00:20:25 szarotka kernel: 00000000: 2693f25a 59b699af 8fe0fe30 c0dd5=
efb  Z..&...Y0....^..
Sep 06 00:20:25 szarotka kernel: 00000000: 2693f25a 59b699af 2693f25a 59b69=
9af  Z..&...YZ..&...Y
Sep 06 00:20:25 szarotka kernel: 00000000: a6aed2d5 1ae7fec3 a75f3edc 8b0b8=
406  .........>_.....
Sep 06 00:20:25 szarotka kernel: 00000000: a6aed2d5 1ae7fec3 a6aed2d5 1ae7f=
ec3  ................
Sep 06 00:20:25 szarotka kernel: 00000000: f02db572 88c364fd 04971b23 362e9=
e70  r.-..d..#...p..6
Sep 06 00:20:25 szarotka kernel: 00000000: f02db572 88c364fd f02db572 88c36=
4fd  r.-..d..r.-..d..
Sep 06 00:20:25 szarotka kernel: 00000000: e72fa630 363fc0a2 208a4232 daa2c=
ec1  0./...?62B. ....
Sep 06 00:20:25 szarotka kernel: 00000000: e72fa630 363fc0a2 e72fa630 363fc=
0a2  0./...?60./...?6
Sep 06 00:20:25 szarotka kernel: 00000000: a13e8a38 2996fba9 366711e4 7366e=
9ef  8.>....)..g6..fs
Sep 06 00:20:25 szarotka kernel: 00000000: a13e8a38 2996fba9 a13e8a38 2996f=
ba9  8.>....)8.>....)
Sep 06 00:20:25 szarotka kernel: 00000000: 877edee7 7e0b852e 3668b402 c8915=
dc6  ..~....~..h6.]..
Sep 06 00:20:25 szarotka kernel: 00000000: 877edee7 7e0b852e 877edee7 7e0b8=
52e  ..~....~..~....~
Sep 06 00:20:25 szarotka kernel: 00000000: 776ee119 56affa0a 4b966635 398cf=
7e9  ..nw...V5f.K...9
Sep 06 00:20:25 szarotka kernel: 00000000: 776ee119 56affa0a 776ee119 56aff=
a0a  ..nw...V..nw...V
Sep 06 00:20:25 szarotka kernel: 00000000: baa39fc0 1ab26315 7308d886 8112d=
bfd  .....c.....s....
Sep 06 00:20:25 szarotka kernel: 00000000: baa39fc0 1ab26315 baa39fc0 1ab26=
315  .....c.......c..
Sep 06 00:20:25 szarotka kernel: 00000000: fa8c93c0 a9983fab e65bce22 f84df=
cd3  .....?..".[...M.
Sep 06 00:20:25 szarotka kernel: 00000000: fa8c93c0 a9983fab fa8c93c0 a9983=
fab  .....?.......?..
Sep 06 00:20:25 szarotka kernel: 00000000: 637665bc 11db8c33 3b460567 cde98=
e55  .evc3...g.F;U...
Sep 06 00:20:25 szarotka kernel: 00000000: 637665bc 11db8c33 637665bc 11db8=
c33  .evc3....evc3...
Sep 06 00:20:25 szarotka kernel: 00000000: 36093a08 8193077d bdad071f 64afb=
c31  .:.6}.......1..d
Sep 06 00:20:25 szarotka kernel: 00000000: 36093a08 8193077d 36093a08 81930=
77d  .:.6}....:.6}...
Sep 06 00:20:25 szarotka kernel: 00000000: 3b27e22e c4964a2b a2c0b27d 76a9f=
1e4  ..';+J..}......v
Sep 06 00:20:25 szarotka kernel: 00000000: 3b27e22e c4964a2b 3b27e22e c4964=
a2b  ..';+J....';+J..
Sep 06 00:20:25 szarotka kernel: 00000000: 5bfa5f12 5a155db6 abe06530 81e49=
edd  ._.[.].Z0e......
Sep 06 00:20:25 szarotka kernel: 00000000: 5bfa5f12 5a155db6 5bfa5f12 5a155=
db6  ._.[.].Z._.[.].Z
Sep 06 00:20:25 szarotka kernel: 00000000: 72220230 328558f8 3e720b91 322be=
329  0."r.X.2..r>).+2
Sep 06 00:20:25 szarotka kernel: 00000000: 72220230 328558f8 72220230 32855=
8f8  0."r.X.20."r.X.2
Sep 06 00:20:25 szarotka kernel: 00000000: c0b3cb5c 90aa6f17 07a7cda6 86578=
377  \....o......w.W.
Sep 06 00:20:25 szarotka kernel: 00000000: c0b3cb5c 90aa6f17 c0b3cb5c 90aa6=
f17  \....o..\....o..
Sep 06 00:20:25 szarotka kernel: 00000000: 58b0e50f 8baabff3 d5e5ca72 667c7=
0f1  ...X....r....p|f
Sep 06 00:20:25 szarotka kernel: 00000000: 58b0e50f 8baabff3 58b0e50f 8baab=
ff3  ...X.......X....
Sep 06 00:20:25 szarotka kernel: 00000000: b7fe657d eb460434 9506276d 6a571=
c9c  }e..4.F.m'....Wj
Sep 06 00:20:25 szarotka kernel: 00000000: b7fe657d eb460434 b7fe657d eb460=
434  }e..4.F.}e..4.F.
Sep 06 00:20:25 szarotka kernel: 00000000: 2382b940 031d028f 21569b77 8a99b=
b0d  @..#....w.V!....
Sep 06 00:20:25 szarotka kernel: 00000000: 2382b940 031d028f 2382b940 031d0=
28f  @..#....@..#....
Sep 06 00:20:25 szarotka kernel: 00000000: 396c5c46 0df4a8f2 63ffd6be 47756=
55b  F\l9.......c[euG
Sep 06 00:20:25 szarotka kernel: 00000000: 396c5c46 0df4a8f2 396c5c46 0df4a=
8f2  F\l9....F\l9....
Sep 06 00:20:25 szarotka kernel: 00000000: 009694e8 bc649139 6c8248f6 ffefb=
e8f  ....9.d..H.l....
Sep 06 00:20:25 szarotka kernel: 00000000: 009694e8 bc649139 009694e8 bc649=
139  ....9.d.....9.d.
Sep 06 00:20:25 szarotka kernel: 00000000: c028d5fe f31c0471 30211b2f 4d3a7=
4e7  ..(.q.../.!0.t:M
Sep 06 00:20:25 szarotka kernel: 00000000: c028d5fe f31c0471 c028d5fe f31c0=
471  ..(.q.....(.q...
Sep 06 00:20:25 szarotka kernel: 00000000: f3844289 2946534c 1444a97f 98ec5=
240  .B..LSF)..D.@R..
Sep 06 00:20:25 szarotka kernel: 00000000: f3844289 2946534c f3844289 29465=
34c  .B..LSF).B..LSF)
Sep 06 00:20:25 szarotka kernel: 00000000: d105b7d9 5c8cf407 27768b75 4195e=
ea6  .......\u.v'...A
Sep 06 00:20:25 szarotka kernel: 00000000: d105b7d9 5c8cf407 d105b7d9 5c8cf=
407  .......\.......\
Sep 06 00:20:25 szarotka kernel: 00000000: 1dfb5666 dbc5a599 c01df867 64ea1=
213  fV......g......d
Sep 06 00:20:25 szarotka kernel: 00000000: 1dfb5666 dbc5a599 1dfb5666 dbc5a=
599  fV......fV......
Sep 06 00:20:25 szarotka kernel: 00000000: d16c67ce acb52427 a528d568 e0acf=
d05  .gl.'$..h.(.....
Sep 06 00:20:25 szarotka kernel: 00000000: d16c67ce acb52427 d16c67ce acb52=
427  .gl.'$...gl.'$..
Sep 06 00:20:25 szarotka kernel: 00000000: 6af5af95 30a4dca0 bf6ef628 10168=
14f  ...j...0(.n.O...
Sep 06 00:20:25 szarotka kernel: 00000000: d49e74c8 8bc083b0 6af5af95 30a4d=
ca0  .t.........j...0
Sep 06 00:20:25 szarotka kernel: 00000000: 03638695 7384f1ce e9cf7908 01eae=
9f2  ..c....s.y......
Sep 06 00:20:25 szarotka kernel: 00000000: 03638695 7384f1ce 03638695 7384f=
1ce  ..c....s..c....s
Sep 06 00:20:25 szarotka kernel: 00000000: 6503623f adbca5e4 1c845dcb f7327=
bd2  ?b.e.....]...{2.
Sep 06 00:20:25 szarotka kernel: 00000000: 6503623f adbca5e4 6503623f adbca=
5e4  ?b.e....?b.e....
Sep 06 00:20:25 szarotka kernel: 00000000: fdbe4564 736956c4 c4340076 778a4=
128  dE...Visv.4.(A.w
Sep 06 00:20:25 szarotka kernel: 00000000: fdbe4564 736956c4 fdbe4564 73695=
6c4  dE...VisdE...Vis
Sep 06 00:20:25 szarotka kernel: 00000000: 442db650 809e5ac9 48ec7628 4a3e2=
9df  P.-D.Z..(v.H.)>J
Sep 06 00:20:25 szarotka kernel: 00000000: 442db650 809e5ac9 442db650 809e5=
ac9  P.-D.Z..P.-D.Z..
Sep 06 00:20:25 szarotka kernel: 00000000: 6ca2244b ab6d1981 2bb0bd3b 93194=
cf4  K$.l..m.;..+.L..
Sep 06 00:20:25 szarotka kernel: 00000000: d2b4945c 8e0a4b71 6ca2244b ab6d1=
981  \...qK..K$.l..m.
Sep 06 00:20:25 szarotka kernel: 00000000: 9a2fa246 ea5ef03e f2fda6de 0d5b3=
821  F./.>.^.....!8[.
Sep 06 00:20:25 szarotka kernel: 00000000: 9a2fa246 ea5ef03e 9a2fa246 ea5ef=
03e  F./.>.^.F./.>.^.
Sep 06 00:20:25 szarotka kernel: 00000000: 968643bc 1fde0784 96a5cbbc 8c86d=
960  .C..........`...
Sep 06 00:20:25 szarotka kernel: 00000000: 968643bc 1fde0784 968643bc 1fde0=
784  .C.......C......
Sep 06 00:20:25 szarotka kernel: 00000000: 087a8ed2 24b71a55 851b2508 e2206=
8c1  ..z.U..$.%...h .
Sep 06 00:20:25 szarotka kernel: 00000000: 087a8ed2 24b71a55 087a8ed2 24b71=
a55  ..z.U..$..z.U..$
Sep 06 00:20:25 szarotka kernel: 00000000: 2637f3ee 5418e5e6 99aba734 24f19=
f7a  ..7&...T4...z..$
Sep 06 00:20:25 szarotka kernel: 00000000: 2637f3ee 5418e5e6 2637f3ee 5418e=
5e6  ..7&...T..7&...T
Sep 06 00:20:25 szarotka kernel: 00000000: 2f1a6fb9 f5dc0bdd ceba4aaf 6a108=
86a  .o./.....J..j..j
Sep 06 00:20:25 szarotka kernel: 00000000: 86a96c17 685b9b45 2f1a6fb9 f5dc0=
bdd  .l..E.[h.o./....
Sep 06 00:20:25 szarotka kernel: 00000000: 838345ef 62033e37 71e1a265 48bae=
80a  .E..7>.be..q...H
Sep 06 00:20:25 szarotka kernel: 00000000: 5577d1a5 e1392bb2 838345ef 62033=
e37  ..wU.+9..E..7>.b
Sep 06 00:20:25 szarotka kernel: 00000000: cb6ed433 3058b34c 996ec2d9 cb739=
9d3  3.n.L.X0..n...s.
Sep 06 00:20:25 szarotka kernel: 00000000: cb6ed433 3058b34c cb6ed433 3058b=
34c  3.n.L.X03.n.L.X0
Sep 06 00:20:25 szarotka kernel: 00000000: 469cd6f8 6ff6c350 3b52027b 40157=
35b  ...FP..o{.R;[s.@
Sep 06 00:20:25 szarotka kernel: 00000000: 469cd6f8 6ff6c350 469cd6f8 6ff6c=
350  ...FP..o...FP..o
Sep 06 00:20:25 szarotka kernel: 00000000: 21e13ab5 37bfd248 40a4b5d0 ca866=
f41  .:.!H..7...@Ao..
Sep 06 00:20:25 szarotka kernel: 00000000: 21e13ab5 37bfd248 21e13ab5 37bfd=
248  .:.!H..7.:.!H..7
Sep 06 00:20:25 szarotka kernel: 00000000: dc17b7c8 ab32bb70 250bf869 49310=
8b8  ....p.2.i..%..1I
Sep 06 00:20:25 szarotka kernel: 00000000: e564f5f7 d7ccfe4e dc17b7c8 ab32b=
b70  ..d.N.......p.2.
Sep 06 00:20:25 szarotka kernel: 00000000: 88c0351d 6e2f2000 b3f4bdc1 05cfc=
e5e  .5... /n....^...
Sep 06 00:20:25 szarotka kernel: 00000000: f0148bd2 814394ae 88c0351d 6e2f2=
000  ......C..5... /n
Sep 06 00:20:25 szarotka kernel: 00000000: 8b4e023a 016b337e dc1af2e1 02497=
bda  :.N.~3k......{I.
Sep 06 00:20:25 szarotka kernel: 00000000: 8b4e023a 016b337e 8b4e023a 016b3=
37e  :.N.~3k.:.N.~3k.
Sep 06 00:20:25 szarotka kernel: 00000000: 8d5a5636 dd1a230e f2f0a720 4177c=
e31  6VZ..#.. ...1.wA
Sep 06 00:20:25 szarotka kernel: 00000000: 8d5a5636 dd1a230e 8d5a5636 dd1a2=
30e  6VZ..#..6VZ..#..
Sep 06 00:20:25 szarotka kernel: 00000000: cceb74cf 425cdf30 923ae1d2 1559f=
bcb  .t..0.\B..:...Y.
Sep 06 00:20:25 szarotka kernel: 00000000: cceb74cf 425cdf30 cceb74cf 425cd=
f30  .t..0.\B.t..0.\B
Sep 06 00:20:25 szarotka kernel: 00000000: e07929c3 da100621 3b11037a 09765=
773  .)y.!...z..;sWv.
Sep 06 00:20:25 szarotka kernel: 00000000: 85fe1ffc e4daa6d3 e07929c3 da100=
621  .........)y.!...
Sep 06 00:20:25 szarotka kernel: 00000000: d63b66b6 461674b3 b1eec1af c6b18=
f81  .f;..t.F........
Sep 06 00:20:25 szarotka kernel: 00000000: 2e7d144c 5811e9f4 d63b66b6 46167=
4b3  L.}....X.f;..t.F
Sep 06 00:20:25 szarotka kernel: 00000000: b1e2a12e 6da4934d 2fbf059c eaf86=
efa  ....M..m.../.n..
Sep 06 00:20:25 szarotka kernel: 00000000: b1e2a12e 6da4934d b1e2a12e 6da49=
34d  ....M..m....M..m
Sep 06 00:20:25 szarotka kernel: 00000000: f94dc06c b70208e1 583ff3c2 ae9d8=
cfe  l.M.......?X....
Sep 06 00:20:25 szarotka kernel: 00000000: f061adb2 2c872c7d f94dc06c b7020=
8e1  ..a.},.,l.M.....
Sep 06 00:20:25 szarotka kernel: 00000000: 9bec71f7 66710655 cb1290c3 104f9=
a09  .q..U.qf......O.
Sep 06 00:20:25 szarotka kernel: 00000000: 9bec71f7 66710655 9bec71f7 66710=
655  .q..U.qf.q..U.qf
Sep 06 00:20:25 szarotka kernel: 00000000: a7cca7d6 d633ca5e 32dc620b a4c73=
966  ....^.3..b.2f9..
Sep 06 00:20:25 szarotka kernel: 00000000: a7cca7d6 d633ca5e a7cca7d6 d633c=
a5e  ....^.3.....^.3.
Sep 06 00:20:25 szarotka kernel: 00000000: 5e86d67e 34ec3c9f 52ee2bfc eae6e=
ee5  ~..^.<.4.+.R....
Sep 06 00:20:25 szarotka kernel: 00000000: 5e86d67e 34ec3c9f 5e86d67e 34ec3=
c9f  ~..^.<.4~..^.<.4
Sep 06 00:20:25 szarotka kernel: 00000000: 398f3332 9578d2f5 126e1ad0 40916=
8c4  23.9..x...n..h.@
Sep 06 00:20:25 szarotka kernel: 00000000: 6d79b397 13a5fe36 398f3332 9578d=
2f5  ..ym6...23.9..x.
Sep 06 00:20:25 szarotka kernel: 00000000: fd1d21b3 38656470 b763c3e6 5c4ee=
d09  .!..pde8..c...N\
Sep 06 00:20:25 szarotka kernel: 00000000: 0426041e 6d033f2f fd1d21b3 38656=
470  ..&./?.m.!..pde8
Sep 06 00:20:25 szarotka kernel: 00000000: 37df7282 255763ad 1fc02a39 5d42a=
52d  .r.7.cW%9*..-.B]
Sep 06 00:20:25 szarotka kernel: 00000000: 6d8f579a c1c0304f 37df7282 25576=
3ad  .W.mO0...r.7.cW%
Sep 06 00:20:25 szarotka kernel: 00000000: 8bce912e 595ca1a3 37915872 7d32d=
e7c  ......\YrX.7|.2}
Sep 06 00:20:25 szarotka kernel: 00000000: 8bce912e 595ca1a3 8bce912e 595ca=
1a3  ......\Y......\Y
Sep 06 00:20:25 szarotka kernel: 00000000: c305c3d6 e0ed3146 da7c1de7 1dde4=
044  ....F1....|.D@..
Sep 06 00:20:25 szarotka kernel: 00000000: c305c3d6 e0ed3146 c305c3d6 e0ed3=
146  ....F1......F1..
Sep 06 00:20:25 szarotka kernel: 00000000: 329b71b6 e4a43c76 21e6f7f2 6031c=
66e  .q.2v<.....!n.1`
Sep 06 00:20:25 szarotka kernel: 00000000: 329b71b6 e4a43c76 329b71b6 e4a43=
c76  .q.2v<...q.2v<..
Sep 06 00:20:25 szarotka kernel: 00000000: 3b83579c 37a51af2 e2959e64 68700=
51e  .W.;...7d.....ph
Sep 06 00:20:25 szarotka kernel: 00000000: 3b83579c 37a51af2 3b83579c 37a51=
af2  .W.;...7.W.;...7
Sep 06 00:20:25 szarotka kernel: 00000000: a99706a8 b4c436fb d184ddb6 0a43d=
9c3  .....6........C.
Sep 06 00:20:25 szarotka kernel: 00000000: a99706a8 b4c436fb a99706a8 b4c43=
6fb  .....6.......6..
Sep 06 00:20:25 szarotka kernel: 00000000: 47a34a63 8e85a1cf 33022009 d2790=
d93  cJ.G..... .3..y.
Sep 06 00:20:25 szarotka kernel: 00000000: 513093ed 641c7756 47a34a63 8e85a=
1cf  ..0QVw.dcJ.G....
Sep 06 00:20:25 szarotka kernel: 00000000: be761e8e b475a777 116fb472 bae43=
20f  ..v.w.u.r.o..2..
Sep 06 00:20:25 szarotka kernel: 00000000: d932185e c28b9255 be761e8e b475a=
777  ^.2.U.....v.w.u.
Sep 06 00:20:25 szarotka kernel: 00000000: ca203b3d 7b41ca83 94f9e604 1a376=
b8b  =3D; ...A{.....k7.
Sep 06 00:20:25 szarotka kernel: 00000000: 5567a8f1 129bd661 ca203b3d 7b41c=
a83  ..gUa...=3D; ...A{
Sep 06 00:20:25 szarotka kernel: 00000000: 9a49305c 55d1fc97 99192033 ca3c2=
1ef  \0I....U3 ...!<.
Sep 06 00:20:25 szarotka kernel: 00000000: 9a49305c 55d1fc97 9a49305c 55d1f=
c97  \0I....U\0I....U
Sep 06 00:20:25 szarotka kernel: 00000000: 7ca4c484 2a87e0f6 f4f9a00e 74a7a=
d42  ...|...*....B..t
Sep 06 00:20:25 szarotka kernel: 00000000: 7ca4c484 2a87e0f6 7ca4c484 2a87e=
0f6  ...|...*...|...*
Sep 06 00:20:25 szarotka kernel: 00000000: 0b5a9cf5 995de8f9 d44fa8aa e189f=
203  ..Z...]...O.....
Sep 06 00:20:25 szarotka kernel: 00000000: 0b5a9cf5 995de8f9 0b5a9cf5 995de=
8f9  ..Z...]...Z...].
Sep 06 00:20:25 szarotka kernel: 00000000: 868ea2fc 8fe4543a 3ef4c9b5 2cb20=
22d  ....:T.....>-..,
Sep 06 00:20:25 szarotka kernel: 00000000: 868ea2fc 8fe4543a 868ea2fc 8fe45=
43a  ....:T......:T..
Sep 06 00:20:25 szarotka kernel: 00000000: 8a96757d f7f803ea c0773e6c 2ccea=
501  }u......l>w....,
Sep 06 00:20:25 szarotka kernel: 00000000: 8a96757d f7f803ea 8a96757d f7f80=
3ea  }u......}u......
Sep 06 00:20:25 szarotka kernel: 00000000: 906d33ae 14f4d849 7cbe1f06 77d35=
4a5  .3m.I......|.T.w
Sep 06 00:20:25 szarotka kernel: 00000000: 096ae075 0f6a654f 906d33ae 14f4d=
849  u.j.Oej..3m.I...
Sep 06 00:20:25 szarotka kernel: 00000000: bdf8e99d f0b039f5 b47c38f8 5d0a2=
90d  .....9...8|..).]
Sep 06 00:20:25 szarotka kernel: 00000000: e6b1425f 0a2b5688 bdf8e99d f0b03=
9f5  _B...V+......9..
Sep 06 00:20:25 szarotka kernel: 00000000: 10c3ad39 0511f3f3 c2f33464 df2d9=
e70  9.......d4..p.-.
Sep 06 00:20:25 szarotka kernel: 00000000: 4fc98ce8 59549d7e 10c3ad39 0511f=
3f3  ...O~.TY9.......
Sep 06 00:20:25 szarotka kernel: 00000000: 229f109c 1ab14ede 962dabca 47949=
58f  ...".N....-....G
Sep 06 00:20:25 szarotka kernel: 00000000: 30f6b8e9 0a6ebf7b 229f109c 1ab14=
ede  ...0{.n....".N..
Sep 06 00:20:25 szarotka kernel: 00000000: 815a9ab2 b489bcb8 251e9990 61492=
8cf  ..Z........%.(Ia
Sep 06 00:20:25 szarotka kernel: 00000000: 7f8b3a0d 8823cc5b 815a9ab2 b489b=
cb8  .:..[.#...Z.....
Sep 06 00:20:25 szarotka kernel: 00000000: 1d514477 744008e2 ee5e34e6 28ffe=
7d1  wDQ...@t.4^....(
Sep 06 00:20:25 szarotka kernel: 00000000: 7a5349bf adc2698c 1d514477 74400=
8e2  .ISz.i..wDQ...@t
Sep 06 00:20:25 szarotka kernel: 00000000: 33f11b59 bd601a65 6c6b3772 a10b6=
135  Y..3e.`.r7kl5a..
Sep 06 00:20:25 szarotka kernel: 00000000: 76053be4 26bb1544 33f11b59 bd601=
a65  .;.vD..&Y..3e.`.
Sep 06 00:20:25 szarotka kernel: 00000000: 538d074d 62322c2c 1ea8eed7 544d9=
d6c  M..S,,2b....l.MT
Sep 06 00:20:25 szarotka kernel: 00000000: 538d074d 62322c2c 538d074d 62322=
c2c  M..S,,2bM..S,,2b
Sep 06 00:20:25 szarotka kernel: 00000000: 78ef055a d034a75f 10f97b14 fdf6e=
db7  Z..x_.4..{......
Sep 06 00:20:25 szarotka kernel: 00000000: 78ef055a d034a75f 78ef055a d034a=
75f  Z..x_.4.Z..x_.4.
Sep 06 00:20:25 szarotka kernel: 00000000: b138d710 890981bb be38c666 aa70c=
20a  ..8.....f.8...p.
Sep 06 00:20:25 szarotka kernel: 00000000: b138d710 890981bb b138d710 89098=
1bb  ..8.......8.....
Sep 06 00:20:25 szarotka kernel: 00000000: 9e202daf 7a661ed7 d6b781a5 61779=
0d0  .- ...fz......wa
Sep 06 00:20:25 szarotka kernel: 00000000: 9e202daf 7a661ed7 9e202daf 7a661=
ed7  .- ...fz.- ...fz
Sep 06 00:20:25 szarotka kernel: 00000000: 6354bfad 13df5092 cffe023b a1596=
1db  ..Tc.P..;....aY.
Sep 06 00:20:25 szarotka kernel: 00000000: 6354bfad 13df5092 6354bfad 13df5=
092  ..Tc.P....Tc.P..
Sep 06 00:20:25 szarotka kernel: 00000000: 56dce366 cdf84e27 d0000fab 59dff=
327  f..V'N......'..Y
Sep 06 00:20:25 szarotka kernel: 00000000: 56dce366 cdf84e27 56dce366 cdf84=
e27  f..V'N..f..V'N..
Sep 06 00:20:25 szarotka kernel: 00000000: 9e80fb62 706342eb 5e8481fd e45e8=
d53  b....Bcp...^S.^.
Sep 06 00:20:25 szarotka kernel: 00000000: 9e80fb62 706342eb 9e80fb62 70634=
2eb  b....Bcpb....Bcp
Sep 06 00:20:25 szarotka kernel: 00000000: 7a882072 3a057229 99586987 799e9=
520  r .z)r.:.iX. ..y
Sep 06 00:20:25 szarotka kernel: 00000000: 7a882072 3a057229 7a882072 3a057=
229  r .z)r.:r .z)r.:
Sep 06 00:20:25 szarotka kernel: 00000000: c1bee99f c11b9436 70cdc47c 1088f=
c15  ....6...|..p....
Sep 06 00:20:25 szarotka kernel: 00000000: c1bee99f c11b9436 c1bee99f c11b9=
436  ....6.......6...
Sep 06 00:20:25 szarotka kernel: 00000000: c4b13bf9 0ea468f5 02f0aad9 d78da=
34f  .;...h......O...
Sep 06 00:20:25 szarotka kernel: 00000000: c4b13bf9 0ea468f5 c4b13bf9 0ea46=
8f5  .;...h...;...h..
Sep 06 00:20:25 szarotka kernel: 00000000: abc9f4bc 0af44a51 f0ac8f92 ff60d=
f02  ....QJ........`.
Sep 06 00:20:25 szarotka kernel: 00000000: abc9f4bc 0af44a51 abc9f4bc 0af44=
a51  ....QJ......QJ..
Sep 06 00:20:25 szarotka kernel: 00000000: 9837e175 df53a9d9 257b9bd0 7291f=
c40  u.7...S...{%@..r
Sep 06 00:20:25 szarotka kernel: 00000000: 668f6e3a c61c1639 9837e175 df53a=
9d9  :n.f9...u.7...S.
Sep 06 00:20:25 szarotka kernel: 00000000: 11d63ad9 0ddb49ce 17bf6a61 af38b=
f2f  .:...I..aj../.8.
Sep 06 00:20:25 szarotka kernel: 00000000: ee7f7481 8be46d01 11d63ad9 0ddb4=
9ce  .t...m...:...I..
Sep 06 00:20:25 szarotka kernel: 00000000: f34178bd d7be7ef6 509d5d05 f25c1=
911  .xA..~...].P..\.
Sep 06 00:20:25 szarotka kernel: 00000000: f34178bd d7be7ef6 f34178bd d7be7=
ef6  .xA..~...xA..~..
Sep 06 00:20:25 szarotka kernel: 00000000: 017bf7ad b2ad1663 8d0a1195 4c25b=
e30  ..{.c.......0.%L
Sep 06 00:20:25 szarotka kernel: 00000000: 017bf7ad b2ad1663 017bf7ad b2ad1=
663  ..{.c.....{.c...
Sep 06 00:20:25 szarotka kernel: 00000000: 66ac1872 9162a133 6c20f896 37636=
068  r..f3.b... lh`c7
Sep 06 00:20:25 szarotka kernel: 00000000: 66ac1872 9162a133 66ac1872 9162a=
133  r..f3.b.r..f3.b.
Sep 06 00:20:26 szarotka kernel: 00000000: 22727e0e 17240adc fdd39120 3fc86=
6e1  .~r"..$. ....f.?
Sep 06 00:20:26 szarotka kernel: 00000000: ece8bcba 21842db8 22727e0e 17240=
adc  .....-.!.~r"..$.
Sep 06 00:20:26 szarotka kernel: 00000000: d94db13d 10a3dd7e 3268d502 eb932=
3d1  =3D.M.~.....h2.#..
Sep 06 00:20:26 szarotka kernel: 00000000: 1c0bf884 66989b6f d94db13d 10a3d=
d7e  ....o..f=3D.M.~...
Sep 06 00:20:26 szarotka kernel: 00000000: 519b75a4 f97f2808 af7dd90b 1b08e=
3b4  .u.Q.(....}.....
Sep 06 00:20:26 szarotka kernel: 00000000: 519b75a4 f97f2808 519b75a4 f97f2=
808  .u.Q.(...u.Q.(..
Sep 06 00:20:26 szarotka kernel: 00000000: 7734ad12 2a73af1b e2a8da49 96f54=
48f  ..4w..s*I....D..
Sep 06 00:20:26 szarotka kernel: 00000000: 7734ad12 2a73af1b 7734ad12 2a73a=
f1b  ..4w..s*..4w..s*
Sep 06 00:20:26 szarotka kernel: 00000000: 857bf6e1 97ea3597 966c909f a32a9=
c19  ..{..5....l...*.
Sep 06 00:20:26 szarotka kernel: 00000000: 857bf6e1 97ea3597 857bf6e1 97ea3=
597  ..{..5....{..5..
Sep 06 00:20:26 szarotka kernel: 00000000: 9bf52517 e9a5f62d 92565911 4bd66=
68c  .%..-....YV..f.K
Sep 06 00:20:26 szarotka kernel: 00000000: b225b229 b3106d8f 9bf52517 e9a5f=
62d  ).%..m...%..-...
Sep 06 00:20:26 szarotka kernel: 00000000: ad045d50 9f6de762 2c9da970 8edad=
c03  P]..b.m.p..,....
Sep 06 00:20:26 szarotka kernel: 00000000: ffdef3d9 0d0ed272 ad045d50 9f6de=
762  ....r...P]..b.m.
Sep 06 00:20:26 szarotka kernel: 00000000: 6d8a6afc 36bcceed e2cc7690 638ca=
b16  .j.m...6.v.....c
Sep 06 00:20:26 szarotka kernel: 00000000: 6d8a6afc 36bcceed 6d8a6afc 36bcc=
eed  .j.m...6.j.m...6
Sep 06 00:20:26 szarotka kernel: 00000000: a698b583 a9cde550 43e76795 c051a=
26b  ....P....g.Ck.Q.
Sep 06 00:20:26 szarotka kernel: 00000000: a698b583 a9cde550 a698b583 a9cde=
550  ....P.......P...
Sep 06 00:20:26 szarotka kernel: 00000000: 7c3f58a3 6f6b2573 1cae1995 115f4=
bc5  .X?|s%ko.....K_.
Sep 06 00:20:26 szarotka kernel: 00000000: 23eb4342 c6849edc 7c3f58a3 6f6b2=
573  BC.#.....X?|s%ko
Sep 06 00:20:26 szarotka kernel: 00000000: eff86c7a 4cfc9515 823d1ace b89e0=
b6c  zl.....L..=3D.l...
Sep 06 00:20:26 szarotka kernel: 00000000: eff86c7a 4cfc9515 eff86c7a 4cfc9=
515  zl.....Lzl.....L
Sep 06 00:20:26 szarotka kernel: 00000000: e9e6f81c 25527576 1427957c 51391=
fab  ....vuR%|.'...9Q
Sep 06 00:20:26 szarotka kernel: 00000000: e9e6f81c 25527576 e9e6f81c 25527=
576  ....vuR%....vuR%
Sep 06 00:20:26 szarotka kernel: 00000000: e7330160 114807cf 996cdbc9 82989=
379  `.3...H...l.y...
Sep 06 00:20:26 szarotka kernel: 00000000: e7330160 114807cf e7330160 11480=
7cf  `.3...H.`.3...H.
Sep 06 00:20:26 szarotka kernel: 00000000: 30f186b7 60a0655c a8bfeb5e ada61=
801  ...0\e.`^.......
Sep 06 00:20:26 szarotka kernel: 00000000: 3a9fd1a4 b983e6dd 30f186b7 60a06=
55c  ...:.......0\e.`
Sep 06 00:20:26 szarotka kernel: 00000000: 2d4c0292 c2f7c9ed 1b3b747a 91123=
f39  ..L-....zt;.9?..
Sep 06 00:20:26 szarotka kernel: 00000000: 3c0e3127 07c4b98f 2d4c0292 c2f7c=
9ed  '1.<......L-....
Sep 06 00:20:26 szarotka kernel: 00000000: e7a0fdcb b7a59462 0a08c2cd d8c23=
520  ....b....... 5..
Sep 06 00:20:26 szarotka kernel: 00000000: e7a0fdcb b7a59462 e7a0fdcb b7a59=
462  ....b.......b...
Sep 06 00:20:26 szarotka kernel: 00000000: 0f358c51 a658a7b7 437fcb01 79728=
4f1  Q.5...X....C..ry
Sep 06 00:20:26 szarotka kernel: 00000000: a4486f25 97a1cd38 0f358c51 a658a=
7b7  %oH.8...Q.5...X.
Sep 06 00:20:26 szarotka kernel: 00000000: 3aae5cbb ca57f0d2 89f6b151 174f5=
a45  .\.:..W.Q...EZO.
Sep 06 00:20:26 szarotka kernel: 00000000: 3aae5cbb ca57f0d2 3aae5cbb ca57f=
0d2  .\.:..W..\.:..W.
Sep 06 00:20:26 szarotka kernel: 00000000: 9ef48630 ad39e7d4 f04eb793 e82f5=
370  0.....9...N.pS/.
Sep 06 00:20:26 szarotka kernel: 00000000: 9ef48630 ad39e7d4 9ef48630 ad39e=
7d4  0.....9.0.....9.
Sep 06 00:20:26 szarotka kernel: 00000000: 90060a21 5dba7045 e9cc4bbc d5f09=
941  !...Ep.].K..A...
Sep 06 00:20:26 szarotka kernel: 00000000: 90060a21 5dba7045 90060a21 5dba7=
045  !...Ep.]!...Ep.]
Sep 06 00:20:26 szarotka kernel: 00000000: 97f165cb fa17761b 6296f04e 1f7be=
14d  .e...v..N..bM.{.
Sep 06 00:20:26 szarotka kernel: 00000000: 97f165cb fa17761b 97f165cb fa177=
61b  .e...v...e...v..
Sep 06 00:20:26 szarotka kernel: 00000000: fded0faf b973ffd3 294dcae8 98410=
73c  ......s...M)<.A.
Sep 06 00:20:26 szarotka kernel: 00000000: fded0faf b973ffd3 fded0faf b973f=
fd3  ......s.......s.
Sep 06 00:20:26 szarotka kernel: 00000000: d2dbcb44 0bfbb692 5e80d1b0 ae740=
989  D..........^..t.
Sep 06 00:20:26 szarotka kernel: 00000000: 5be6f844 e2f978c9 d2dbcb44 0bfbb=
692  D..[.x..D.......
Sep 06 00:20:26 szarotka kernel: 00000000: db9bef09 15a0ddce 4343be79 1e7d6=
831  ........y.CC1h}.
Sep 06 00:20:26 szarotka kernel: 00000000: b3ea5a11 e0dcd7e8 db9bef09 15a0d=
dce  .Z..............
Sep 06 00:20:26 szarotka kernel: 00000000: a988fba2 bf2b4fef f0077b57 887b5=
af1  .....O+.W{...Z{.
Sep 06 00:20:26 szarotka kernel: 00000000: a988fba2 bf2b4fef a988fba2 bf2b4=
fef  .....O+......O+.
Sep 06 00:20:26 szarotka kernel: 00000000: 4140d37c 325bd37c 46217f57 94d3a=
789  |.@A|.[2W.!F....
Sep 06 00:20:26 szarotka kernel: 00000000: 4140d37c 325bd37c 4140d37c 325bd=
37c  |.@A|.[2|.@A|.[2
Sep 06 00:20:26 szarotka kernel: 00000000: 194878c2 56d9f713 3a1a2f59 f01a5=
cb3  .xH....VY/.:.\..
Sep 06 00:20:26 szarotka kernel: 00000000: 194878c2 56d9f713 194878c2 56d9f=
713  .xH....V.xH....V
Sep 06 00:20:26 szarotka kernel: 00000000: a8b9a6bb ed52197b e6ca1fb0 27a52=
9e8  ....{.R......).'
Sep 06 00:20:26 szarotka kernel: 00000000: a8b9a6bb ed52197b a8b9a6bb ed521=
97b  ....{.R.....{.R.
Sep 06 00:20:26 szarotka kernel: 00000000: 714da233 7949cfed edd2d38c 6b632=
014  3.Mq..Iy..... ck
Sep 06 00:20:26 szarotka kernel: 00000000: 714da233 7949cfed 714da233 7949c=
fed  3.Mq..Iy3.Mq..Iy
Sep 06 00:20:26 szarotka kernel: 00000000: 90210302 87f92175 0ee846a8 4617d=
056  ..!.u!...F..V..F
Sep 06 00:20:26 szarotka kernel: 00000000: 258962ce aa032a7e 90210302 87f92=
175  .b.%~*....!.u!..
Sep 06 00:20:26 szarotka kernel: 00000000: 4fddbbf5 f306f7b8 837671fd a4822=
913  ...O.....qv..)..
Sep 06 00:20:26 szarotka kernel: 00000000: 2633f256 3a0f52f1 4fddbbf5 f306f=
7b8  V.3&.R.:...O....
Sep 06 00:20:26 szarotka kernel: 00000000: effff480 056449e5 e5d46e9b d5473=
bf3  .....Id..n...;G.
Sep 06 00:20:26 szarotka kernel: 00000000: a7025092 2df7bf14 effff480 05644=
9e5  .P.....-.....Id.
Sep 06 00:20:26 szarotka kernel: 00000000: 3b1e7a48 8584aaeb 20155bf3 aae3b=
5c7  Hz.;.....[. ....
Sep 06 00:20:26 szarotka kernel: 00000000: 11bf1806 4808b9cb 3b1e7a48 8584a=
aeb  .......HHz.;....
Sep 06 00:20:26 szarotka kernel: 00000000: 6a75f085 996bb205 aaa1f817 9b92b=
9cf  ..uj..k.........
Sep 06 00:20:26 szarotka kernel: 00000000: a00a9f84 f8fbfe0e 6a75f085 996bb=
205  ..........uj..k.
Sep 06 00:20:26 szarotka kernel: 00000000: 07775b27 78a4f266 93c2dc45 38feb=
d6a  '[w.f..xE...j..8
Sep 06 00:20:26 szarotka kernel: 00000000: 07775b27 78a4f266 07775b27 78a4f=
266  '[w.f..x'[w.f..x
Sep 06 00:20:26 szarotka kernel: 00000000: bcc058de e68d2b95 033334c3 e0a29=
125  .X...+...43.%...
Sep 06 00:20:26 szarotka kernel: 00000000: bcc058de e68d2b95 bcc058de e68d2=
b95  .X...+...X...+..
Sep 06 00:20:26 szarotka kernel: 00000000: b2b6b092 737c8dd9 ce71af73 21d35=
3e7  ......|ss.q..S.!
Sep 06 00:20:26 szarotka kernel: 00000000: b2b6b092 737c8dd9 b2b6b092 737c8=
dd9  ......|s......|s
Sep 06 00:20:26 szarotka kernel: 00000000: b2457299 e0cdefd3 6c3ca368 df650=
507  .rE.....h.<l..e.
Sep 06 00:20:26 szarotka kernel: 00000000: b2457299 e0cdefd3 b2457299 e0cde=
fd3  .rE......rE.....
Sep 06 00:20:26 szarotka kernel: 00000000: 88252b3f 7af4a019 5de290fe 45287=
a78  ?+%....z...]xz(E
Sep 06 00:20:26 szarotka kernel: 00000000: 3c3dd6c6 2a899ad3 88252b3f 7af4a=
019  ..=3D<...*?+%....z
Sep 06 00:20:26 szarotka kernel: 00000000: 4530052e ae6868c0 60430515 abe1c=
199  ..0E.hh...C`....
Sep 06 00:20:26 szarotka kernel: 00000000: 6db8f915 d11aad83 4530052e ae686=
8c0  ...m......0E.hh.
Sep 06 00:20:26 szarotka kernel: 00000000: 366b755f f8d06922 bfaeaa68 22f9a=
84b  _uk6"i..h...K.."
Sep 06 00:20:26 szarotka kernel: 00000000: 928470ca b161b55d 366b755f f8d06=
922  .p..].a._uk6"i..
Sep 06 00:20:26 szarotka kernel: 00000000: f15d6e1e 940af678 57770797 d97af=
9d3  .n].x.....wW..z.
Sep 06 00:20:26 szarotka kernel: 00000000: f15d6e1e 940af678 f15d6e1e 940af=
678  .n].x....n].x...
Sep 06 00:20:26 szarotka kernel: 00000000: 3c4ee88a bf23addc df9a7ee4 09ca8=
dd9  ..N<..#..~......
Sep 06 00:20:26 szarotka kernel: 00000000: 3c4ee88a bf23addc 3c4ee88a bf23a=
ddc  ..N<..#...N<..#.
Sep 06 00:20:26 szarotka kernel: 00000000: e975b9cc 67585e9a 7765a52e 001c7=
fb1  ..u..^Xg..ew....
Sep 06 00:20:26 szarotka kernel: 00000000: e975b9cc 67585e9a e975b9cc 67585=
e9a  ..u..^Xg..u..^Xg
Sep 06 00:20:26 szarotka kernel: 00000000: 3bd7fa2e 2175dd2b e53433e9 52b5e=
a23  ...;+.u!.34.#..R
Sep 06 00:20:26 szarotka kernel: 00000000: f2be369a 2d2462dc 3bd7fa2e 2175d=
d2b  .6...b$-...;+.u!
Sep 06 00:20:26 szarotka kernel: 00000000: 61911ec5 d3f49609 17f1b97b 0a590=
d2f  ...a....{.../.Y.
Sep 06 00:20:26 szarotka kernel: 00000000: 105eeaa1 f0fb9950 61911ec5 d3f49=
609  ..^.P......a....
Sep 06 00:20:26 szarotka kernel: 00000000: 31d4185b 878847f5 4f440631 9285f=
5ec  [..1.G..1.DO....
Sep 06 00:20:26 szarotka kernel: 00000000: 31d4185b 878847f5 31d4185b 87884=
7f5  [..1.G..[..1.G..
Sep 06 00:20:26 szarotka kernel: 00000000: 0df7d9f9 11a386fe 8ff3784a 8beb7=
b2a  ........Jx..*{..
Sep 06 00:20:26 szarotka kernel: 00000000: 0df7d9f9 11a386fe 0df7d9f9 11a38=
6fe  ................
Sep 06 00:20:26 szarotka kernel: 00000000: 29e669d2 3dc9583e df5a168e a1988=
b47  .i.)>X.=3D..Z.G...
Sep 06 00:20:26 szarotka kernel: 00000000: 29e669d2 3dc9583e 29e669d2 3dc95=
83e  .i.)>X.=3D.i.)>X.=3D
Sep 06 00:20:26 szarotka kernel: 00000000: d778d97a e0d120cc 1ca4f92d 8f5a4=
d81  z.x.. ..-....MZ.
Sep 06 00:20:26 szarotka kernel: 00000000: d778d97a e0d120cc d778d97a e0d12=
0cc  z.x.. ..z.x.. ..
Sep 06 00:20:26 szarotka kernel: 00000000: 492fa83c ee9206f8 5a41ec26 d8af1=
e3f  <./I....&.AZ?...
Sep 06 00:20:26 szarotka kernel: 00000000: 96a9d341 51a3ee9d 492fa83c ee920=
6f8  A......Q<./I....
Sep 06 00:20:26 szarotka kernel: 00000000: 6ed0e7bb e748560c 22d9892c 416ae=
b82  ...n.VH.,.."..jA
Sep 06 00:20:26 szarotka kernel: 00000000: 60a231dc 5a224c31 6ed0e7bb e7485=
60c  .1.`1L"Z...n.VH.
Sep 06 00:20:26 szarotka kernel: 00000000: c8780cb0 1c1f0e50 aebeb447 34672=
66c  ..x.P...G...l&g4
Sep 06 00:20:26 szarotka kernel: 00000000: c8780cb0 1c1f0e50 c8780cb0 1c1f0=
e50  ..x.P.....x.P...
Sep 06 00:20:26 szarotka kernel: 00000000: 1bf72d28 6429a3a5 af697dd0 cc026=
e6c  (-....)d.}i.ln..
Sep 06 00:20:26 szarotka kernel: 00000000: 1bf72d28 6429a3a5 1bf72d28 6429a=
3a5  (-....)d(-....)d
Sep 06 00:20:26 szarotka kernel: 00000000: cead9bbf 32c41d65 7951754e 3b75e=
0db  ....e..2NuQy..u;
Sep 06 00:20:26 szarotka kernel: 00000000: cead9bbf 32c41d65 cead9bbf 32c41=
d65  ....e..2....e..2
Sep 06 00:20:26 szarotka kernel: 00000000: b488fe15 0de36af1 725b21e4 dac77=
975  .....j...![ruy..
Sep 06 00:20:26 szarotka kernel: 00000000: fb9f960b 0e1080b1 b488fe15 0de36=
af1  .............j..
Sep 06 00:20:26 szarotka kernel: 00000000: d7b000ef a5e90ca0 2790efb5 8390f=
e28  ...........'(...
Sep 06 00:20:26 szarotka kernel: 00000000: f0d964a9 49dee4ef d7b000ef a5e90=
ca0  .d.....I........
Sep 06 00:20:26 szarotka kernel: 00000000: a99b7068 0a2a3ddb ac1a58b5 a4d7e=
187  hp...=3D*..X......
Sep 06 00:20:26 szarotka kernel: 00000000: a99b7068 0a2a3ddb a99b7068 0a2a3=
ddb  hp...=3D*.hp...=3D*.
Sep 06 00:20:26 szarotka kernel: 00000000: f2f119f6 f6f5e3d6 a50b9a92 ac7e9=
82c  ............,.~.
Sep 06 00:20:26 szarotka kernel: 00000000: f2f119f6 f6f5e3d6 f2f119f6 f6f5e=
3d6  ................
Sep 06 00:20:26 szarotka kernel: 00000000: 19ab3963 5e81c86d 521ecb80 4a85d=
05d  c9..m..^...R]..J
Sep 06 00:20:26 szarotka kernel: 00000000: 19ab3963 5e81c86d 19ab3963 5e81c=
86d  c9..m..^c9..m..^
Sep 06 00:20:26 szarotka kernel: 00000000: 58bbd550 5ca8692b cf05ad75 0c673=
1a1  P..X+i.\u....1g.
Sep 06 00:20:26 szarotka kernel: 00000000: e1488ec9 e45a162b 58bbd550 5ca86=
92b  ..H.+.Z.P..X+i.\
Sep 06 00:20:26 szarotka kernel: 00000000: 21296264 e3ccf494 f5d763bb dff7b=
804  db)!.....c......
Sep 06 00:20:26 szarotka kernel: 00000000: 5d983ee9 e02bfbe8 21296264 e3ccf=
494  .>.]..+.db)!....
Sep 06 00:20:26 szarotka kernel: 00000000: ad99cb16 8af9664c 2a70e821 8d915=
b1b  ....Lf..!.p*.[..
Sep 06 00:20:26 szarotka kernel: 00000000: ad99cb16 8af9664c ad99cb16 8af96=
64c  ....Lf......Lf..
Sep 06 00:20:26 szarotka kernel: 00000000: 45972a7f f86498f1 f777d2eb 005f8=
ce3  .*.E..d...w..._.
Sep 06 00:20:26 szarotka kernel: 00000000: 436c96ff 1fc7d268 45972a7f f8649=
8f1  ..lCh....*.E..d.
Sep 06 00:20:26 szarotka kernel: 00000000: 441481e6 ae883dcb c03cfc44 027a9=
4e6  ...D.=3D..D.<...z.
Sep 06 00:20:26 szarotka kernel: 00000000: 441481e6 ae883dcb 441481e6 ae883=
dcb  ...D.=3D.....D.=3D..
Sep 06 00:20:26 szarotka kernel: 00000000: 47b7b1c9 16baccef ba656dac 33d88=
5fe  ...G.....me....3
Sep 06 00:20:26 szarotka kernel: 00000000: 47b7b1c9 16baccef 47b7b1c9 16bac=
cef  ...G.......G....
Sep 06 00:20:26 szarotka kernel: 00000000: 481b1b1f c2589a05 bbce6882 38d6f=
ef9  ...H..X..h.....8
Sep 06 00:20:26 szarotka kernel: 00000000: 481b1b1f c2589a05 481b1b1f c2589=
a05  ...H..X....H..X.
Sep 06 00:20:26 szarotka kernel: 00000000: 83d5b92f 4ec0dc17 6dcc666d f9742=
7a1  /......Nmf.m.'t.
Sep 06 00:20:26 szarotka kernel: 00000000: 83d5b92f 4ec0dc17 83d5b92f 4ec0d=
c17  /......N/......N
Sep 06 00:20:26 szarotka kernel: 00000000: 369d8a5b 48739664 3493b8ae dacc8=
6e2  [..6d.sH...4....
Sep 06 00:20:26 szarotka kernel: 00000000: 369d8a5b 48739664 369d8a5b 48739=
664  [..6d.sH[..6d.sH
Sep 06 00:20:26 szarotka kernel: 00000000: 5e503439 286721bd 37fb9f5a e9da4=
594  94P^.!g(Z..7.E..
Sep 06 00:20:26 szarotka kernel: 00000000: e04ac2e0 70e5cc30 5e503439 28672=
1bd  ..J.0..p94P^.!g(
Sep 06 00:20:26 szarotka kernel: 00000000: 49957b3a 008564c0 c0cbec54 ea76b=
daf  :{.I.d..T.....v.
Sep 06 00:20:26 szarotka kernel: 00000000: ff1358b6 c391d6d0 49957b3a 00856=
4c0  .X......:{.I.d..
Sep 06 00:20:26 szarotka kernel: 00000000: 4cf9826f 3f686a2f c9c11fe9 c3b1d=
533  o..L/jh?....3...
Sep 06 00:20:26 szarotka kernel: 00000000: 4cf9826f 3f686a2f 4cf9826f 3f686=
a2f  o..L/jh?o..L/jh?
Sep 06 00:20:26 szarotka kernel: 00000000: fe798ca5 d32a3f23 b8127dd9 ffb66=
894  ..y.#?*..}...h..
Sep 06 00:20:26 szarotka kernel: 00000000: fe798ca5 d32a3f23 fe798ca5 d32a3=
f23  ..y.#?*...y.#?*.
Sep 06 00:20:26 szarotka kernel: 00000000: 7cec00e0 77ee914f b3050f1b 32d67=
0cc  ...|O..w.....p.2
Sep 06 00:20:26 szarotka kernel: 00000000: 7cec00e0 77ee914f 7cec00e0 77ee9=
14f  ...|O..w...|O..w
Sep 06 00:20:26 szarotka kernel: 00000000: c0f7e517 1258adff 30e0f72f 4d21f=
d6e  ......X./..0n.!M
Sep 06 00:20:26 szarotka kernel: 00000000: c0f7e517 1258adff c0f7e517 1258a=
dff  ......X.......X.
Sep 06 00:20:26 szarotka kernel: 00000000: 422071be 6a18662f c46ff63e 30ef2=
898  .q B/f.j>.o..(.0
Sep 06 00:20:26 szarotka kernel: 00000000: dd0cd840 26116ecc 422071be 6a186=
62f  @....n.&.q B/f.j
Sep 06 00:20:26 szarotka kernel: 00000000: c59c982d 50e58cbc 0d2894f8 f27d6=
74e  -......P..(.Ng}.
Sep 06 00:20:26 szarotka kernel: 00000000: e539faa1 dfc2f79a c59c982d 50e58=
cbc  ..9.....-......P
Sep 06 00:20:26 szarotka kernel: 00000000: 23e1a2de 85f9c628 b642affc 7640a=
2d8  ...#(.....B...@v
Sep 06 00:20:26 szarotka kernel: 00000000: 23e1a2de 85f9c628 23e1a2de 85f9c=
628  ...#(......#(...
Sep 06 00:20:26 szarotka kernel: 00000000: 99b2703e cef24fee 4fcda237 e551a=
b16  >p...O..7..O..Q.
Sep 06 00:20:26 szarotka kernel: 00000000: 99b2703e cef24fee 99b2703e cef24=
fee  >p...O..>p...O..
Sep 06 00:20:26 szarotka kernel: 00000000: e6169d38 f36addf5 1660ca4d 668dd=
dba  8.....j.M.`....f
Sep 06 00:20:26 szarotka kernel: 00000000: e6169d38 f36addf5 e6169d38 f36ad=
df5  8.....j.8.....j.
Sep 06 00:20:26 szarotka kernel: 00000000: ff356521 0a541c15 fec4f4be c200f=
2d9  !e5...T.........
Sep 06 00:20:26 szarotka kernel: 00000000: 40ead611 8124e6b5 ff356521 0a541=
c15  ...@..$.!e5...T.
Sep 06 00:20:26 szarotka kernel: 00000000: ddf04e36 ce94fbd4 75699685 8e617=
260  6N........iu`ra.
Sep 06 00:20:26 szarotka kernel: 00000000: 7a354a6e 271db01f ddf04e36 ce94f=
bd4  nJ5z...'6N......
Sep 06 00:20:26 szarotka kernel: 00000000: 6037ba70 2dd820dd d205219e 601fb=
ff9  p.7`. .-.!.....`
Sep 06 00:20:26 szarotka kernel: 00000000: 6037ba70 2dd820dd 6037ba70 2dd82=
0dd  p.7`. .-p.7`. .-
Sep 06 00:20:26 szarotka kernel: 00000000: f21b0dec b6194175 1680b92c e805b=
b5e  ....uA..,...^...
Sep 06 00:20:26 szarotka kernel: 00000000: f21b0dec b6194175 f21b0dec b6194=
175  ....uA......uA..
Sep 06 00:20:26 szarotka kernel: 00000000: 01252740 beec7b62 d7c8b3f2 2d311=
ea4  @'%.b{........1-
Sep 06 00:20:26 szarotka kernel: 00000000: a44f7b08 b275ee90 01252740 beec7=
b62  .{O...u.@'%.b{..
Sep 06 00:20:26 szarotka kernel: 00000000: b2f79257 fe5bc1c7 ddec35fb 5e901=
738  W.....[..5..8..^
Sep 06 00:20:26 szarotka kernel: 00000000: b2f79257 fe5bc1c7 b2f79257 fe5bc=
1c7  W.....[.W.....[.
Sep 06 00:20:26 szarotka kernel: 00000000: f92fd43f f9d214fa 254029cb 7ea9e=
0b8  ?./......)@%...~
Sep 06 00:20:26 szarotka kernel: 00000000: f92fd43f f9d214fa f92fd43f f9d21=
4fa  ?./.....?./.....
Sep 06 00:20:26 szarotka kernel: 00000000: 2e3e73a9 c62a5235 2278da7f 56d5d=
084  .s>.5R*...x"...V
Sep 06 00:20:26 szarotka kernel: 00000000: 2e3e73a9 c62a5235 2e3e73a9 c62a5=
235  .s>.5R*..s>.5R*.
Sep 06 00:20:26 szarotka kernel: 00000000: 8147e633 ee13aa79 f38c01b5 b78c1=
6fd  3.G.y...........
Sep 06 00:20:26 szarotka kernel: 00000000: 788359db 1e71a33f 8147e633 ee13a=
a79  .Y.x?.q.3.G.y...
Sep 06 00:20:26 szarotka kernel: 00000000: 97fdbf6a 6159ae13 4393e5a0 62d37=
5f3  j.....Ya...C.u.b
Sep 06 00:20:26 szarotka kernel: 00000000: 97fdbf6a 6159ae13 97fdbf6a 6159a=
e13  j.....Yaj.....Ya
Sep 06 00:20:26 szarotka kernel: 00000000: 4ae3bc0b ce68dfcd eeb07f5d f7f36=
614  ...J..h.]....f..
Sep 06 00:20:26 szarotka kernel: 00000000: 4ae3bc0b ce68dfcd 4ae3bc0b ce68d=
fcd  ...J..h....J..h.
Sep 06 00:20:26 szarotka kernel: 00000000: 087b3583 df08368f 67a0d20d 87fb8=
56b  .5{..6.....gk...
Sep 06 00:20:26 szarotka kernel: 00000000: 087b3583 df08368f 087b3583 df083=
68f  .5{..6...5{..6..
Sep 06 00:20:26 szarotka kernel: 00000000: 3dec6257 6d434af5 995d46f0 3259d=
3bd  Wb.=3D.JCm.F]...Y2
Sep 06 00:20:26 szarotka kernel: 00000000: 7abbabe5 cdf2578e 3dec6257 6d434=
af5  ...z.W..Wb.=3D.JCm
Sep 06 00:20:26 szarotka kernel: 00000000: f018cad9 f0d72f90 2a5ca0b2 d7512=
078  ...../....\*x Q.
Sep 06 00:20:26 szarotka kernel: 00000000: f018cad9 f0d72f90 f018cad9 f0d72=
f90  ...../......./..
Sep 06 00:20:26 szarotka kernel: 00000000: 41f1f2aa fedb0c6d d5173b1d 0b370=
c29  ...Am....;..).7.
Sep 06 00:20:26 szarotka kernel: 00000000: 41f1f2aa fedb0c6d 41f1f2aa fedb0=
c6d  ...Am......Am...
Sep 06 00:20:26 szarotka kernel: 00000000: c0e845be 888e3140 91379572 4465f=
81f  .E..@1..r.7...eD
Sep 06 00:20:26 szarotka kernel: 00000000: c0e845be 888e3140 c0e845be 888e3=
140  .E..@1...E..@1..
Sep 06 00:20:26 szarotka kernel: 00000000: 06770f37 04fae0fc 97720d63 b7c62=
500  7.w.....c.r..%..
Sep 06 00:20:26 szarotka kernel: 00000000: 06770f37 04fae0fc 06770f37 04fae=
0fc  7.w.....7.w.....
Sep 06 00:20:26 szarotka kernel: 00000000: 83dde066 6412e6e0 0bfd800e 96728=
35b  f......d....[.r.
Sep 06 00:20:26 szarotka kernel: 00000000: 5a4cbd8a 386a97d8 83dde066 6412e=
6e0  ..LZ..j8f......d
Sep 06 00:20:26 szarotka kernel: 00000000: ec4e7e06 7bd2100f 55a86010 87dc2=
541  .~N....{.`.UA%..
Sep 06 00:20:26 szarotka kernel: 00000000: ec4e7e06 7bd2100f ec4e7e06 7bd21=
00f  .~N....{.~N....{
Sep 06 00:20:26 szarotka kernel: 00000000: 6ea4bc6f 18aefc38 99fdefa0 c975c=
012  o..n8.........u.
Sep 06 00:20:26 szarotka kernel: 00000000: 36b17f37 e20e3bba 6ea4bc6f 18aef=
c38  7..6.;..o..n8...
Sep 06 00:20:26 szarotka kernel: 00000000: 3a5c41fe 92323dcc 4b28780b b4f86=
fd1  .A\:.=3D2..x(K.o..
Sep 06 00:20:26 szarotka kernel: 00000000: 3a5c41fe 92323dcc 3a5c41fe 92323=
dcc  .A\:.=3D2..A\:.=3D2.
Sep 06 00:20:26 szarotka kernel: 00000000: 1a33f90b 6c1ecbf9 03d20089 e6fdb=
0b2  ..3....l........
Sep 06 00:20:26 szarotka kernel: 00000000: 1a33f90b 6c1ecbf9 1a33f90b 6c1ec=
bf9  ..3....l..3....l
Sep 06 00:20:26 szarotka kernel: 00000000: 7111ded7 7cdad34b 9c503c1e 62f6a=
2d6  ...qK..|.<P....b
Sep 06 00:20:26 szarotka kernel: 00000000: 913392c4 f0a1796f 7111ded7 7cdad=
34b  ..3.oy.....qK..|
Sep 06 00:20:26 szarotka kernel: 00000000: 8878a7b3 bf8c5702 910a3ba7 a9de3=
6d9  ..x..W...;...6..
Sep 06 00:20:26 szarotka kernel: 00000000: 8878a7b3 bf8c5702 8878a7b3 bf8c5=
702  ..x..W....x..W..
Sep 06 00:20:26 szarotka kernel: 00000000: 71c55be5 068d7101 d3bf6f4b 14f3c=
1eb  .[.q.q..Ko......
Sep 06 00:20:26 szarotka kernel: 00000000: 71c55be5 068d7101 71c55be5 068d7=
101  .[.q.q...[.q.q..
Sep 06 00:20:26 szarotka kernel: 00000000: 07a85cad 99e3f345 ad55b1de 87855=
ce0  .\..E.....U..\..
Sep 06 00:20:26 szarotka kernel: 00000000: 757fcc3d 63756931 07a85cad 99e3f=
345  =3D..u1iuc.\..E...
Sep 06 00:20:26 szarotka kernel: 00000000: 3428bbe1 95fcff4f 44542a49 89b1a=
eca  ..(4O...I*TD....
Sep 06 00:20:26 szarotka kernel: 00000000: 3428bbe1 95fcff4f 3428bbe1 95fcf=
f4f  ..(4O.....(4O...
Sep 06 00:20:26 szarotka kernel: 00000000: 34168aa0 6b3a4ace 3765801c e6709=
d03  ...4.J:k..e7..p.
Sep 06 00:20:26 szarotka kernel: 00000000: 34168aa0 6b3a4ace 34168aa0 6b3a4=
ace  ...4.J:k...4.J:k
Sep 06 00:20:26 szarotka kernel: 00000000: 2d686ce0 c0dce16e 7a850bba 75916=
44a  .lh-n......zJd.u
Sep 06 00:20:26 szarotka kernel: 00000000: 5a08b4c5 024edb1c 2d686ce0 c0dce=
16e  ...Z..N..lh-n...
Sep 06 00:20:26 szarotka kernel: 00000000: 51bfda62 67583438 ab0bd81d 8a3fe=
39e  b..Q84Xg......?.
Sep 06 00:20:26 szarotka kernel: 00000000: 51bfda62 67583438 51bfda62 67583=
438  b..Q84Xgb..Q84Xg
Sep 06 00:20:26 szarotka kernel: 00000000: 97a580da 8b7bb7c2 a185cf01 a73ac=
19e  ......{.......:.
Sep 06 00:20:26 szarotka kernel: 00000000: 97a580da 8b7bb7c2 97a580da 8b7bb=
7c2  ......{.......{.
Sep 06 00:20:26 szarotka kernel: 00000000: 57eae978 436b7ac1 3355aa83 13ade=
559  x..W.zkC..U3Y...
Sep 06 00:20:26 szarotka kernel: 00000000: da9d6c78 d91e9c92 57eae978 436b7=
ac1  xl......x..W.zkC
Sep 06 00:20:45 szarotka kernel: 00000000: f4d18900 e5d5370f ebe6d22a ee30c=
4c6  .....7..*.....0.
Sep 06 00:20:45 szarotka kernel: 00000000: f4d18900 e5d5370f f4d18900 e5d53=
70f  .....7.......7..
Sep 06 00:20:45 szarotka kernel: cifs_verify_signature: 270 callbacks suppr=
essed
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:45 szarotka kernel: 00000000: bdc0ac4b 06a008c5 d7f72ab1 584b3=
530  K........*..05KX
Sep 06 00:20:45 szarotka kernel: 00000000: bdc0ac4b 06a008c5 bdc0ac4b 06a00=
8c5  K.......K.......
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:45 szarotka kernel: 00000000: 12fe65b5 525a4e74 3e136111 ceb3a=
ffe  .e..tNZR.a.>....
Sep 06 00:20:45 szarotka kernel: 00000000: 12fe65b5 525a4e74 12fe65b5 525a4=
e74  .e..tNZR.e..tNZR
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:45 szarotka kernel: 00000000: d1e81304 d1ee6f0e 784725b6 4b0b1=
ce7  .....o...%Gx...K
Sep 06 00:20:45 szarotka kernel: 00000000: d1e81304 d1ee6f0e d1e81304 d1ee6=
f0e  .....o.......o..
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x2f
Sep 06 00:20:45 szarotka kernel: 00000000: d37a59f0 1d86d48c 70dd20b2 f194f=
b04  .Yz...... .p....
Sep 06 00:20:45 szarotka kernel: 00000000: d37a59f0 1d86d48c d37a59f0 1d86d=
48c  .Yz......Yz.....
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x4
Sep 06 00:20:45 szarotka kernel: 00000000: fe3a4740 4f4153e5 cc850219 23d7b=
85b  @G:..SAO....[..#
Sep 06 00:20:45 szarotka kernel: 00000000: fe3a4740 4f4153e5 fe3a4740 4f415=
3e5  @G:..SAO@G:..SAO
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:45 szarotka kernel: 00000000: fb75c4ec 2da51f9d 9c50b5ba e9e90=
e08  ..u....-..P.....
Sep 06 00:20:45 szarotka kernel: 00000000: fb75c4ec 2da51f9d fb75c4ec 2da51=
f9d  ..u....-..u....-
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:45 szarotka kernel: 00000000: 168431a8 5e8bc42f c2ce7d32 dd137=
1f5  .1../..^2}...q..
Sep 06 00:20:45 szarotka kernel: 00000000: 168431a8 5e8bc42f 168431a8 5e8bc=
42f  .1../..^.1../..^
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:45 szarotka kernel: 00000000: 31e5455a 42635b6f 1f57d83d d9d2d=
0b2  ZE.1o[cB=3D.W.....
Sep 06 00:20:45 szarotka kernel: 00000000: 46282582 9ea696bc 31e5455a 42635=
b6f  .%(F....ZE.1o[cB
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x2e
Sep 06 00:20:45 szarotka kernel: cifs_readv_callback: 71 callbacks suppress=
ed
Sep 06 00:20:45 szarotka kernel: CIFS VFS: SMB signature verification retur=
ned error =3D -13
Sep 06 00:20:45 szarotka kernel: 00000000: 00f19851 3eb5b163 dd3c300f c1d2a=
ef4  Q...c..>.0<.....
Sep 06 00:20:45 szarotka kernel: 00000000: 00f19851 3eb5b163 00f19851 3eb5b=
163  Q...c..>Q...c..>
Sep 06 00:20:45 szarotka kernel: CIFS VFS: command 0x4
Sep 06 00:20:45 szarotka kernel: 00000000: af1dbfef 35933cfb bed4e982 47098=
912  .....<.5.......G
Sep 06 00:20:45 szarotka kernel: 00000000: af1dbfef 35933cfb af1dbfef 35933=
cfb  .....<.5.....<.5
Sep 06 00:20:45 szarotka kernel: 00000000: 0fa94420 6db60cdc df3a24c2 c4f01=
9f4   D.....m.$:.....
Sep 06 00:20:45 szarotka kernel: 00000000: 0fa94420 6db60cdc 0fa94420 6db60=
cdc   D.....m D.....m
Sep 06 00:20:45 szarotka kernel: 00000000: 817edd25 e35d5051 46d27a02 55f6c=
8ee  %.~.QP]..z.F...U
Sep 06 00:20:45 szarotka kernel: 00000000: 817edd25 e35d5051 817edd25 e35d5=
051  %.~.QP].%.~.QP].
Sep 06 00:20:45 szarotka kernel: 00000000: b9b8e68f 74716737 da929fee 81b01=
803  ....7gqt........
Sep 06 00:20:45 szarotka kernel: 00000000: b9b8e68f 74716737 b9b8e68f 74716=
737  ....7gqt....7gqt
Sep 06 00:20:45 szarotka kernel: 00000000: 2e49330f 4209a7e5 dbb09cd0 862c8=
6e8  .3I....B......,.
Sep 06 00:20:45 szarotka kernel: 00000000: 2e49330f 4209a7e5 2e49330f 4209a=
7e5  .3I....B.3I....B
Sep 06 00:20:45 szarotka kernel: 00000000: e505fcb9 830e43d6 0537663d cd638=
873  .....C..=3Df7.s.c.
Sep 06 00:20:45 szarotka kernel: 00000000: e505fcb9 830e43d6 e505fcb9 830e4=
3d6  .....C.......C..
Sep 06 00:20:45 szarotka sudo[17860]: pam_unix(sudo:session): session close=
d for user root
Sep 06 00:20:45 szarotka kernel: 00000000: 5174a025 e6e9dfe6 cee32708 c1b82=
c04  %.tQ.....'...,..
Sep 06 00:20:45 szarotka kernel: 00000000: 5174a025 e6e9dfe6 5174a025 e6e9d=
fe6  %.tQ....%.tQ....
Sep 06 00:20:52 szarotka sudo[17871]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D=
/home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/umount /tmp/owo
Sep 06 00:20:52 szarotka sudo[17871]: pam_unix(sudo:session): session opene=
d for user root by nabijaczleweli(uid=3D0)
Sep 06 00:20:52 szarotka kernel: 00000000: 56532572 7ad7c3d5 fccdebb3 27e5d=
c77  r%SV...z....w..'
Sep 06 00:20:52 szarotka kernel: 00000000: 56532572 7ad7c3d5 56532572 7ad7c=
3d5  r%SV...zr%SV...z
Sep 06 00:20:52 szarotka kernel: cifs_verify_signature: 7 callbacks suppres=
sed
Sep 06 00:20:52 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:52 szarotka kernel: 00000000: e49590c6 c09102e5 131481a9 0bef0=
f04  ................
Sep 06 00:20:52 szarotka kernel: 00000000: e49590c6 c09102e5 e49590c6 c0910=
2e5  ................
Sep 06 00:20:52 szarotka kernel: CIFS VFS: command 0x32
Sep 06 00:20:52 szarotka systemd[681]: tmp-owo.mount: Succeeded.
Sep 06 00:20:52 szarotka kernel: 00000000: 828c142c 212d96af a9a6cfd0 814c6=
c6e  ,.....-!....nlL.
Sep 06 00:20:52 szarotka kernel: 00000000: 828c142c 212d96af 828c142c 212d9=
6af  ,.....-!,.....-!
Sep 06 00:20:52 szarotka kernel: CIFS VFS: command 0x71
Sep 06 00:20:52 szarotka kernel: 00000000: 76f1d244 f98980b9 7f3cc488 e89a5=
24b  D..v......<.KR..
Sep 06 00:20:52 szarotka kernel: 00000000: 76f1d244 f98980b9 76f1d244 f9898=
0b9  D..v....D..v....
Sep 06 00:20:52 szarotka kernel: CIFS VFS: command 0x74
Sep 06 00:20:52 szarotka systemd[1]: tmp-owo.mount: Succeeded.
Sep 06 00:20:52 szarotka sudo[17871]: pam_unix(sudo:session): session close=
d for user root
Sep 06 00:20:57 szarotka sudo[17874]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D=
/home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl -e
Sep 06 00:20:57 szarotka sudo[17874]: pam_unix(sudo:session): session opene=
d for user root by nabijaczleweli(uid=3D0)
Sep 06 00:21:16 szarotka sudo[17874]: pam_unix(sudo:session): session close=
d for user root
Sep 06 00:21:19 szarotka sudo[17877]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D=
/home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl
Sep 06 00:21:19 szarotka sudo[17877]: pam_unix(sudo:session): session opene=
d for user root by nabijaczleweli(uid=3D0)
Sep 06 00:21:24 szarotka sudo[17877]: pam_unix(sudo:session): session close=
d for user root
Sep 06 00:21:26 szarotka sudo[17880]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D=
/home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl -b
Sep 06 00:21:26 szarotka sudo[17880]: pam_unix(sudo:session): session opene=
d for user root by nabijaczleweli(uid=3D0)
Sep 06 00:21:55 szarotka sudo[17880]: pam_unix(sudo:session): session close=
d for user root
Sep 06 00:22:03 szarotka sudo[17885]: nabijaczleweli : TTY=3Dpts/0 ; PWD=3D=
/home/nabijaczleweli ; USER=3Droot ; COMMAND=3D/usr/bin/journalctl --since =
00:08:56
Sep 06 00:22:03 szarotka sudo[17885]: pam_unix(sudo:session): session opene=
d for user root by nabijaczleweli(uid=3D0)

--xta6vuywnarozrzx--

--febfgth2coeele2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAl9UNRAACgkQvP0LAY0m
WPEZqw/3bJjpeq4CNCGAKkxLA/EWDpDRkasjN+XDB5Q+u6GTILGV4cHjs46xGFZO
/86RD6TR7AkgKNs3EqglUIpb/f/qmqw8kUdk9nYCWoKWIYsTtAjDJu8ACtgkt7An
0qzpnIeM5yFvmr3LciRmSEKzZjuJsMM7zAosmc8k/YzCOyzHNurxkF3crRqccCFd
Qce95YKHYuRWXG7ayn6NRzFZCc86Yw7c1SEjQ25N5NMiBWd1FHHkAW64jwH+MwmA
1b0c72KjChN4/iVGQEpbQpKtmTp0Ncv0el9NChCTUKOd3OtyEayx+p3ZeYUDulMV
k6VMAR5thtVbi0bTMAnDNdkaMFjh1961cTm7diQLm9p+VMNy94d4PBaIrxDSgyM+
vzrTpbsjWF0ySZqcI1TqVZIb2y+HRbYSX17tuY7DVdgjvJTFdvqooQFbZMm7N6Lf
PtNSnZvFRHuYEResgParNbWnPLiGqK0ynWN3Q0tJp1RL0jfOXaP3Pe12xDylEtdR
wf/YolSjWySovKhx7uAz8qHGIq/NK0Y5srI3oeJ47+LbCazNVFKnNv+6uR35tc1j
NTiB+mDHzZmkEQYVTD/yKvXh3vJPrZhxhErsJm+MQVUjnpDoD6CXkAmDfSK6pFzX
wR1JZ/pNNSnv6PfYS73kTPiMBdT/nmAwOJdZEgPf3tmdrqKtmg==
=9pGc
-----END PGP SIGNATURE-----

--febfgth2coeele2j--


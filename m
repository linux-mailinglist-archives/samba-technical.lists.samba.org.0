Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EE5A19ECE
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2025 08:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/rbQpm9Jy7IybTEigTwL39Sgkr2FI7rHzAu1DibH0+E=; b=EghjfJP60umZBH+3pQ9WiSEGeJ
	/JIxu9YOUROsZuP7QEXTWhG052mPmOs2Pp/gpfyCYQwNgkl/cWPJPqdWPrX7rEKmqxhKp4Q7w07lj
	rGQnddqAr1Khympok3g90OD6iQwlTFeOJ35eveUfzWufd2RcfIoq8y2+RAhT9jkw2B1HT4Tisa1Yx
	ZMAh3zKLxi1zMt/vM/YBY+5cx7K1rjCqI4XB4TqhOAhuH2GVOXLkc/jUZd1+Z8JN8d5uK64Ar3W2K
	k/8Rl2ciyTJMEwlSQACqbwG3UwZpUZUr0mik9Q0eHwzxfP67JH/lFr71qmI8IAKXDUUhemMSkA4QX
	PPhIm6fQ==;
Received: from ip6-localhost ([::1]:60918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tarXm-009I5h-Kd; Thu, 23 Jan 2025 07:22:26 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:56376) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tarXe-009I5a-OG
 for samba-technical@lists.samba.org; Thu, 23 Jan 2025 07:22:22 +0000
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso1077325a12.0
 for <samba-technical@lists.samba.org>; Wed, 22 Jan 2025 23:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737616937; x=1738221737; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q/Q5RIUDZKHOtknpAzqSm6+6LnWcY5XN7V1yv8OAUbk=;
 b=NQ6RZJ7NgQMTVbk6Mnb6BolWcMxJa/MX+pNZvGI1uBFtkwIOsp5Be0MQpSzPOR/gQ7
 +PAtto1kN1hzHUFkW+O1KTUf1lPE+04hgm6L07V8wllEVdwBpLyN134ZLl075IF+ggMV
 lcBHuA2egMJ50cmJdoUwUvmGFhHiVpBrjqCKDgFbhsKC5Y8j5Bncq3CerPlWPDaWq4SB
 0HmckwZJkx/oW3zljtdAAsjwGlswxSHERzhmTFf94WVKhP6Jzo/IAV9kPFQfwj35qYtW
 Ow9eKgu78c7eVUMLvf+o/HZonkhK2JvknWD7wtKbCs4+8ZMQErZQGQ0BxAgrpZaFIsps
 aPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737616937; x=1738221737;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q/Q5RIUDZKHOtknpAzqSm6+6LnWcY5XN7V1yv8OAUbk=;
 b=o9XcjiAY8JVGQM0p0waPoCFr9OKimDr6ncw+Sa1rwodWFQ5+kQlt1OeHK4jIuAQCUS
 7Vu1c1fRcJFyAhOga7XAwoc97PKvxwRpQrq+WezJDM1bgbB/sRu41lr9fI5iWMhdZork
 6fU/LVeLNNA1nBxQao8pLrgBrqYkadre8oAAsFmzHfz339ce33kI4crGorAB6LWyeE14
 SgxynWRQ9TQAH53UsbbJTQS+b+XVfaLwLbFxqJCDFT5ZA3wErAZjWX7qr9PMf9KofrJA
 XAqrImLdtNfgQurMa/IOG7/ARbgdLg3qEgwV6Xsvf1NLx0omytZzcsCerntOxArvqwhA
 G6UA==
X-Gm-Message-State: AOJu0Yx7pijsMI5mdvUlO3fEkQwEl0Z/+6e93PAN9OUCxVi81v+YnG63
 3SY0pEoG1jjAabsIlHjIBvQwpf5ka6d/sXDV3ZrxHZrfojDFcqiHjGGRDdV5n9eK+aRV3k8pYIP
 8lidvC+15+ZwiEy1X5YOclcDAFQ6oawXL
X-Gm-Gg: ASbGncuqBKCi4+EpKnNBE3KzzexNc3Ff75dUHu+xspTippADZmLFS36IocIRaxmFqq7
 h3BrUn1uD/4wX4XBY230XiLgRPxTkAF5ws5awcYP+P9O7dZTsu5/ER3bmy26VuiSnxosXMRXJB3
 faBoyackh9uPiGhctB4UI=
X-Google-Smtp-Source: AGHT+IEDuqddNDThoc5gSqUIoNxtmd7Y9s0+SgCpWv93uSJ51tcgmrFwp76CT/7effiCAYNMqZY876xZybOPcXxJmwA=
X-Received: by 2002:a05:6402:2554:b0:5d9:f8d3:6e6b with SMTP id
 4fb4d7f45d1cf-5db7d3550e0mr21529402a12.22.1737616936569; Wed, 22 Jan 2025
 23:22:16 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 22 Jan 2025 23:22:05 -0800
X-Gm-Features: AbW1kvbupxdTT02d-EmPfRwGqEx-tBtFW_Kgph9-ok_pWYdQ8ekAo4t5IBsbQY4
Message-ID: <CAOGdD2rEGmhH4rJRsgQbgU7Wu=kg3_poTLUUr7MMjuJkAHM8eg@mail.gmail.com>
Subject: PANIC Bad talloc magic value - unknown value during disconnect.
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Yogesh Kulkarni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Yogesh Kulkarni <yoknfs@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi, I am looking for help in getting RCA on this issue.

A Panic with bad talloc magic value is seen during disconnect.

Samba version : 4.13.13 ( Debian 11 - 4.13.13+dfsg-1~deb11u5 )

Environment :

Samba is deployed on a debian VM and is being mounted on a terminal server
( MSFT remote desktop ).

smbstatus output has confirmed that the same smb connection is serving
multiple tcon=E2=80=99s.

There are about 10 users connected to the system from the terminal server.

Modules - Propriety module, fruit, catia, streams_xattr, however the same
dumps are seen for IPC$.

Stack trace from log.smbd ( truncated for ease of reading )

[2025/01/14 21:04:00.354782,  4, pid=3D3759694, effective(35049, 0),
real(35049, 0), class=3Dvfs] ../../source3/smbd/vfs.c:939(vfs_ChDir)

  vfs_ChDir to /tmp

[2025/01/14 21:04:00.354840,  5, pid=3D3759694, effective(35049, 0),
real(35049, 0), class=3Dvfs] ../../source3/smbd/vfs.c:1001(vfs_ChDir)

  vfs_ChDir: vfs_ChDir got /tmp

[2025/01/14 21:04:00.354873,  2]
../../source3/smbd/close.c:824(close_normal_file)

  USER closed file /tmp (numopen=3D-1) NT_STATUS_INVALID_HANDLE
  <=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94 why is close_normal_file being called on a dire=
ctory ?

[2025/01/14 21:04:00.354884,  3]
../../source3/smbd/service.c:1123(close_cnum)

  dl-rds-02 (ipv4:172.29.6.13:49523) closed connection to service IPC$

[2025/01/14 21:04:00.354893,  4, pid=3D3759694, effective(0, 0), real(0, 0)=
,
class=3Dvfs] ../../source3/smbd/vfs.c:939(vfs_ChDir)

  vfs_ChDir to /

[2025/01/14 21:04:00.354913,  0]
../../source3/lib/popt_common.c:68(popt_s3_talloc_log_fn)

  Bad talloc magic value - unknown value

[2025/01/14 21:04:00.354942,  0] ../../lib/util/fault.c:159(smb_panic_log)

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[2025/01/14 21:04:00.354951,  0] ../../lib/util/fault.c:160(smb_panic_log)

  INTERNAL ERROR: Bad talloc magic value - unknown value in pid 3759694
(4.13.13-Debian)

[2025/01/14 21:04:00.354966,  0] ../../lib/util/fault.c:164(smb_panic_log)

  If you are running a recent Samba version, and if you think this problem
is not yet fixed in the latest versions, please consider reporting this
bug, see https://wiki.samba.org/index.php/Bug_Reporting

[2025/01/14 21:04:00.354976,  0] ../../lib/util/fault.c:169(smb_panic_log)

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[2025/01/14 21:04:00.354983,  0] ../../lib/util/fault.c:170(smb_panic_log)

  PANIC (pid 3759694): Bad talloc magic value - unknown value in
4.13.13-Debian

[2025/01/14 21:04:00.355314,  0] ../../lib/util/fault.c:274(log_stack_trace=
)

  BACKTRACE: 26 stack frames:

   #0 /lib/x86_64-linux-gnu/libsamba-util.so.0(log_stack_trace+0x30)
[0x7efe9419f220]

   #1 /lib/x86_64-linux-gnu/libsamba-util.so.0(smb_panic+0x26)
[0x7efe9419f486]

   #2 /lib/x86_64-linux-gnu/libtalloc.so.2(+0x6ae7) [0x7efe93ac5ae7]

   #3 /lib/x86_64-linux-gnu/libtalloc.so.2(_talloc_move+0x13)
[0x7efe93ac5d43]

   #4 /usr/lib/x86_64-linux-gnu/samba/libsmbd-base.so.0(vfs_ChDir+0xe7)
[0x7efe940048c7]

   #5 /usr/lib/x86_64-linux-gnu/samba/libsmbd-base.so.0(close_cnum+0x96)
[0x7efe9401c3b6]

   #6
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base.so.0(smbXsrv_tcon_disconnect+0=
x4b)
[0x7efe9404ae1b]

   #7 /usr/lib/x86_64-linux-gnu/samba/libsmbd-base.so.0(+0x1eb111)
[0x7efe94031111]



By reading the code, I am able to conclude  -

   -

   Server receives a disconnect
   -

   The process chdir=E2=80=99s to the shares root dir ( for IPC it is /tmp =
)
   -

   Iterate over the open files to check all the files open for this
   connection file_close_conn()
   -

   Close the open files/directories for this connection, but skip conn->cwd
   ( But during the close, logs show the message which comes from
   close_normal_file()

USER closed file /tmp (numopen=3D-1) NT_STATUS_INVALID_HANDLE
Close of a directory coming from close_normal_file() seems to be an issue.

   -

   Once all the files/directories are closed, change dir to /
   -

   PANIC always observed at this point, in the following line of code -
   conn->cwd_fsp->fsp_name =3D talloc_move(conn->cwd_fsp, &cwd);
   the error comes from talloc_chunk_from_ptr() when the magic is not
   correct.


From the dump, I see that the line where the

 0x00007efe940048c7 in vfs_ChDir (conn=3Dconn@entry=3D0x563eed964ce0,
smb_fname=3Dsmb_fname@entry=3D0x7ffcc176e130)

    at ../../source3/smbd/vfs.c:998

I have calculated the magic value as TALLOC_MAGIC =3D 0xea17ed70 and SIZEOF
talloc_chunk =3D 88

I am trying to figure out the talloc chunk magic from the header, using 96
since the header is rounded off to the nearest multiple of 16.

(gdb) x /12gx ((char *)cwd - 96)

0x563eed819050: 0x00000000e0c1a8f4 0x0000563eed95d5a0

0x563eed819060: 0x0000000000000000 0x0000563eed964c80

0x563eed819070: 0x0000563eed819180 0x0000000000000000

0x563eed819080: 0x0000000000000000 0x00007efe9407080e

0x563eed819090: 0x00000000000000c8 0x0000000000000000

0x563eed8190a0: 0x0000000000000000 0x0000000000000000

(gdb) x /12gx ((char *)conn->cwd_fsp - 96)

0x563eed952f70: 0x0000563eed90e6b0 0x0000563eed7e9010

0x563eed952f80: 0x0000000000000000 0x0000000000000000

0x563eed952f90: 0x0000000000000000 0x0000000000000000

0x563eed952fa0: 0x0000000000000000 0x00007efe940df340

0x563eed952fb0: 0x00000000000001a0 0x0000000000000000

0x563eed952fc0: 0x0000000000000000 0x0000000000000000

No magic seen here ?? I might be missing something ?

(gdb) p *conn->cwd_fsp

shows everything zeroed out.

I looked at the code, but I am not able to point anything specific in the
code that causes this issue.

Based on the error line about the directory being closed in
close_normal_file() might be an issue. But I am not able to reproduce this.

The PANIC happens both for the shares exposed by our product as well as
IPC$.

Note that this does not happen on 4.9.5 ( Debian 10 distribution.) However,
there are code changes to the chdir itself that I have not looked into.
There are changes to the vfs_ChDir() code with hash 75f98a19537c


Thanks and regards,

Yogesh.

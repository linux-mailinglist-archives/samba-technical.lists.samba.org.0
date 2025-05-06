Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03CAACB67
	for <lists+samba-technical@lfdr.de>; Tue,  6 May 2025 18:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=26T7Ps2oG+4o/JMcYs6XXiWsCJvzRUosKFIgjVkzkMs=; b=y8sdl28s442h3ixYsXiWTG13J8
	5fb5XEvPbfx9WjKkJkE7ACNrTKGvmqz7NisJPpKU6x+/Hq851+q59rItpib4FoiJGiJBWHuZeYhlg
	QAYjtY1QEiz1JpV1JeJYpA1yMlkv5KAP2NCZmdmsNRZahAfn0KGYKJ4s5v/gW1fMAM4/uMOKi6i4K
	BaCDC60KIvdlFuWTyR2wzfaH6jF6Y7MgfrpUr/7cLW3Ne78bgO+NkSW+5lVftGLayoGaZGcjy8fNI
	MdsW6Y0hYHuS9+e2qelVD3tvrlLA7D+TCAJLBjjL7ioeuec9MJFnwTxMW/EZx5M0U0og0nzg8FEqi
	G901AguA==;
Received: from ip6-localhost ([::1]:52448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uCLSB-003C49-Bg; Tue, 06 May 2025 16:47:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56944) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uCLS7-003C42-Fo
 for samba-technical@lists.samba.org; Tue, 06 May 2025 16:47:33 +0000
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E1C8E3F128
 for <samba-technical@lists.samba.org>; Tue,  6 May 2025 16:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1746550047;
 bh=26T7Ps2oG+4o/JMcYs6XXiWsCJvzRUosKFIgjVkzkMs=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Content-Type;
 b=VdtXz3KTs8QtdwOc2D7gET/7oWstedpREI9JyySOQjj07/aq1eNNwQahrgmWqSeuK
 2s7JM4FY4YXb2j5acvIv2qjGL4pymrcgGCwYVmmS6+A9XFLbJB/MJ1+57u2YXW/84E
 cN6UeUktcxd0ppHH9ej+XICvEjxguQjdwUIiVC6Qu92Hck6rFyqxEilePz0r2oYwYo
 wGTF2Ur508SdI+BijKUGdFFmDrY6lvoF7Vwv5GWJnUmdblkBHLBZ2qzDfNRgTYa2Ci
 W3CgppDQQHYexPw26sUXf5VNz7Jdk/QptTa2UIrWv22SfJKTJXLN57CT1Ygl2TxOAn
 hHKHFqTiemvuw==
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-7071dd5df15so78319207b3.0
 for <samba-technical@lists.samba.org>; Tue, 06 May 2025 09:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746550046; x=1747154846;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=26T7Ps2oG+4o/JMcYs6XXiWsCJvzRUosKFIgjVkzkMs=;
 b=bOfYl5WWTdH8b3HwhVwCKRNtOwDJ2dP5qd/dbQm6wWd7HVtzr6H2eMdqhb8tXVV+xa
 b/OPXvV6Dyrdt2/i4QTqPV2SLObfccQs9xLXtp38msKefspQDl9lo4bczbiyQRG+Emc5
 05q02JPa3mMuF0zJEvcuGv6Xj9MTknKsqRyjFLjKja3HPxwVrzG+1NelV1meYIPyV6Gk
 h+RL82bbRmfqI+XkVxWNNYqGFMXtqJuM5Jk7/MjiB1sP9sM4yh3xqDo6hYbaturoxU36
 Fwb01sAuQpyou7w7XWko4WKcOLYkb9XoIXyS0MnUW2QC6BaDXb7YUIZ3fy6gC/EpNJuj
 ormA==
X-Gm-Message-State: AOJu0Yy/ahgSfqotBHFiKEqOolNgAzQXmfp1ju+046XbYaOC8gphntge
 qR3Ehmq67kcdL4ApsTteooNR0Z8M224gfblX56XVXzHUwGHuF2xlyjn+KE5tfSzdYfff4yjxg4M
 kmCUzq8gRlKq1XjK3CMAzC7dBCChsfzXELNfWh4/KHo8DSJoxkoC3h8Jc6OJkj4zUgbrZZ+1JIv
 /W5Hf8KMvtGUhgHUuUzVTrctyhDhVi74J4BgZ/ZFdSzkQ0xTNw47Z9u1hAdmSt71RD9lk0CA==
X-Gm-Gg: ASbGncu8ShiEAyfzFARAWu6UnRpfCPh02EbeOfPmIHRiCWzWp2+bodfRnN7fVQKII7y
 yCMrR9ct48FJZoa8cG3ws5cxP43Es0+Xzdj0KwWKeVBGtjwjdBSpzltQ0yu+re37jUXAGbg==
X-Received: by 2002:a05:690c:6ac6:b0:70a:1084:8749 with SMTP id
 00721157ae682-70a1dad2f1cmr651857b3.23.1746550046510; 
 Tue, 06 May 2025 09:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOc8sOFNRT98gZUc/anzK5mNzlKgxLPNZG6DYAEZk6QZu5pZRMNULtq8b+MmsJ7qndbo8YHL7oh9peaPf99cU=
X-Received: by 2002:a05:690c:6ac6:b0:70a:1084:8749 with SMTP id
 00721157ae682-70a1dad2f1cmr651617b3.23.1746550046243; Tue, 06 May 2025
 09:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANYNYEGAcAcp-T6BMVCaXWfw5PV-x2UJ8UbGOGx9=YpXsz1MSA@mail.gmail.com>
 <e554bf4b-52e7-4a20-b35d-84a22e056412@samba.org>
In-Reply-To: <e554bf4b-52e7-4a20-b35d-84a22e056412@samba.org>
Date: Tue, 6 May 2025 13:47:15 -0300
X-Gm-Features: ATxdqUHGIO7zkprD-Rx_pgOleaHohKFkvP_BDvRAA5jZs7bm9vqGKo-bGMGcXbE
Message-ID: <CANYNYEF0cJ1_k_FUyaG1Zb8xyqKeYyeektaEwKZAL-2EqyTzYg@mail.gmail.com>
Subject: Re: samba-tool gpo manage motd set failing with invalid handle on
 s390x
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas.hasenack@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Tue, May 6, 2025 at 11:34=E2=80=AFAM David Mulder via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On 5/5/25 4:52 PM, Andreas Hasenack via samba-technical wrote:
> > Hi,
> >
> > I just wrote some tests around the motd GPO subset of commands of
> > samba-tool, and am baffled at a failure I'm getting only on s390x (big
> > endian).
> >    File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line
> > 353, in _run
> >      return self.run(*args, **kwargs)
> >             ~~~~~~~~^^^^^^^^^^^^^^^^^
> >    File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 3850=
, in run
> >      reg.increment_gpt_ini(machine_changed=3DTrue)
> >      ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
> >    File "/usr/lib/python3/dist-packages/samba/policies.py", line 198,
> > in increment_gpt_ini
> >      self.__save_file(self.pol_dir % '', GPT_INI,
> >      ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >                       out_data.read().encode('utf-8'))
> >                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >    File "/usr/lib/python3/dist-packages/samba/policies.py", line 99, in
> > __save_file
> >      self.conn.set_acl(file_name, self.fs_sd)
> >      ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^
> >    File "/usr/lib/python3/dist-packages/samba/samba3/libsmb_samba_inter=
nal.py",
> > line 128, in set_acl
> >      self.set_sd(fnum, sd, sinfo)
> >      ~~~~~~~~~~~^^^^^^^^^^^^^^^^^
> It's only failing while setting the acls on the GPT.INI file (not the
> manifest). What do
> the acls look like on GPT.INI?

There are two GPT.INI files:

root@ad:~# getfacl
"/var/lib/samba/sysvol/example/Policies/{31B2F340-016D-11D2-945F-00C04FB984=
F9}/GPT.INI"
getfacl: Removing leading '/' from absolute path names
# file: var/lib/samba/sysvol/example/Policies/{31B2F340-016D-11D2-945F-00C0=
4FB984F9}/GPT.INI
# owner: EXAMPLE.FAKE\\domain\040admins
# group: EXAMPLE.FAKE\\domain\040admins
user::rwx
user:root:rwx
user:BUILTIN\\administrators:rwx
user:BUILTIN\\server\040operators:r-x
user:NT\040Authority\\system:rwx
user:NT\040Authority\\authenticated\040users:r-x
group::rwx
group:BUILTIN\\administrators:rwx
group:BUILTIN\\server\040operators:r-x
group:NT\040Authority\\system:rwx
group:NT\040Authority\\authenticated\040users:r-x
mask::rwx
other::---


root@ad:~# getfacl
"/var/lib/samba/sysvol/example/Policies/{6AC1786C-016F-11D2-945F-00C04FB984=
F9}/GPT.INI"
getfacl: Removing leading '/' from absolute path names
# file: var/lib/samba/sysvol/example/Policies/{6AC1786C-016F-11D2-945F-00C0=
4FB984F9}/GPT.INI
# owner: EXAMPLE.FAKE\\domain\040admins
# group: EXAMPLE.FAKE\\domain\040admins
user::rwx
user:root:rwx
user:BUILTIN\\administrators:rwx
user:BUILTIN\\server\040operators:r-x
user:NT\040Authority\\system:rwx
user:NT\040Authority\\authenticated\040users:r-x
group::rwx
group:BUILTIN\\administrators:rwx
group:BUILTIN\\server\040operators:r-x
group:NT\040Authority\\system:rwx
group:NT\040Authority\\authenticated\040users:r-x
mask::rwx
other::---

They have slightly different content:

root@ad:~# cat "/var/lib/samba/sysvol/example/Policies/{31B2F340-016D-11D2-=
945F-00C04FB984F9}/GPT.INI"
[General]
Version =3D 1

root@ad:~# cat "/var/lib/samba/sysvol/example/Policies/{6AC1786C-016F-11D2-=
945F-00C04FB984F9}/GPT.INI"
[General]
Version=3D0

(there was no \n at the end of the one above, after the zero, if that matte=
rs).


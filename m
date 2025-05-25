Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F5AC3231
	for <lists+samba-technical@lfdr.de>; Sun, 25 May 2025 04:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GYIMJK+Si/G03+W2pCu4MqQA5CeRYZm7fbge2Uj3pIM=; b=NTiwQnHUDvz91KheFlqti3E651
	PeniWXdlKZ+MOsJbgA1Lu7PswRq/tcaK6AKA6XmNof+T0lZhCfxpZ23td+z7kT3A1Ikp2zwGCyBwf
	2+nNhqZdZj1o1qjqp8wusJGD4X27ZZDCyfeQL2dAfLnuxaq/U9a2C2QoKCSUg9fiDHlTwCmgdNx1f
	YgN7X7O0QZ2XM6Y/hSwNdN3F7h+Z/zVey4XzxSbVGCrAgv6324tPTs9OKmgKhJXY+2UuhgG5f9Py/
	wEuBU7qiToz5hcfEbj0FCxB6O245E1cYa/XuAFmXbzBP3XGUUj7sI5x2StjtFsVf15I8k8xg99Klk
	W4G0KZxQ==;
Received: from ip6-localhost ([::1]:45420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJ1HM-004A6U-St; Sun, 25 May 2025 02:40:01 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:42359) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJ1HG-004A6N-NS
 for samba-technical@lists.samba.org; Sun, 25 May 2025 02:39:58 +0000
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-32807137b94so12650761fa.1
 for <samba-technical@lists.samba.org>; Sat, 24 May 2025 19:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748140792; x=1748745592; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYIMJK+Si/G03+W2pCu4MqQA5CeRYZm7fbge2Uj3pIM=;
 b=cEEOgm9tCxOhbSBcwl0k2ed18eet71NJbHdd7cnAxQDevVjPtKTficPDmE+ltEB4a2
 oRS78waCp4BrIQ/x9nZUpUWOvr9JLpQJ3YIhzmQrLpyNmVSzsuFV/yShJV8cbZwvuttf
 GOuTgfBIVp128ZFsBHa4wg27C1E1yiSdOmq7w7x7aHCySipPDtdEMG/CFwLuOnLd2DTU
 +Pdqw39vC9wIe32p7hQmP9Jf5nCtPLUf+S+JrOUF4nv4b0m3gzq+hykjRDVLosAVFaPl
 t4GWWZeq8WPKN0hnbPolrqNQc9K9ynqBI0AQaX7pVbk00llBVQKr7LEXmBuG2Qi+p6pU
 cVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748140792; x=1748745592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYIMJK+Si/G03+W2pCu4MqQA5CeRYZm7fbge2Uj3pIM=;
 b=UXPtmkDKiy0VUPHH8qY5CE1hlfec9WwEa0ME1LBYsHm2qHOnTqemVi/adjrFQrIr0i
 OBntJvt74aLFS1m531KhvrBcAz6zjAarnbIXHEDElf4Z6q7ddKw94lSvE9J+T7OW+YkW
 7kA9O6m//rYcoAsBYGrRwZr4Wk2S5QCFyq2BoCILI39i9MmX1dD0ZfJidISy6c/MubIJ
 zzTdtMCtAyw2uKKexTElFyk9BYriOx9xgD0AyKRJOuTE4dwjZXXwdfv2T9bru4g9X3Lz
 oOQ5ZWMvDFOaE3xAq5cG8ESSH+cx5SJOgJxLl1XS2Ta50utzcAk9lr/aIPqYPPclAJEm
 rwuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp+fI5MlGDbR76vSBl3fZL+f7nsq6qL7I0yIT+KdYAjTO6tAAEYUpZ3pKV9j3gVGhZCMRt+9mV+A6tu0p+ODs=@lists.samba.org
X-Gm-Message-State: AOJu0YymhZIOAjwfl2qnMDps5U9m13T969d/F31ST3Oob4I1b7XWC3V7
 sX9yHcvqCLmZo7/Dgpo8ReCh3MK8OVGaiHlB3gdNnyp5kMPvkK9YXCoEyJQ0CTGroUbK6Mp4Z5n
 RuJmkfblj5HDAV757LyVjxT/ndzLUaBI=
X-Gm-Gg: ASbGncshVEjKYF+1KuphJBPlqphYbLcenDdO/HSAiZMoHyFznViqHQN2dFjB+tJERkk
 h/SgvO3zwR7T56IaSHHie56kb0RbX52SuEfvRlJCdbE+MpCDyivoMGbVqPyDj+CCp4FaACtdYQv
 tv4tzy51nftDj/4tgmS8lf4O3P/Lb2gnHGqlu2lE+CRReFPh7HkYax+pdRPH3B3cKmqLY=
X-Google-Smtp-Source: AGHT+IGjHl8+73jUUC6J/lja7v31sS3aKuDonlKloafCuDr3G+C/NDGkRP0KmUMeYn0SahMuoGz1IgWyEAOzRL3hZrw=
X-Received: by 2002:a05:651c:19ab:b0:30b:e5bd:404a with SMTP id
 38308e7fff4ca-3294f727f79mr27441751fa.6.1748140791801; Sat, 24 May 2025
 19:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <d0df2b2556fac975c764c0c7c914c6e3c42f16a1.camel@rx2.rx-server.de>
In-Reply-To: <d0df2b2556fac975c764c0c7c914c6e3c42f16a1.camel@rx2.rx-server.de>
Date: Sat, 24 May 2025 21:39:40 -0500
X-Gm-Features: AX0GCFv-abMqUp4ClW2TvGWMmJehZ5HT-Fb4Oyy7_QDxQpKjB42FMig-snj0g5k
Message-ID: <CAH2r5mubXak1pe9N96wph5HtggFMAMpYm+5KtqYOz7e1cNGWhg@mail.gmail.com>
Subject: Re: ksmbd and special characters in file names
To: Philipp Kerling <pkerling@casix.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs@vger.kernel.org,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Interesting ... looks like ksmbd reports the files properly.  I do see
a bug with "ls -l" though

/* check the local view of the shared directory, ie on xfs */
smfrench@smfrench-ThinkPad-P52:/shares/scratch$ ls
'dir-with-&-and'  'file\backslash'     ' file with spaces'
'file*asterisk'   'file?questionmark'   testfile

/* Mount without specifying linux/posix extensions */
smfrench@smfrench-ThinkPad-P52:/shares/scratch$ ls /mnt/no-posix
'dir-with-&-and'  'file\backslash'     ' file with spaces'
'file*asterisk'   'file?questionmark'   testfile

/* Mount with linux/posix/extensions */
smfrench@smfrench-ThinkPad-P52:/shares/scratch$ ls /mnt/posix
'dir-with-&-and'  'file\backslash'     ' file with spaces'
'file*asterisk'   'file?questionmark'   testfile

/* But doing "ls -l" of either posix (or non-posix) mounts returns
errors even though files are displayed correctly */
smfrench@smfrench-ThinkPad-P52:/shares/scratch$ ls /mnt/posix -l
ls: '/mnt/cifs/file*asterisk': No such file or directory
ls: '/mnt/cifs/file\backslash': No such file or directory
ls: '/mnt/cifs/file?questionmark': No such file or directory
total 64
drwxr-xr-x 2 root root     0 May 24 21:20 'dir-with-&-and'
-rwxr-xr-x 1 root root     0 May 24 21:16 'file*asterisk'
-rwxr-xr-x 1 root root     0 May 24 21:17 'file\backslash'
-rwxr-xr-x 1 root root     0 May 24 21:18 'file?questionmark'
-rwxr-xr-x 1 root root     0 May 24 21:17 ' file with spaces'
-rwxr-xr-x 1 root root 65536 May 23 00:10  testfile

Interestingly trying this to Samba I don't have any problem creating
the files with the reserved characters on smb3.1.1 mount but Samba
server returns the incorrect filename in the Find (query dir)
response. It mangles the names (e.g. to A7V558~Y) even with posix
mounts which looks incorrect




On Sat, May 24, 2025 at 4:57=E2=80=AFPM Philipp Kerling <pkerling@casix.org=
> wrote:
>
> Hi!
>
> I've been reading a lot about the SAMBA 3.1.1 POSIX extensions and had
> (perhaps wrongly?) hoped that they would allow native support for all
> file names valid in POSIX if the server and client agree, so I could
> continue to access my files that contain colons or quotes as I did
> using nfs. I know there are remapping options for the reserved
> characters, but they are very annoying to use if you want to have
> direct access to the files on the server machine as well or want to
> serve a directory that already exists and has "problematic" file names.
>
> I have been playing with this on Linux 6.14.6 with ksmbd as server and
> Linux cifs as client. Unfortunately, I was not able to access any
> file/folder containing, for example, a double quote character ("). From
> what I can tell in the logs, this is due to ksmbd validating the name
> and failing:
>
>    May 24 22:25:15 takaishi kernel: ksmbd: converted name =3D Jazz/SOIL&"=
PIMP" SESSIONS
>    May 24 22:25:15 takaishi kernel: ksmbd: File name validation failed: 0=
x22
>
> This seems to be an explicit and intentional check for various
> characters including ?"<>|* [1]. If not for that check, I could access
> my files just fine (mounting with -o nomapposix of course). I've
> patched it out locally to test and it's working great. Even smbclient
> and gvfs are happy with it. Is this something that would make sense
> (even if only as an option), or are there other restrictions/security
> concerns in the SMB protocol that prevent having the special characters
> be treated as valid?
>
> Best regards
> Philipp
>
> [1] https://elixir.bootlin.com/linux/v6.15-rc7/source/fs/smb/server/misc.=
c#L80-L84
>


--=20
Thanks,

Steve


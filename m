Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C13172E863B
	for <lists+samba-technical@lfdr.de>; Sat,  2 Jan 2021 04:50:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5BEWF3/UOFlb9APa1uXowujximI7deRNLg7s7zD3Zhw=; b=kePNp6xKct2VNQcbRRmXcYPgaY
	TMsEuu4FZwD/m3ccbw6CfDlP4mxcQF7sI28bt2eWLdTtC8kKFDDeBbbwMJaQ1RObSdUSzMYvGFJun
	0XZjVjr1CzyqNdKYmpWwlUF2SLFHx55m42BbZCX0KwGK+jkcoIQKQjDmfP/lX6SLwo3x1Qr/y4Mf9
	I6k8k4ffFiuSoR3sZMhfZoTyzXZ6iNvgIPWxf2JL+Gbk4IVt8wAvCDqp1dLtc53ZlegQvplmSdQhy
	AUJccyRa+I326696AdCSwBpMUW7nL3Qrgl8nmWiFGEtpsPRYQWlTtJ26UjYaBHhyTBINl4RYhHcVH
	a4H3aWlw==;
Received: from ip6-localhost ([::1]:40850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvXvB-004V7H-91; Sat, 02 Jan 2021 03:49:41 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:42142) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvXv5-004V77-CY
 for samba-technical@lists.samba.org; Sat, 02 Jan 2021 03:49:38 +0000
Received: by mail-lf1-x129.google.com with SMTP id b26so51692134lff.9
 for <samba-technical@lists.samba.org>; Fri, 01 Jan 2021 19:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5BEWF3/UOFlb9APa1uXowujximI7deRNLg7s7zD3Zhw=;
 b=VBJGAHJsJIi2CH+C3lVt4WH9zwNfftjSFYI7Qb9sS455hLkFw8FUc4rKEYDeidHuE0
 o4sezLipc0XxicKG7Yiv9FPpfEwgBOPav2kDVlKdN87uzPqNl/nEBrIsYScDYXp2DG30
 bTzMFA4uUBWLsaEP/L27rnMpZXN8vs+Kj//4sfrhVMhPgb8U0Ir+WJGj4K9kYwp+hfAl
 SYweRVkn0aFWNBnFlCxPTFNIXCOTMQxudUEk2TQDWDOwytQD/uc3ruJrl5y2zYPufDy0
 aXUfdrQgYMJ8RRuHNDrcLf+NR7G7+dTSpY1RUdOOr+sXtG116FzEFCoZ55OPQf2eFQHX
 uR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BEWF3/UOFlb9APa1uXowujximI7deRNLg7s7zD3Zhw=;
 b=qFwN2W8+AzP9UWGwT7lfSPX78uMISTF5OOZvnRS2zjMm966etxw9LjdoWbOFMuh3Cr
 2oGYy9LfFq1c7tffU8rsd6PDW1pyRK4u8NRZvzPdMa4FUFA4niQ1J65X4lIcQEai6SQH
 BmOL+QD1fkNwB2g5tVBygp96essZk+BgM5eq7phb8BQ6squ0c0TDhyVlNgd7PbRcKw1n
 KUiwRxgcw4z5Pxf8s/NbdaM9M4MV0zBd6cq6f6Oe+/BbsPboT0lf+Eo5+GAI5YhHdOZi
 /U6PDATxvcLD8Mg+/JSFh78oinsAOi5APEbYPfIq9zGwCoB7NjiERXWHT5KBD0VSQXjl
 4OpQ==
X-Gm-Message-State: AOAM531V3dKWkAjDh2ILizCq3cCUDVyI/8bKw1AF8Du20skS80vxigTN
 xDuwTwOYrt5VpUT2McgjT4aKFyPEJGhfWuF3zLY=
X-Google-Smtp-Source: ABdhPJy3l/zpKP73nWXnD7895fy2kIj88CCfFeuJUYuOJrmVNbvvcVVe5A95Yo5pn9Njcmo7zUAeV86yRbSnLkzRGtY=
X-Received: by 2002:a2e:88c8:: with SMTP id a8mr30654738ljk.148.1609559357712; 
 Fri, 01 Jan 2021 19:49:17 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
 <20210101060050.GA1892237@jeremy-acer>
 <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
 <20210101195821.GA41555@jeremy-acer>
 <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
 <20210102025837.GA61433@jeremy-acer>
In-Reply-To: <20210102025837.GA61433@jeremy-acer>
Date: Fri, 1 Jan 2021 21:49:06 -0600
Message-ID: <CAH2r5ms1V2KKb6T3ELQ-JsQ3fniOScTE2654_xLwnPruiekzEw@mail.gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I wasn't able to setup a second independent repro of this until
tonight, but the smbclient behavior (bug) does appear to be dependent
on the version of smbclient (see below).  Newer versions failed
(including current Samba, 4.14-pre and 4.12.5 Ubuntu).  These were all
attempted on the same machine, and the repro was simple. See below.

Recreation:
create two files with reserved characters (locally on the server) in
the root of the share (in this case xfs, running on the current stable
kernel,
5.10.4 although that is unlikely to matter)
$ ls /scratch
'file-\-backslash'  'file-?-question'

I also created a subdirectory with additional files with reserved
characters, although that may not matter.

$ ls /scratch/rsvd-chars
'dir-with-trailing-space '  'file-\backslash'    'file space'
 file                       'file->greaterthan'
'file-*asterisk'            'file-?question'

I exported the /scratch directory with smb.conf configured as

[scratch]
   comment = scratch share for testing
   browseable = yes
   path = /scratch
   guest ok = yes
   read only = no
   ea support = yes
   create mask = 0777
   directory mask = 0777
   vfs objects = acl_xattr
   map acl inherit = yes
   strict allocate = yes
   map acl inherit = yes
   mangled names = no

Connecting with smbclient and doing a simple ls causes the disconnect:
$ smbclient --version
Version 4.12.5-Ubuntu
$ smbclient //localhost/scratch -U testuser
Enter SAMBA\testuser's password:
Try "help" to get a list of possible commands.
smb: \> ls
  .                                   D        0  Fri Jan  1 21:19:52 2021
  ..                                  D        0  Thu Dec 31 21:42:28 2020
  rsvd-chars                          D        0  Fri Jan  1 09:14:04 2021
  file-?-question                     N        0  Fri Jan  1 21:19:42 2021
is_bad_finfo_name: bad finfo->name
NT_STATUS_INVALID_NETWORK_RESPONSE listing \*
smb: \> SMBecho failed (NT_STATUS_CONNECTION_DISCONNECTED). The
connection is disconnected now

wireshark trace shows a simple open (SMB3.1.1 create) followed by
level 37 SMB3.1.1 find request, then smbclient appears to drop the tcp
session.

Running smbclient with -d 10 (debug level) shows these three messages

dos_clean_name [\*]
unix_clean_name [\*]
is_bad_finfo_name: bad finfo->name

Trying the same thing with *older* smbclient worked, although there is
a possibility that other differences in build with the two smbclients
could be the reason that the older one worked and the newer one
failed:

$ /usr/local/samba/bin/smbclient //localhost/share --version
Version 4.11.0pre1-GIT-e63e391a1ad
$ /usr/local/samba/bin/smbclient //localhost/scratch -U testuser
smb: \> ls
  .                                   D        0  Fri Jan  1 21:19:52 2021
  ..                                  D        0  Thu Dec 31 21:42:28 2020
  rsvd-chars                          D        0  Fri Jan  1 09:14:04 2021
  file-?-question                     N        0  Fri Jan  1 21:19:42 2021
  file-\-backslash                    N        0  Fri Jan  1 21:19:52 2021

556368460 blocks of size 1024. 295948832 blocks available

I also tried it with current smbclient and it also failed:

$ ./bin/smbclient --version
Version 4.14.0pre1-DEVELOPERBUILD
$ ./bin/smbclient //localhost/scratch -U testuser
Enter SAMBA\testuser's password:
Try "help" to get a list of possible commands.
smb: \> ls
  .                                   D        0  Fri Jan  1 21:19:52 2021
  ..                                  D        0  Thu Dec 31 21:42:28 2020
  rsvd-chars                          D        0  Fri Jan  1 09:14:04 2021
  file-?-question                     N        0  Fri Jan  1 21:19:42 2021
is_bad_finfo_name: bad finfo->name
NT_STATUS_INVALID_NETWORK_RESPONSE listing \*
smb: \> SMBecho failed (NT_STATUS_CONNECTION_DISCONNECTED). The
connection is disconnected now

On Fri, Jan 1, 2021 at 8:58 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Fri, Jan 01, 2021 at 05:57:08PM -0500, Steve French wrote:
> >4.12.4 Ubuntu
> >
> >On Fri, Jan 1, 2021, 14:58 Jeremy Allison <jra@samba.org> wrote:
> >> >is_bad_finfo_name: bad finfo->name
> >> >NT_STATUS_INVALID_NETWORK_RESPONSE listing \*
> >> >smb: \> SMBecho failed (NT_STATUS_CONNECTION_DISCONNECTED). The
> >> >connection is disconnected now
> >>
> >> Can you log a bug please and give full setup instructions
> >> to reproduce. This isn't enough to show me what the bug is.
> >> I need a directory listing from the Server side to show
> >> me what files are in the root of the share.
> >>
> >> Also, you neglect to tell me what Samba version you are
> >> using (which is a pre-requisite for a bug report Steve,
> >> you know this :-).
>
> To channel Rowland, this isn't a bug report, this is an
> anecdote :-).
>
> Here's what I did to show this doesn't happen.
>
> $ mkdir /tmp/chartest
> $ touch /tmp/chartest/fil\\e.dat
> $ ls -l /tmp/chartest/
> total 0
> -rw-rw-r-- 1 user user 0 Jan  1 18:52 'fil\e.dat'
>
> Edit /usr/local/samba/etc/smb.conf, add:
>
> [chartest]
>         path = /tmp/chartest
>         guest ok = yes
>         read only = no
>
> Restart smbd. Run:
>
> $ /usr/local/samba/bin/smbclient //127.0.0.1/chartest -Uuser%password -mSMB3
> smb: \> ls
>    .                                   D        0  Fri Jan  1 18:52:10 2021
>    ..                                  D        0  Fri Jan  1 18:51:38 2021
>    FI7KDO~J.DAT                        N        0  Fri Jan  1 18:52:10 2021
>
> IF YOU WANT ME TO INVESTIGATE THIS IS NEED A SIMILAR
> LEVEL OF DETAIL (sigh). But I *know* you *know*
> this...



-- 
Thanks,

Steve


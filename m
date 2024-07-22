Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B69394C5
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jul 2024 22:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HGoZ0iVpud46DiOQwtMdFUCxn0VjY8u/70U0lrf/oxo=; b=G0bFvTDPKdvs6ZnlCGZQXTGoEJ
	CW5hX7yy/6u9cHEyAQYoQ9y+dytPCbCmjgU7ssUMqurnRO5gE5nMMl+Nu3wXsgNfFGcrNZuKjaYqX
	fjJt1tTQ8gkZL02+xM5VaUcqca4FLVCIv10W8bKnbWbeTanQPrdc/A13N6EpzvCBzh2r2uXtjcFJk
	V0NRrdcNKD/8R0/H3pzURL+8VN03D3abTShmJAAct15rjnPODs34Tak8JelkT2W+c8lysCExnat6Q
	bDSiEDV40oDKtQCQxISk03Ihv9BnNQiInjhDcVgU78SHuj3o29qUgXlFl7A4godbrNS3CGqkkxRrW
	spqKu3VA==;
Received: from ip6-localhost ([::1]:23594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sVzh7-001IYp-Sk; Mon, 22 Jul 2024 20:31:41 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:42394) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sVzh2-001IYi-IZ
 for samba-technical@lists.samba.org; Mon, 22 Jul 2024 20:31:39 +0000
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52efef496ccso1743533e87.1
 for <samba-technical@lists.samba.org>; Mon, 22 Jul 2024 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721680295; x=1722285095; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+p5+Gb7a35+ZYY7+QjNOy6NnmvKMK5Etl5KynXcNfQA=;
 b=CM1U6jXpS3KhxRk7HJAMYpd0A1chneQ58VVHu1Mqx0jZg85KbdqNlEJ0+Rs8OTKm9D
 4XQnSyTCtkywRXN4pfeFVk4BosXp+gsAPkUXAqOdo4wUed1JQ+EB57oNpDkC0thATxIb
 ZhKsfvZQRMehodxq4RIXvKwmLNg/HAsPtX1NqlEH7iTsg6YlO+ydrgGSk8fz1Qj4LXRu
 BTwjoHFphMHyBB8E/xkik8ebzsG23sfb70z037nqdZ3CS/AcMPgORyieGxKXTFVJIkSh
 joyHQB2at6pfTS628J6fxFn9g90MdzLQw/bvSZGi3Zm2lW/ZYZw4rd2MVBUjpGbxi5o7
 s7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721680295; x=1722285095;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+p5+Gb7a35+ZYY7+QjNOy6NnmvKMK5Etl5KynXcNfQA=;
 b=jmSvOgI3juzwj72YnDQsUC+MriScxWKFP6NQvKW9Ja0Ul1w+my2QMvG/ShXM1oRKn0
 HtRVYNqAlF7/aa3JYk/iAms6Ebqe+BtKjqpNuyn6Yahu8gWToZIilEUwjm2eipm4+Kze
 bc/6flxmMOYeTDiZ07LWsTXWOXIVWFBvYi6HfVTmtWOqOnv+N+7nP5hViLw7tIPNFez1
 HF9IBoj3hy01CSE5nqusbWQakYe3VQumUmr1pL9YOoG7O0RAyv+UzJWMCeTuV0rkcpjB
 R6Zas+Goi8KV4qmtC37yY/80zLsM/llmzfq/QNouXLM2zwbZJei0OrR8dc5i965rNcK6
 6XYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmFgDnDlIvV62In/5APRJPOsHb2laGktq1M0bOr+o1P7UD+cS7qTeYfUxB+/Pn69uddHYWNzRwXhHFCBOopQ6h46biupwerqneFL93+OGq
X-Gm-Message-State: AOJu0YzZgj1AHXJX6NJCbmiQUnVT/w6bMr8ydkvHn0hlT/GKahHQr7Mj
 csbi+0RhBGc3/QKLywEfNYO0TNhbSRTbOWffgW+acYbIHiL/9fqQF/i3SEmM+u8xDgo0ytWs2Y6
 9sXURLB5v9yrWr511AT2ygf0RnxnnY/gf
X-Google-Smtp-Source: AGHT+IFNQlHVmb5lxXivTCyrcqK1QMB2psqizfAJAFGHzsb4tz0cdjLT8ZwV4oeM2deicmjXGLKil6jZpSBAhQ0SMd0=
X-Received: by 2002:a05:6512:118d:b0:52f:c398:8780 with SMTP id
 2adb3069b0e04-52fc6700ac6mr6432e87.18.1721680294355; Mon, 22 Jul 2024
 13:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <5659539.ZASKD2KPVS@wintermute>
 <CAH2r5mtzzgG9-peAakYhBNdpahQ=R8wkhJxUQJ+oZtzEvuNjSg@mail.gmail.com>
 <5fad6c05eab959e06fe3518d9104376b79dcbcb9.camel@samba.org>
In-Reply-To: <5fad6c05eab959e06fe3518d9104376b79dcbcb9.camel@samba.org>
Date: Mon, 22 Jul 2024 15:31:23 -0500
Message-ID: <CAH2r5mvYLkAKaHVB-9yD-_U++BkZF5HGJneLB4E8j-QPTezQEg@mail.gmail.com>
Subject: Re: Different behavior of POSIX file locks depending on cache mode
To: Andrew Bartlett <abartlet@samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.com>, Kevin Ottens <kevin.ottens@enioka.com>,
 "Stefan \(metze\) Metzmacher" <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>, linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> I was hoping to include the old SMB1 unix extensions in this test also,
but these seem unsupported in current kernels.  When did they go away?

The SMB1 Unix Extensions still work to Samba but ... In investigating this
I found a more serious SMB1 problem.  Reconnect with SMB1 is broken to
Samba - we mount fine with SMB1 (assuming SMB1 is not disabled in the Linux
config) to Samba server and SMB1 Unix Extensions are negotiated by default
(assuming the server hasn't turned them off) but reconnect fails.   With
various rewrites/cleanup of the reconnect code, it is now handled in a
worker thread which skips the call to "reset_cifs_unix_caps()" (to do the
SetFSInfo on the tcon required to enable Unix Extensions for SMB1).   Am
trying to fix that but a little tricky to find best place to call that
function.

On Sun, Jun 9, 2024 at 11:41=E2=80=AFPM Andrew Bartlett <abartlet@samba.org=
> wrote:

> (resend due spam rules on list)
>
> Kia Ora Steve,
>
> I'm working with Kevin on this, and I set up a clean environment with
> the latest software to make sure this is all still an issue on current
> software:
>
> I was hoping to include the old SMB1 unix extensions in this test also,
> but these seem unsupported in current kernels.  When did they go away?
>
> Anyway, here is the data.  It certainly looks like an issue with the
> SMB3 client, as only the client changes with the cache=3Dnone
>
> Server is Samba 4.20.1 from Debian Sid.  Kernel is
> Linux debian-sid-cifs-client 6.7.9-amd64 #1 SMP PREEMPT_DYNAMIC Debian
> 6.7.9-2 (2024-03-13) x86_64 GNU/Linux
>
> With SMB1 but not unix extensions (seems unsupported):
>
> root@debian-sid-cifs-client:~# mount.cifs //192.168.122.234/testuser
> mnt -o user=3Dtestuser,pass=3Dpass,vers=3D1.0
> root@debian-sid-cifs-client:~# cd mnt/
> root@debian-sid-cifs-client:~/mnt# ../lock_test foo
> Testing with foo
> Got new file descriptor 3
> Lock set: 1
> Second file descriptor 4
> Read from second fd: x count: 0
> Third file descriptor 5
> Wrote to third fd: 1
>
> root@debian-sid-cifs-client:~# mount.cifs //192.168.122.234/testuser
> mnt -o user=3Dtestuser,pass=3Dpenguin12#,vers=3D3.1.1,posix
> root@debian-sid-cifs-client:~# cd mnt/
> root@debian-sid-cifs-client:~/mnt# ../lock_test foo
> Testing with foo
> Got new file descriptor 3
> Lock set: 1
> Second file descriptor 4
> Read from second fd: x count: -1
> Third file descriptor 5
> Wrote to third fd: -1
> root@debian-sid-cifs-client:~# mount.cifs //192.168.122.234/testuser
> mnt -o user=3Dtestuser,pass=3Dpenguin12#,vers=3D3.1.1,unix
>
> root@debian-sid-cifs-client:~# mount.cifs //192.168.122.234/testuser
> mnt -o user=3Dtestuser,pass=3Dpenguin12#,vers=3D3.1.1,unix,nobrl
> root@debian-sid-cifs-client:~# cd mnt/
> root@debian-sid-cifs-client:~/mnt# ../lock_test foo
> Testing with foo
> Got new file descriptor 3
> Lock set: 1
> Second file descriptor 4
> Read from second fd: o count: 1
> Third file descriptor 5
> Wrote to third fd: 1
>
> And with cache=3Dnone
>
> root@debian-sid-cifs-client:~# mount.cifs //192.168.122.234/testuser
> mnt -o user=3Dtestuser,pass=3Dpenguin12#,vers=3D3.1.1,posix,cache=3Dnone
> root@debian-sid-cifs-client:~# cd mnt/
> root@debian-sid-cifs-client:~/mnt# ../lock_test foo
> Testing with foo
> Got new file descriptor 3
> Lock set: 1
> Second file descriptor 4
> Read from second fd: o count: 1
> Third file descriptor 5
> Wrote to third fd: 1
>
> On Thu, 2024-05-23 at 11:12 -0500, Steve French wrote:
> > What is the behavior with "nobrl" mount option? and what is the
> > behavior when running with the POSIX extensions enabled (e.g. to
> > current Samba or ksmbd adding "posix" to the mount options)
> >
> > On Thu, May 23, 2024 at 11:08=E2=80=AFAM Kevin Ottens <
> > kevin.ottens@enioka.com
> > > wrote:
> > > Hello,
> > >
> > > I've been hunting down a bug exhibited by Libreoffice regarding
> > > POSIX file
> > > locks in conjunction with CIFS mounts. In short: just before
> > > saving, it
> > > reopens a file on which it already holds a file lock (via another
> > > file
> > > descriptor in the same process) in order to read from it to create
> > > a backup
> > > copy... but the read call fails.
> > >
> > > I've been in discussion with Andrew Bartlett for a little while
> > > regarding this
> > > issue and, after exploring several venues, he advised me to send an
> > > email to
> > > this list in order to get more opinions about it.
> > >
> > > The latest discovery we did was that the cache option on the
> > > mountpoint seems
> > > to impact the behavior of the POSIX file locks. I made a minimal
> > > test
> > > application (attached to this email) which basically does the
> > > following:
> > >  * open a file for read/write
> > >  * set a POSIX write lock on the whole file
> > >  * open the file a second time and try to read from it
> > >  * open the file a third time and try to write to it
> > >
> > > It assumes there is already some text in the file. Also, as it goes
> > > it outputs
> > > information about the calls.
> > >
> > > The output I get is the following with cache=3Dstrict on the mount:
> > > ---
> > > Testing with /mnt/foo
> > > Got new file descriptor 3
> > > Lock set: 1
> > > Second file descriptor 4
> > > Read from second fd: x count: -1
> > > Third file descriptor 5
> > > Wrote to third fd: -1
> > > ---
> > >
> > > If I'm using cache=3Dnone:
> > > ---
> > > Testing with /mnt/foo
> > > Got new file descriptor 3
> > > Lock set: 1
> > > Second file descriptor 4
> > > Read from second fd: b count: 1
> > > Third file descriptor 5
> > > Wrote to third fd: 1
> > > ---
> > >
> > > That's the surprising behavior which prompted the email on this
> > > list. Is it
> > > somehow intended that the cache option would impact the semantic of
> > > the file
> > > locks? At least it caught me by surprise and I wouldn't expect such
> > > a
> > > difference in behavior.
> > >
> > > Now, since the POSIX locks are process wide, I would have expected
> > > to have the
> > > output I'm getting for the "cache=3Dnone" case to be also the one I'm
> > > getting
> > > for the "cache=3Dstrict" case.
> > >
> > > I'm looking forward to feedback on this one. I really wonder if we
> > > missed
> > > something obvious or if there is some kind of bug in the cifs
> > > driver.
> > >
> > > Regards.
> > > --
> > > K=C3=A9vin Ottens
> > > kevin.ottens@enioka.com
> > >
> > > +33 7 57 08 95 13
> >
> >
>
> --
>
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead                https://catalyst.net.nz/services/samba
> Catalyst.Net <https://catalyst.net.nz/services/sambaCatalyst.Net> Ltd
>
> Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
> company
>
> Samba Development and Support: https://catalyst.net.nz/services/samba
>
> Catalyst IT - Expert Open Source Solutions
>
> --
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead                https://catalyst.net.nz/services/samba
> Catalyst.Net <https://catalyst.net.nz/services/sambaCatalyst.Net> Ltd
>
> Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
> company
>
> Samba Development and Support: https://catalyst.net.nz/services/samba
>
> Catalyst IT - Expert Open Source Solutions
>


--=20
Thanks,

Steve

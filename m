Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ADAA18ACA
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jan 2025 04:48:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=a/jUX3B4Yz9bhHpGEzlR7mRYxOoHXxyJBdL35nvhrIU=; b=5QHklgFG3NfWnAvBkhI+5qHcSW
	xDhSkgVB/Ly7sI3+M+gTiHzy+sJy3bGgIQmM/ZBxJpJoI5Y6h7B1AC7gNv7/HwpdELE6A2DFZQRqP
	XmcXQGSDxz0h8y4gogbZKan0gYJs1DrysoQWOjoTurK8nVkBYU64xWVeYsrq/kk514MUd0Ku+uURr
	smiAWwIZLs+EmVW9Fg7gG92NOnAHdFhWUsrpqIBEkth2azik7NOvBN/wKJZe3JaA0VCEiTJSSPRPS
	toXWNALSqARI2Xo3VY7YqG7KSAN+k0m6eJjfpCqEUtVZxroBMWiHlntobEJzVHnUI5wLlr66JTfeO
	7SQp0r6g==;
Received: from ip6-localhost ([::1]:56498 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1taRiA-0092WU-NC; Wed, 22 Jan 2025 03:47:26 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:51479) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taRi3-0092WN-Qo
 for samba-technical@lists.samba.org; Wed, 22 Jan 2025 03:47:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so6091759e87.3
 for <samba-technical@lists.samba.org>; Tue, 21 Jan 2025 19:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737517638; x=1738122438; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a/jUX3B4Yz9bhHpGEzlR7mRYxOoHXxyJBdL35nvhrIU=;
 b=fgKvCTYKEiY552WAKvfIBxsgGnqum0wG7q/JUWKDn1cGxWonhlCRWpPUapF1lbFEEK
 wUC6h6q7E4rcI0d3uQEunJ81nRsmYABom2NUIPrOmsO1dR21f+dMW1htYvhf37jzGsby
 gtPIHRBaA5R37v+oLwHey3ygLysW5TmQkqnR5pDdTIS3QksJek4L11o6cyeAQpI25V0I
 Xj+YQjTUTkt3kayIcm09t7U906wJGMRf3DvKAE0yKtQDKiEPeV7YJdxKRyKRbIbSY4Pl
 Ywfu4M0I+nXb9z4voUfxt9TCBknV6DwlrvMMDh8oiQA68DitnLlX92I7D7qTU/ge4Bwp
 lMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737517638; x=1738122438;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/jUX3B4Yz9bhHpGEzlR7mRYxOoHXxyJBdL35nvhrIU=;
 b=Ss0j/x7VujmiQMV30FyD73DokRt3/0nHC23ISNKh6k4mlG+VtMaWCmPtyDlZJcTaF5
 e4ixZBW8bar9no6d+DjXftp7A+hIR0bG4PBm6/W9DLt+UFSbvMlJAWjaFXbzrghh6AZR
 bW+jrXBuGmcosAktwTPpm0ccl1YPptWgyoUXMPw9/Oi6B7/LpVDAQQ3gnwxzkEJcLkqP
 NUzqcN3qGeIbD7dNvyW6jGL0aiwGgI3FXOrXRdQCASnqLWAAiXcC0z24+olea2zny8oW
 NsYiuqLwGKtJo3fEVjnhJwIjo/TqmLiW9CCQsJCWjWMTPwZbUl87ylPh+dJxf358cbi1
 ZaAg==
X-Gm-Message-State: AOJu0YwyKXXAmXcQprgtqdSh8zVSEHKPPn9Iy7n1AUfiNetJOTJTaSVr
 HlDcG4fVV+wZaF0Qg3U5ZtLb+AErYxKk9gc3FFt8eHjd3uK6NkExKoIJ71fAiZ6gcaUu9YQCsUE
 JQy6yEgNwySaVkpDInElTlS6RRMoQPFNO
X-Gm-Gg: ASbGncsgKMjaQg5CI3K1LUNgwAsGxBaCuENaFWRx8JNlw4bBxkCt6T5mwHb9eLRJZH9
 PSvBfuZttg0qYQ2td/x61oyUk7J3JiIjcUii/Pniu2uBaYRC33W0=
X-Google-Smtp-Source: AGHT+IFdQUmNw+YdYY0I7zVyW6oJ1t6qm1wzsC6LwfSotHTqKd9UVrERFOz7NIn6rd1BbZcprCXlIkFMyogUpDIW8Ac=
X-Received: by 2002:ac2:561a:0:b0:540:75d3:95af with SMTP id
 2adb3069b0e04-5439c249f31mr4958604e87.29.1737517637474; Tue, 21 Jan 2025
 19:47:17 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <Z43pEk7WDs6dTQ1M@toolbox> <4942506.OV4Wx5bFTl@magrathea>
In-Reply-To: <4942506.OV4Wx5bFTl@magrathea>
Date: Tue, 21 Jan 2025 19:47:06 -0800
X-Gm-Features: AbW1kvamYpRlfqCsOjBxXMSoFW-rh0IVt7tDkfFaVcsE2Jbbabu67vVAcfLLgbI
Message-ID: <CAH2r5mvy2b35BAaUnqHdO7dLb9pRHy=LXv7YMBhCc76fUst05Q@mail.gmail.com>
Subject: Re: Local KDC and Samba
To: Andreas Schneider <asn@samba.org>
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
Cc: Alexander Bokovoy <ab@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Although install of the localkdc seemed to work, running setup on it failed=
:
root@localhost-live:/home/smfrench# dnf install localkdc
Updating and loading repositories:
Repositories loaded.
Package                   Arch   Version                   Repository
             Size
Installing:
 localkdc                 x86_64 0.0.1-14.fc41
copr:copr.fedorainf  30.4 KiB
Installing dependencies:
 certmonger               x86_64 0.79.20-2.fc41            fedora
          2.5 MiB
 krb5-pkinit              x86_64 1.21.3-121.fc41
copr:copr.fedorainf 121.2 KiB
 krb5-server              x86_64 1.21.3-121.fc41
copr:copr.fedorainf 784.6 KiB
 libkadm5                 x86_64 1.21.3-121.fc41
copr:copr.fedorainf 218.2 KiB
 localkdc-selinux         x86_64 0.0.1-14.fc41
copr:copr.fedorainf  10.1 KiB

Transaction Summary:
 Installing:         6 packages

Total size of inbound packages is 1 MiB. Need to download 1 MiB.
After this operation, 4 MiB extra will be used (install 4 MiB, remove 0 B).
Is this ok [y/N]: y
[1/6] localkdc-0:0.0.1-14.fc41.x86_64           100% |  28.8 KiB/s |
18.2 KiB |  00m01s
[2/6] certmonger-0:0.79.20-2.fc41.x86_64        100% | 824.8 KiB/s |
602.1 KiB |  00m01s
[3/6] krb5-server-0:1.21.3-121.fc41.x86_64      100% | 376.8 KiB/s |
300.0 KiB |  00m01s
[4/6] krb5-pkinit-0:1.21.3-121.fc41.x86_64      100% | 319.9 KiB/s |
59.8 KiB |  00m00s
[5/6] libkadm5-0:1.21.3-121.fc41.x86_64         100% | 330.6 KiB/s |
77.7 KiB |  00m00s
[6/6] localkdc-selinux-0:0.0.1-14.fc41.x86_64   100% |  81.7 KiB/s |
19.9 KiB |  00m00s
---------------------------------------------------------------------------=
-------------
[6/6] Total                                     100% | 678.3 KiB/s |
1.1 MiB |  00m02s


root@localhost-live:~# localkdc-setup
The parent of location "/var/kerberos/localkdc/kdc.crt" could not be
accessed due to insufficient permissions.
/usr/bin/local-getcert: Failed to create pkinit certificates

But it looks like it has sufficient permissions:

root@localhost-live:~# stat /var/kerberos/localkdc
  File: /var/kerberos/localkdc
  Size: 16            Blocks: 0          IO Block: 4096   directory
Device: 0,42    Inode: 367888      Links: 1
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Context: system_u:object_r:var_t:s0
Access: 2025-01-21 19:42:50.669926708 -0800
Modify: 2025-01-21 19:42:22.342659428 -0800
Change: 2025-01-21 19:42:22.342659428 -0800
 Birth: 2025-01-21 19:41:03.323891871 -0800

Any ideas why this would fail?

On Mon, Jan 20, 2025 at 12:33=E2=80=AFAM Andreas Schneider <asn@samba.org> =
wrote:
>
> On Monday, 20 January 2025 07:11:30 CET Alexander Bokovoy via samba-techn=
ical
> wrote:
> > On =D0=9D=D1=8F=D0=B4, 19 =D1=81=D1=82=D1=83 2025, Steve French wrote:
> > > Is there documentation (or example howto, walkthrough etc.) on how to
> > > setup the new Local KDC features of Samba server?
> > >
> > > I wanted to try some experiments with the Linux client to make sure
> > > the new type of krb5 mounts work fine.  For the server I am using
> > > current Samba master branch on Ubuntu.
> >
> > There are bits and pieces which aren't merged yet in both MIT Kerberos
> > and Samba.
> >
> > Your best way of testing is by using COPR repository Andreas created fo=
r
> > Fedora as it includes prepared packages.
> >
> > See https://gitlab.com/cryptomilk/localkdc and
> > https://copr.fedorainfracloud.org/coprs/asn/localkdc/
> >
> > Andreas gave some insstructions in this comment:
> > https://github.com/SSSD/sssd/issues/7723#issuecomment-2597864370
>
> For using IAKerb you need smbd and smbclient built from:
>
> https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads/asn-=
iakerb
>
>
> Edit the smb.conf and add:
>
> include /etc/samba/localkdc.conf
>
> at the end of the [global] section after you ran localkdc-setup!
>
> You can then connect to smbd using the mdns name of the machine
> (<hostname>.local).
>
> Example:
>
> smbclient //samba-iakerb.local//share -Uasn@SAMBA-IAKERB.LOCALKDC.SITE --=
use-
> kerberos=3Drequired
>
>
> Best regards
>
>
>         Andreas
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>


--=20
Thanks,

Steve


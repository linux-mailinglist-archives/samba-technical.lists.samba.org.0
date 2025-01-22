Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 482ECA18CB1
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jan 2025 08:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uB7jcK5ZrtUj0xI39nNzcA+hmD2xHrDYJ1HkIj+xdjM=; b=U9HvYAK/Hig6AmdjoVWGH/LHZj
	A7IZsgGvso3SQ+5mtIXSmJ2D6ksSOjTjx/TpM5VNvuaEI+L/niHfmlCT/YOrY78x91VW50ZYVCQ5v
	35h/CluMwW9ZXr84YYV+OJDxd97IkdU1Jvac+DO3uRcPsgtg6payMePRCMaKdHplxNjVK580g3f2w
	Pu2vSuUi62oGMbEFe6myUG+1j2hHFZjOVjUT7zWxnaDqYKSly0M2z6lqbUQJv1KxHNNOxkBW815In
	QuAVfZ3ephbH66hj6JrPxGfVBhlz3iiG59SahVLO6J7BwKexaJ/i2Fv+InzmZb+vedgZmqy4mPRSy
	Rpl/519A==;
Received: from ip6-localhost ([::1]:44936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1taV0q-0094Nv-5B; Wed, 22 Jan 2025 07:18:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63322) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taV0c-0094Ne-MY
 for samba-technical@lists.samba.org; Wed, 22 Jan 2025 07:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=uB7jcK5ZrtUj0xI39nNzcA+hmD2xHrDYJ1HkIj+xdjM=; b=Q3AuTsHSqTAiTddBbDM8siwO7I
 rKCrLuR3sRjTudcQ1/iI/jYqSSHNfsNH4V4IHkq3XydvG/wkuWS0ADD+crGtrjldoCNtgjPUkwRfm
 VDIdUFj14fzdh4kA8mz35Ar7yHWjTC9tysBr7m4rLOIVgcq92CF3+akkSSyoM+J3put+ZmSC4Y+oH
 JfAEHYF+4Gi2kPj9j6QorFt+dQoqwMSU1QG/nJhuaJqryaC8YxtgTccj3Yv0ZwPb3pfIJfdOkk5c0
 31eqm9QsFAnHPi9hA17y0bysygL19hSCdQC5m4WIC5euMV8yJ1gXLRPTzzeQZbV6Uujl+HWLUIxFx
 YfxzQLG5DDfr2tcCiQbOnLwVqadIpZgfLIDL9AoO6NNvZw7rRbHOJ78JxkFVrGkd6Huhhz1y6lEg9
 zw61piYMt+Tc02DFAIRN1EQc0p73gtkWVYZ/AyTe9Cfbh+4OSD32XX89Lgmb8LcGWpsbaoRzXIMkV
 cxKla+g3aRS+GUHmUnoLgNjZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taV0a-001Odw-03; Wed, 22 Jan 2025 07:18:40 +0000
Date: Wed, 22 Jan 2025 09:17:32 +0200
To: Steve French <smfrench@gmail.com>
Subject: Re: Local KDC and Samba
Message-ID: <Z5CbjKR8Fl5dgx6e@toolbox>
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <Z43pEk7WDs6dTQ1M@toolbox> <4942506.OV4Wx5bFTl@magrathea>
 <CAH2r5mvy2b35BAaUnqHdO7dLb9pRHy=LXv7YMBhCc76fUst05Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2r5mvy2b35BAaUnqHdO7dLb9pRHy=LXv7YMBhCc76fUst05Q@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Аўт, 21 сту 2025, Steve French wrote:
> Although install of the localkdc seemed to work, running setup on it failed:
> root@localhost-live:/home/smfrench# dnf install localkdc
> Updating and loading repositories:
> Repositories loaded.
> Package                   Arch   Version                   Repository
>              Size
> Installing:
>  localkdc                 x86_64 0.0.1-14.fc41
> copr:copr.fedorainf  30.4 KiB
> Installing dependencies:
>  certmonger               x86_64 0.79.20-2.fc41            fedora
>           2.5 MiB
>  krb5-pkinit              x86_64 1.21.3-121.fc41
> copr:copr.fedorainf 121.2 KiB
>  krb5-server              x86_64 1.21.3-121.fc41
> copr:copr.fedorainf 784.6 KiB
>  libkadm5                 x86_64 1.21.3-121.fc41
> copr:copr.fedorainf 218.2 KiB
>  localkdc-selinux         x86_64 0.0.1-14.fc41
> copr:copr.fedorainf  10.1 KiB
> 
> Transaction Summary:
>  Installing:         6 packages
> 
> Total size of inbound packages is 1 MiB. Need to download 1 MiB.
> After this operation, 4 MiB extra will be used (install 4 MiB, remove 0 B).
> Is this ok [y/N]: y
> [1/6] localkdc-0:0.0.1-14.fc41.x86_64           100% |  28.8 KiB/s |
> 18.2 KiB |  00m01s
> [2/6] certmonger-0:0.79.20-2.fc41.x86_64        100% | 824.8 KiB/s |
> 602.1 KiB |  00m01s
> [3/6] krb5-server-0:1.21.3-121.fc41.x86_64      100% | 376.8 KiB/s |
> 300.0 KiB |  00m01s
> [4/6] krb5-pkinit-0:1.21.3-121.fc41.x86_64      100% | 319.9 KiB/s |
> 59.8 KiB |  00m00s
> [5/6] libkadm5-0:1.21.3-121.fc41.x86_64         100% | 330.6 KiB/s |
> 77.7 KiB |  00m00s
> [6/6] localkdc-selinux-0:0.0.1-14.fc41.x86_64   100% |  81.7 KiB/s |
> 19.9 KiB |  00m00s
> ----------------------------------------------------------------------------------------
> [6/6] Total                                     100% | 678.3 KiB/s |
> 1.1 MiB |  00m02s
> 
> 
> root@localhost-live:~# localkdc-setup
> The parent of location "/var/kerberos/localkdc/kdc.crt" could not be
> accessed due to insufficient permissions.
> /usr/bin/local-getcert: Failed to create pkinit certificates
> 
> But it looks like it has sufficient permissions:
> 
> root@localhost-live:~# stat /var/kerberos/localkdc
>   File: /var/kerberos/localkdc
>   Size: 16            Blocks: 0          IO Block: 4096   directory
> Device: 0,42    Inode: 367888      Links: 1
> Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
> Context: system_u:object_r:var_t:s0
> Access: 2025-01-21 19:42:50.669926708 -0800
> Modify: 2025-01-21 19:42:22.342659428 -0800
> Change: 2025-01-21 19:42:22.342659428 -0800
>  Birth: 2025-01-21 19:41:03.323891871 -0800
> 
> Any ideas why this would fail?

There is incomplete SELinux policy yet. Please run in permissive for
time being, we need to fix the policy.


> 
> On Mon, Jan 20, 2025 at 12:33 AM Andreas Schneider <asn@samba.org> wrote:
> >
> > On Monday, 20 January 2025 07:11:30 CET Alexander Bokovoy via samba-technical
> > wrote:
> > > On Няд, 19 сту 2025, Steve French wrote:
> > > > Is there documentation (or example howto, walkthrough etc.) on how to
> > > > setup the new Local KDC features of Samba server?
> > > >
> > > > I wanted to try some experiments with the Linux client to make sure
> > > > the new type of krb5 mounts work fine.  For the server I am using
> > > > current Samba master branch on Ubuntu.
> > >
> > > There are bits and pieces which aren't merged yet in both MIT Kerberos
> > > and Samba.
> > >
> > > Your best way of testing is by using COPR repository Andreas created for
> > > Fedora as it includes prepared packages.
> > >
> > > See https://gitlab.com/cryptomilk/localkdc and
> > > https://copr.fedorainfracloud.org/coprs/asn/localkdc/
> > >
> > > Andreas gave some insstructions in this comment:
> > > https://github.com/SSSD/sssd/issues/7723#issuecomment-2597864370
> >
> > For using IAKerb you need smbd and smbclient built from:
> >
> > https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-iakerb
> >
> >
> > Edit the smb.conf and add:
> >
> > include /etc/samba/localkdc.conf
> >
> > at the end of the [global] section after you ran localkdc-setup!
> >
> > You can then connect to smbd using the mdns name of the machine
> > (<hostname>.local).
> >
> > Example:
> >
> > smbclient //samba-iakerb.local//share -Uasn@SAMBA-IAKERB.LOCALKDC.SITE --use-
> > kerberos=required
> >
> >
> > Best regards
> >
> >
> >         Andreas
> >
> > --
> > Andreas Schneider                      asn@samba.org
> > Samba Team                             www.samba.org
> > GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
> >
> >
> 
> 
> -- 
> Thanks,
> 
> Steve

-- 
/ Alexander Bokovoy


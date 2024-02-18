Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4C859767
	for <lists+samba-technical@lfdr.de>; Sun, 18 Feb 2024 15:29:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dgnj/hkRtciMM3dj4gtRQ/04slsvQP17gvgjD+uoKhU=; b=pNR+za0s3iKujU0nBuU/Z5lZ4V
	P+lZ/m8UUyNLzqV1suwplGQ3CjtdXjUVIozzjnjIampeMy74+KyhBtCD+RE3OB4Jbntk+jZsaMP4O
	w47SoDkrCXGS/Vipbvd40iAoL1itCagB2EBbZDh58PF7Q/+3TuWIOhTRODtg0uCIye1XsW868mRB6
	n7aLhkymGc1UirkLQ41EIop4+YS61rdpjZpLUy52gNxnxc9d2SR9C53KHUesoimN0udRT32gbiOQC
	B32r7SRGoWogqXYlRGh2mvAUi/rV+5q5hS+RPR8Bc0VQK6lpcNSl3WppqUdXpCnDV4AGesmMdUNYc
	YLTuOvQw==;
Received: from ip6-localhost ([::1]:60320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rbiAY-008qAB-7q; Sun, 18 Feb 2024 14:29:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42524) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rbiAU-008qA4-DX
 for samba-technical@lists.samba.org; Sun, 18 Feb 2024 14:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=dgnj/hkRtciMM3dj4gtRQ/04slsvQP17gvgjD+uoKhU=; b=IdlMhpYaZ1QcwIK77JlN7rG8gQ
 QM33eb4ZdqS1jDf5umfh6u6NrwB91+lIAyH2ZFNaRT46ykG4yORYuDOqBTGffmcbDqIJ8Msf1ql1a
 J4Mw8rOdlwdtlUJIJBqhkUArokXsAbcl2+o6B6IJXD7L7zyVmJwlzBg8kF1ZIrSqVVKufWh+eewiQ
 ojjCoJT7eVfJjHNp9NMFTpbHzSu5kSeIHByXr3Dl6emvzXKN3ZZOBLuMO+KCsN2bBYInBtAfbyRQo
 E3eaRtEGKPIPZbycoL42/JLjxnC/Kw/t5gC9ainl343Fb6pnXJXKE3ieo5n+k53NGx9ZXoxnEQfOs
 mP+nzy5n6Hp9mQj4ugujCVqg5ZP7FVopcTjHTv5sNSIR26VepOrNGK7FT827vcov4gs38pnwwpNcn
 92S8t9ZMu6+LbZNdlmfr3LTUWs3aBhn5AHRggkex6UY/zXobsuMq7CouWm0chFVf/8FFMvEO9e00g
 /jJTINpy0CHvzth0VPbzGoia;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rbiAS-00Ddqr-2b; Sun, 18 Feb 2024 14:29:20 +0000
Date: Sun, 18 Feb 2024 16:32:17 +0200
To: Nico Kadel-Garcia <nkadel@gmail.com>
Subject: Re: Samba 4.20.0rc2 fails to support "--with-includelibs" or build
 Heimdall Kerberos
Message-ID: <ZdIU8U1tFrsf0Yi2@toolbox>
References: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 18 Feb 2024, Nico Kadel-Garcia via samba-technical wrote:
> I've been publishing backports of current Samba releases for RHEL to
> include full domain controller capability for a few years now. Red Hat
> elects to turn off the domain controller features at build time, and
> the Fedora SRPM's reflect this decision for RHEL. Building for RHEL
> meand activating "--with-includelibs" in order to avoid conflicts with
> the libldb, libtdb, etc. versons used by sssd and other default tools.
> 
> My current work is published at https://github.com/nkadel/samba4repo/.
> When I enable the use of the built-in Heimdall Kerberos with the
> "system_mit_krb5" option in the .spec file, I get these errors when
> compiling Samba with the "mock" command.
> 
> 
> error: Bad exit status from /var/tmp/rpm-tmp.sarBcy (%build)
> RPM build errors:
>     Bad exit status from /var/tmp/rpm-tmp.sarBcy (%build)
> Child return code was: 1
> EXCEPTION: [Error('Command failed: \n # /usr/bin/systemd-nspawn -q -M
> 62568e9bb2da46fb9560a29c33520d1a -D
> /var/lib/mock/centos-stream+epel-9-x86_64/root -a -u mockbuild
> --capability=cap_ipc_lock --
> bind=/tmp/mock-resolv.0z11du6p:/etc/resolv.conf
> --bind=/dev/mapper/control --bind=/dev/fuse --bind=/dev/loop-control
> --bind=/dev/loop0 --bind=/dev/loop1 --bind=/dev/loop2
> --bind=/dev/loop3 --bind=/
> dev/loop4 --bind=/dev/loop5 --bind=/dev/loop6 --bind=/dev/loop7
> --bind=/dev/loop8 --bind=/dev/loop9 --bind=/dev/loop10
> --bind=/dev/loop11 --console=pipe --setenv=TERM=vt100
> --setenv=SHELL=/bin/bash
>  --setenv=HOME=/builddir --setenv=HOSTNAME=mock
> --setenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin
> \'--setenv=PROMPT_COMMAND=printf "\\033]0;<mock-chroot>\\007"\'
> \'--setenv=PS1=<mock-chroot> \\s-\\v\\$ \
> ' --setenv=LANG=C.UTF-8 --resolv-conf=off bash --login -c
> \'/usr/bin/rpmbuild -bb  --target
> x86_64 --nodeps /builddir/build/originals/samba.spec\'\n', 1)]
> Traceback (most recent call last):
>   File "/usr/lib/python3.9/site-packages/mockbuild/trace_decorator.py",
> line 93, in trace
>     result = func(*args, **kw)
>   File "/usr/lib/python3.9/site-packages/mockbuild/util.py", line 612,
> in do_with_status
>     raise exception.Error("Command failed: \n # %s\n%s" %
> (cmd_pretty(command, env), output), child.returncode)
> mockbuild.exception.Error: Command failed:
>  # /usr/bin/systemd-nspawn -q -M 62568e9bb2da46fb9560a29c33520d1a -D
> /var/lib/mock/centos-stream+epel-9-x86_64/root -a -u mockbuild
> --capability=cap_ipc_lock
> --bind=/tmp/mock-resolv.0z11du6p:/etc/resolv.conf
> --bind=/dev/mapper/control --bind=/dev/fuse --bind=/dev/loop-control
> --bind=/dev/loop0 --bind=/dev/loop1 --bind=/dev/loop2
> --bind=/dev/loop3 --bind=/dev/loop4 --bind=/dev/loop5
> --bind=/dev/loop6 --bind=/dev/loop7 --bind=/dev/loop8
> --bind=/dev/loop9 --bind=/dev/loop10 --bind=/dev/loop11 --console=pipe
> --setenv=TERM=vt100 --setenv=SHELL=/bin/bash --setenv=HOME=/builddir
> --setenv=HOSTNAME=mock --setenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin
> '--setenv=PROMPT_COMMAND=printf "\033]0;<mock-chroot>\007"'
> '--setenv=PS1=<mock-chroot> \s-\v\$ ' --setenv=LANG=C.UTF-8
> --resolv-conf=off bash --login -c '/usr/bin/rpmbuild -bb  --target
> x86_64 --nodeps /builddir/build/originals/samba.spec'


This just shows that systemd-nspawn execution failed when running
'rpmbuild -bb ... samba.spec'. Are there are any more logs available?

In particular, prior to  

> error: Bad exit status from /var/tmp/rpm-tmp.sarBcy (%build)
> RPM build errors:

-- 
/ Alexander Bokovoy


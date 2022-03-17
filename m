Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A114DBBA1
	for <lists+samba-technical@lfdr.de>; Thu, 17 Mar 2022 01:23:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=eTLkdQK/1hmN7YTBSYLzsHMkfIMGs15NJg3BRnbxOjo=; b=Uu5Z34TPxRO6/gy8Eqeje0vAqp
	OQEMffL/MLSjZaGSjRB1ZMb6AeZKsb7OK10naBEJnysKSh0aoqXmnGMkcGqHk5fujQUyg3BDrWaVa
	cMyES1vQMt90H/iDl4DyyMiMhQmxF/isxK9FNl9XGB6pBMeovEYTKEq1hvIvUxF50QRtZfjOfd9Z3
	VzlvBEaQGnKVoV4NmIEFMHwB40pqZY10Ss8EbtkwCECdPRm+zkJSDogTMQ/Gbriud9RDhbd4cpVkz
	UntpvgNIeWWIVZfZigqsvfTDNSNiu53RE+odFTGRswT2d1xa0SseRMSXhoEA6MN5WgUHoXyXRjYKc
	415rNB4A==;
Received: from ip6-localhost ([::1]:60612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nUduR-0034jJ-F5; Thu, 17 Mar 2022 00:22:31 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:32805
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nUduL-0034jA-Vp
 for samba-technical@lists.samba.org; Thu, 17 Mar 2022 00:22:28 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KJnrj4pK3z4xw4;
 Thu, 17 Mar 2022 11:21:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1647476518;
 bh=eTLkdQK/1hmN7YTBSYLzsHMkfIMGs15NJg3BRnbxOjo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YcQORPupdqsK4ek0dr3ttnEUANv+FGWCuSPLRxFMNeOzgNaSqVGK8B+l1RYIlPVWJ
 YgpRX4//REjjCs9V71ikZeClx5MKJe95bS8Pg1KpVpfLqM5rHiruTjrh0L+XUr83X1
 0/hBzqai0t0b4z6+ljtdHcce4TY2BMWt/m2UhQBnuLNkbMS8O0EvXx/M+nO9YY3JH0
 1QCLdaO8i6UBQK8lr5PHeWkQwiNnyBYq/7pHJBW8gwO6+KTHMMzZNsvhmUaljsbh1r
 L2A56/FJyd264PH9CMfS48dLhaGRnXCagIND8pJXl8bWgDqy2/+o/TbEWYJ9AeX96Q
 3C+pFAKvme5UQ==
Date: Thu, 17 Mar 2022 11:21:56 +1100
To: samba-technical@lists.samba.org
Subject: Re: ctdb nfs rquotad: inconsistency between startup and checks
Message-ID: <20220317112156.3abc7093@martins.ozlabs.org>
In-Reply-To: <CANYNYEHpqsDONcd24SX3GxdRSX6FPR0BH7Ar9mizqke4Rk2T0Q@mail.gmail.com>
References: <CANYNYEHpqsDONcd24SX3GxdRSX6FPR0BH7Ar9mizqke4Rk2T0Q@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Andreas Hasenack <andreas@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

[Replying here on samba-technical, since I would like to discuss a
 fix.  I might reply to your post on the samba list, suggesting removing
 50.rquotad.check and pointing here for more details.]

First, thanks for going to the trouble of understanding the root cause
of this.  I haven't looked at this code in a long time and, even though
I wrote it, you have saved me time by refreshing my understanding.
Thanks!

On Wed, 16 Mar 2022 15:27:08 -0300, Andreas Hasenack via
samba-technical <samba-technical@lists.samba.org> wrote:

> in ctdb/config/nfs-linux-kernel-callout, nfs_rquotad_service contains
> the name of the service that starts/stops the rpc.rquotad daemon.
> 
> If that name is defined, basic_start() and basic_stop() will,
> respectively, use the service command to start/stop it. For example,
> basic_start():
> basic_start ()
> {
>     case "$1" in
>     nfs)
> ...
>         if [ -n "$nfs_rquotad_service" ] ; then
>             service "$nfs_rquotad_service" start
>         fi
> 
> 
> So if you don't define nfs_rquotad_service, it won't be started.
> 
> The nfs event script, however, behaves differently, as there is a
> specific check for rpc.rquotad in
> ctdb/config/nfs-checks.d/50.rquotad.check. Due to that check, if
> rpc.rquotad isn't running, it will be started, either via service
> $nfs_rquotad_service start, or a manual direct invocation of the
> binary.
> 
> In other words, there doesn't seem to be a way to not have rpc.rquotad
> running. Either the callout will start it, or the event script via the
> check. And if you don't have it installed, they will fail. Is this
> desired?

The simplest solution would be to remove (or edit) 50.rquotad.check on
your nodes.  Hopefully the packager has marked it as a configuration
file, so it would not be replaced on upgrade - if not, that is a
packaging bug.  Ha!  I just noticed your Canonical email address, so
you might be the packager.  :-)

However, this doesn't obey the principle of least surprise, and there is
a design flaw here. I have overloaded the meaning of variables like
nfs_rquotad_service. There is an assumption that an unset variable
means it is started elsewhere, which is only really true for Sys-V init.

So, choices are, in nfs-linux-kernel-callout:

1. Insert the following in service_stop() and service_start(), before
   each "# Default to stopping/starting by hand" comment:

     case "$nfs_distro_style" in
     systemd-*) return
     esac

   This would avoid the hand-stop/start when systemd (and, I suppose,
   /etc/nfs.conf) is in use.  It is a hack but it should cover all
   reasonable cases.

2. Introduce a special value for variables like nfs_rquotad_service,
   such as "OFF", and treat this value specially.  This is ugly but
   effective.

3. Split the call-out into systemd and sysvinit versions.  This would
   repeat a lot of code.

I prefer (1).  Do you have an opinion?

> I'm having a problem in a scenario where the server only exports (via
> nfs) gluster mount points, for which, as far as I know, rpc.rquotad is
> useless, and I would prefer to not run it.

Makes sense.

Thanks again...

peace & happiness,
martin


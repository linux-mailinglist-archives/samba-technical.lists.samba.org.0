Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7230D2583FF
	for <lists+samba-technical@lfdr.de>; Tue,  1 Sep 2020 00:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oXqVhIImkBzTcuj3+qrOIR4H3mjkNnQjAEkzCL/+vnc=; b=QjTXxf45YoxjKEcdYNVCWPjbBx
	qt+csASdTpLsFExWpHYPHLXjLWPA4zmXCE8VMo2NgdULz+ftNnsO7vRQmJOIfnooL8tfWM6jUEadx
	WZOTibolJ+9FUE1TPixiHulLiV5KfWn6k4EUUJxZMm7ma13oF3Xjsa9NDsyw8OuviV5Q1yMaLPMU1
	tr3Dc6iY/FWkbEcQiIAwWLKLG6gKcFCDcWX4RRqlPznm/kuquSvo2EUsFy/zVCAPALX5DY9qflyVK
	1xLqsGwW6ZlZSI+MXmhl15JmkYsvabJebiCXroWHjK7i3nyFcNI/WiJz3pOTVvIQ9JLXICIZlhZg9
	UKycSzcA==;
Received: from localhost ([::1]:43166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kCsAs-001VC7-DA; Mon, 31 Aug 2020 22:21:14 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52]:34536) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kCsAl-001VC0-Vg
 for samba-technical@lists.samba.org; Mon, 31 Aug 2020 22:21:11 +0000
Received: by mail-ej1-f52.google.com with SMTP id d26so10630706ejr.1
 for <samba-technical@lists.samba.org>; Mon, 31 Aug 2020 15:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oXqVhIImkBzTcuj3+qrOIR4H3mjkNnQjAEkzCL/+vnc=;
 b=NrNqheIEMG4mwdXB/ih6COg9KYi1Wt+DPZpELPzrGFyzWptDNOclXilkjk58lpTycL
 S66my9k1caXrLEVlr2vtNoVmZpz/ZTfR33D2Wg01lN0V5Pg80uAJYer9UIDWrqW4msro
 OowP2/t/XzKrC4tm/2GUuY+Tx9scbZuiFcu425eAKts9ckdfMgbU44rX8cttEcQSfai4
 5Zj3BDpA2bMgH4WPan80W3bAeEPL0c8W6+ASM+zWsWukPwr/Do+WgmzP675rjSwm1Jwx
 /Elb2PZQSwrpzyHHhFRh/HDpk8DkmDYyQeCl2xDLfg/DZqAvWFISJwcGQT4mscyOp0G1
 Zt0A==
X-Gm-Message-State: AOAM5301TBsFHlizQY5GV0ezSP1mo6b4+j3IOc5XLImEZqi7ySmzPHK7
 OEJMz1qwm5vJpdJx0viU5X9FSlOHCnbST1YGMFBDkjvAMMY=
X-Google-Smtp-Source: ABdhPJwfsi7E00io180Jzbk8MQORILYJ4RBpQJdTe7YwmNLbJoes80F+ffj5bf6Gcd/COKHhJf3fyaWriaD67kgjmNk=
X-Received: by 2002:a17:906:cf82:: with SMTP id
 um2mr2855781ejb.49.1598912463700; 
 Mon, 31 Aug 2020 15:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
In-Reply-To: <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
Date: Mon, 31 Aug 2020 18:20:50 -0400
Message-ID: <CALSyjX7jvBqNEdfY2TR=2-PeRU13U-uKbTNv-zjBP+=sRqh_=A@mail.gmail.com>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: Karolin Seeger <kseeger@samba.org>
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
From: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Taylor <liverbugg@rinux.org>
Cc: Matt Taylor via samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 31, 2020 at 8:53 AM Karolin Seeger via samba-technical
<samba-technical@lists.samba.org> wrote:
> > I get that Bj=C3=B6rn would like to change our mostly-but-not-entirely
> > consistent position from 'all features on by default, turn them off if
> > they don't work for you' (since Waf was introduced) to 'auto-figure
> > what the system has' (what autoconf traditionally did).
> >
> > I also get that we have not been entirely consistent.
> >
> > But we did Waf, and much of this change, back in Samba 4.0 so why is
> > this blocking the release at 4.13?
>
> The point with 4.13.0 is, that the !snapper in the vfs module list does
> not work any longer (and it does in 4.12). It has been broken by commit
> 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a.
>
> Additionally, Samba does not build by default on many non Linux
> plattforms any longer. The auto dection mode "build if possible" is very
> nice for vendors.
>
> Can we revert this patch for 4.13.0?
>
> Cheers,
> Karo
>
> --
> Karolin Seeger                  https://samba.org/~kseeger/
> Release Manager Samba Team      https://samba.org
> Team Lead Samba SerNet          https://sernet.de
>

Would changing the conf.fatal to a Logs.warn in the snapper check
similar to how Ceph and GlusterFS handle their enabling work?  It
looks like that would allow it to continue through to the
shared_modules enable/disable options.

There is also the patch from David in the MR that was dropped from
merging that sets disabled by default for snapper:
https://gitlab.com/samba-team/samba/-/merge_requests/1335/diffs?commit_id=
=3Da324706b52ad792d25e6172b41b620c954b56fd6
but that has the issues Andrew mentions in the MR.

Sorry to have dug up more of a can of worms than expected with my
original patch.

Thanks,

-Matt


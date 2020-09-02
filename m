Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0281D25A885
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 11:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IqVA1gvGLYWxoaX99uH13L2WhAfI0sc2FPcPUM40fmA=; b=hdgDOgmxOGTX82TPpfQ+7/jpGZ
	RRnl4nLOppTZ1Wdd8vJ85Mwu3TJwD6EL1XrHbN+eQiLE0U3CVVWkpKUBrh/aqZwebaLMSi3ttre1h
	GDxmdKEDMACCKsgK4UtickmKlm7elVUWFcaRj6/INgRyjr70itS1SgKIpUyTE5wCJlzdk5AQVvPjj
	tf7KJ+xGnj+w1XTn/xv5WtQ6V9D2Px8aRe3O2rQTArfbCFqmusMmeFt9bGbjUJZNkKW/4PtVg1nJJ
	ki0nvQo/+4lkhlNL7VSvY2ih9t1UkAuBjc0+W3GWUwIQqCDRtW/S7C0Tq1lc507CQQMKe04S00UQB
	rZH7Al4w==;
Received: from localhost ([::1]:40096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDOxd-003U4k-Cr; Wed, 02 Sep 2020 09:21:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27232) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDOxU-003U4d-64
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 09:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=IqVA1gvGLYWxoaX99uH13L2WhAfI0sc2FPcPUM40fmA=; b=nV7YTHL3lTcbFCi3Jnoi/1Uydo
 yyDOtjGiPKnNbjvg6865/qHV+WwgEpnG2Hl4fQt/jlV1dYuCkN+gcksYWjjZ9JUoCo1aRfDwlmSnd
 PtRq0C4afQRQi7Hk0q6NEF3VKZ42iyDelxui7VIM2NCyPGyU6JNvRbbeNjDokIHESt76Z/CN+p5eQ
 OSpW1CAkzmzsR2SzuFtPeQ7oWYqrEmiCm3oNJz6lxauYD9hVB5VbQllp+MCZ19pRR5Hzqfe+TZ5ym
 VYLzBWbNk0VMWkB/hjjwmBTeCowDkCQYwodyKW2fXn4j4BDqdT9jj5tYPAflIoYj4qx4l3dO1PIVg
 AzLCypOS9Ftvz/8CZiJxmhMHJZ2MCHsq37Mi8nR9KZond7TJ6WAWrW1oksEyqJrgPSN65Hclh8bko
 P4f5h69GyNPvqkl3ovOlSC24gn97nix4y0RM2rfHdX3jOY7mbeD3cTkRRbQYOEndAmVZpQMBHFn5I
 V1qsalQm0q7/B+yNiOj7bpJu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDOxS-0000zZ-6y; Wed, 02 Sep 2020 09:21:34 +0000
Date: Wed, 2 Sep 2020 11:21:32 +0200
To: =?UTF-8?B?QmrDtnJu?= JACKE via samba-technical
 <samba-technical@lists.samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200902112132.1f7f4c79@samba.org>
In-Reply-To: <20200901104311.GB760902@sernet.de>
References: <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
 <20200901104311.GB760902@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Matt Taylor <liverbugg@rinux.org>,
 =?UTF-8?B?QmrDtnJu?= JACKE <bj@SerNet.DE>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Tue, 1 Sep 2020 12:43:11 +0200, Bj=C3=B6rn JACKE via samba-technical wro=
te:

> On 2020-08-31 at 14:53 +0200 Karolin Seeger via samba-technical sent off:
> > The point with 4.13.0 is, that the !snapper in the vfs module list does
> > not work any longer (and it does in 4.12). It has been broken by commit
> > 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a.
> >=20
> > Additionally, Samba does not build by default on many non Linux
> > plattforms any longer. The auto dection mode "build if possible" is very
> > nice for vendors.

I respectfully disagree :-). In my opinion "build if possible" behaviour
leads to:
- inconsistent build results depending on host state
- increased wscript complexity
- slower waf configure turnaround

> > Can we revert this patch for 4.13.0? =20
>=20
> reverting the mentioned patch is the most simple and straight forward sol=
ution
> as the newly introduced option is not required and the generic module
> activate/deactive mechanism can be used. Any other solution with redundan=
t new
> options adds more complexity or and possibly conflicts.
>=20
> RB+ from me for the revert of 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a

I've submitted https://gitlab.com/samba-team/samba/-/merge_requests/1547
It fixes --with-shared-modules=3D!vfs_snapper while keeping explicit
disable / enable (default) behaviour.

Cheers, David


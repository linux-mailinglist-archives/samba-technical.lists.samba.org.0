Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B43BF452
	for <lists+samba-technical@lfdr.de>; Thu,  8 Jul 2021 05:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xY8bW0q6ekvKjnzGHtlupZI/6/1bFNd4014aaiNpMXI=; b=d1utLRL2PYj1rP6d+aKECT66gr
	3VN5j+xvZdB1HDXOlEl5y/jLdsykZod6zYOF1LuBuVKD0Mn7NMEhwXYToa1zBziO94VxHMD7ZsueK
	NkbHCFEAT6x/LvRK54vIpUsikaRxSdZO1AVsKgk3mHPftrUGgR0GGyPzKfY1XO+0smWHiFPIWm5i3
	OQBF9gzbck8BPORuiHaYmCtCZcQ1JbVRB5fwuPR2dV4SvU1POO0uxf+Cpbci7ZZcaFEhogBS82t7g
	H4LkG3tXh14fK5AqD7mtK0YhHEu7RE9DQkqp7ps/bqSykKkKB/BGNPNkvi9HcvKA7KaEMQpQgrVl1
	cAr6Cz1w==;
Received: from ip6-localhost ([::1]:31488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m1KtX-00CgdD-VE; Thu, 08 Jul 2021 03:40:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26758) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m1KtR-00Cgd3-NM
 for samba-technical@lists.samba.org; Thu, 08 Jul 2021 03:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=xY8bW0q6ekvKjnzGHtlupZI/6/1bFNd4014aaiNpMXI=; b=ElCSdBOXPY3qFakF4XT4IDJlvA
 +vq+4r7LSljSsoJhLOV04UnhA10ifoxMOrzSHWYlRl7+io708Gw/I3opI8J/yG4eGvOO2hR376zqc
 abh3ABkxGy8MRb3glCEtpe3xdCd9Cf9Ln0Gs3G5wOnq8BNu97B/VTaPyV3dBvqFLB3QFhnMbqAc+s
 784kIDw0TAzXHOpTeeqoTeoWAjewbZDmtHTtfooIcSQLQ3ihVZAjd90IKwzY0HwqvdlSW4WwaYttw
 JM/uXMUVxSvQSSuXMcQjA+QsAF+0CEhp++f+UvJygaJsQT+nHd8893J2IHtqHC5OWtSNh7l0mcBmM
 drC/I8tjMDylmxL93qUifrmO+dMKC3M2G5Bq8vy2uDoe2YxM2PjsdoFm7d8Mpjf037hdZQBdhdVsP
 AyhFZek5SHqq1FlCtzCxNWUezl8WyJWxuT+vmCv9xvhIuWdB5axbgPqDunYY+Qe33Mu+zBM3s5K8o
 B/vdXn2DhNcTGKwjsk0mMUXl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m1KtN-00025r-NF; Thu, 08 Jul 2021 03:40:02 +0000
Message-ID: <6274dd618d9f1cab594dca1df38def15db5d024b.camel@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
To: Stefan Metzmacher <metze@samba.org>, Andrew Bartlett
 <abartlet@samba.org>,  Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>, Isaac Boukris <iboukris@gmail.com>
Date: Thu, 08 Jul 2021 06:39:59 +0300
In-Reply-To: <c328766b-d894-517f-966c-fa5305558633@samba.org>
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
 <c328766b-d894-517f-966c-fa5305558633@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

+ list

On Tue, Jul 6, 2021 at 11:14 AM Stefan Metzmacher <metze@samba.org>
wrote:
>
> We most likely also need to change some apis in order to generate PAC
Tic=
ket checksums
> (Wireshark support is being added by Isaac and me, see
https://gitlab.com=
/wireshark/wireshark/-/merge_requests/3570)
> and also for compound identity PACs when offering FAST.
> "wip: rework PAC and AD-SIGNTICKET for S4U2Proxy support"
> https://github.com/heimdal/heimdal/pull/767
> might also be related here.

I took a look at PR 767 (which is related to bug 14642), I managed to
get a poc working, that is the kdc is now able to issue a minimal PAC
with all signatures even without hdb support, this would allow the
removal of KRB5SignedPath while keeping S4U2Proxy and its upstream
test working (we don't need delegation-info for that, and we can live
on the NDR boundary), I've updated the PR. Here is an example captured
from the upstream tests:

authorization-data: 1 item
    AuthorizationData item
        ad-type: aD-IF-RELEVANT (1)
        ad-data:
308197308194a00402020080a1818b04818804000000000000000a00000010000000480
0=E2=
=80=A6
            AuthorizationData item
                ad-type: aD-WIN2K-PAC (128)
                ad-data:
04000000000000000a00000010000000480000000000000006000000100000005800000
0=E2=
=80=A6
                    Verified Server checksum 16 keytype 18 using
keytab principal host/datan.test.h5l.se@TEST.H5L.SE (id=3Dkeytab.1
same=3D0) (ce52810b...)
                    Verified KDC checksum 16 keytype 18 using keytab
principal krbtgt/TEST.H5L.SE@TEST.H5L.SE (id=3Dkeytab.27 same=3D0)
(ee737882...)
                    Verified Ticket checksum 16 keytype 18 using
keytab principal krbtgt/TEST.H5L.SE@TEST.H5L.SE (id=3Dkeytab.27
same=3D0)
(ee737882...)
                    Num Entries: 4
                    Version: 0
                    Type: Client Info Type (10)
                    Type: Server Checksum (6)
                    Type: Privsvr Checksum (7)
                    Type: Ticket Checksum (16)

I'm still confuse about how '_kdc_pac_verify()' should look like, I
think samba might be picky about the kdc_key (mostly relevant to be
able to act as a DC along other Windows DCs in the same domain),
perhaps we should split the api as it is currently overloaded imo.



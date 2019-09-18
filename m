Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D28B5924
	for <lists+samba-technical@lfdr.de>; Wed, 18 Sep 2019 02:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xV+YK8HCAobaFn6kImj7TRdpJs1h7hZT7/xIMegXL9c=; b=3m8b7d/GZ9sstEDYc4KFcEMpx2
	MQyKcslkcPldRF5ztKt8xJX1qaj5dAFQcBHAqlVa+m0KQ1UKfKcT/VcyALItfVcpUwp3Zt4RXAhd/
	0SkBiUDMFselyt81SCgog9/tEMvR5Jsno6IlWxVOFdVStdxNveyZN+XW6zeHEqNzCJeLtvNIAFb4Q
	4P7y2wzzziFG35+oaPZnhaA6LrM73+4cYfUZSeQDC/A4vMLi9gcFGQOxjgxzXICicrBstFf8kyZiX
	9n152q73R6VWfRzRwhrJVpycLNIoyVWf53P0f3EQfX4OyEDJtd4emeubG1SmxFVUYqlhFA1MYT//g
	W4lIt9DA==;
Received: from localhost ([::1]:32040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAOJq-006MX4-05; Wed, 18 Sep 2019 00:59:42 +0000
Received: from mailout4.samsung.com ([203.254.224.34]:25054) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iAOJj-006MWV-Jk
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 00:59:39 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190918005927epoutp042631c610421624671faff74e6d3c36a7~FYoS1Z42_1886018860epoutp04w
 for <samba-technical@lists.samba.org>; Wed, 18 Sep 2019 00:59:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190918005927epoutp042631c610421624671faff74e6d3c36a7~FYoS1Z42_1886018860epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568768367;
 bh=xV+YK8HCAobaFn6kImj7TRdpJs1h7hZT7/xIMegXL9c=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=ZCAEyW3K2eqTPFL+hvrmRr+v75DsjPaLcGM1IwUMD0mSBQkWYGQB7jFy14aEMjfo/
 8l79ejW0y1pOyB7SiiXmKKoSs1sUDWLjetXJDMrXF+SQH1PPXV57phY2tPZGqrbptT
 y8bI1YuiBxacxaPQKOuwkyA6quoEesrd05guvDdw=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20190918005927epcas1p38c6230e1e311f7b9b4a11e5944ee3ecd~FYoSpu9Hs3049630496epcas1p3J;
 Wed, 18 Sep 2019 00:59:27 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.164]) by
 epsnrtp5.localdomain (Postfix) with ESMTP id 46Y1pQ0MjPzMqYkW; Wed, 18 Sep
 2019 00:59:26 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 3C.81.04085.D61818D5; Wed, 18 Sep 2019 09:59:25 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190918005924epcas1p137f8dc36d9a57b7443714c7b2c908909~FYoQho7Ny0490004900epcas1p1a;
 Wed, 18 Sep 2019 00:59:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190918005924epsmtrp10eb1e3bcea078a61a83186cf3e500d76~FYoQSwQ4X1140211402epsmtrp1W;
 Wed, 18 Sep 2019 00:59:24 +0000 (GMT)
X-AuditID: b6c32a39-cebff70000000ff5-f1-5d81816df5bc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4D.3B.03706.C61818D5; Wed, 18 Sep 2019 09:59:24 +0900 (KST)
Received: from DONAMJAEJEO06 (unknown [10.88.104.63]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190918005924epsmtip27ba19399a355f00074a5a0b39c3a2670~FYoQGmf-12472724727epsmtip2P;
 Wed, 18 Sep 2019 00:59:24 +0000 (GMT)
To: "'Andrew Bartlett'" <abartlet@samba.org>
In-Reply-To: <1568767835.4377.53.camel@samba.org>
Subject: RE: samba performance difference between old and the latest ?
Date: Wed, 18 Sep 2019 09:59:24 +0900
Message-ID: <002801d56dbc$5031fc30$f095f490$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQIZax4NKmV56qsUv9QoMnuR58a1nQGzAbk3Awr3XHcCy+HZHAHztVvNAU/WHooCLrcHsqZAwEvQ
Content-Language: ko
X-CMS-MailID: 20190918005924epcas1p137f8dc36d9a57b7443714c7b2c908909
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com>
 <371f328678d7f01b7051d657499ec0f8b341b2f9.camel@samba.org>
 <CAKYAXd80cwJ2XUOBoP25M94mB_P200Y7BnajsSZwWkMuuXO8Yg@mail.gmail.com>
 <b34d077e33bcb6e72a25e6cd0b32ed28e570c7e0.camel@samba.org>
 <001c01d56db8$a5ec1420$f1c43c60$@samsung.com>
 <1568767835.4377.53.camel@samba.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <namjae.jeon@samsung.com>
Cc: sergey.senozhatsky@gmail.com, 'Namjae Jeon' <linkinjeon@gmail.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> Thanks so much for getting back to us.  Make sure to catch up with the
> Samba Team at SDC to pin this down further.
WC, Okay:)
> 
> Finally, to ensure I understand your reply correctly:  Is it correct
> that 4.8.12 is 'normal', but 4.9.13 is 'slow'?
The performance of all upper versions included 4.8.12 are degraded.
i.e. 4.7.12 is normal, 4.8.12 ~ 4.11.0 are slow.

Thanks~
> 
> Thanks!
> 
> Andrew Bartlett
> 
> On Wed, 2019-09-18 at 09:33 +0900, Namjae Jeon via samba-technical
> wrote:
> > Hi Andrew,
> >
> > I'm sorry I'm late. I forgot because there are many issues this week.
> > I just checked that the performance is degraded from samba 4.8.12.
> > The version I checked is as follows.
> >
> > 4.7.12
> > 4.8.12 <--- performance degration
> > 4.9.13
> > 4.10.6
> > 4.11.0
> >
> > I can look at samba changes more, but I am sorry that I couldn't help
> > you much because of the event(SDC 2019) next week:)
> >
> > Thanks!
> >
> > > -----Original Message-----
> > > From: Andrew Bartlett [mailto:abartlet@samba.org]
> > > Sent: Wednesday, September 18, 2019 4:33 AM
> > > To: Namjae Jeon
> > > Cc: Namjae Jeon; sergey.senozhatsky@gmail.com; samba-
> > > technical@lists.samba.org
> > > Subject: Re: samba performance difference between old and the latest ?
> > >
> > > On Sat, 2019-09-07 at 14:58 +0900, Namjae Jeon via samba-technical
> > > wrote:
> > > > 2019-09-07 12:20 GMT+09:00, Andrew Bartlett via samba-technical
> > > > <samba-technical@lists.samba.org>:
> > > > > On Fri, 2019-09-06 at 11:01 +0900, Namjae Jeon via samba-technical
> > > > > wrote:
> > > > > > Hello,
> > > > > >
> > > > > > I found something strange during measuring performance with samba
> > > > > > these days.
> > > > > > I checked the performance of samba 4.7.6 and 4.10.6.
> > > > >
> > > > >
> > > > > > samba 4.7.6 : 11.6MB/s
> > > > > > samba 4.10.6 : 9.5MB/s
> > > > > >
> > > > >
> > > > > Jumping back to the top of this thread to focus on what you could
> > > > > help
> > > > > us with.  If you built Samba for both of these tests, then perhaps
> > > > > you
> > > > > could do a git bisect between those two versions to work out where
> > > > > this
> > > > > degraded?
> > > >
> > > > Yes, I agree to narrow it down.
> > > > >
> > > > > Of course, this assumes it was a single commit, but who knows, it
> > > > > just
> > > > > might be.
> > > > >
> > > > > Either way, if you were able to additionally test 4.7.latest,
> > > > > 4.8.latest, 4.9.latest, 4.11.0rc3 and master (so as to add to the
> > > > > dataset) it would be a massive help.
> > > >
> > > > Hm, okay, I will make time.
> > >
> > > G'Day Namjae,
> > >
> > > I just wondered if you had any more numbers to share with us?
> > >
> > > I know I asked for a lot of work, but we would really appreciate any
> > > insights you have on this.
> > >
> > > Thanks!
> > >
> > > Andrew Bartlett
> > > --
> > > Andrew Bartlett                       https://samba.org/~abartlet/
> > > Authentication Developer, Samba Team  https://samba.org
> > > Samba Developer, Catalyst IT
> > > https://catalyst.net.nz/services/samba
> > >
> > >
> >
> >
> >
> --
> Andrew Bartlett
> https://samba.org/~abartlet/
> Authentication Developer, Samba Team         https://samba.org
> Samba Development and Support, Catalyst IT
> https://catalyst.net.nz/services/samba
> 
> 
> 




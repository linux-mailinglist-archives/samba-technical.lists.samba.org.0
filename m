Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57294B590A
	for <lists+samba-technical@lfdr.de>; Wed, 18 Sep 2019 02:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YTc4YOA2CSQ9g2pbidIBNCa1w2TZSgpIgQbRKXIZSZY=; b=XhFhv/oKzofzb7D+D3qM6OaCw9
	VQS2JLD9DXbepgthpVXzwWl/mzm3kvrn8Gkzc+YASr4RhcHV/ZkKgwiuyJWhVEt/SYqnvoy0LhPc3
	txbA5d+n/hPYpNnQ8z/kBrt63G/rN/mkvAxs6seLr0gOKunRzj1xPvemWHoGQk/VaH0MiFnkHYZ0l
	ru9U/AO2ZrF0ni7/2lOUAWtiJoLVaAjfafwK+8ehtATQgaCh4svEK02UuX5o8g1k15ZA+YBLS3j1p
	OSYsE8JJ8yqs/IfGShTyVnbjlAQHM0iTM1KH/wmJ5HV19eLJtf4k57TVWjzfYppp+nNdhF1MLHC9Y
	8trL86ew==;
Received: from localhost ([::1]:30050 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iANuS-006M9D-8U; Wed, 18 Sep 2019 00:33:28 +0000
Received: from mailout1.samsung.com ([203.254.224.24]:49738) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iANuL-006M91-WA
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 00:33:25 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20190918003313epoutp017876faa14e9d456a466023de7af0f54b~FYRZKRoNO1568115681epoutp01M
 for <samba-technical@lists.samba.org>; Wed, 18 Sep 2019 00:33:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20190918003313epoutp017876faa14e9d456a466023de7af0f54b~FYRZKRoNO1568115681epoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568766793;
 bh=YTc4YOA2CSQ9g2pbidIBNCa1w2TZSgpIgQbRKXIZSZY=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=KacJMuK0K2oYgnmKn48KfZyMbb0KvtZIWpG/IZtSbdTprv8qZiv9LSP1ULMCEozve
 NLGXStsA5Vhrzqr9Tau2MXRARRuSICWoWfaEjDeKTP2ghTt2TDwTQnMsPKHliE+KEz
 nQ7a5OIPAVXd0Uhadxz8B6gOzNkwbj0Z9HZOrXvA=
Received: from epsnrtp6.localdomain (unknown [182.195.42.167]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20190918003313epcas1p3a08e4eb7a09cf07bad4e9095a9a5d268~FYRY8eMz92797727977epcas1p3-;
 Wed, 18 Sep 2019 00:33:13 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.161]) by
 epsnrtp6.localdomain (Postfix) with ESMTP id 46Y1D76V8szMqYkc; Wed, 18 Sep
 2019 00:33:11 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 0E.34.04160.64B718D5; Wed, 18 Sep 2019 09:33:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20190918003310epcas1p390e96af020e30157680ab53ebb524f16~FYRWKzAOZ2797727977epcas1p32;
 Wed, 18 Sep 2019 00:33:10 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190918003310epsmtrp2239a7c7812caf3d0462cbcd85cd07868~FYRWKKH0t2110421104epsmtrp2I;
 Wed, 18 Sep 2019 00:33:10 +0000 (GMT)
X-AuditID: b6c32a38-b4bff70000001040-bc-5d817b46a966
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 96.AA.03638.64B718D5; Wed, 18 Sep 2019 09:33:10 +0900 (KST)
Received: from DONAMJAEJEO06 (unknown [10.88.104.63]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190918003310epsmtip229b9d75bddf7b46b5796dfdc758cd453~FYRWCS_5a1088510885epsmtip2S;
 Wed, 18 Sep 2019 00:33:10 +0000 (GMT)
To: "'Andrew Bartlett'" <abartlet@samba.org>
In-Reply-To: <b34d077e33bcb6e72a25e6cd0b32ed28e570c7e0.camel@samba.org>
Subject: RE: samba performance difference between old and the latest ?
Date: Wed, 18 Sep 2019 09:33:09 +0900
Message-ID: <001c01d56db8$a5ec1420$f1c43c60$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQIZax4NKmV56qsUv9QoMnuR58a1nQGzAbk3Awr3XHcCy+HZHAHztVvNplysg/A=
Content-Language: ko
X-CMS-MailID: 20190918003310epcas1p390e96af020e30157680ab53ebb524f16
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

Hi Andrew,

I'm sorry I'm late. I forgot because there are many issues this week. 
I just checked that the performance is degraded from samba 4.8.12. 
The version I checked is as follows.

4.7.12
4.8.12 <--- performance degration
4.9.13
4.10.6
4.11.0

I can look at samba changes more, but I am sorry that I couldn't help
you much because of the event(SDC 2019) next week:)

Thanks!

> -----Original Message-----
> From: Andrew Bartlett [mailto:abartlet@samba.org]
> Sent: Wednesday, September 18, 2019 4:33 AM
> To: Namjae Jeon
> Cc: Namjae Jeon; sergey.senozhatsky@gmail.com; samba-
> technical@lists.samba.org
> Subject: Re: samba performance difference between old and the latest ?
> 
> On Sat, 2019-09-07 at 14:58 +0900, Namjae Jeon via samba-technical
> wrote:
> > 2019-09-07 12:20 GMT+09:00, Andrew Bartlett via samba-technical
> > <samba-technical@lists.samba.org>:
> > > On Fri, 2019-09-06 at 11:01 +0900, Namjae Jeon via samba-technical
> > > wrote:
> > > > Hello,
> > > >
> > > > I found something strange during measuring performance with samba
> > > > these days.
> > > > I checked the performance of samba 4.7.6 and 4.10.6.
> > >
> > >
> > > > samba 4.7.6 : 11.6MB/s
> > > > samba 4.10.6 : 9.5MB/s
> > > >
> > >
> > > Jumping back to the top of this thread to focus on what you could
> > > help
> > > us with.  If you built Samba for both of these tests, then perhaps
> > > you
> > > could do a git bisect between those two versions to work out where
> > > this
> > > degraded?
> >
> > Yes, I agree to narrow it down.
> > >
> > > Of course, this assumes it was a single commit, but who knows, it
> > > just
> > > might be.
> > >
> > > Either way, if you were able to additionally test 4.7.latest,
> > > 4.8.latest, 4.9.latest, 4.11.0rc3 and master (so as to add to the
> > > dataset) it would be a massive help.
> >
> > Hm, okay, I will make time.
> 
> G'Day Namjae,
> 
> I just wondered if you had any more numbers to share with us?
> 
> I know I asked for a lot of work, but we would really appreciate any
> insights you have on this.
> 
> Thanks!
> 
> Andrew Bartlett
> --
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT
> https://catalyst.net.nz/services/samba
> 
> 




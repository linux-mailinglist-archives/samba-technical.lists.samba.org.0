Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5459309FC3
	for <lists+samba-technical@lfdr.de>; Mon,  1 Feb 2021 01:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jthPfYHSpZjFyFNEnErqJe2Ug7bG9MJoOmdIubaig3A=; b=l2gg4gnDvB23l52wkWXY1VICHd
	in4PIvpTD8oQ/J4kX4zq6cD4zpEHEma5tBpno6JQ1WrGMUfRaLCeInY+pdyDp54Y0XfZGK6sOyb6p
	6bAugW5q9qMoVACfs82jCaZjhRyX6R4GyDD7nBN8weh3HkxQnrt3JXWbQTDHGFyGIwBc7RIWo1DuH
	8IUkB7mKWOl6Wqzb2G2yGuzwPCDRCErzuuuDyWe3NGfZge4P6j2KxrTIvo5lnn1FzKl/NENIAM2eK
	i5sZ8zXOM4J2I9djB8fJC9LNqrrcWbxLmCpHNcppJShSHalZeo/FrMd3jwawnnHi4STl7UJ3ds3Fh
	AKwL/yFg==;
Received: from ip6-localhost ([::1]:61302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l6NO4-009vGs-QE; Mon, 01 Feb 2021 00:48:16 +0000
Received: from mailout1.samsung.com ([203.254.224.24]:36969) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1l6NNk-009vGl-74
 for samba-technical@lists.samba.org; Mon, 01 Feb 2021 00:48:05 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210201004746epoutp0111d870253cb97a334635a31a808e8629~feTZ6I93z2870928709epoutp01j
 for <samba-technical@lists.samba.org>; Mon,  1 Feb 2021 00:47:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210201004746epoutp0111d870253cb97a334635a31a808e8629~feTZ6I93z2870928709epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612140466;
 bh=jthPfYHSpZjFyFNEnErqJe2Ug7bG9MJoOmdIubaig3A=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=T+hbkU9XOyT4rXOyQyx3DdZtTrHFokCpooDdOIqvWIUMgZWtptdWtAkkKNnLkeBR5
 TKODF/kz/bT9ztFVnQUjBalMc8Q/HYgd5qEu7Mge4+MKvlfPsH7plChGn1JQD6LBGI
 x1WvAYpmeLlJFr2u8Fpfnn+sjF2h85HDWlc7hyms=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210201004745epcas1p2928adb0270c60ebcabd4b7fc5aa2639e~feTZQ3JDC1330813308epcas1p2j;
 Mon,  1 Feb 2021 00:47:45 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.166]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4DTTnD3Y6Rz4x9Q7; Mon,  1 Feb
 2021 00:47:44 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C7.63.63458.0BF47106; Mon,  1 Feb 2021 09:47:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20210201004743epcas1p3d6070b20d5e4c3b5fdfc5b3a102c4307~feTXHPXER2189421894epcas1p3K;
 Mon,  1 Feb 2021 00:47:43 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210201004743epsmtrp21ca8da5f8e9a30a2ffe62f21234a6613~feTXF9NmM0429404294epsmtrp2O;
 Mon,  1 Feb 2021 00:47:43 +0000 (GMT)
X-AuditID: b6c32a36-6c9ff7000000f7e2-1c-60174fb09220
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 04.A1.08745.FAF47106; Mon,  1 Feb 2021 09:47:43 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210201004743epsmtip2a345cf83f218cb3fe0e0e330f4ec1315~feTW7muRM0640406404epsmtip2S;
 Mon,  1 Feb 2021 00:47:43 +0000 (GMT)
To: "'Steve French'" <smfrench@gmail.com>
In-Reply-To: <CAH2r5mutwPP570YbwxDWikwM6e+gdD7m2iwMJ5xNEcvqpkVrNg@mail.gmail.com>
Subject: RE: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
Date: Mon, 1 Feb 2021 09:47:43 +0900
Message-ID: <000101d6f833$d9c38ba0$8d4aa2e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGl6IhnSLG/1SsUO9NpARHPFZxSUgHLNQ68Ax7baU4BuzjdCwG11peXqmG9YHA=
Content-Language: ko
X-CMS-MailID: 20210201004743epcas1p3d6070b20d5e4c3b5fdfc5b3a102c4307
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a
References: <CGME20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a@epcas1p2.samsung.com>
 <20210126022335.27311-1-namjae.jeon@samsung.com>
 <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
 <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
 <CAH2r5mutwPP570YbwxDWikwM6e+gdD7m2iwMJ5xNEcvqpkVrNg@mail.gmail.com>
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
Cc: 'Stefan Metzmacher' <metze@samba.org>,
 'Samba Technical' <samba-technical@lists.samba.org>,
 'Namjae Jeon' <linkinjeon@kernel.org>, linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> FYI - I have rebased the cifsd-for-next branch onto 5.11-rc6
Let me check it!

Thanks!
> 
> https://protect2.fireeye.com/v1/url?k=776f3edf-28f407c5-776eb590-0cc47a6cba04-
> 039abc8d8963817e&q=1&e=3337a309-5806-4005-8f00-
> b7312c0621f1&u=https%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel.git
> 
> On Tue, Jan 26, 2021 at 4:46 PM Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
> wrote:
> >
> > 2021-01-26 23:36 GMT+09:00, Stefan Metzmacher via samba-technical
> > <samba-technical@lists.samba.org>:
> > > Hi Namjae,
> > Hi Metze,
> > >
> > >> Samba team request that ksmbd should make xattr format of ksmbd
> > >> compatible with samba's one. When user replace samba with ksmbd or
> > >> replace ksmbd with samba, The written attribute and ACLs of xattr
> > >> in file should be used on both server. This patch work the
> > >> following ones.
> > >>  1. make xattr prefix compaible.
> > >>     - rename creation.time and file.attribute to DOSATTRIB.
> > >>     - rename stream. to DosStream.
> > >>     - rename sd. to NTACL.
> > >>  2. use same dos attribute and ntacl structure compaible with samba.
> > >>  3. create read/write encoding of ndr functions in ndr.c to store ndr
> > >>     encoded metadata to xattr.
> > >
> > > Thanks a lot!
> > >
> > > Do you also have this a git commit in some repository?
> > Yes, You can check github.com/cifsd-team/cifsd
> > tree(https://protect2.fireeye.com/v1/url?k=abb45e79-f42f6763-abb5d536-0cc47a6cba04-
> 4d12d0be7dd14e1f&q=1&e=3337a309-5806-4005-8f00-b7312c0621f1&u=https%3A%2F%2Fgithub.com%2Fcifsd-
> team%2Fcifsd%2Fcommit%2F0dc106786d40457e276f50412ecc67f11422dd1e).
> > And there is a cifsd-for-next branch in
> > github.com/smfrench/smb3-kernel for upstream.
> > I have made a patch for that git tree, but I haven't fully tested it yet...
> > I'm planning to send a pull request to Steve this week after doing it.
> > >
> > > I played with ksmbd a bit in the last days.
> > Cool.
> > >
> > > I can also test this commit and check if the resulting data is
> > > compatible with samba.
> > Great!  Let me know your opinion if there is something wrong:) Thank
> > you so much for your help!
> > >
> > > metze
> > >
> > >
> >
> 
> 
> --
> Thanks,
> 
> Steve



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F685312B19
	for <lists+samba-technical@lfdr.de>; Mon,  8 Feb 2021 08:29:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MP46nDGAqWLFcidnx9lnN21j7YDuNPr08szG3smj5gY=; b=t86CKrKwcduyEFBzWB8ReK49S4
	N4OCwblnBq6OcGCSmd1AYW3TVG0owDQeIg65Sk6VyeWG+G/ZXbpPhiXA0XZzOvQVMZTBKWPkhnA28
	PbOgXZKkPJF6vDYAWPN/mvezb+O1R3hJ7eHUOwvK4rmIq3I01/sR9FXVGeho2DPoas/avaa0dAR92
	5/j8RpiUaRdl+dJ97ZSPJFSs6WsN/URSt66NZXnywKBtgiMh4JEqZcE2zHXrkljJXxArXoMMGQS4s
	E18mctFVKaZRJP8VSzmn+Al42L9cL7i/fdhbTq1D8HVI7GhMqRDoZiACiH1RqLWEKbWEOiIU10qzH
	nDUvRTrA==;
Received: from ip6-localhost ([::1]:33956 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l90yn-00BbUi-Re; Mon, 08 Feb 2021 07:29:05 +0000
Received: from mailout1.samsung.com ([203.254.224.24]:38613) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1l90ya-00BbUa-Kc
 for samba-technical@lists.samba.org; Mon, 08 Feb 2021 07:28:57 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210208072842epoutp013fa845a5c9b42742a328c5c563881dc3~htSdsZi5I1032010320epoutp01r
 for <samba-technical@lists.samba.org>; Mon,  8 Feb 2021 07:28:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210208072842epoutp013fa845a5c9b42742a328c5c563881dc3~htSdsZi5I1032010320epoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612769322;
 bh=MP46nDGAqWLFcidnx9lnN21j7YDuNPr08szG3smj5gY=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=h/qCxqxiwfFCZ1f/b3ZEhXa+pboglBuPxM3kIw/d8xyHdf/TQft6BaChdfEH93n1+
 2dFhApizdFfO64K1Dj17ME0d55R7mQFDwZV0N90dMCR7hLg2x5PVxUJZDB8Me3Ro3z
 bXTYWrXbNclBgH8mA8eABcl+U8eYZKaye0SnAtnM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20210208072842epcas1p4c3a9662aeb7c1f6945d9d7c9324236f9~htSdZSa062262122621epcas1p4H;
 Mon,  8 Feb 2021 07:28:42 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.165]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4DYyLc6Qdkz4x9Pr; Mon,  8 Feb
 2021 07:28:40 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 0B.00.09582.628E0206; Mon,  8 Feb 2021 16:28:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20210208072838epcas1p4263cd7632a6e6f01535ba92fb623d298~htSZhNh_-0911209112epcas1p4Y;
 Mon,  8 Feb 2021 07:28:38 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210208072838epsmtrp2c9361e21fdaa253d755873c6ca39c4de~htSZghXlr1935219352epsmtrp2F;
 Mon,  8 Feb 2021 07:28:38 +0000 (GMT)
X-AuditID: b6c32a37-8afff7000000256e-59-6020e82647c0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B5.E2.08745.528E0206; Mon,  8 Feb 2021 16:28:37 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210208072837epsmtip19346371cc9434d5f64ef521b2255cc47~htSZVYT8r2363123631epsmtip1N;
 Mon,  8 Feb 2021 07:28:37 +0000 (GMT)
To: "'Steve French'" <smfrench@gmail.com>
In-Reply-To: <CAH2r5mtmmei0q9kemkjL-QyDfeiNNYCidAuqX=WN0PncoqiokA@mail.gmail.com>
Subject: RE: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
Date: Mon, 8 Feb 2021 16:28:37 +0900
Message-ID: <017501d6fdec$04418400$0cc48c00$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGl6IhnSLG/1SsUO9NpARHPFZxSUgHLNQ68Ax7baU4BuzjdCwG11peXAcHI8CgBpXVnkKpR8o9w
Content-Language: ko
X-CMS-MailID: 20210208072838epcas1p4263cd7632a6e6f01535ba92fb623d298
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
 <000101d6f833$d9c38ba0$8d4aa2e0$@samsung.com>
 <CAH2r5mtmmei0q9kemkjL-QyDfeiNNYCidAuqX=WN0PncoqiokA@mail.gmail.com>
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
Cc: 'Stefan Metzmacher' <metze@samba.org>, 'CIFS' <linux-cifs@vger.kernel.org>,
 'Samba Technical' <samba-technical@lists.samba.org>,
 'Namjae Jeon' <linkinjeon@kernel.org>, linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> I have rebased cifsd-for-next on 5.11-rc7
Okay.

> 
> Will kick off some buildbot tests with it this week - it is looking good so far, but let me know of
> other PRs coming soon
I have just sent a PR. Please check it.
And I will test on rebased #cifsd-for-next. If you find any issue, Let me know it.

Thanks!
> 
> On Sun, Jan 31, 2021 at 6:47 PM Namjae Jeon <namjae.jeon@samsung.com> wrote:
> >
> > > FYI - I have rebased the cifsd-for-next branch onto 5.11-rc6
> > Let me check it!
> >
> > Thanks!
> > >
> > > https://protect2.fireeye.com/v1/url?k=776f3edf-28f407c5-776eb590-0cc
> > > 47a6cba04-
> > > 039abc8d8963817e&q=1&e=3337a309-5806-4005-8f00-
> > > b7312c0621f1&u=https%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel.git
> > >
> > > On Tue, Jan 26, 2021 at 4:46 PM Namjae Jeon via samba-technical
> > > <samba-technical@lists.samba.org>
> > > wrote:
> > > >
> > > > 2021-01-26 23:36 GMT+09:00, Stefan Metzmacher via samba-technical
> > > > <samba-technical@lists.samba.org>:
> > > > > Hi Namjae,
> > > > Hi Metze,
> > > > >
> > > > >> Samba team request that ksmbd should make xattr format of ksmbd
> > > > >> compatible with samba's one. When user replace samba with ksmbd
> > > > >> or replace ksmbd with samba, The written attribute and ACLs of
> > > > >> xattr in file should be used on both server. This patch work
> > > > >> the following ones.
> > > > >>  1. make xattr prefix compaible.
> > > > >>     - rename creation.time and file.attribute to DOSATTRIB.
> > > > >>     - rename stream. to DosStream.
> > > > >>     - rename sd. to NTACL.
> > > > >>  2. use same dos attribute and ntacl structure compaible with samba.
> > > > >>  3. create read/write encoding of ndr functions in ndr.c to store ndr
> > > > >>     encoded metadata to xattr.
> > > > >
> > > > > Thanks a lot!
> > > > >
> > > > > Do you also have this a git commit in some repository?
> > > > Yes, You can check github.com/cifsd-team/cifsd
> > > > tree(https://protect2.fireeye.com/v1/url?k=abb45e79-f42f6763-abb5d
> > > > 536-0cc47a6cba04-
> > > 4d12d0be7dd14e1f&q=1&e=3337a309-5806-4005-8f00-b7312c0621f1&u=https%
> > > 3A%2F%2Fgithub.com%2Fcifsd-
> > > team%2Fcifsd%2Fcommit%2F0dc106786d40457e276f50412ecc67f11422dd1e).
> > > > And there is a cifsd-for-next branch in
> > > > github.com/smfrench/smb3-kernel for upstream.
> > > > I have made a patch for that git tree, but I haven't fully tested it yet...
> > > > I'm planning to send a pull request to Steve this week after doing it.
> > > > >
> > > > > I played with ksmbd a bit in the last days.
> > > > Cool.
> > > > >
> > > > > I can also test this commit and check if the resulting data is
> > > > > compatible with samba.
> > > > Great!  Let me know your opinion if there is something wrong:)
> > > > Thank you so much for your help!
> > > > >
> > > > > metze
> > > > >
> > > > >
> > > >
> > >
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
> >
> 
> 
> --
> Thanks,
> 
> Steve



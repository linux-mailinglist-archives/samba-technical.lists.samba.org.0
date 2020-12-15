Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E992DA635
	for <lists+samba-technical@lfdr.de>; Tue, 15 Dec 2020 03:29:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=skR/Qw2vVXW43PtNfvgOG+lsDO70LbpjjpQF3CxZK4A=; b=Y6JF7ay+qr35UCXS1fW772rYJ+
	qvYytOm77ER8i8nr4wux5O1zKRfiES1um0E+scMNc6F3h3ijnHDDwsrqyiiEOEAqY7VAZ+dKJ5dW9
	57ojJlLatXUlezY8OiODOhYRX0WzqrgyN1YuBD9kcFB7h8rIOPWe+vg0EPZhMvfiMt6DG4poSvOfW
	N2lPW19NUuE0Am017X52OwO6NgT0heQXVKW8eOPM9GJY+ZTji+qlUa2IU+wr6fTTXkileRuBCacA2
	fmc+AkV1AiD1N8eLl7WUvbYF8WvoN3W5KWRacKTVTVgodkzHp132GK+ktKEjW3WL+Lacomo5RQ2Cz
	EV+y2nFQ==;
Received: from ip6-localhost ([::1]:41182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kp05S-001GoG-7j; Tue, 15 Dec 2020 02:29:14 +0000
Received: from mailout1.samsung.com ([203.254.224.24]:30738) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kp05N-001Go7-E8
 for samba-technical@lists.samba.org; Tue, 15 Dec 2020 02:29:11 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201215022903epoutp01a28fe8a9b0d6dd06fad1ee4facdfaf7d~QwuIsRAXO3202032020epoutp01U
 for <samba-technical@lists.samba.org>; Tue, 15 Dec 2020 02:29:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201215022903epoutp01a28fe8a9b0d6dd06fad1ee4facdfaf7d~QwuIsRAXO3202032020epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1607999343;
 bh=skR/Qw2vVXW43PtNfvgOG+lsDO70LbpjjpQF3CxZK4A=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Eph1UMz5Kz1sElOOpnNGwRXtbQ0mpgztVwkrry2x9cd1dByssfsOKCt6iBrzv3tKX
 pSxBB0Aqm+GZJNmsS/ohHkJIca5i6Czq1fmN9/4rylNXad/S5l5RQNul8K1NKvfPrw
 vvaKcVwFnUktUNGpjGjt7K2RPwe1DfySjCCLW68M=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20201215022903epcas1p38b3bce90b33ebcb2be699d0a6f8c9929~QwuIWlCjK0252402524epcas1p3x;
 Tue, 15 Dec 2020 02:29:03 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.166]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Cw2JG18hKz4x9QB; Tue, 15 Dec
 2020 02:29:02 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 45.54.09577.E6F18DF5; Tue, 15 Dec 2020 11:29:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201215022901epcas1p2ee0986ba0904d6ed250a51f8503ab143~QwuGjR7Ua2038320383epcas1p2a;
 Tue, 15 Dec 2020 02:29:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201215022901epsmtrp178580bb63cdcc826e18ee9b95881c44f~QwuGiktuL2597025970epsmtrp1w;
 Tue, 15 Dec 2020 02:29:01 +0000 (GMT)
X-AuditID: b6c32a39-c13ff70000002569-7a-5fd81f6e9904
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0D.D0.13470.D6F18DF5; Tue, 15 Dec 2020 11:29:01 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201215022901epsmtip2a85b7752cb1f9f24e93665d3630129be~QwuGZHtcz2948929489epsmtip2L;
 Tue, 15 Dec 2020 02:29:01 +0000 (GMT)
To: "'Jeremy Allison'" <jra@samba.org>, "'Stefan Metzmacher'" <metze@samba.org>
In-Reply-To: <20201214184820.GB56567@jeremy-acer>
Subject: RE: updated ksmbd (cifsd)
Date: Tue, 15 Dec 2020 11:29:01 +0900
Message-ID: <003b01d6d28a$0caa3750$25fea5f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDtjnMiCa1AcmvYMj1ELhOClJiQLwMbPjBGAcAX0rICKWbi6KuRyyDg
Content-Language: ko
X-CMS-MailID: 20201215022901epcas1p2ee0986ba0904d6ed250a51f8503ab143
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201214184832epcas1p2095ebcc51c22fd003316c0e2334b9e1b
References: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
 <3bf45223-484a-e86a-279a-619a779ceabd@samba.org>
 <CGME20201214184832epcas1p2095ebcc51c22fd003316c0e2334b9e1b@epcas1p2.samsung.com>
 <20201214184820.GB56567@jeremy-acer>
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
Cc: 'Steve French' <smfrench@gmail.com>,
 'samba-technical' <samba-technical@lists.samba.org>,
 'CIFS' <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


> On Mon, Dec 14, 2020 at 06:45:51PM +0100, Stefan Metzmacher via samba-technical wrote:
> >Am 14.12.20 um 02:20 schrieb Steve French via samba-technical:
> >> I just rebased https://protect2.fireeye.com/v1/url?k=e100f21c-be9bcb17-e1017953-002590f5b904-
> f00629b46b3afee4&q=1&e=6fc8b980-0fd2-4e4d-a9dc-
> 9ea15e482833&u=https%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel%2Ftree%2Fcifsd-for-next
> >> ontop of 5.10 kernel. Let me know if you see any problems.   xfstest
> >> results (and recent improvements) running Linux cifs.ko->ksmbd look
> >> very promising.
> >
> >I just looked briefly, but I'm wondering about a few things:
> >
> >1. The xattr's to store additional meta data are not compatible with
> >   Samba's way of storing things:
> >
> >https://protect2.fireeye.com/v1/url?k=fbb13e03-a42a0708-fbb0b54c-002590
> >f5b904-f4288e37b0eb9ae8&q=1&e=6fc8b980-0fd2-4e4d-a9dc-9ea15e482833&u=ht
> >tps%3A%2F%2Fgit.samba.org%2F%3Fp%3Dsamba.git%3Ba%3Dblob%3Bf%3Dlibrpc%2F
> >idl%2Fxattr.idl
> >
> >   In order to make it possible to use the same filesystem with both servers
> >   it would be great if the well established way used in Samba would be used
> >   as well.
> 
> A thousand times this ! If cifs.ko->ksmbd adds a differnt way of storing the extra meta-data that is
> incompatible with Samba this would be a disaster for users.
> 
> Please fix this before proposing any merge.
You said that samba can handle it even if ksmbd has own extra metadata format. I didn't think it was
necessary to what you said. If we have to do this, I think it is not too late to work after sending
ksmbd to linux-next first.



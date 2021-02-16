Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D831C4C3
	for <lists+samba-technical@lfdr.de>; Tue, 16 Feb 2021 02:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JUKeK3VrsGIQYP4L1JnZLzS0l7s3KCKys9Zk2n7ASnA=; b=kaMA9aYmaHthydwHqkKjceD69j
	xS359h/9L88wOHYmWGf/7KD+/W2SWz21jRjAOkz0sGPeIdHTfu4Y5YIYYRJyvHzI0BwMgnM8dozQU
	8NTrJQFpnrKdDuRZPRRUuH3oMS4hWyRWnWNvTfK/+rLk76XwxXzGgYgQlF8oyxtoZW5Ave/tPxcEi
	T9gedKhw1PWnAdN19maxrtptVpd+T8IXytrwqY2YeEl8mwqwfzeBpo5vueIpPZPgUspE0t7ni4keD
	LZPvZD2EJsNdO6pwGERaCYSRUHNJWAJ3WNuZiUysygvTSf2ZIGbCrXE4GhenR532+RkAT6QTJ3fm+
	IqT8O16w==;
Received: from ip6-localhost ([::1]:32186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lBooH-0001GR-8o; Tue, 16 Feb 2021 01:05:49 +0000
Received: from mailout4.samsung.com ([203.254.224.34]:38932) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lBoo8-0001GK-Nh
 for samba-technical@lists.samba.org; Tue, 16 Feb 2021 01:05:46 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210216010531epoutp04dfca94b5d3c2bfee5989c67f0d1e61d2~kFOMR2nlV3060430604epoutp04B
 for <samba-technical@lists.samba.org>; Tue, 16 Feb 2021 01:05:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210216010531epoutp04dfca94b5d3c2bfee5989c67f0d1e61d2~kFOMR2nlV3060430604epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1613437532;
 bh=JUKeK3VrsGIQYP4L1JnZLzS0l7s3KCKys9Zk2n7ASnA=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=FYy0Wd1oezkM7p9/9smOhpLamdaRUOc6VYKEc0UbWoxMyiv7dtvdx8+gLH/C+iKXM
 UfkBdfyd8v9j7c2CwvUpSjKK4YV0/Kiw5tXfDPqNHwKV1vlYV2OUBfQrIgHYt7Sio8
 hYuHsal7ZIc3ipvoyzfkvgoo+s6HeY4tKi4v/3Pw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20210216010531epcas1p49b7f3ed5df2a37da6bc300dc645efe99~kFOL_mcL01979819798epcas1p4D;
 Tue, 16 Feb 2021 01:05:31 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.166]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4DfjSp276mz4x9Pt; Tue, 16 Feb
 2021 01:05:30 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 CD.CF.09582.A5A1B206; Tue, 16 Feb 2021 10:05:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210216010529epcas1p1ef074c255eefeac5d50e56847e2b89ec~kFOJ37S323142231422epcas1p1S;
 Tue, 16 Feb 2021 01:05:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210216010529epsmtrp256af2e1e9579e18c95aeefd45616c6d3~kFOJ3Oak30128001280epsmtrp2Y;
 Tue, 16 Feb 2021 01:05:29 +0000 (GMT)
X-AuditID: b6c32a37-8afff7000000256e-c5-602b1a5aa6e8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F5.33.13470.95A1B206; Tue, 16 Feb 2021 10:05:29 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210216010529epsmtip2c028e10b09e6c9341ef5bad51767ad5f~kFOJtsiel2957029570epsmtip2j;
 Tue, 16 Feb 2021 01:05:29 +0000 (GMT)
To: "'Stefan Metzmacher'" <metze@samba.org>
In-Reply-To: <CAKYAXd8ngEqRFfeQ9zmR5h4QWhg5=OoG=FM7QcuZiFP5wdn+xw@mail.gmail.com>
Subject: RE: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
Date: Tue, 16 Feb 2021 10:05:29 +0900
Message-ID: <00ff01d703ff$d15c2620$74147260$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGl6IhnSLG/1SsUO9NpARHPFZxSUgHLNQ68Ax7baU4BuzjdCwLer7MAAb+GglSqYhAT0A==
Content-Language: ko
X-CMS-MailID: 20210216010529epcas1p1ef074c255eefeac5d50e56847e2b89ec
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
 <d776f655-f58d-6541-e30a-f10e5b9f0660@samba.org>
 <CAKYAXd8ngEqRFfeQ9zmR5h4QWhg5=OoG=FM7QcuZiFP5wdn+xw@mail.gmail.com>
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
Cc: 'Samba Technical' <samba-technical@lists.samba.org>,
 'Namjae Jeon' <linkinjeon@kernel.org>, linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Metze,
> > There seems to be a problem, when a new file inherits acls from the
> > parent directory. There I see a strange owner sid:
> Hm... I'll try to reproduce it when I go to office.
> 
> Thanks!
> >
> >                         owner_sid                : *
> >                             owner_sid                : S-21-2276714256
> > and
> >
> > WARNING! 20 unread bytes
> > [0000] 00 00 00 00 00 00 00 00   00 00 00 00 00 00 00 00   ........
> > ........
> > [0010] 00 00 00 00
> >
> > I used this command to analyze this:
When you use the command you told, the following error occurs...
# getfattr -n security.NTACL acl_test_file.txt | grep security.NTACL| sed -e 's!security.NTACL=0s!!' | ndrdump --base64-input xattr
xattr_NTACL struct 2>&1 |less
getfattr: Removing leading '/' from absolute path names
Function 'xattr_NTACL' not found

So I have tried to use this command.
# samba-tool ntacl get acl_test_file.txt --use-ntvfs

   owner_sid                : *
            owner_sid                : S-1-5-21-1548411273-428405841-1880688874-1000

owner_sid seems to be displayed normally. Is there any way to reproduce it?

Thanks!
> >
> > getfattr -n security.NTACL WHATSNEW.txt | grep security.NTACL| sed -e
> > 's!security.NTACL=0s!!' | ndrdump --base64-input xattr xattr_NTACL
> > struct
> > 2>&1 |less
> >
> > metze
> >
> >
> 
> 
> _______________________________________________
> Linux-cifsd-devel mailing list
> Linux-cifsd-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-cifsd-devel



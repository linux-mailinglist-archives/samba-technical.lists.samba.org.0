Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24B2DA634
	for <lists+samba-technical@lfdr.de>; Tue, 15 Dec 2020 03:29:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SGu2L9Ty4Jx4keki1YpkjdBh5K+q36VaU3Ijy9igl+c=; b=VNkS2t8bxo5fyAumqYc/YaVF6d
	T1Dy/Hrnw53OH4ZeJErrU0n+qpF3yndKPJs1RZ9rSe3hXIW5kYnFFN1noMKrXeK7M2PjJTfoIxB5Z
	z4mqVoT48MWlHzdAmsF8yaJMXYPjf7cEZCYaPMUxKUcbSvU41gRUN4ZS4u8JGLfGrtvlk672BG0ND
	FYw2zDMqqqh13XLWYgS7LW+ZnnNOmywzaA1SMCc2yXRwyf2zsyzW+opDie1nm0yqW+sYlBCO9Fzj7
	2W4RxqQCRri3sayengPDPgH6pHWRXd39vAvvFLSjomSLOcKhc3OMKAyNpMoH35QDJ4D7XxuT5iQcW
	4aaaccrw==;
Received: from ip6-localhost ([::1]:41038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kp055-001Gmj-CO; Tue, 15 Dec 2020 02:28:51 +0000
Received: from mailout1.samsung.com ([203.254.224.24]:30310) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kp04t-001Gmb-9k
 for samba-technical@lists.samba.org; Tue, 15 Dec 2020 02:28:48 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201215022809epoutp01860ea4b56af304901a59af169af8991f~QwtV69T_g3202032020epoutp01f
 for <samba-technical@lists.samba.org>; Tue, 15 Dec 2020 02:28:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201215022809epoutp01860ea4b56af304901a59af169af8991f~QwtV69T_g3202032020epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1607999289;
 bh=SGu2L9Ty4Jx4keki1YpkjdBh5K+q36VaU3Ijy9igl+c=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=H5Lw+wioaBYs5Dj6P23u6EiNEMw0ceBgsDVsG72G/ywGwYTsAkirGBQpKYeghmXiu
 F7gDnRfQhAcwZqye4eACgMhY//93iBf3iY7JLk1LKZKcFDB1DFsd4bjDZAnlZg+/Cv
 FdlOr2/ehkThxxr4nRY6cwcpSjn+sRfs3H7iov+I=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201215022808epcas1p2eddf603daef93e9e2158e8c43e9a19ba~QwtVuSWbi3157231572epcas1p2E;
 Tue, 15 Dec 2020 02:28:08 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.162]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Cw2HC6QHQzMqYkY; Tue, 15 Dec
 2020 02:28:07 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 1E.30.63458.73F18DF5; Tue, 15 Dec 2020 11:28:07 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20201215022807epcas1p312cb80f3437bdfd8f01606097e941bd6~QwtUPxgVW1015710157epcas1p3I;
 Tue, 15 Dec 2020 02:28:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201215022807epsmtrp224aa38a25582fb956271fdc8c3612139~QwtUPSCrG2612226122epsmtrp2g;
 Tue, 15 Dec 2020 02:28:07 +0000 (GMT)
X-AuditID: b6c32a36-6dfff7000000f7e2-48-5fd81f371495
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6E.C0.13470.73F18DF5; Tue, 15 Dec 2020 11:28:07 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201215022807epsmtip133c80062b9d3c4ea45bd7b3455249a78~QwtUEz4jP1254212542epsmtip1d;
 Tue, 15 Dec 2020 02:28:07 +0000 (GMT)
To: "'Steve French'" <smfrench@gmail.com>
In-Reply-To: <CAKYAXd-qTqLF3M1S0xbpu-C0w1E=vS4HRFa_ou0xXnGJaFKuWg@mail.gmail.com>
Subject: RE: updated ksmbd (cifsd)
Date: Tue, 15 Dec 2020 11:28:07 +0900
Message-ID: <003901d6d289$ec771cf0$c56556d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDtjnMiCa1AcmvYMj1ELhOClJiQLwKF7csoAmVajgeromj5IA==
Content-Language: ko
X-CMS-MailID: 20201215022807epcas1p312cb80f3437bdfd8f01606097e941bd6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201214124704epcas1p3a5e4349522b58764ba9ca79bdf1da3fd
References: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
 <CGME20201214124704epcas1p3a5e4349522b58764ba9ca79bdf1da3fd@epcas1p3.samsung.com>
 <CAKYAXd-qTqLF3M1S0xbpu-C0w1E=vS4HRFa_ou0xXnGJaFKuWg@mail.gmail.com>
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
Cc: 'CIFS' <linux-cifs@vger.kernel.org>,
 'samba-technical' <samba-technical@lists.samba.org>,
 'Namjae Jeon' <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


> > I just rebased https://github.com/smfrench/smb3-kernel/tree/cifsd-for-n=
ext
> > ontop of 5.10 kernel. Let me know if you see any problems.   xfstest
> > results (and recent improvements) running Linux cifs.ko->ksmbd look
> > very promising.
> With the help of Ronnie, I fixed one problem in previous patch. I have se=
nt
> a pull request for this patch. And I have also checked number of 118 test=
s of
> xfstests were passed on rebased smb3-kernel(+ the patch in pull request).

I share the xfstests's result of 5.10 kernel+ksmbd(cifsd).
---------------------->8------------------
FSTYP         -- cifs
PLATFORM      -- Linux/x86_64 linkinjeon-Samsung-DeskTop-System 5.10.0+ =23=
1 SMP Mon Dec 14 10:55:27 KST 2020
MKFS_OPTIONS  -- //10.88.103.87/homes
MOUNT_OPTIONS -- -ousername=3Dlinkinjeon,password=3D1234,noperm,vers=3D3.11=
,mfsymlinks,nostrictsync //10.88.103.87/homes /mnt/test

cifs/001 files ...  1s
generic/001 files ...  15s
generic/002 files ...  2s
generic/005 files ...  2s
generic/006 files ...  58s
generic/007 files ...  46s
generic/008 files ...  1s
generic/011 files ...  56s
generic/013 files ...  62s
generic/014 files ...  12s
generic/020 files ...  3s
generic/023 files ...  2s
generic/024 files ...  2s
generic/028 files ...  6s
generic/029 files ...  2s
generic/030 files ...  1s
generic/032 files ...  14s
generic/033 files ...  1s
generic/036 files ...  11s
generic/037 files ...  9s
generic/069 files ...  18s
generic/070 files ...  39s
generic/071 files ...  1s
generic/074 files ...  98s
generic/080 files ...  3s
generic/084 files ...  6s
generic/086 files ...  2s
generic/095 files ...  6s
generic/098 files ...  2s
generic/100 files ...  39s
generic/103 files ...  2s
generic/109 files ...  28s
generic/113 files ...  7s
generic/117 files ...  38s
generic/124 files ...  7s
generic/125 files ...  62s
generic/129 files ...  35s
generic/130 files ...  4s
generic/132 files ...  16s
generic/133 files ...  36s
generic/135 files ...  1s
generic/141 files ...  1s
generic/169 files ...  1s
generic/198 files ...  1s
generic/207 files ...  2s
generic/208 files ...  200s
generic/210 files ...  0s
generic/211 files ...  0s
generic/212 files ...  0s
generic/214 files ...  1s
generic/215 files ...  3s
generic/221 files ...  2s
generic/225 files ...  9s
generic/228 files ...  1s
generic/236 files ...  2s
generic/239 files ...  31s
generic/241 files ...  73s
generic/245 files ...  0s
generic/246 files ...  1s
generic/247 files ...  20s
generic/248 files ...  0s
generic/249 files ...  2s
generic/257 files ...  2s
generic/258 files ...  1s
generic/286 files ...  6s
generic/308 files ...  1s
generic/309 files ...  2s
generic/310 files ...  101s
generic/313 files ...  4s
generic/315 files ...  1s
generic/316 files ...  2s
generic/337 files ...  0s
generic/339 files ...  4s
generic/340 files ...  6s
generic/344 files ...  11s
generic/345 files ...  11s
generic/346 files ...  25s
generic/349 files ...  4s
generic/350 files ...  3s
generic/354 files ...  9s
generic/360 files ...  0s
generic/377 files ...  1s
generic/391 files ...  10s
generic/393 files ...  3s
generic/394 files ...  2s
generic/406 files ...  2s
generic/412 files ...  1s
generic/420 files ...  1s
generic/422 files ...  2s
generic/428 files ...  1s
generic/432 files ...  1s
generic/433 files ...  1s
generic/436 files ...  2s
generic/437 files ...  2s
generic/438 files ...  69s
generic/439 files ...  1s
generic/443 files ...  1s
generic/445 files ...  2s
generic/446 files ...  14s
generic/448 files ...  3s
generic/451 files ...  31s
generic/452 files ...  1s
generic/454 files ...  2s
generic/460 files ...  9s
generic/464 files ...  54s
generic/465 files ...  3s
generic/476 files ...  18864s
generic/490 files ...  3s
generic/504 files ...  0s
generic/523 files ...  118s
generic/524 files ...  6s
generic/533 files ...  2s
generic/539 files ...  2s
generic/551 files ...  7923s
generic/567 files ...  4s
generic/568 files ...  1s
generic/590 files ...  106s
generic/591 files ...  1s
Ran: cifs/001 generic/001 generic/002 generic/005 generic/006 generic/007 g=
eneric/008 generic/011 generic/013 generic/014 generic/020 generic/023 gene=
ric/024 generic/028 generic/029 generic/030 generic/032 generic/033 generic=
/036 generic/037 generic/069 generic/070 generic/071 generic/074 generic/08=
0 generic/084 generic/086 generic/095 generic/098 generic/100 generic/103 g=
eneric/109 generic/113 generic/117 generic/124 generic/125 generic/129 gene=
ric/130 generic/132 generic/133 generic/135 generic/141 generic/169 generic=
/198 generic/207 generic/208 generic/210 generic/211 generic/212 generic/21=
4 generic/215 generic/221 generic/225 generic/228 generic/236 generic/239 g=
eneric/241 generic/245 generic/246 generic/247 generic/248 generic/249 gene=
ric/257 generic/258 generic/286 generic/308 generic/309 generic/310 generic=
/313 generic/315 generic/316 generic/337 generic/339 generic/340 generic/34=
4 generic/345 generic/346 generic/349 generic/350 generic/354 generic/360 g=
eneric/377 generic/391 generic/393 generic/394 generic/406 generic/412 gene=
ric/420 generic/422 generic/428 generic/432 generic/433 generic/436 generic=
/437 generic/438 generic/439 generic/443 generic/445 generic/446 generic/44=
8 generic/451 generic/452 generic/454 generic/460 generic/464 generic/465 g=
eneric/476 generic/490 generic/504 generic/523 generic/524 generic/533 gene=
ric/539 generic/551 generic/567 generic/568 generic/590 generic/591
Passed all 118 tests



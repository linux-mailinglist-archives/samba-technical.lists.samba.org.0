Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 973702DA636
	for <lists+samba-technical@lfdr.de>; Tue, 15 Dec 2020 03:29:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=C6cMqNj7gzMKd12i3GOKnHnQ2pKaXHaTzApbDP/ONXk=; b=iFvM/l+KRHdRnTGbCnZA5lTz4i
	DfYjV2NPJR9yCgZBgduXwgViq4pqXf7kNU/teNNiLEeeoafyvhnNNPUdNc46Q62roDfDOz2R4gfrm
	8zmUZ7UZqN0R/zI6s/oHEPNsHMyzYTmBQli08+rjODPmsP3sJRSKp2CVzmKN+VdyEqSweQJ26ZxFv
	y1yefLB2VSkyuTDPB3yNGbIuNZCKJDiSvNCFDo28/zWBd5Tz86sD615rf5YT0m5nmGeber6xUdAj6
	VEp/51GNqrk0kQ4Bv69qQ+jDOCPZDMp+JDEN2wY0s7ZRbXk2ddL6sxRC2UHArBHqbyPAwBWNqzD8R
	594cKlFg==;
Received: from ip6-localhost ([::1]:41068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kp05D-001Gn7-QC; Tue, 15 Dec 2020 02:28:59 +0000
Received: from mailout2.samsung.com ([203.254.224.25]:37229) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kp057-001Gmd-2A
 for samba-technical@lists.samba.org; Tue, 15 Dec 2020 02:28:57 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201215022842epoutp020acc48983d7a1b7c0c38fd16d2283f1f~Qwt1SMuWw1241012410epoutp021
 for <samba-technical@lists.samba.org>; Tue, 15 Dec 2020 02:28:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201215022842epoutp020acc48983d7a1b7c0c38fd16d2283f1f~Qwt1SMuWw1241012410epoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1607999322;
 bh=C6cMqNj7gzMKd12i3GOKnHnQ2pKaXHaTzApbDP/ONXk=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=ZwFSmhjA8Eg1wczOQ84bsC0LnfASmoQIG6o7I2gIa0UhXWSSHXza+9kOk8Ya5IW5n
 Ahp0a/957QTa93IG3vLPCiydMQBQC6YAx/aNlAeD5kaC+xCJ1u43JA0xjDizgr1ET+
 aRKZ3TCVs8ekFdBchA+6QWGg6zylHcX3GqrkC/Xw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201215022842epcas1p2c4b5881c9a13ff0ac05a0007906a3f9a~Qwt1DdIag0881508815epcas1p2n;
 Tue, 15 Dec 2020 02:28:42 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.164]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Cw2Hs4XW6z4x9Q8; Tue, 15 Dec
 2020 02:28:41 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 20.60.63458.95F18DF5; Tue, 15 Dec 2020 11:28:41 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201215022841epcas1p10b4dde15676ae066b1cca67478099be6~Qwtzx8WO71167011670epcas1p1i;
 Tue, 15 Dec 2020 02:28:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201215022841epsmtrp1cd32d1ed81bfe27cca40e3d6e7bc2214~QwtzxTfzf2597025970epsmtrp1K;
 Tue, 15 Dec 2020 02:28:41 +0000 (GMT)
X-AuditID: b6c32a36-6dfff7000000f7e2-29-5fd81f598957
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D6.D0.13470.85F18DF5; Tue, 15 Dec 2020 11:28:40 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201215022840epsmtip21125d7195390123501ae3fd890860fe7~QwtzgoMZY2807028070epsmtip2N;
 Tue, 15 Dec 2020 02:28:40 +0000 (GMT)
To: "'Stefan Metzmacher'" <metze@samba.org>
In-Reply-To: <3bf45223-484a-e86a-279a-619a779ceabd@samba.org>
Subject: RE: updated ksmbd (cifsd)
Date: Tue, 15 Dec 2020 11:28:41 +0900
Message-ID: <003a01d6d28a$00989dd0$01c9d970$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDtjnMiCa1AcmvYMj1ELhOClJiQLwG3FqLJAxs+MEaro0rx4A==
Content-Language: ko
X-CMS-MailID: 20201215022841epcas1p10b4dde15676ae066b1cca67478099be6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201214182517epcas1p1d710746f4dd56097f16ed08cfda0f6b2
References: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
 <CGME20201214182517epcas1p1d710746f4dd56097f16ed08cfda0f6b2@epcas1p1.samsung.com>
 <3bf45223-484a-e86a-279a-619a779ceabd@samba.org>
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
Cc: 'CIFS' <linux-cifs@vger.kernel.org>, 'Steve French' <smfrench@gmail.com>,
 'samba-technical' <samba-technical@lists.samba.org>,
 'Hyunchul Lee' <hyc.lee@gmail.com>,
 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

 
> I just looked briefly, but I'm wondering about a few things:
> 
> 1. The xattr's to store additional meta data are not compatible with
>    Samba's way of storing things:
>     https://git.samba.org/?p=samba.git;a=blob;f=librpc/idl/xattr.idl
> 
>    In order to make it possible to use the same filesystem with both servers
>    it would be great if the well established way used in Samba would be used
>    as well.
Yes, Maybe... I will check it after sending ksmbd to linux-next.
 
> 2. Why does smb2_set_info_sec() have fp->saccess |= FILE_SHARE_DELETE_LE; ?
Because of smb2.acls.GENERIC failure.

TESTING FILE GENERIC BITS
get the original sd
Testing generic bits 0x00000000
time: 2020-12-15 00:00:37.940992
failure: GENERIC [
(../../source4/torture/smb2/acls.c:439) Incorrect status NT_STATUS_SHARING_VIOLATION - should be NT_STATUS_OK

I really don't understand this test. This testcase expect that FILE_DELETE is set in response if desired access
of smb2 open is FILE_MAXIMAL_ACCESS.
I don't know why smb2 open should be allowed although FILE_SHARE_DELETE is not set in previous open in this test.
Can you give me a hint ?

> 3. Why does ksmbd_override_fsids() only reset cred->fs[g|u]id, but group_info
>    is kept unchanged, I guess at least the groups array should be set to be empty.
Yes, We need to handle the groups list. Will fix it.

> 4. What is work->saved_cred_level used for in ksmbd_override_fsids()?
>    It seems to be unused and adds a lot of complexity.
ksmbd_override_fsids could be called recursively.
work->saved_cred_level prevents ksmbd from overriding fs[g|u]id again.
 
> 5. Documentation/filesystems/cifsd.rst and fs/cifsd/Kconfig still references https://github.com/cifsd-team/cifsd-tools
>   instead of https://github.com/cifsd-team/ksmbd-tools
Okay. Will update it.

> 6. Why is SMB_SERVER_CHECK_CAP_NET_ADMIN an compile time option and why is it off by default?
>    I think the behavior should be enforced without a switch.
I can make it default yes. Can you explain more why it should be enforced ?

> These are just some initial thoughts.
Thanks for sharing your review!
> 
> metze




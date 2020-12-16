Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E22812DBCFF
	for <lists+samba-technical@lfdr.de>; Wed, 16 Dec 2020 09:51:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ix+u816TBtZ4pK8xW8eb/4IvuGnGKJx94XI2ZmU0Wlk=; b=ceD5ip9qDJc1WQYRd7zgWfhzGJ
	V2MDoDgGlEuTngI83opx+ExpZiRfT+scpOtcMKiBztHRgxsgFEojSOfKpvKF3xSMXvXD0qZv9Lvt/
	08ps1dkX4riXZdyyMZ1aHuCO5UFpSyPDiCZzG36ETJuJ4SipFTSWUss/wzaxl6jHQNnX7Uh3mylBD
	SdYzTx8166iozifWu4eT/baIaL8bBBk4g15TspfqvDkDZzfWTPUU+NeVqSClbxGVApnOb+/Vnz2Hu
	5+1OFXO9HrAxRbw9LV5NkzApj9nzpJWzB+XNbQLt5tPf8DjJ9i/L9q8eHGIFH2JmOyDcEr3cWRSRr
	uWYM2ccA==;
Received: from ip6-localhost ([::1]:31322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpSWW-001Y2x-BB; Wed, 16 Dec 2020 08:51:04 +0000
Received: from mailout4.samsung.com ([203.254.224.34]:13164) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kpSWO-001Y2j-Ro
 for samba-technical@lists.samba.org; Wed, 16 Dec 2020 08:51:02 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201216085036epoutp04615e452c7a11a05c2e44da53bc0fef65~RJkjZpLp60886408864epoutp04n
 for <samba-technical@lists.samba.org>; Wed, 16 Dec 2020 08:50:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201216085036epoutp04615e452c7a11a05c2e44da53bc0fef65~RJkjZpLp60886408864epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1608108636;
 bh=ix+u816TBtZ4pK8xW8eb/4IvuGnGKJx94XI2ZmU0Wlk=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=CAbq91lB2fIgs/40Xyd1MR68TB39+YoLlJEyxZIQwcVVqof9BAIcAjGRE7VUHe0wm
 jVvS7Bjz0S5J3TBmfPiIDRh++bB2LUgkwXSY+U9EZm5wxv9XVUXB14zJgpB4Xsn9DY
 1c8NkZAk/W/ICQjhSykiH3iqHjMCJu7Lnhltc77M=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20201216085036epcas1p32486d512da04f82bcf577ec1f3314b39~RJkjMn3Eg2879528795epcas1p3y;
 Wed, 16 Dec 2020 08:50:36 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.162]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Cwpk25bN9zMqYkq; Wed, 16 Dec
 2020 08:50:34 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 B0.A8.09582.95AC9DF5; Wed, 16 Dec 2020 17:50:33 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20201216085032epcas1p395a2802e249c7a17b534af3753a3f37f~RJkgKNGrf0058900589epcas1p3S;
 Wed, 16 Dec 2020 08:50:32 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201216085032epsmtrp160748a75cac5ea7d651d7f05e1cc46dd~RJkgJknKz0069400694epsmtrp1S;
 Wed, 16 Dec 2020 08:50:32 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-73-5fd9ca59be50
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F5.52.08745.85AC9DF5; Wed, 16 Dec 2020 17:50:32 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201216085032epsmtip29adf7410a4ae8440ed7ad94c6cd5a57f~RJkf_iZ5H2967629676epsmtip2P;
 Wed, 16 Dec 2020 08:50:32 +0000 (GMT)
To: "'Stefan Metzmacher'" <metze@samba.org>
In-Reply-To: <069556fc-cb6c-1e52-02ab-fa9b71f58cf6@samba.org>
Subject: RE: updated ksmbd (cifsd)
Date: Wed, 16 Dec 2020 17:50:32 +0900
Message-ID: <003c01d6d388$83669740$8a33c5c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDtjnMiCa1AcmvYMj1ELhOClJiQLwG3FqLJAxs+MEYCGETvfAJQSgxQq4Gl7zA=
Content-Language: ko
X-CMS-MailID: 20201216085032epcas1p395a2802e249c7a17b534af3753a3f37f
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
 <003a01d6d28a$00989dd0$01c9d970$@samsung.com>
 <069556fc-cb6c-1e52-02ab-fa9b71f58cf6@samba.org>
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
 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>,
 'samba-technical' <samba-technical@lists.samba.org>,
 'Hyunchul Lee' <hyc.lee@gmail.com>, 'Steve French' <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> >> 2. Why does smb2_set_info_sec() have fp->saccess |= FILE_SHARE_DELETE_LE; ?
> > Because of smb2.acls.GENERIC failure.
> >
> > TESTING FILE GENERIC BITS
> > get the original sd
> > Testing generic bits 0x00000000
> > time: 2020-12-15 00:00:37.940992
> > failure: GENERIC [
> > (../../source4/torture/smb2/acls.c:439) Incorrect status
> > NT_STATUS_SHARING_VIOLATION - should be NT_STATUS_OK
> >
> > I really don't understand this test. This testcase expect that
> > FILE_DELETE is set in response if desired access of smb2 open is FILE_MAXIMAL_ACCESS.
> > I don't know why smb2 open should be allowed although FILE_SHARE_DELETE is not set in previous open
> in this test.
> > Can you give me a hint ?
> 
> As far as I can see the test assumes the user has SeRestorePrivilege, with that
> SEC_FLAG_MAXIMUM_ALLOWED will add FILE_DELETE, see https://protect2.fireeye.com/v1/url?k=3a9ae45d-
> 6501dd47-3a9b6f12-000babff24ad-8398dba5a818cd4a&q=1&e=bdf5897b-3ecc-49dc-9105-
> 2d6782854fcc&u=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fopenspecs%2Fwindows_protocols%2Fms-
> fsa%2F8ada5fbe-db4e-49fd-aef6-20d54b748e40
The question I'm asking is how it can be opened with FILE DELETE that adding
by SEC_FLAG_MAXIMUM_ALLOWED without FILE_SHARE_DELETE in 1st open.
NT_STATUS_SHARING_VIOLATION error should be returned? but this test should be allowed to open.

It test in the following sequences.
- 1st smb2 open with NTCREATEX_SHARE_ACCESS_READ | NTCREATEX_SHARE_ACCESS_WRITE
- SMB2 set info security().
- 2nd open with SEC_FLAG_MAXIMUM_ALLOWED(adding FILE DELETE) => NT_STATUS_SHARING_VIOLATION or NT_STATUS_OK ?

> 
> >> 3. Why does ksmbd_override_fsids() only reset cred->fs[g|u]id, but group_info
> >>    is kept unchanged, I guess at least the groups array should be set to be empty.
> > Yes, We need to handle the groups list. Will fix it.
> >
> >> 4. What is work->saved_cred_level used for in ksmbd_override_fsids()?
> >>    It seems to be unused and adds a lot of complexity.
> > ksmbd_override_fsids could be called recursively.
> > work->saved_cred_level prevents ksmbd from overriding fs[g|u]id again.
> 
> But that will always be on the same session/share combination?
Ah, ksmbd_override_fsids() has been recursively called to handle SMB1 requests.
At present, SMB1 codes was removed in smb3_kernel tree, So we can remove work->saved_cred_level.

Thanks for your review!
> 
> >> 5. Documentation/filesystems/cifsd.rst and fs/cifsd/Kconfig still references
> https://protect2.fireeye.com/v1/url?k=6f3cad54-30a7944e-6f3d261b-000babff24ad-
> 32002aad36f8cca9&q=1&e=bdf5897b-3ecc-49dc-9105-2d6782854fcc&u=https%3A%2F%2Fgithub.com%2Fcifsd-
> team%2Fcifsd-tools
> >>   instead of
> >> https://protect2.fireeye.com/v1/url?k=cf0932a6-90920bbc-cf08b9e9-000b
> >> abff24ad-ea69fcf05590fae2&q=1&e=bdf5897b-3ecc-49dc-9105-2d6782854fcc&
> >> u=https%3A%2F%2Fgithub.com%2Fcifsd-team%2Fksmbd-tools
> > Okay. Will update it.
> 
> Thanks!
> 
> >> 6. Why is SMB_SERVER_CHECK_CAP_NET_ADMIN an compile time option and why is it off by default?
> >>    I think the behavior should be enforced without a switch.
> > I can make it default yes. Can you explain more why it should be enforced ?
> 
> Why should an unprivileged user ever be able to start the server?
> Wouldn't that be a massive security problem as that user would provide the share definitions and users
> and controls what ksmbd_override_fsids() will use?
> 
> metze




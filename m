Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3169913654F
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jan 2020 03:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=wShPhtayzF9B2KkA0kIGhEQQENQsSg4eqz5ilD8nMxg=; b=yalPlXK5Z+9Od8IQb+9foi1QVT
	8i/E0cPSoxcbAKl9EOaLxUDN9QdMr3/c5+tymFHC7q0xBo8vEVZp5pc3yeJhtuwe3PdtvxCxRgLZf
	WF4AK+wgN+oUeaM2EhDAOeKlDoa4WmcmSrax3Esdys81UC+k8h9HiToH7E0D3863RbICG8qYx1R3k
	Wvpd42lRCymTWUK2XL9EgZbJjBYYacFv8ZXJMAuzWZtXbxGFuWT5Ow+P/ixcckHjUF9fQIp4rPnjk
	RoEL28TJbMzi0hnCsDVLtgWXCa9H+7vahqyFNv25IlMHyWrIafhg4WL+nLovOuwQExytGLEmomXwl
	8bUvZiPw==;
Received: from localhost ([::1]:59416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ipjz5-002t8f-Iq; Fri, 10 Jan 2020 02:25:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48718) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipjyz-002t7Y-Iy
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=6lsH/NoNyFFZvTNNpXdy1wxZMxR48VVU4MBHY8Pu+ho=; b=bdGd1b05am3ooLNGYrSKDH3r4R
 duBPvY4CRE+c+bOejvHKNWOve0xAAZPVDyAHDvtI01vzXrJgsvvZalego0/5loL8SuHtXl/CSVZPZ
 bov7e0S0jU6Y5S42nxLy29Bz0siDZiRdmWX3+TVLWJjHB91WOogxY1B8HZq4cEpg7u3j5rNzlgDHE
 Rq/96JCXHkb5LHjMIX1IRs2m6/lB0xcjoFL+OUrktfxG1/zVHd1iPoy+Vy9pZS25Q4P+I5jzaDrg4
 jiR3evl1m71u1IWzqqVF+tEWfLF6DAWZhiJTU/RCNc3S1cHRBePabH29iRKu2wLuwuaH9r1Z8QPYX
 3NelvxzcgqnYzufFgiMgc0vgXxs558xhAqATfw89F57w/feX0a3buNgYw4GZRpTrOU/l3fiAr+Aqt
 CVU/2TFQQrvlizMbEEB0k1ER1sL1/oAW0q/rw0p6AyqmNbk9/JarM1Iivau46FVr0937vf1Mp1Ddk
 qeII9hI3xWSgIUMkqq+k/V4i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipjyy-00062N-8u
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:25:04 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1ipjyx-0030Ed-5F
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:25:03 +0000
MIME-Version: 1.0
Subject: Re: fix ldb-samba: require pid match for cached ldb
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-164@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-164@samba.org>
Date: Fri, 10 Jan 2020 02:25:03 +0000
Message-Id: <E1ipjyx-0030Ed-5F@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgYWJhcnRsZXQgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkKCmh0dHBz
Oi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMTY0I2lzc3VlY29tbWVudC01NzI4
NDQ1MjcKQ29tbWVudDoKQ2xvc2luZyB0aGlzIGJlY2F1c2Ugd2UgZG9uJ3QgdXNlIEdpdEh1Yiwg
cGFydGljdWxhcmx5IGZvciBwdWxsIHJlcXVlc3RzIGFueSBtb3JlIGFuZCB0aGlzIGlzbid0IHRo
ZSByaWdodCBmaXggaW4gYW55IGNhc2UgKHdlIGluY2x1ZGUgc3lzdGVtIGhlYWRlcnMgdmlhIHRo
ZSBzeXN0ZW0vIGhlYWRlcnMgZnJvbSBsaWJyZXBsYWNlKS4K

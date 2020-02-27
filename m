Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 202FE172A72
	for <lists+samba-technical@lfdr.de>; Thu, 27 Feb 2020 22:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fDdY/vVe1W6SuujFflC3cJEXHGhOo5VIWcjs7yJrlvI=; b=zqENm6ThSA6uwfN8ranYv5MkK3
	tph4mReGsBLzMqS72NoJZZc+icjsLkfgD2B44ukMOjIfezFD2Ca9t2pb4UDAbYCiQEjunq93Eynyd
	TKHakawDVP0Y7UaPcv6LLCvZL5qXZf0eebwX7VGJb9SO7uHWJN5+nV5zt17VzwRQ2fEkCI6YLQBoP
	V4ESmrSOrAfq/bdoKFYjdE34dRNpaT2tDMRbDiQN3ly2g6ItTIsf8uT7mJmwjCbZsJmJilr+ht5PA
	jqc6lMGX8iAJ+e/FEWt3X4SJ0K8046MB1GAf4To93ZbfS41z4uJS+GqeKLjTRT3M3dyfnNsEEGhmo
	YcgvBcaA==;
Received: from localhost ([::1]:58754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j7R3l-00C9Ac-K6; Thu, 27 Feb 2020 21:51:09 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:59805) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j7R3e-00C9AV-94
 for samba-technical@lists.samba.org; Thu, 27 Feb 2020 21:51:06 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CB0193AB;
 Thu, 27 Feb 2020 16:26:08 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute5.internal (MEProxy); Thu, 27 Feb 2020 16:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=artmg.org; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=fDdY/vVe1W6SuujFflC3cJEXHGhOo5V
 IWcjs7yJrlvI=; b=lpmeSjXj7bHXeYTgXoKlRufJgH49IhC7LqeiAJiH72FTsR5
 fR+ZAe68L81FUlvTohHdjOd39rWn3a5DboxcR18dD16Lndyypce1k5jNKcSKC9Oo
 umS9FSWRZNMNm3gw0o+DEuui6l6+jWbYvHeWWleaPl44NL+xskxPKdnpE3cXIGuT
 cBfjXoB5JDrwiG2zloQ9bY9viCSnnLh8MDyB3RUlrDStClnjkt9QXDWKhCz/IdI3
 kokyHDq7s/xbh3sizxv55+TKlhDvrafUua3/1h/EJUqy/nb1+xF+qkmg5ISFIHf6
 /OXRO1jH0HsDeNT1ffYOdkpkU0nfdsDAZs5yyRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fDdY/v
 Ve1W6SuujFflC3cJEXHGhOo5VIWcjs7yJrlvI=; b=K9Il66jiUibj2CgdcWjG5i
 60NsXTcJ4z5vqIYppy/qiL/KifFpNfT51A/B0U0niiAiJ78IrdAciMt2sFNzvH0A
 NXs8QfHVHyoe1fX9+S4ClNj2hNKfs0wheKbhr7o8r2+2JFujJqB7T0UQjFAy4XVU
 8MOnkYQ9K2okJk1YwEYhGsKQ0/4DSlkWhmgAaRBywAUT1sJsVgGSjmdtdOicvW2H
 QytGjAW+PEr1kxXzPzPYjElNqOmljZCHAjRfb6oKwGo4RaYH4UJ4jdxa1Wets1Ds
 y+H+RY75SDbwaVrJc0o7pU3YXFInxQr6N+gtrPa5M3QPaHt2/J/IYBrdKyXtrMdg
 ==
X-ME-Sender: <xms:7zNYXvaT0ppEoirCzqhwqbK8C8rzn8BeO1Xeyzn-Qkv2pPV01i_zBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeigddugeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderreejnecuhfhrohhmpedftehrthcuoffifdcuoehsmhgslhhotghksegrrhhtmhhg
 rdhorhhgqeenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhmsghlohgtkhesrghrthhmghdr
 ohhrgh
X-ME-Proxy: <xmx:7zNYXleau5fHsjX-9rCIAP0RRIOoVG4SU4sgjUQX_vC_cLxILJfUWQ>
 <xmx:7zNYXpoCiesp819IZnjXz-NUmpAB20PJJjKhIsiGVqbSv2fTxNPSJg>
 <xmx:7zNYXsArsx28gDe7GrSUUnPhw1y60fkiiOtNfpY2IMQ0mLLHKZMAJg>
 <xmx:8DNYXoi27Oh-P-qYEZlK_LudwxEstTn9UteKus2X-BY9nrKMv9OaSA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CA023C200A4; Thu, 27 Feb 2020 16:26:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-967-g014f925-fmstable-20200226v1
Mime-Version: 1.0
Message-Id: <058076d9-60d8-4967-805b-3b2cf718600b@www.fastmail.com>
In-Reply-To: <20200224203401.GB15879@jeremy-ThinkPad-X1>
References: <mailman.231.1582110513.713.samba@lists.samba.org>
 <f09b7d28-4b3d-4211-b151-bb51d783ef4d@www.fastmail.com>
 <20200224193237.GA15759@jeremy-ThinkPad-X1>
 <d3a08bb5-3f56-4c51-b50c-78b7aeacb75d@www.fastmail.com>
 <20200224203401.GB15879@jeremy-ThinkPad-X1>
Date: Thu, 27 Feb 2020 21:25:37 +0000
To: "Jeremy Allison" <jra@samba.org>
Subject: =?UTF-8?Q?Re:_[Samba]_vfs_fruit_disk=5Ffree_fails_on_tmsize_overflow_wit?=
 =?UTF-8?Q?h_macOS_Time_Machine?=
Content-Type: text/plain
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
From: Art MG via samba-technical <samba-technical@lists.samba.org>
Reply-To: Art MG <smblock@artmg.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> On Mon, Feb 24, 2020 at 08:34:11PM +0000, Jeremy Allison via samba wrote:
> We need to keep the overflow checks,
> as this is on user-supplied data I believe.

I appreciate the advice, Jeremy, and have modified the patch as below, in a new branch

I have ADDED the fix, AND left the error checking, but with better explanation 
in the debug log message and in the code itself.
The issue is now unlikely to arise, but at least it won't be fatal if it does :) win / win
My tests indicate that this code now resolves the issue. 

I will raise the PR shortly from
https://gitlab.com/artmg/samba/-/blob/artmg-tmsize-prevent-overflow/source3/modules/vfs_fruit.c

Will I need to create an account on the bugzilla to refer to the PR in the issue, 
or will the release manager arrange that as part of the process?

Thanks
Art

________


diff --git a/source3/modules/vfs_fruit.c b/source3/modules/vfs_fruit.c
index b8ede0cdfdb5661cc9579f25b81613f30e410215..3b1dd3ca853329cc156e747df0eefd427511594e 100644
--- a/source3/modules/vfs_fruit.c
+++ b/source3/modules/vfs_fruit.c
@@ -6971,15 +6971,22 @@ static bool fruit_tmsize_do_dirent(vfs_handle_struct *handle,
 		return true;
 	}
 
+	/*
+	 * Arithmetic on 32-bit systems may cause overflow, depending on
+	 * size_t precision. First we check its unlikely, then we
+	 * force the precision into target off_t, then we check that
+	 * the total did not overflow either.
+	 */
 	if (bandsize > SIZE_MAX/nbands) {
-		DBG_ERR("tmsize overflow: bandsize [%zu] nbands [%zu]\n",
+		DBG_ERR("tmsize potential overflow: bandsize [%zu] nbands [%zu]\n",
 			bandsize, nbands);
 		return false;
 	}
-	tm_size = bandsize * nbands;
+
+	tm_size = (off_t)bandsize * (off_t)nbands;
 
 	if (state->total_size + tm_size < state->total_size) {
-		DBG_ERR("tmsize overflow: bandsize [%zu] nbands [%zu]\n",
+		DBG_ERR("tm total size overflow: bandsize [%zu] nbands [%zu]\n",
 			bandsize, nbands);
 		return false;
 	}



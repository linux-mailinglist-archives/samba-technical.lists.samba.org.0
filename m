Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B60659268
	for <lists+samba-technical@lfdr.de>; Thu, 29 Dec 2022 23:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=a1b1yMejAXbU9i9Rl0DG1yZnHQV2zcDbaspzR5IGp/w=; b=hcQoEOi9VSET4u3GhEGTUuUmi7
	Lbg5vpTz3jPoy9t/JQC82Wn1j/jb/QvHY5b5er//EJ7ilsCC0b7DFlfa9JN4n8CCxItWEck2ZpqP6
	U7vBJ8UXlTQLTzta7tmHYxtQsmwie/QVMSxP1o2rkrjzFLkyAbpYJWJkR7JrFJ1owFqNJa0DdGxqk
	PpNZvwQ5sfKrWFOROMwVLNV+uAxLbeiRIxp9ueYfU2VAUiPxsBd/kWyctLY0FJVD7mS+WNcTyMESX
	n8Rbj1epKExFsfWnQI6QtvcAiaWcNM3wMS2/CXsvXmszuNh9saDunT2nkeybnXmiMgSMztz2HbR6D
	sAiN3DzA==;
Received: from ip6-localhost ([::1]:50214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pB19Q-00BvcW-VM; Thu, 29 Dec 2022 22:13:25 +0000
Received: from mx.cjr.nz ([51.158.111.142]:15544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pB19J-00BvcN-Si
 for samba-technical@lists.samba.org; Thu, 29 Dec 2022 22:13:22 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 4A94D7FC20;
 Thu, 29 Dec 2022 22:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1672351994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a1b1yMejAXbU9i9Rl0DG1yZnHQV2zcDbaspzR5IGp/w=;
 b=vLGFxAVDNg27ohVsRpc95TPaKEaRSCTlK1Yf4Hsm5ZBZ9bloepBi3jknwCMjnPxBMoNCBC
 OxXShIqKmo4qitu7SZzpRlbTV2w75Y2KQAmKLXDQW4+lZ13c0dEKDM2ZPQMC+1jUOS2Pzn
 Ko9Nro54HYKSvPr5blf/srDHB7XWwPak+hf47lp3TprSv/pHsbY8Jw3BUi3z0fihs0H+Gg
 yGQtg3uyn5PVaS3EEhkFYSv8EZY8lQPcCBSq4znDAgxNYJDWQnOOmELMIkbH5EKSiCKcQJ
 Ar5nkwD6lsvnHgn7avKOhzAr5V6cZySQt/mR2jcS7/ENkMYhPhGYTJpe+bKI9A==
To: Ira Weiny <ira.weiny@intel.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] cifs: Fix kmap_local_page() unmapping
In-Reply-To: <20221229-cifs-kmap-v1-1-c70d0e9a53eb@intel.com>
References: <20221229-cifs-kmap-v1-1-c70d0e9a53eb@intel.com>
Date: Thu, 29 Dec 2022 19:13:09 -0300
Message-ID: <874jtd505m.fsf@cjr.nz>
MIME-Version: 1.0
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ira Weiny <ira.weiny@intel.com> writes:

> kmap_local_page() requires kunmap_local() to unmap the mapping.  In
> addition memcpy_page() is provided to perform this common memcpy
> pattern.
>
> Replace the kmap_local_page() and broken kunmap() with memcpy_page()
>
> Fixes: d406d26745ab ("cifs: skip alloc when request has no pages")
> Cc: Paulo Alcantara <pc@cjr.nz>
> Cc: Steve French <sfrench@samba.org>
> Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  fs/cifs/smb2ops.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>


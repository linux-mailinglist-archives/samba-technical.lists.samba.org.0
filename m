Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5B3EF6FD
	for <lists+samba-technical@lfdr.de>; Wed, 18 Aug 2021 02:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=yYTI8eHnDRDCuYc0EGEyTDS9vWJeBebzaFZ1mBVnpqY=; b=RA72JWxk5zYSkPf6Yg2y959S2C
	cyTXC9u0WwnVbsyHOBFiXodpe03v6CL85jE8KB+yV8T4uYqwyp1Inh5Av+6lAf3E5Xs/8Lpv5ywq7
	Av3+iSBhfRE2on+HjB54C8p7tn1aSWxzTICGawV4lY21oh3J6mQDCfrPMqbZdmrWFFmdKmN5kYdp7
	05mojQYAJSMreUb8sdXS1ZvlzX88zs5rl9fmW1LUrkH1TiH65B1FBeQq15pQ6rXvQuAu5ZPntQTzj
	0paPuA7IIUBfxRS1vFRv8NbV8MKfAYk3DCskw7mVFN/KvcV52oF3TlPbHkMrdS9TbHsYgZu6s6PNK
	3AUq380g==;
Received: from ip6-localhost ([::1]:55976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mG9hw-007DNG-T6; Wed, 18 Aug 2021 00:45:28 +0000
Received: from mx.cjr.nz ([51.158.111.142]:61518) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mG9hp-007DN7-Fp
 for samba-technical@lists.samba.org; Wed, 18 Aug 2021 00:45:26 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id B14107FF6C;
 Wed, 18 Aug 2021 00:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1629246526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yYTI8eHnDRDCuYc0EGEyTDS9vWJeBebzaFZ1mBVnpqY=;
 b=xNEqtCdNo1Bd1VWZ/z76niW2n6KK3nCMJn5Fm85WH/4+CKIoq/P8l9ZdFpVYnC8IL0TXYd
 ykoUecU2BuAcbcK67sNJDOp6MCi5Yo4jC7K8SQxW6ZKxtrgWOSdrY/eDD9nD5/WxY3T5Ey
 8rhteKBABaNAqecGtYHiYnKxO05MYx/1BivgfstsSYxcn7dRZ+VZf5O7deyzQnd7rhIhMP
 Zp91ff3F14rrQ684DPL1P7jwBzZ2uWpBIBBOyCzSKFOATOlVKGOA5dIXLkCvs2n/SNc56X
 QA64M8ytvh/1Qe1ONobUGi8H4A/l28GLROWnvMZpicbq+KOPYg3RJhw8OOHnsg==
To: Len Baker <len.baker@gmx.com>, Steve French <sfrench@samba.org>, Jeff
 Layton <jlayton@kernel.org>, Suresh Jayaraman <sjayaraman@suse.de>
Subject: Re: [PATCH] CIFS: Fix a potencially linear read overflow
In-Reply-To: <20210817102709.15046-1-len.baker@gmx.com>
References: <20210817102709.15046-1-len.baker@gmx.com>
Date: Tue, 17 Aug 2021 21:28:40 -0300
Message-ID: <87im03h9zb.fsf@cjr.nz>
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
Cc: linux-cifs@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Len Baker <len.baker@gmx.com>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Len Baker <len.baker@gmx.com> writes:

> strlcpy() reads the entire source buffer first. This read may exceed the
> destination size limit. This is both inefficient and can lead to linear
> read overflows if a source string is not NUL-terminated.
>
> Also, the strnlen() call does not avoid the read overflow in the strlcpy
> function when a not NUL-terminated string is passed.
>
> So, replace this block by a call to kstrndup() that avoids this type of
> overflow and does the same.
>
> Fixes: 066ce6899484d ("cifs: rename cifs_strlcpy_to_host and make it use new functions")
> Signed-off-by: Len Baker <len.baker@gmx.com>
> ---
>  fs/cifs/cifs_unicode.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C8884460A
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jan 2024 18:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=T7jJIaYqMSfxPjtLTr60DeUKvzsmBPgfKadAEZC9wwo=; b=nIjZ1p+v10mrLqWaA9DGs87yEp
	6MqWON+rEGpdnLX/lkzAla4dQe4MZugOV+JDE6gp+Kx85y9+6U8Q4girrqX0gQnmU8vzIHiG6ZTww
	iH+DTYQ4cjUoW1mtUbtQiUBfV0pPN6B/kKRN/DMxMjeA2AAhLwvSh7KkjJ9NmWqb++6cqe+gY641l
	Qi3K88tlg/RYlEenrNbNug3v5wZw6TQykWhX6rGXMzizH9Lz//6Og+dZuXvxC6zvci41tqaM/iaUx
	WpAe4dDaiusAZMLV3tIzGrenVoZ7vKCn9CfGqog0TMvKQ9Jp9mh0UwIouBrSknqE9M4tYadJ7+YRo
	i1KfHt7A==;
Received: from ip6-localhost ([::1]:30120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVEJA-005Ifi-E4; Wed, 31 Jan 2024 17:23:32 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:41494) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVEJ6-005Ifb-FZ
 for samba-technical@lists.samba.org; Wed, 31 Jan 2024 17:23:30 +0000
Message-ID: <e0861faa7b564362e384783d4e52e38c@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1706721797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T7jJIaYqMSfxPjtLTr60DeUKvzsmBPgfKadAEZC9wwo=;
 b=T5SxKhAAJiH0NWcSdazzl+wRI6/ATIDRkkLlsiQNj6P+XSRcZbj16uQSZC0qMDWHAm/t32
 y3POA/YOv31Sz7HR3CLt+qJJexg5TUwkuKcp5NJTBbFLZzZnu9zaEDytRQivcziCm+AZWH
 LMgHe6mCtAMfq17ajMJCzLrvpP5ktkIwK78qGV82ODHXyN8rT0x2zsb3tG5RiAFgCsrTzy
 NH74VvHMxbJKrFOC0ImAbgSq1Zfq9XhmDUE/MQUqsX4418pw5a2QvC9/S7qhsFiMZ1WXUL
 mhzMCgYV1wv98suc2P4xMB91L0BXTjcy8EBwMzcdjcoQOHF8uG6EldVD2ldU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1706721797;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7jJIaYqMSfxPjtLTr60DeUKvzsmBPgfKadAEZC9wwo=;
 b=C7S5PNyeFynbMjNaJdSIVnEfbdRFQhB66SkNb1tyfxDZGujMTB0pCmkhAgVK0B/IzSCNn1
 DAFhaayE8FIoBcoPKWW/aZ+0d9i7F7bfeTiHJ5DggJGzVECZnNjp757YOVxmGKTbFj1oc9
 7EUdrv8LuXa8AwB/9Sak9f74/9s76JnCe15r3D0Trtna3aMjyINxdnnEbQu95upfGYiDWH
 MiDCKRwrq3JZfXl2IuDN2jJ53NpTh6XV15v+VU1vfKKZMBuzf9p1Es70dUre7kXa3rO1Ji
 vVf1fYcK5zOWB4CBmewCsiBV4Hg/MYs4GAkvoyAtLLbwpAZviVA4gi8fLQQGLA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1706721797; a=rsa-sha256; cv=none;
 b=o37iH5DlZhudX0g7wrQFXivWYBlZfw6KV7qoPJAOAGnneqnGleIIuyAbIJCgSkfaJercFA
 C3wJSco9alFsazIkS88c9WTPVBCfqUiTAlYmkz2x/KW8rBkWJ9+ODTPvF3Zr4QMbyrGaAI
 tQ1FMh0x1QNMcTKe7c9+xnOZnGfrxfdmGBxAngqv5a3U7ww6sF3xf0MW2VYeXOHpeOGHc5
 tGudQ+zfB1Jrnx5O6JrqvOJDG9iCcS0yk0Oah8eGvnuN7xNPAUiTVqtezehrQKk6AnpWOX
 BKHyojikbjpT6meialC9E4L4rrFOFFHt60tZVArrThILfV7IQDYxKBswH/fnwA==
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] smb: client: Fix a NULL vs IS_ERR() check in
 wsl_set_xattrs()
In-Reply-To: <571c33b3-8378-49fd-84e1-57f622ef6db5@moroto.mountain>
References: <571c33b3-8378-49fd-84e1-57f622ef6db5@moroto.mountain>
Date: Wed, 31 Jan 2024 14:23:13 -0300
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
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dan Carpenter <dan.carpenter@linaro.org> writes:

> This was intended to be an IS_ERR() check.  The ea_create_context()
> function doesn't return NULL.
>
> Fixes: 1eab17fe485c ("smb: client: add support for WSL reparse points")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/smb/client/reparse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Paulo Alcantara <pc@manguebit.com>


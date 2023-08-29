Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8743778D067
	for <lists+samba-technical@lfdr.de>; Wed, 30 Aug 2023 01:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zmAvbKbvHPTK+tSdU1LtS5cJIoj5hGJqWxhJnxvR1TE=; b=n3pOGZyJb6oUo0D1kZIvbUnl73
	tYDGrumhl1Jh+4pVp5y7S01TKpqunDJoCqU0KD4zFv+CYDU6neps9QcXqdR3o53bkqwJ4ef/uER+g
	bkZ1U6mosj8slyxM3HkeErj9+F9IwI7HukTsxLJsxozaGmNmrgtgp9Yt2T87m+mmfj2YcZzcvCAiE
	7ndQ5szaGxyYBB2YX2GmZoCdDKGDg8ECRB2KyFzyfz0v9zMgtQHEQPzROD+TMMqp8kMyCxvLPCtK4
	myeGRSB9iOh/Sydn6yylCPc8APgp1RP7ieD3iVk9NTrL6kqHpQb8ZNM5wgebDlD91SPmP4OPE70Jw
	4HN3uKMA==;
Received: from ip6-localhost ([::1]:20640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qb83F-00FRn4-Td; Tue, 29 Aug 2023 23:23:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36878) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qb839-00FRmv-4H
 for samba-technical@lists.samba.org; Tue, 29 Aug 2023 23:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=zmAvbKbvHPTK+tSdU1LtS5cJIoj5hGJqWxhJnxvR1TE=; b=bkHEmD8N0NCg57Z34V1rkyw9uD
 Y/t/T67CzbZr9uXqiw/E9VtVFHYX4zsPf13GEqti8H0fmXeoFONAQbWAXpgGAdlqV/W9D+pL2kGr2
 3UvXSEKce7SNAXikHXnPzbztWnCEI1f/7izMx2q9hMstLCv02rGTRXSb96hFOco3L5JtqqJtR7mO9
 T3jGZhdoyyYmZojv9jDfulvK+5o5xhPn3ZHF4zWQ2f/8jm151LT8h0bmPROr3X7g/ueoY8N1jVDnZ
 lxH2E7EF5X9eIA6k9Oo8lyMNv2CEnJREoeAUKAqr1wbchmvo6PGp+lC0W51ESSpWVX6Q3L0jybyyW
 NwVL762cWCQvzzqAbE2TWYAuJvmmfoDAfI42qSlpxmgmVJtOdAuv/CipILNnVwazazVqwBRTc/s5g
 U3YZSJHm6Vk72bL7Fa8FySuHDjXGZkvoYuSC0SH1aNYNgnWrwqi1F/XB39oV2GuDmp3YuNDtSxF1F
 Kut9+xXj9tg/zmsKLuh9klvI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qb837-00AfZm-0X; Tue, 29 Aug 2023 23:23:05 +0000
Message-ID: <62bd6748-fedf-85c4-7416-7e620fa6b4f2@samba.org>
Date: Tue, 29 Aug 2023 18:23:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] smb: propagate error code of extract_sharename()
Content-Language: en-US
To: Katya Orlova <e.orlova@ispras.ru>, David Howells <dhowells@redhat.com>
References: <20230815133831.3537-1-e.orlova@ispras.ru>
In-Reply-To: <20230815133831.3537-1-e.orlova@ispras.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Steven French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steven French <sfrench@samba.org>
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 lvc-project@linuxtesting.org, samba-technical@lists.samba.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

On 8/15/23 08:38, Katya Orlova wrote:
> In addition to the EINVAL, there may be an ENOMEM.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 70431bfd825d ("cifs: Support fscache indexing rewrite")
> Signed-off-by: Katya Orlova <e.orlova@ispras.ru>
> ---
>   fs/smb/client/fscache.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/fscache.c b/fs/smb/client/fscache.c
> index 8f6909d633da..34e20c4cd507 100644
> --- a/fs/smb/client/fscache.c
> +++ b/fs/smb/client/fscache.c
> @@ -48,7 +48,7 @@ int cifs_fscache_get_super_cookie(struct cifs_tcon *tcon)
>   	sharename = extract_sharename(tcon->tree_name);
>   	if (IS_ERR(sharename)) {
>   		cifs_dbg(FYI, "%s: couldn't extract sharename\n", __func__);
> -		return -EINVAL;
> +		return PTR_ERR(sharename);
>   	}
>   
>   	slen = strlen(sharename);


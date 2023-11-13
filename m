Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2667EA315
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 19:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YdugKrF1IHQlb6TkxWiEpumPtlmZ379QWs8fZvedX24=; b=kB65qZP67XIUzMQBmoqSZv4M26
	PpUVJMBgEFgQt/fsV21tnXAIkTw2JvUppWs40ESSXVoVfLq4XvsrHAZwdk/szsIa5Hpujn4s0m5Qp
	go5dg+T5FLTp537AHws+Tqa4lA3wPa/+2RxdgavwP6QyAHjAaC5EWa0b9rDmUR6DZDh/SpbvAZ1/7
	z5AbAgN+FwQBdQpecrKyjVcZQ343z557X7IdnOjz7Fo/lz/O1Uwd6B1Ztl/e05SSTSQIly/RPeGmM
	Cm6Q6nJzcJtv2zaL4f4kUFfkOgkmphomi8kXvx25P04TIDzzyaYWH2I/1SvzK6nU9/7Q8hjy9kbQZ
	AOOZKfog==;
Received: from ip6-localhost ([::1]:28572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2c0R-0088OG-LQ; Mon, 13 Nov 2023 18:49:55 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:36898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2c0J-0088O7-DW
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 18:49:51 +0000
Message-ID: <6bcf9eb2d4ca5faa17e8e0842c4d69fd.pc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1699901384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YdugKrF1IHQlb6TkxWiEpumPtlmZ379QWs8fZvedX24=;
 b=YPH52W0vCrsa65YO0LWx28OiLIEZNBi9nurcA/VlQfU+CVhc4XSv9teWPiiXs1gcZ/1S6j
 2z6MMwfd8OkzBd5XtpWD0d1jPzocppDfGsmsY3/drw2AAPshTJlSBzCpZUPzSLbrfuvkB6
 ymCPO/7JjQd0NXRxBi4v+t/uLTYZ+SFDkZ71rVWk7UHbVdcKcTmE4govFPIHZNuaQcH2AV
 8Y3iAank794IxdExgLcjag4xkxyEzScpvdSHjKN5QJUrslHk0waL+X4k7/muesei2Gq/NX
 MK84RCVSmjfqn76DjhOU8Dt57bep+RotwQ0WgX5lh5w+ISu7XfufWzE4yVYqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1699901384;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdugKrF1IHQlb6TkxWiEpumPtlmZ379QWs8fZvedX24=;
 b=IVzS7DHdzhuBCTwZEqcrJ0EebdfaWtnBVQZ6Tw+SV10HTFOC7qiUOOF+qiAgtNE2oqyUp3
 yujSJGmPc3XaAqgWbbde5G+cSFKXbfvWPX/QKlhBwyCwj1gTti0B3O6RsFH0yfPyNR5cmQ
 Va8kvIh3FMMkGlANinL+Cn7mBqvnXZ4eQ9jFKCa1hlIrTR54qLH1eRLh3q06w7kaRqcp52
 oSF1FZ/aQEHG6tbAR+yDY9uOlLwGLZ9Vso6JZbxxQ5/MaLlAAbBZpoqsjMp8VBF1Bl44Q0
 8tfv52fOJnxnh4V6zU67knG0RoWXoUnDTy4Ea8OKjFk0nd5Ztut2s8KFZrOyTw==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1699901384; a=rsa-sha256; cv=none;
 b=govAlo1L714Gbqo1VbQfkM6vjRsK6bhNSG9DtUwjDdkU3lMBmC6+ud9z2NrKh9jj2D0PkB
 yIRk3dPQksDdh6Yi04mjjjTA1RpTozaISCoZrZrYIJYaTqcHrd9VbN+ciUQ2OioDao8vu9
 T8Ygh0cWuG/vVbIc+asUd+GgyLrWuhB5rsU8iuACu5+SNkWAG0m75Ykjzvec5KGLSpLOwe
 AloD5BcZc6XOF4a+NTZXcw6jhI8WBqi87a2SU59AqC9+nTDJhw51fgsqhPgGblhGPWfBCd
 olJoZV6+MNASjIPOVtxOL5/OR6QEOac9JvWGOdCc8SUlj7c2af8WnkYA58jEKw==
To: Ekaterina Esina <eesina@astralinux.ru>, Steve French <sfrench@samba.org>
Subject: Re: [PATCH] cifs: fix check of rc in function generate_smb3signingkey
In-Reply-To: <20231113164241.32310-1-eesina@astralinux.ru>
References: <20231113164241.32310-1-eesina@astralinux.ru>
Date: Mon, 13 Nov 2023 15:49:41 -0300
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 samba-technical@lists.samba.org, Aurelien Aptel <aaptel@suse.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Tom Talpey <tom@talpey.com>,
 Ekaterina Esina <eesina@astralinux.ru>,
 Anastasia Belova <abelova@astralinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ekaterina Esina <eesina@astralinux.ru> writes:

> Remove extra check after condition, add check after generating key
> for encryption. The check is needed to return non zero rc before
> rewriting it with generating key for decryption.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d70e9fa55884 ("cifs: try opening channels after mounting")
> Signed-off-by: Ekaterina Esina <eesina@astralinux.ru>
> Co-developed-by: Anastasia Belova <abelova@astralinux.ru>
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  fs/smb/client/smb2transport.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>


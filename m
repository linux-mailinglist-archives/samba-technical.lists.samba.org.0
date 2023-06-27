Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D74740295
	for <lists+samba-technical@lfdr.de>; Tue, 27 Jun 2023 19:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WyXWxFIH1UoRYYS19wsiBX0/0B37P9alxoz0Y8Z5FmY=; b=qC6GlaA/VCEKkjUnCnxBhED+E/
	geRhpwGLEhb8HJNLG7SEQUs48KYpyqqu+KypVfjHF98WrqzvO5Zi5ExzHCnSOVaChiJxi/dtKtYGR
	pP4E8kVmhHQNg3MXdjE/Rffv7kbuwJulelQ7VrI26hAgBF3R8FsTEu1/JKtUbycPixuI7kkZI3sl2
	ToNUspoQrhH+mCw8Oa/oNsn1KZQBukSKuObHcwloqw29PBkN54+VT1vu5mKICAYoCmCkEeW1Vdblo
	8IotM62U5yLyMKWgeuth2rCpdRCWxzCsPoHTmm7jWreIKe/jLS+1RnXZRM6opBEe+x59IOVSB+mOZ
	UY7v1EFg==;
Received: from ip6-localhost ([::1]:54330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qECnK-004oPU-Th; Tue, 27 Jun 2023 17:48:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36742) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qECnE-004oPK-UR
 for samba-technical@lists.samba.org; Tue, 27 Jun 2023 17:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=WyXWxFIH1UoRYYS19wsiBX0/0B37P9alxoz0Y8Z5FmY=; b=d03Piy/Fnu/f1RE8Sgl2LskU02
 wxVMUhH5r6HblSITXiZFgv1stpomrHNS7TY6Eq36tedj+ZjWL/Ptt1HNUPp5BMxnaAay62IV/Sodv
 7GMwhsrJvt2fT5Jor18j0Yl26rhjX3wdvkM5bUoTQGDDeGJPz4krjYb5YQ7FQsAUHqXOHal09gXXZ
 SDjfcewT9tpNVtZ2Z0BCVInh9Kg1sE42tV7ZFNIR/vO5yR5+rzmJnRqDCf97hRv0UNERc6v4ozt3l
 9hjwpwNACpbjdLNv84Qzp8v1/2zImo6yNiC9z87YQ0Eu+T5//HAk6qKDtKKyIgpLXUjVmTR/Bl92o
 x4/zM2Qs35j+RXq7icrwVrvGCJJNbTjLePkflG5zRN9JfRaLBom7zX9F3WGHJ42ZbrGiIR5Hsbixh
 zVj7qEYytqYqKMyY+G3RVnAeCjmV+Cw+E5tL3zCNgYzB/YemaChslOX18ygX2ryquS9YukteHTpbO
 k0bzS9Cjh288mpnXrqoP6xrj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qECnD-004nb5-1j; Tue, 27 Jun 2023 17:47:55 +0000
Date: Tue, 27 Jun 2023 10:47:51 -0700
To: Ferenc =?iso-8859-1?Q?W=E1gner?= <wferi@niif.hu>
Subject: Re: Is this a real memory leak?
Message-ID: <ZJsgx2j0foTkcE6m@jeremy-rocky-laptop>
References: <87v8f9gpbo.fsf@fin.soreny>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8f9gpbo.fsf@fin.soreny>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 27, 2023 at 12:41:15PM +0200, Ferenc Wágner via samba-technical wrote:
>Dear Samba developers,
>
>Please take a look at the following patch, taken from
>https://github.com/balabit-deps/balabit-os-8-samba/commit/5f46ae6282db1457b8ef8bbfb4e97eb4aadd55b4:
>
>From 5f46ae6282db1457b8ef8bbfb4e97eb4aadd55b4 Mon Sep 17 00:00:00 2001
>From: Balazs Scheidler <bazsi@balabit.hu>
>Date: Wed, 22 Aug 2012 11:34:43 +0200
>Subject: [PATCH] nsswitch/libwbclient: fixed a memory leak in
> wbcAuthenticateUserEx
>
>(cherry picked from commit zorp-os-5.0 / f0e88410bd2528517910f780d71e63f8effb91ef)
>---
> nsswitch/libwbclient/wbc_pam.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/nsswitch/libwbclient/wbc_pam.c b/nsswitch/libwbclient/wbc_pam.c
>index e4cd2963..b16c9424 100644
>--- a/nsswitch/libwbclient/wbc_pam.c
>+++ b/nsswitch/libwbclient/wbc_pam.c
>@@ -415,6 +415,7 @@ wbcErr wbcCtxAuthenticateUserEx(struct wbcContext *ctx,
>                                 params->domain_name,
>                                 sep_response.data.info.winbind_separator,
>                                 params->account_name);
>+                       winbindd_free_response(&sep_response);
>                } else {
>                        strncpy(request.data.auth.user,
>                                params->account_name,
>
>Do you agree that this patches an actual memory leak?  If so, would you
>please consider taking it?

Thanks Ferenc, this does look like a real memory leak to me.


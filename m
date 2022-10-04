Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102B5F49A7
	for <lists+samba-technical@lfdr.de>; Tue,  4 Oct 2022 21:20:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cvV5XO3ylK5FK1gANSWSwikc0pVYpXVdsUgPuT78aGo=; b=GdSCthv5sRFUXWyTfqvQJpusVX
	bdlg48k+yoYWLdb5ZGKOuSl8oCb75IvjP4WARK65ZJnuiLtJiwWvu5xR5TPuW9hrtj4IX8aWF28Ps
	7y/IFIZ/IVVVGHrX/7iOdB2u9WaZYxK6gExeouW2mNbv1hvGs4Q7xdAsN++dwLVUZblaDXxvkr/14
	V0rQu7Sw2kDmkeFmyd/RaNlWQkJJ8qp1EXVkNjxT8T5Kk1pEaEWRaUdaqEQ/gRGnn8t7tbBg2NkYw
	V/5tiuB8y6WhuOdWH0z1BPx5xdeciESwqbXqWIefMnMM7r4T9WXIGqtou+ssCqTMShhCA7B7TD7wS
	JhP1du4Q==;
Received: from ip6-localhost ([::1]:45076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofnRd-007ySB-Sk; Tue, 04 Oct 2022 19:19:09 +0000
Received: from mx.cjr.nz ([51.158.111.142]:32538) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofnRR-007yS2-74
 for samba-technical@lists.samba.org; Tue, 04 Oct 2022 19:19:07 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 6487080B8A;
 Tue,  4 Oct 2022 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1664910050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cvV5XO3ylK5FK1gANSWSwikc0pVYpXVdsUgPuT78aGo=;
 b=a3q3LfgY8Yo+sVRT9GjdQDSTwwwPwiqdHpRUvYQ6jJp9vJEnReR++sGUTQye6hXBl37ezf
 PinXzTjZ5dYJN1Q1Q8H6gEPDwukEZIK0+XE7wUtV1Ao0h7dpL1iNBjmbXffkMOuTMk2tiL
 wDc5sHGkNLPBrPBO2THnYC6Eq7W5rlmOeJKylEQAPIJSs3eHoE+4QfkJ1oEkVAPd3c+0J9
 qMtErMk3G4nU+a7KdlrWeM+q/h4eeTZswV0i3jLu+ySRK1T6f+M0gIyTNSPsOrxdBM0oNQ
 53zVaJ6M/3RykpuPh2NKb39YpMGbQe+AYG8e2YvfyevJ6q7DfkOwVgbqiFkbhQ==
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Steve French
 <sfrench@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>
Subject: Re: [PATCH 2/2] cifs: check returned value for error
In-Reply-To: <20221004062333.416225-2-usama.anjum@collabora.com>
References: <20221004062333.416225-1-usama.anjum@collabora.com>
 <20221004062333.416225-2-usama.anjum@collabora.com>
Date: Tue, 04 Oct 2022 16:01:40 -0300
Message-ID: <87lepv4dm3.fsf@cjr.nz>
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Muhammad Usama Anjum <usama.anjum@collabora.com> writes:

> smb311_decode_neg_context() can return error. Its return value should be
> checked for errors.
>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  fs/cifs/smb2pdu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 2bf43c892ae6..c6e37352dbe1 100644

This patch doesn't apply in Steve's for-next branch[1].  If it still
makes sense, please rebase and resend.

[1] git://git.samba.org/sfrench/cifs-2.6.git


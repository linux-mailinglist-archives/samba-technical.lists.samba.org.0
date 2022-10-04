Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4DF5F4563
	for <lists+samba-technical@lfdr.de>; Tue,  4 Oct 2022 16:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5gUUNgEDhizGEpFxKtQMBGFV8uYs1I5bUDwiFyCdJPs=; b=wENXH/snLcvQLQqGIYeaChYrAu
	JlD5jcH/PBGlaRfT9nYYv1FEmtQAL/nNqs3xCvTJNXRs2AuXZgplHPp14atRapAxxZy8+ff9Gs6ia
	SmMK+zPqn5e3FDZTr/bVVnwf/2MuT7bV+BRg4dMG03Sht3ZIWNQhzUN9ut6WmpVyqZlRKK3lBJXT5
	F+aqppof65jG3ypIO6bW7U7+eDYicF6Zm9pIwuIqhHtJCDo7r/J+nRMQRkGowkCHo+FmntnMdkwre
	1HF9Evx/cVLWi0JJJohLVgW1n9qMQuqqGxW3SKiW0aUV9tJqv1Sv4UU2y63AiKvb2Z9xBu10IpUym
	W5TIm83w==;
Received: from ip6-localhost ([::1]:36096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofipQ-007uzh-EM; Tue, 04 Oct 2022 14:23:24 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:59930) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofipL-007uzY-MN
 for samba-technical@lists.samba.org; Tue, 04 Oct 2022 14:23:21 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08A432198D;
 Tue,  4 Oct 2022 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664893389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5gUUNgEDhizGEpFxKtQMBGFV8uYs1I5bUDwiFyCdJPs=;
 b=Zt/OhUS5ydTQ9UGifRGK41t6GwEwC9hWteg+uA6BanmdxcmrHSUmnRwaax6muvmAzKKREl
 HvCVf6R1AOho0RNxtGGq8BX7drQ5X+U22DhcXFne3NLKWdoz22LRBr9nP61FvgBdh/CnD2
 lrLR8nF+sDF1Wgk/6b85JyPAcKbmAGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664893389;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5gUUNgEDhizGEpFxKtQMBGFV8uYs1I5bUDwiFyCdJPs=;
 b=nnwkZhu5TLtAve4z+S1eE5DR29Ezv4gT6tG61WizYluhc4rs1VB3OA9gmZrHP6yk89nLJM
 fz5UHGvz5kGnMFBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80A1D139EF;
 Tue,  4 Oct 2022 14:23:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ds5VEcxBPGPpdAAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Tue, 04 Oct 2022 14:23:08 +0000
Date: Tue, 4 Oct 2022 11:23:06 -0300
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: Re: [PATCH 1/2] cifs: remove initialization value
Message-ID: <20221004142306.ysgh45nhgdo4z3ok@suse.de>
References: <20221004062333.416225-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221004062333.416225-1-usama.anjum@collabora.com>
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
From: Enzo Matsumiya via samba-technical <samba-technical@lists.samba.org>
Reply-To: Enzo Matsumiya <ematsumiya@suse.de>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Paulo Alcantara <pc@cjr.nz>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, kernel@collabora.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Usama,

On 10/04, Muhammad Usama Anjum wrote:
>Don't initialize the rc as its value is being overwritten before its
>use.

Being bitten by an unitialized variable bug as recent as 2 days ago, I'd
say this is a step backwards from the "best practices" POV.

>Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>---
> fs/cifs/smb2pdu.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
>index 0600f0a07628..2bf43c892ae6 100644
>--- a/fs/cifs/smb2pdu.c
>+++ b/fs/cifs/smb2pdu.c
>@@ -879,7 +879,7 @@ SMB2_negotiate(const unsigned int xid,
> 	struct smb2_negotiate_rsp *rsp;
> 	struct kvec iov[1];
> 	struct kvec rsp_iov;
>-	int rc = 0;
>+	int rc;
> 	int resp_buftype;
> 	int blob_offset, blob_length;
> 	char *security_blob;
>-- 
>2.30.2

Cheers,

Enzo


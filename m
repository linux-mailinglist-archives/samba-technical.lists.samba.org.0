Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9C23EF6FA
	for <lists+samba-technical@lfdr.de>; Wed, 18 Aug 2021 02:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OwKoMpKsJfYGuAd5+UrIcHs7Dv7p+8pKzbl1xu55fyE=; b=KRwiydwYECvpZWt9aIdRNsAQnj
	Ptq5lVO6VGurL4VIfMM6JWAnuEbsWkMVy97WFAts1xLR/NjlphwzlO8PDA7JTjuLd9XC1uxi/NN0K
	FArEUtfMCF5YiNi6425yogegnQ1kHAaSYgwUOkn1FoNpHDLGjK9y8NVP4irT6RNvMGmJ/kme7dIQ1
	J8/KB64zshP5S9G+LV0fHqf/o8Nxfi0+qdF/EPFhltAyc/N55pW/1BuNs0D8GbLy2dXBhpvWl0jSm
	8XPGz1tzRBEWs9Eiui+fd9+DDmdSEDFzmTe3JxNVbAFXro5D5hLwuJhTlV3HL+D2qWgCHzYWdMvYN
	87Ba2ayg==;
Received: from ip6-localhost ([::1]:55300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mG9d7-007D4c-4t; Wed, 18 Aug 2021 00:40:29 +0000
Received: from mx.cjr.nz ([51.158.111.142]:61116) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mG9cy-007D4T-Rf
 for samba-technical@lists.samba.org; Wed, 18 Aug 2021 00:40:26 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 3D024818D6;
 Wed, 18 Aug 2021 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1629246623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OwKoMpKsJfYGuAd5+UrIcHs7Dv7p+8pKzbl1xu55fyE=;
 b=nbJ9B3FXUUeED1pR2AuA+whx4RTm4MTvkBkk3TZRcgqwiSWtTlq5FuettUxXJN2b01es56
 2PPUYEJ6pZtdSdA9dWjpKm6nvrMcYmZfH8LXq1X+OiPeoTfbilWfKyMsb8WhbFqPFJJ9f/
 YJ/GBiVrJ8abARaqd5IAtuT0+zkDwK+Z2Jv8OOBM6l3GJA++rNNaxBseyGiCou9m5sBu1o
 MTq/vgJfDT1h8uAX67xwLvMBSyN6LSyQzUE1xqbUKzndceHAQe60CZYRYGHKRINFN7y/GP
 VNJpSB7Ryg+87uup72keukwqsQD7ENhF5GQFAoifNJzCFV+mKkqEaYVR5YY2UA==
To: Ding Hui <dinghui@sangfor.com.cn>, sfrench@samba.org
Subject: Re: [PATCH] cifs: fix wrong release in sess_alloc_buffer() failed path
In-Reply-To: <20210817145510.639-1-dinghui@sangfor.com.cn>
References: <20210817145510.639-1-dinghui@sangfor.com.cn>
Date: Tue, 17 Aug 2021 21:30:17 -0300
Message-ID: <87fsv7h9wm.fsf@cjr.nz>
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
Cc: linux-cifs@vger.kernel.org, Ding Hui <dinghui@sangfor.com.cn>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ding Hui <dinghui@sangfor.com.cn> writes:

> smb_buf is allocated by small_smb_init_no_tc(), and buf type is
> CIFS_SMALL_BUFFER, so we should use cifs_small_buf_release() to
> release it in failed path.
>
> Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
> ---
>  fs/cifs/sess.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>


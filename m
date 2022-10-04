Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FF15F49AB
	for <lists+samba-technical@lfdr.de>; Tue,  4 Oct 2022 21:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=myIGBnfBacIG2+HWik5iZ7600MHQKUlDlQPLoFbcxX8=; b=dnVFxr+fiVCur1h2A1ij5OKMhH
	IprksIHRre2prelQB4XonNwRseFDq7FYq67vV3RMPhexaC0vr6gl3RKOgawtd6gKSxQ+iZSeNAKJe
	kph6Rwr1gszcViNSIFRTBKNO6s1yN8vYGIz8RGbj2FldElIUJenbpqLLfyzkGDtGDzP809OT1WKva
	mU3530BgtC4m8xnOFKvqqGSbQCdR5D7Crd8806ARPTx2SsjmST1VOh/JpZ/Y5k7LX7I171MnpNbiz
	w9WEkHpT+SMRVZaf7hrqCdn9wkpGnk9JtIke/lkI5v184czV9oCH84FFjqDJMh9sArUxyXNk/ezNe
	PIwXHTug==;
Received: from ip6-localhost ([::1]:50018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofnWN-007yjy-Et; Tue, 04 Oct 2022 19:24:03 +0000
Received: from mx.cjr.nz ([51.158.111.142]:32984) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofnWH-007yjp-HY
 for samba-technical@lists.samba.org; Tue, 04 Oct 2022 19:23:59 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id CAACC8079F;
 Tue,  4 Oct 2022 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1664909946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=myIGBnfBacIG2+HWik5iZ7600MHQKUlDlQPLoFbcxX8=;
 b=Z+jJ47GsoCRk3wbcpVcQrV8XfZWlkR8lL3oB+/fogM5z1dR3mNRIGwP6ReWz4Lk0YeX36e
 oGdtEMAT8m0M6/KP5Eauwre+fIEIQy7QlUOqvW0PnlZU0P+sIYADe+5Ww2ypWiMEIdeLFc
 HfJPAl6ItKbFOw2BLBfqyDCRVhtVonxNbHSdqyZA115hohF29tSGJgiaiXgSd9CU678qUs
 a4G8tdM2eaNljBM+NjnoW4vpJFVt8snRqpZ2Mqx4pfoJ+UCGk0agmC+MaITtN2QRuWA7dn
 vOZZqOBdquVN5yEHr5AF3Un+bhHl1GbTIMdqC4QECmYOhknIIypGzvL6CUzzTg==
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Steve French
 <sfrench@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>
Subject: Re: [PATCH 1/2] cifs: remove initialization value
In-Reply-To: <20221004062333.416225-1-usama.anjum@collabora.com>
References: <20221004062333.416225-1-usama.anjum@collabora.com>
Date: Tue, 04 Oct 2022 15:59:55 -0300
Message-ID: <87o7ur4dp0.fsf@cjr.nz>
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

> Don't initialize the rc as its value is being overwritten before its
> use.
>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  fs/cifs/smb2pdu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>


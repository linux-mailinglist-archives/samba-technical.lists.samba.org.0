Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FE61A7551
	for <lists+samba-technical@lfdr.de>; Tue, 14 Apr 2020 10:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=zlWGbTOB9joXsAgxkgX2tpua1ctVBKP5fRVz0EJLD7E=; b=sLd2DxWkflfwS6kWVtvK5pdcFH
	IRu157CV90hpHZ898AYwYDlNitd2KVWsQKy1XNWUqzbotBuFzBoaLxCt09yrNZpzw34c6/K6JSpFa
	OLQ63K1Ia81qJz+01Lf1a+k7A9setMqVqyv1o1SeV0MCsq7I04ZvkZesIEpar4b6NYl1xdacygJ/C
	RSyZeisMapV+oYBHRqB8dZrm3y+ZiVAd1/rsiMYDRtGFNH8PDCKeM/J7Xxuq9gt7/xinBi4qrdipy
	2PZ+yol13DuEvTEmBUz15pXuEY1S3lSJRuoahLVVVkEhNN9HpfwPAAd9Hr0R1DJdKHVgSqcwhwxG+
	DOOMpu+g==;
Received: from localhost ([::1]:57348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jOGVq-000fG5-Qd; Tue, 14 Apr 2020 08:01:42 +0000
Received: from smtprelay0048.hostedemail.com ([216.40.44.48]:43050
 helo=smtprelay.hostedemail.com) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jO6iL-000dtN-7N
 for samba-technical@lists.samba.org; Mon, 13 Apr 2020 21:33:59 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id D45AF18027F9D;
 Mon, 13 Apr 2020 21:33:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: badge84_5a5696689f027
X-Filterd-Recvd-Size: 3380
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Mon, 13 Apr 2020 21:33:40 +0000 (UTC)
Message-ID: <efd6ceb1f182aa7364e9706422768a1c1335aee4.camel@perches.com>
Subject: Re: [PATCH 2/2] crypto: Remove unnecessary memzero_explicit()
To: Waiman Long <longman@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>,  David Howells <dhowells@redhat.com>, Jarkko
 Sakkinen <jarkko.sakkinen@linux.intel.com>, James Morris
 <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
Date: Mon, 13 Apr 2020 14:31:32 -0700
In-Reply-To: <20200413211550.8307-3-longman@redhat.com>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413211550.8307-3-longman@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 216.40.44.48
 (smtprelay0048.hostedemail.com) incorrectly presented itself as
 smtprelay.hostedemail.com
X-Mailman-Approved-At: Tue, 14 Apr 2020 08:01:38 +0000
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
From: Joe Perches via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joe Perches <joe@perches.com>
Cc: samba-technical@lists.samba.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-crypto@vger.kernel.org,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-04-13 at 17:15 -0400, Waiman Long wrote:
> Since kfree_sensitive() will do an implicit memzero_explicit(), there
> is no need to call memzero_explicit() before it. Eliminate those
> memzero_explicit() and simplify the call sites.

2 bits of trivia:

> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
[]
> @@ -391,10 +388,7 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  		dev_dbg(ce->dev, "ERROR: Invalid keylen %u\n", keylen);
>  		return -EINVAL;
>  	}
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>  	op->keylen = keylen;
>  	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>  	if (!op->key)

It might be a defect to set op->keylen before the kmemdup succeeds.

> @@ -416,10 +410,7 @@ int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  	if (err)
>  		return err;
>  
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	free_sensitive(op->key, op->keylen);

Why not kfree_sensitive(op->key) ?




Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DEBA8134
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 13:41:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WIxdHZoHbFVGIK0wXmRUfvlBo1LbkYr7AQ2Ks9G3LZo=; b=GivolqrzKom4k/FImDtRkdiNZn
	vz7FFPIjnGacG80Q/CIlU93HxwG/8Zjg7zVTi7btWhBidFkjC8gG+2Dylq+l89+8jcmwohJFv9gZm
	YgQESYuQiJdmj6+e2bNQohdv3xhRQxDTwEh4vSKvCLfQAreK2amp+zCTdAiigDriysYKvZh8aCGjf
	AR+RXvyhzAQy5YHI18Z1ha1rrjMXq1pVztBxtuMD8WP+JGgunpdn9Ua1ZcjCfErjQ08B0Uk7Wx+kk
	CXAdCHyKJHTzzAa/r7ogRtyHk/5PpV+xcgkGEmYeMut21l9Kay7KYOE+UunOdrmM8ut+J9dLsQg3x
	O2OfIqZw==;
Received: from localhost ([::1]:54880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5TeV-003NMk-M1; Wed, 04 Sep 2019 11:40:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10302) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5TeR-003NMd-4g
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 11:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=WIxdHZoHbFVGIK0wXmRUfvlBo1LbkYr7AQ2Ks9G3LZo=; b=RUGTaIAyHrXITbXUp7IF4+p9kL
 CcjxlpR5Y5VcXnCTnaDnl4EYG787z6WTKAugeqFiUhlkQmfMXCmBq9n77uMKCcZnAFbZ3gHfoYiPA
 lQrGhbku0z3vPNziOexxER77YChSWvfVaAVpzgm+kLy5NgVdk6NJyIhKQLgC0HP07IkY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5TeQ-0005V1-Df; Wed, 04 Sep 2019 11:40:38 +0000
Date: Wed, 4 Sep 2019 14:40:35 +0300
To: =?iso-8859-1?Q?G=FCnther?= Deschner <gd@samba.org>
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
Message-ID: <20190904114035.GD25360@onega.vda.li>
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 04 syys 2019, Günther Deschner via samba-technical wrote:
> Hi,
> 
> while fixing bug #13861 we brought in a regression via
> 2044ca0e20bd3180720a82506b3af041d14b5c68 (we check only for LDAP result
> code but the result itself). Andreas has a similar patch in his larger
> join related patchset but we should first push this isolated join fix.
> 
> Please review and push.
> 
> Thanks,
> Guenther
> 
> -- 
> Günther Deschner                    GPG-ID: 8EE11688
> Red Hat                         gdeschner@redhat.com
> Samba Team                              gd@samba.org

> From 0f6357f5fce2a25dff957ffffb236252951244fa Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?G=C3=BCnther=20Deschner?= <gd@samba.org>
> Date: Fri, 30 Aug 2019 17:19:51 +0200
> Subject: [PATCH] s3/libads: fix joining to AD and specific organizational
>  units
> 
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=14114
> 
> The change made in 2044ca0e20bd3180720a82506b3af041d14b5c68 (for #13861)
> did only check whether the LDAP query was successful, it did not
> check for the LDAP results.
> 
> Guenther
> 
> Signed-off-by: Guenther Deschner <gd@samba.org>
> ---
>  source3/libads/ldap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/source3/libads/ldap.c b/source3/libads/ldap.c
> index 4f3d43b02b1..d7741e0920b 100644
> --- a/source3/libads/ldap.c
> +++ b/source3/libads/ldap.c
> @@ -2122,7 +2122,7 @@ ADS_STATUS ads_create_machine_acct(ADS_STRUCT *ads,
>  
>  	ret = ads_find_machine_acct(ads, &res, machine_escaped);
>  	ads_msgfree(ads, res);
> -	if (ADS_ERR_OK(ret)) {
> +	if (ADS_ERR_OK(ret) && ads_count_replies(ads, res) == 1) {
>  		DBG_DEBUG("Host account for %s already exists.\n",
>  				machine_escaped);
I wonder if the check has to be ads_count_replies(ads, res) > 0 ?
Technically, there could be a unique name but there might be names in
multiple OUs.

Other than that, RB+, please push.

>  		ret = ADS_ERROR_LDAP(LDAP_ALREADY_EXISTS);
> -- 
> 2.21.0
> 





-- 
/ Alexander Bokovoy


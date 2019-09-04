Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD336A81B5
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 14:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/DcXubfw9NtSK8Ik0C3FepCVKGj8Mcb6LFVAKEGAcBA=; b=v3FXLccP5IKOaBvUa4Dh0tmRwD
	CZ7v6NgdbJ7ceXYTjZ/tCcJ5pGZ0JLzmyktVuNO91dFYrvlsXXbx8An2gT9HFCAPeRNZgThEEL8We
	V4ydARVd1p35E809qn75CSBEwgDegbFcnJY4TNDyriDVG9H+Pgsp9OUKnbEujjbGxnL4BUSvT2OOm
	TH7JFFw4amLA377+Fv6AJYTFz+jbwBaBSgUxeWscrMsvc6dVTn0w1cKAF4Q4rc4FcHSRgnaYWWTgC
	R/5lZeKeIlsAniNj1l84HigVATRzFyB2U6CJKGvtrtLykqIeV+Hj6ARjdUMK7D/Qh1KqjAN76DOk9
	sYmKHKwA==;
Received: from localhost ([::1]:58660 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5U0S-003NwO-ON; Wed, 04 Sep 2019 12:03:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21378) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5U0P-003NwH-04
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 12:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=/DcXubfw9NtSK8Ik0C3FepCVKGj8Mcb6LFVAKEGAcBA=; b=fbQV1W2KZHBIjhX0+vkPV/90nV
 NdMpcUdBrV63nCSlhKDkuJ3gKEENTPNdOyfaMP67CL/pQV9iNoRyvq0sfBQMRLy0X+PtH2gLqnxtE
 n+ht48tt5yJljA5OekeuAe+TaVS4MODp3N/xb+N5mwzlBe2Kbjf5ES36yuPIBJ6RfvXQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5U0O-0005ke-DY; Wed, 04 Sep 2019 12:03:20 +0000
Date: Wed, 4 Sep 2019 15:03:18 +0300
To: =?iso-8859-1?Q?G=FCnther?= Deschner <gd@samba.org>
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
Message-ID: <20190904120318.GE25360@onega.vda.li>
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
 <20190904114035.GD25360@onega.vda.li>
 <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
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
> Hi Alexander,
> 
> On 04/09/2019 13:40, Alexander Bokovoy wrote:
> 
> >> @@ -2122,7 +2122,7 @@ ADS_STATUS ads_create_machine_acct(ADS_STRUCT *ads,
> >>  
> >>  	ret = ads_find_machine_acct(ads, &res, machine_escaped);
> >>  	ads_msgfree(ads, res);
> >> -	if (ADS_ERR_OK(ret)) {
> >> +	if (ADS_ERR_OK(ret) && ads_count_replies(ads, res) == 1) {
> >>  		DBG_DEBUG("Host account for %s already exists.\n",
> >>  				machine_escaped);
> > I wonder if the check has to be ads_count_replies(ads, res) > 0 ?
> > Technically, there could be a unique name but there might be names in
> > multiple OUs.
> 
> The LDAP query looks for the specific samaccountname of that machine
> which will be unique in the entire domain namespace.

Ok, discussed it more on IRC and since GC search will not be done here,
'== 1' is OK.

RB+, please push.


-- 
/ Alexander Bokovoy


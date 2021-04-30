Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9D036F3F0
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 04:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gmZg1DVMTaKsOcqvwD3ffCEAT+Y8Gu+i1DTBNKj7LiU=; b=Z9mD2UTOc/kiXAOcB1Wuv1FMoW
	GAtQnD2h5RIygVLB45ubpYlOO5K7MHa/r90sjPWAjubhtdWFL9Uv3kalFYp/s9caxgk3tlLA1zKDM
	b03waO/KEPrRApJCTNeDDC2F7sPaGKotLBcqzh06KFFLwBCrhBKEzi3zVOaUlIewn61igk5wVOYI9
	YYDPR8R6gBaHQAMOG/q2b+dkNzPbK8vtOgVkz9GJlhAk1sBb1G6Ht9n4HrCWHO4fxmW+JQT8IBy4m
	ZuPSwDig/ej22DFc5zDYbjeIhLS0MFJVcTNSoOTXRfOzxsAxTvIHl/kz7+6vPPPLRhDlhf55c2m/+
	WguMxjrg==;
Received: from ip6-localhost ([::1]:39622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcIZN-00DHC4-OF; Fri, 30 Apr 2021 02:07:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30108) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcIZI-00DHBx-A5
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 02:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gmZg1DVMTaKsOcqvwD3ffCEAT+Y8Gu+i1DTBNKj7LiU=; b=TFOalKdsireAGdnVMFKlnFMWhq
 jc3zOkA5RMHF9N93BK4VCD1LESXeoYxFEmB//M9G8ul6X+jScaMBt5uIK9clm7lBfiFeEIu0/HQG3
 MCs4fPFwQQ/D7qekBPVHTMHnOb/WnHnMullEayw0FwN8j05OrbQXlb6uvHTxRFltvJ0PqSUAfOdN/
 nGVJYgPHIGTS6T6vOFMPzLawLK4cMVKiLQeqswNnS9budANryZS7HChxiqzAJTtk95MxO/5O5eZx/
 v0iKk4W9x02t8aDKvL8yuxyhhG8VGbyozbl44coTnWNmxw7Z8/opR278ERvIeU+7PjOQwVrgPknaW
 DOGgKrJ+xW25tT1+24SArsG2nYfiYuJ1j9SAs60eGZkcdlrqWn7ZZQE9tHuT8iQ/FGZcD0Zvk2mAV
 YPYvE829IwfLCDoKb5HurvtHfzEG6Z6oDwXKNpw0EQTHY+GfvZHkQNg1Jjh21dFpoxEmyBjpMMQMn
 5XZ8qcDOSuMOOGboW5oy4MS8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcIZA-0002xU-Re; Fri, 30 Apr 2021 02:07:41 +0000
Date: Thu, 29 Apr 2021 19:07:37 -0700
To: Shilpa K <shilpa.krishnareddy@gmail.com>
Subject: Re: Fallback to NTLMSSP allowed if KDC is not reachable?
Message-ID: <20210430020737.GA942612@jeremy-acer>
References: <CAHbM3qj_N3XKNC0q3nfmkqjDsGis+rRd8eSRUjs2LWYrUNZZyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHbM3qj_N3XKNC0q3nfmkqjDsGis+rRd8eSRUjs2LWYrUNZZyg@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 30, 2021 at 07:08:44AM +0530, Shilpa K via samba-technical wrote:
>Hello,
>
>In one instance, port 88 was blocked while port 445 and port 139 were
>allowed on the DC. In this scenario, when we tried to execute 'net ads join
>-k', it was not working. But, with the below code modification, it will
>fallback to NTLMSSP and works. Is it expected to fallback to NTLMSSP in net
>ads commands if krb does not work?

Hmmm. I think that's a policy decision. Not sure
*where* that policy is set, but I'm pretty sure
it's a policy somewhere :-).

Hopefully a Team member who works more on authentication
will chime in here..

>diff --git a/source3/utils/net_ads.c b/source3/utils/net_ads.c
>index 23ab0f9133..0d94ce692e 100644
>--- a/source3/utils/net_ads.c
>+++ b/source3/utils/net_ads.c
>@@ -297,6 +297,8 @@ retry:
>                }
>        }
>
>+       ads->auth.flags |= ADS_AUTH_ALLOW_NTLMSSP;
>+
>        status = ads_connect(ads);
>
>        if (!ADS_ERR_OK(status)) {
>
>diff --git a/source3/libnet/libnet_join.c b/source3/libnet/libnet_join.c
>index 103120d8ec..53875fb946 100644
>--- a/source3/libnet/libnet_join.c
>+++ b/source3/libnet/libnet_join.c
>@@ -152,6 +152,8 @@ static ADS_STATUS libnet_connect_ads(const char
>*ad_domain_name,
>                my_ads->auth.password = SMB_STRDUP(password);
>        }
>
>+       my_ads->auth.flags |= ADS_AUTH_ALLOW_NTLMSSP;
>+
>        status = ads_connect_user_creds(my_ads);
>        if (!ADS_ERR_OK(status)) {
>                ads_destroy(&my_ads);


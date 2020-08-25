Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4C0252400
	for <lists+samba-technical@lfdr.de>; Wed, 26 Aug 2020 01:16:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZR/0Q08jlRpSaaHPTCpaA+xj73cpltiG6vfD4bBUaQQ=; b=jpQXg6hQ/mcYQqceISs0zrqyAE
	cDGMZxVS3PirYQi6VAFgOTdL1zeLfeBK6304hUIxKuiLoBheB75jdGT2ueIqRz587vAb856qYH84V
	iyB981SGcbtb1/Khv6IJ2ZBgUviGw8n5ER2COvbePxUDTwMHMWFT8s6Teu/bHmCdw+WlFjdjFuPjh
	qg+SVxwmqatD63kBxaDXSuqYvQlnrteMykFQ457MLdNaDwSojgJCgPt331lDzHSDcSMywbNF44c0D
	KYWHrTTFGbfS6Hb1KxgY5hEzFz3I0wv2LuLdohObJgLFeNPtt1T5tbn3we+IxNg5rI2lVZq7QRAIC
	dObSiz1g==;
Received: from localhost ([::1]:52514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kAiAE-000XRk-TM; Tue, 25 Aug 2020 23:15:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAiAA-000XRc-IM
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 23:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ZR/0Q08jlRpSaaHPTCpaA+xj73cpltiG6vfD4bBUaQQ=; b=nfO6FJXYCj6CiC6ahob7TVSuFd
 YROklycAhdL4/wRKGqLp82I8Tvd5K10HRC5ZPi1RFyotvHlliBZOzWeHLlAXah46TfnK/lT/7wLCn
 gL2SboHtDpXdJUQvEFr0sVsl57VDC14RNz0mslBcWbVQldgd8wqgx5vUN6XvN2PQ5XT98NCAwQajT
 CpFZdiU94sJ3644LLsjLtdn25oxMoimkt+u9FbfbWwikLaRADV0arceBMynQcRGHfgyplcPBAFHBH
 MZ+B4KUP8Ue5NdJBjYIc5MtjNUDnQfkxRoziVccfEnp2EElS2+vMTVCT+/UpZ7xxxEjTsjc20wdbC
 dVXDZuTcfn7OG31+xigxBynNUy5vvtgAUZHU4EFhDzQ+N+gNEiSJcXZK99iZfziDxuKPImNrddz+e
 r7XJNoNlEM1/Yl9fttPyI1Vdhf0qF3lFRe0Rc5McOYp+/w1q+b/WGNc416D3W7ErFecPqxACcmgiQ
 nvqU/xXJ4Z+s/cegFbhxj3iV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAiA9-00025t-PJ; Tue, 25 Aug 2020 23:15:34 +0000
Date: Tue, 25 Aug 2020 16:15:29 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: [PATCH}pam_winbind grammar and typos
Message-ID: <20200825231529.GA3997@jeremy-acer>
References: <66993582-b8b0-1d0b-65cf-3158487ea138@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66993582-b8b0-1d0b-65cf-3158487ea138@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, Aug 25, 2020 at 01:37:13PM +0100, Rowland penny via samba-technical wrote:
> Attempt to fix the grammar and typos in the pam_winbind manpage, see
> attached patch.

LGTM Rowland, RB+ and pushed. Feel free to re-push if
the autobuild fails :-).

Jeremy.

> From 2ca75b1b3ec2eefb169b222177f6bce4a6e61e47 Mon Sep 17 00:00:00 2001
> From: Rowland Penny <rpenny@samba.org>
> Date: Tue, 25 Aug 2020 13:19:28 +0100
> Subject: [PATCH] pam_winbind manpage: grammar and typos
> 
> Signed-off-by: Rowland Penny <rpenny@samba.org>
> ---
>  docs-xml/manpages/pam_winbind.8.xml | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/docs-xml/manpages/pam_winbind.8.xml b/docs-xml/manpages/pam_winbind.8.xml
> index 32030ef0ecc..171bb408757 100644
> --- a/docs-xml/manpages/pam_winbind.8.xml
> +++ b/docs-xml/manpages/pam_winbind.8.xml
> @@ -165,23 +165,23 @@
>  		(when the DIR type is supported by the system's Kerberos
>  		library). In case of FILE a credential cache in the form of
>  		/tmp/krb5cc_UID will be created -  in case of DIR you NEED
> -		to specify a directory. UID is replaced with the numeric
> -		user id. The UID directory is being created. The path up to
> -		the directory should already exist. Check the details of the
> -		Kerberos implmentation.</para>
> +		to specify a directory which must exist, the UID directory
> +		will be created in the specified directory.
> +		In all cases UID is replaced with the numeric user id.
> +		Check the details of the Kerberos implementation.</para>
>  
>  		<para>When using the KEYRING type, the supported mechanism is
>  		<quote>KEYRING:persistent:UID</quote>, which uses the Linux
>  		kernel keyring to store credentials on a per-UID basis.
> -		The KEYRING has its limitations. As it is secure kernel memory,
> -		for example bulk sorage of credentils is for not possible.</para>
> +		KEYRING has limitations. For example, it is secure kernel memory,
> +		so bulk storage of credentials is not possible.</para>
>  
> -		<para>When using th KCM type, the supported mechanism is
> +		<para>When using the KCM type, the supported mechanism is
>  		<quote>KCM:UID</quote>, which uses a Kerberos credential
> -		manaager to store credentials on a per-UID basis similar to
> +		manager to store credentials on a per-UID basis similar to
>  		KEYRING. This is the recommended choice on latest Linux
> -		distributions, offering a Kerberos Credential Manager. If not
> -		we suggest to use KEYRING as those are the most secure and
> +		distributions that offer a Kerberos Credential Manager. If not,
> +		we suggest to use KEYRING, as those are the most secure and
>  		predictable method.</para>
>  
>  		<para>It is also possible to define custom filepaths and use the "%u"
> -- 
> 2.20.1
> 



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B251E269F54
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 09:12:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=cWiSp2nLYgYA9kJpQ3OGmBCa7aX/G5VwoBaDXU9RbMc=; b=eiwcaVB+ApuL7jocCLiGomFLDs
	DvQPm+We/uimSTBBBvJeUZENleCknrIBKZfpuTTzHOsx1ecJo+5nUKoi9X7WeDjyAyzvaWGqgP3KN
	Gv1ggh83K93R/7NBEpkEIyEqUv4o+2k1r3FXm+mCNGBCnEsb4LUJcYLUiCYb/wpa5hTUbi5Mze4W6
	xAnlfgA9PgI1dkps2wfC9YOPUvWB5DpldXVpWLho5Rj1RyCIZQoKue1pwU68rntD3Vqrc6nojPKh2
	Yf074b8JHFX/8Me01xUbv4FVqm22HysnGJPHe18fO3d9sEetIsZD6bfzWmuSdyakWuDRID3xO58U5
	ojgDijyw==;
Received: from localhost ([::1]:50822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kI575-005RSF-BN; Tue, 15 Sep 2020 07:10:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45938) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI56p-005RS8-Im
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 07:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=cWiSp2nLYgYA9kJpQ3OGmBCa7aX/G5VwoBaDXU9RbMc=; b=JFCgzW82qFoV89i+p8z82mA0jC
 hqCquxUDYC1t/V7efm1T40K4C6xibFQhs3TJQ5RnJgKkPfJFOvUIAEmZHxcqzcP92ZsopBDGUYmUk
 X+TapDZnzXj/kvSVvczgSAzhd8vIBxPzAR6wqKhBlfs1/yXQIlajRnxyURA5wxqfBnj1fvL5y4rad
 VJBPurR5/EZQTwrk41wSIF4hUuX8/IHc9oOMSnsxQgBCNpz5qrGTULixJxJ26Ki+wZrZqw6jHv28V
 sNdJcL9X+DPJclLBbivOc4kQpk4jZVcJ1KM9h4tR+ETxtzNHPL/W1/3/xXS3vvpH6TF/tRBFlZ5HO
 wO2TzROlPzFmH7SQcT1K30IrwxhCGKKOVgl9Tz8lwPZYIBQmtDJh0wXZL1yU0oBeI0HZaLUQLR6r4
 aNhZitSOuzuwrHW6JprSqCTDz/PjqaWWC4JHy+Uq32iqrx523qQvuNSxqCmnF4mrz0aJ19OAbuDjB
 Qvy6Jl3xrhlVmhoNOFWtH45u;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI56n-0005fu-Ay
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 07:10:33 +0000
Subject: Re: SELinux attributes in Samba domain
To: samba-technical@lists.samba.org
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
Message-ID: <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
Date: Tue, 15 Sep 2020 08:10:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/09/2020 01:42, Mikhail Novosyolov via samba-technical wrote:
> Hello everyone!
>
> I am thinking about storing SELinux attributes of domain users in Samba AD domain.
>
> The problem is that Samba AD copies Windows domain, but there is no SELinux in Windows.
>
> Currently FreeIPA can store this as a server in LDAP and sssd can get and apply SELinux attributes from FreeIPA's LDAP:
>
> $ grep -inHr ipaSELinux
> src/providers/ipa/ipa_config.h:34:#define IPA_CONFIG_SELINUX_DEFAULT_USER_CTX "ipaSELinuxUserMapDefault"
> src/providers/ipa/ipa_config.h:35:#define IPA_CONFIG_SELINUX_MAP_ORDER "ipaSELinuxUserMapOrder"
> src/providers/ipa/ipa_opts.c:271:    { "ipa_selinux_usermap_object_class", "ipaselinuxusermap", SYSDB_SELINUX_USERMAP_CLASS, NULL},
> src/providers/ipa/ipa_opts.c:276:    { "ipa_selinux_usermap_selinux_user", "ipaSELinuxUser", SYSDB_SELINUX_USER, NULL},
>
> In general it just gets a string and processes it, this email is about storing that string inside the domain per user.
>
> My question is: how can SELinux attributes be stored inside Samba?
> I understand that it will not a standartized name (but maybe we can come up to upstreamizing something into sssd...?), but I am ready to keep with something not upstream for now and to try to make SSSD to the same for selinux in Samba as it does in FreeIPA.
>
> I think I should extend Samba's scheme with custom attributes like in the guide http://david-latham.blogspot.com/2012/12/extending-ad-schema-on-samba4.html
> And then try to make sssd read those values.
> Does it sound like a not very bad approach?
>
> Thanks!
>
>
We have a wikipage about extending  the AD schema: 
https://wiki.samba.org/index.php/Samba_AD_schema_extensions

Your problem will come with sssd, it isn't supported by Samba (because 
we do not produce it and no little about it) and even Red-Hat no longer 
supports it use with Samba.

Rowland




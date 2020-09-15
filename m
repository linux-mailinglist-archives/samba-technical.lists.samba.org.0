Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8B126A05F
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 10:05:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=7BHJ/PE52H5k8Z0k/p3Q/hxYkbsZjHUxD/HCvq9D2wE=; b=iqF64LtC1Kt20tgOpPh8UY0FvX
	zsmKDZpe1ON0l4znaSmsVhT2aLTkbrEeo1aJ+vH3Guedkr/+zIn2ac8iUqEs0Zdpxygx+XAbDz9cb
	IZq0gZU+8X/u6lwkY7jK3m1fRK2fyEpAD4qZOhNtjU7JcMJvYCX5LAbnqxi73ZJPBKcdUZrJWQlda
	Vi2RMHGZKLSQzuhVkfC1FrEN6RsW+H6X5LIj++gCmPT7qUwPVBfuLF+pfa3vEiq/hl2jKtw09PPiE
	JZcpBVWVpKdqJdfhzxXEr34k2ZXAV2tElFULI85scII3f1RyeBGxZH9IksufSD05TP0Y/58Xm/q++
	Fcj0eZNQ==;
Received: from localhost ([::1]:52362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kI5x8-005RmU-1I; Tue, 15 Sep 2020 08:04:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62742) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI5x1-005RmN-MY
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 08:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=7BHJ/PE52H5k8Z0k/p3Q/hxYkbsZjHUxD/HCvq9D2wE=; b=X2Vwu4NM0aK9Z5LtzvNN4TWK4d
 GACU9GktWPRNwe1x7JirEFIyg18IFo0RZI2kNkosbotKsXuUwvvKoVdinhL1IKjwESwaXr5JHW2CX
 V8S9GmgmAKi5l1c7Tbn2wiN1UMCnZC9yP7ZO64yzqVy89nsV19hKJbE8O+blPWffBbkbfAeSlWjwH
 +0Wu6flFmNT1W5d4UQdO2un45stb+kBL7G6s5n1rAifT4tN6verBRWormWzgUslBM1FDas+LKekBf
 ND9NEBVxivtXtiNf+LkhuhYAIJRGRoVGQrYvfifMHr4TLfjjFH26JupZezQam/LocQ+Jpv4y+sX0J
 TXRhDDxILV1su6CLGPSAP94EHuWXkxTGZ1UByDH7ERQWALsa2fXj2i15V3fGBc7pAzlL16aqfrwT+
 GO4x4/ysdLvWt0Odg81DV6b+BLjH/8v2c4CQB4fqcr8w95RTapyG94jsoA3YodOf4T/plVumINR1O
 jqmkXjw8w4euk9wh4HoJeG6F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI5x0-0006A0-Rg; Tue, 15 Sep 2020 08:04:30 +0000
Subject: Re: SELinux attributes in Samba domain
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <c98e756ee61403d845c5cba384c756224d2fd5bd.camel@samba.org>
Message-ID: <b9a78af7-1a42-b294-4cfa-dee7a743d84b@samba.org>
Date: Tue, 15 Sep 2020 09:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c98e756ee61403d845c5cba384c756224d2fd5bd.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 15/09/2020 08:39, Andrew Bartlett wrote:
> On Tue, 2020-09-15 at 08:10 +0100, Rowland penny via samba-technical
> wrote:
>> On 15/09/2020 01:42, Mikhail Novosyolov via samba-technical wrote:
>>> Hello everyone!
>>>
>>> I am thinking about storing SELinux attributes of domain users in
>>> Samba AD domain.
>>>
>>> The problem is that Samba AD copies Windows domain, but there is no
>>> SELinux in Windows.
>>>
>>> Currently FreeIPA can store this as a server in LDAP and sssd can
>>> get and apply SELinux attributes from FreeIPA's LDAP:
>>>
>>> $ grep -inHr ipaSELinux
>>> src/providers/ipa/ipa_config.h:34:#define
>>> IPA_CONFIG_SELINUX_DEFAULT_USER_CTX "ipaSELinuxUserMapDefault"
>>> src/providers/ipa/ipa_config.h:35:#define
>>> IPA_CONFIG_SELINUX_MAP_ORDER "ipaSELinuxUserMapOrder"
>>> src/providers/ipa/ipa_opts.c:271:    {
>>> "ipa_selinux_usermap_object_class", "ipaselinuxusermap",
>>> SYSDB_SELINUX_USERMAP_CLASS, NULL},
>>> src/providers/ipa/ipa_opts.c:276:    {
>>> "ipa_selinux_usermap_selinux_user", "ipaSELinuxUser",
>>> SYSDB_SELINUX_USER, NULL},
>>>
>>> In general it just gets a string and processes it, this email is
>>> about storing that string inside the domain per user.
>>>
>>> My question is: how can SELinux attributes be stored inside Samba?
>>> I understand that it will not a standartized name (but maybe we can
>>> come up to upstreamizing something into sssd...?), but I am ready
>>> to keep with something not upstream for now and to try to make SSSD
>>> to the same for selinux in Samba as it does in FreeIPA.
>>>
>>> I think I should extend Samba's scheme with custom attributes like
>>> in the guide
>>> http://david-latham.blogspot.com/2012/12/extending-ad-schema-on-samba4.html
>>> And then try to make sssd read those values.
>>> Does it sound like a not very bad approach?
>>>
>>> Thanks!
>>>
>>>
>> We have a wikipage about extending  the AD schema:
>> https://wiki.samba.org/index.php/Samba_AD_schema_extensions
>>
>> Your problem will come with sssd, it isn't supported by Samba
>> (because
>> we do not produce it and no little about it) and even Red-Hat no
>> longer
>> supports it use with Samba.
> For managing pure Linux clients it would be really awesome if we could
> make this work well.  I've long dreamed that Samba be the ideal posix
> directory server, because there is no good reason why it can't do that
> as well as be an AD DC - why should sites have to run both FreeIPA and
> Samba (and have the complexity of trusts) just to get really good
> management of their Linux clients.
Totally agree with this, it would be great if Samba could do for Linux 
what AD did for Windows.
>
> Rowland,
>
> While the combination of Samba and sssd on the same host is a known
> problem, outside this case we should work hard to have sssd be a great
> domain member in Samba domains, just as much as we hope for good
> outcomes for MacOS or Windows clients.
>
> Andrew Bartlett
>
Nope, we should make Samba work so well that nobody needs sssd. Lets be 
honest, there is very little that sssd does that Samba doesn't, 
especially when David's GPO tools come on line.

It shouldn't be down to Samba to make sssd work in a Samba domain, it 
should be down to Red-Hat to do this. There are more important things 
that need fixing first, Sysvol for one.

Rowland




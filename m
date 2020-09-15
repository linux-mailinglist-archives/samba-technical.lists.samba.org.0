Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8977626A44F
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 13:42:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=sNV0QEHTvGaFhuizG+a7aiIMA/I997PsIKY5jb6/+Ok=; b=smPHasVVDxQL0CHIWVQmLaZd4U
	ObQYX3gF/t4tVSirVqiAnUKR1GP8nfssK6828FedFo9Jz3i+rNdguS+YSFYJUie97c1V2HzTw+L34
	3rBkSesp6rOqj2Swwp/j1C3sYA22Bf2UT9T3wu6UMvPEZ3ac0QrzTxUOiVUhSYhk6UrhWHV93fqrF
	4XZdYa2UKGVJmtfJQO4LuldcWAaU6YIOZASz9SgCD1vtVnefJQdFvgEofgZS21xdfdesE4Jou4+sY
	K9Tpwn/gzhZXUhTF/tsSZ20u8m0KIBhd3uuJLp/vizn6rTGJDbIvkejAAYQWmtilioPqk6o3jk6e0
	u4XAn1+A==;
Received: from localhost ([::1]:19052 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kI9Lh-005TvK-KN; Tue, 15 Sep 2020 11:42:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18466) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI9Lc-005Tv8-AT
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 11:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=sNV0QEHTvGaFhuizG+a7aiIMA/I997PsIKY5jb6/+Ok=; b=qGYctfWTDL+Z+rl41SjrhbVVWE
 gRYkLS123AB2HUiTX5A/5d25bSx5PFz+XtOFmODxSygNAoFSa46Kc8M2ltSdJuAWNHjA88bhC0H4T
 hyT5sb3mYLraiqwJpNd71DnpHMQLqZyenJE72jNDfy3zYMUOBm7JRzBoQadRM+4PDYFHvpgZdslBC
 K5rb651lHo4ODleu8hNPZFKI7o5ZVMktQJpX/EKXg15seRzj68ZwAXMc4Q6BbU7pRdmYW0WmFLIqO
 CvCjtIu2/OIgUzzwEMwRTy3DL7YbPsk1A/WZyTqj3YO1KjMB4yBNBcbjhD6RDN8vMEadpn9StJrRT
 qXVZFN+tGu9PnX+CwksBPtHKBEcPcWu1pF7h1F9gRTA/4vOqep7ste2fzMQDJXQCpGlCNaIkgd00T
 GPORMnaNHC0oRw8M/U8mV9slAH0VIclWKUA0/gtQcNoT0aksHDzoXI3vVxPiUM2xn+SbQnMAHXuX7
 FY6DEo0aQZ5NgBdclNdxJWhc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI9Lb-0007mi-4c
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 11:42:07 +0000
Subject: Re: SELinux attributes in Samba domain
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <c98e756ee61403d845c5cba384c756224d2fd5bd.camel@samba.org>
 <01ED5F03-FFBD-48D1-85F1-639CABD23564@rosalinux.ru>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <21fc0d1d-810a-19f1-56b0-38f63dfd8ec4@samba.org>
Date: Tue, 15 Sep 2020 12:42:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <01ED5F03-FFBD-48D1-85F1-639CABD23564@rosalinux.ru>
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

On 15/09/2020 12:16, Mikhail Novosyolov wrote:
>
> 15 сентября 2020 г. 10:39:41 GMT+03:00, Andrew Bartlett via samba-technical <samba-technical@lists.samba.org> пишет:
>> On Tue, 2020-09-15 at 08:10 +0100, Rowland penny via samba-technical
>> wrote:
>>> On 15/09/2020 01:42, Mikhail Novosyolov via samba-technical wrote:
>>>> Hello everyone!
>>>>
>>>> I am thinking about storing SELinux attributes of domain users in
>>>> Samba AD domain.
>>>>
>>>> The problem is that Samba AD copies Windows domain, but there is no
>>>> SELinux in Windows.
>>>>
>>>> Currently FreeIPA can store this as a server in LDAP and sssd can
>>>> get and apply SELinux attributes from FreeIPA's LDAP:
>>>>
>>>> $ grep -inHr ipaSELinux
>>>> src/providers/ipa/ipa_config.h:34:#define
>>>> IPA_CONFIG_SELINUX_DEFAULT_USER_CTX "ipaSELinuxUserMapDefault"
>>>> src/providers/ipa/ipa_config.h:35:#define
>>>> IPA_CONFIG_SELINUX_MAP_ORDER "ipaSELinuxUserMapOrder"
>>>> src/providers/ipa/ipa_opts.c:271:    {
>>>> "ipa_selinux_usermap_object_class", "ipaselinuxusermap",
>>>> SYSDB_SELINUX_USERMAP_CLASS, NULL},
>>>> src/providers/ipa/ipa_opts.c:276:    {
>>>> "ipa_selinux_usermap_selinux_user", "ipaSELinuxUser",
>>>> SYSDB_SELINUX_USER, NULL},
>>>>
>>>> In general it just gets a string and processes it, this email is
>>>> about storing that string inside the domain per user.
>>>>
>>>> My question is: how can SELinux attributes be stored inside Samba?
>>>> I understand that it will not a standartized name (but maybe we can
>>>> come up to upstreamizing something into sssd...?), but I am ready
>>>> to keep with something not upstream for now and to try to make SSSD
>>>> to the same for selinux in Samba as it does in FreeIPA.
>>>>
>>>> I think I should extend Samba's scheme with custom attributes like
>>>> in the guide
>>>>
>> http://david-latham.blogspot.com/2012/12/extending-ad-schema-on-samba4.html
>>>> And then try to make sssd read those values.
>>>> Does it sound like a not very bad approach?
>>>>
>>>> Thanks!
>>>>
>>>>
>>> We have a wikipage about extending  the AD schema:
>>> https://wiki.samba.org/index.php/Samba_AD_schema_extensions
>>>
>>> Your problem will come with sssd, it isn't supported by Samba
>>> (because
>>> we do not produce it and no little about it) and even Red-Hat no
>>> longer
>>> supports it use with Samba.
>> For managing pure Linux clients it would be really awesome if we could
>> make this work well.  I've long dreamed that Samba be the ideal posix
>> directory server, because there is no good reason why it can't do that
>> as well as be an AD DC - why should sites have to run both FreeIPA and
>> Samba (and have the complexity of trusts) just to get really good
>> management of their Linux clients.
> Yes! FreeIPA is a great thing, but a VERY complex and resource hungry one!
>
>> Rowland,
>>
>> While the combination of Samba and sssd on the same host is a known
>> problem,
> Why may it be needed to run samba and sssd on the same host? Samba is server, sssd is client, but it probably does use smbd? Which problems are there?

There are a lot of people out there using sssd with Samba, which was 
okay before Samba 4.8.0, but isn't now. Samba is a server, but it is 
also a client and it can be both at the same time.

Rowland





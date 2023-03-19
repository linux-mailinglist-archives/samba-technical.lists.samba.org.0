Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E81A6C0032
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 09:52:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aucNPLHy7bCpgBNQggN9GwvoO7LCqUlINNqVY7xET1M=; b=f7ZeKDLViVAN7uLT4XzSYi0iUk
	OxtrTvCWqQMmgfqty47fCGKuvREOaXOesSgbrcFBFgbBgH74gPZithFFEPQIiOYH5c/c++8GLkwsr
	lGuTfgowMMgPKcmmI7wja0V47STm/47H6dqz4xK4V/o1+XCDlScIw26JqjC2eN/IJpy1JeSFfyNr9
	8RnMKPNlxZBeMfpjNYvvjmHLy6C6+1KKxMkbGJUy3BkrLYXXrIowqHqbj9UHS9v5dgFBT3qKX5/Ww
	FeB5NmvwrCnuQC9U1uFJeKjIOF+qbee4apwYELO5esIXb+5RbRo10RZPrWKP9ts/TnG+S74cvAxA1
	e+aIxm/g==;
Received: from ip6-localhost ([::1]:31396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdold-003NH6-45; Sun, 19 Mar 2023 08:51:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdolW-003NGx-4G
 for samba-technical@lists.samba.org; Sun, 19 Mar 2023 08:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=aucNPLHy7bCpgBNQggN9GwvoO7LCqUlINNqVY7xET1M=; b=nuT2q4zhz62UhiVOrt8//9mZFK
 uIuNq7mQXA5wAkxuweb3V8O0w+/jZEyurHpSA84oEo+d/NI6wEweBlnIsqw9ZvpSEn7MXZTvBRRED
 ITbQdsdkmwVlVct24oaM44xqta+0wSo06j3iruXwJ2frVZEf0xSunOZ60vDZZ6ObyYHfdyUjaJJnV
 oTprxnPZQf17hj5fIRIJv3Ql7ghkOmTSJGxSDniyH82MP0VSZNFuAM3Kj6X8BCbaj1vfAQb76an4a
 ShFTKLFF1zB1DfpH5/JIdX1yDl+4Y9g2bVkKvO4FaNXnCm+SsGYcn0MbgVvPiaKrH1oaDHcGBc36A
 hD2tQElSO7v9rBga5Ve4b6A2c22ozlzd3lCHfCpxIcx4fqVUroXff5Cju/3YlcWny6mGHVxHjV8Mj
 De5VouD5CN5iqHD9BTqGwSC1z1BEEpMSdR3BVfSzSNKHyIG+DQ8kkzOIABZVLf8q7a9awClLVltuI
 tp/jWD83b0QPNkuuBIqfKV5G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pdolV-004BNd-GA
 for samba-technical@lists.samba.org; Sun, 19 Mar 2023 08:51:45 +0000
Message-ID: <1c92a10c-d23e-59e1-f2fe-ba4054418b67@samba.org>
Date: Sun, 19 Mar 2023 08:51:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: mit-krb5 and heimdal binaries
Content-Language: en-GB
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <31194bd0-05a5-9549-5b6c-ef37bd5d5c17@samba.org>
 <CAN05THRpJu92-viS-kbJr1F_hoQP94VPnWTzcy3+1s4j_kup-w@mail.gmail.com>
To: samba-technical@lists.samba.org
In-Reply-To: <CAN05THRpJu92-viS-kbJr1F_hoQP94VPnWTzcy3+1s4j_kup-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 19/03/2023 08:04, ronnie sahlberg wrote:
> On Sun, 19 Mar 2023 at 17:52, Rowland Penny via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>
>>
>>
>> On 19/03/2023 07:29, Alexander Bokovoy via samba-technical wrote:
>>> Hi,
>>>
>>> On su, 19 maalis 2023, Michael Tokarev via samba-technical wrote:
>>>> Hi!
>>>>
>>>> I already asked a similar question before, but it keeps popping up in different
>>>> contexts and forms, and the more I use samba myself, the more often it comes to
>>>> me too, especially in context of using various security tokens for auth.  And the
>>>> more I think about all this, the more sane it looks to me.
>>>>
>>>> The thing is: mit-krb5 has much better user-level support than heimdal. But samba
>>>> does not fully support mit-krb5 as an active directory domain controller.  The
>>>> AD-DC thing is server-side.
>>>>
>>>> I can think of providing two builds of samba for a distribution (eg debian/ubuntu), -
>>>> one implementing whole ad-dc, as a complete thing, using their own set of libs,
>>>> linked with heimdal. And a usual set of more client-side packages, with their own
>>>> libraries, built against mit-krb5.  Or maybe some other combination also has its
>>>> right to be, - for example, smbclient built with mit-krb5, the rest is heimdal.
>>>>
>>>> An essential part of this is that the two sets (built against mit-krb5 and heimdal)
>>>> do not share any internal libraries, each has its own libraries. This way, there's
>>>> no "mix" of differently built samba, each build uses only its own libs, so there's
>>>> no clash here.  They share the same smb.conf though.
>>>>
>>>> So far, I've seen requests to build two versions of the server (again, with mit-krb5
>>>> and with heimdal), - and I faced the same issues too.  This is because a regular AD
>>>> member server is also good to have mit-krb5 support to integrate nicely into the auth
>>>> infrastructure. While for ad-dc, it is less often used as "end-user" server.
>>>>
>>>> So I can think of a separate samba-ad-dc binary package providing whole samba suite
>>>> built against heimdal (maybe without smbclient and some other minor things), and
>>>> samba "file server" binary package providing regular server not suitable to use as
>>>> an ad-dc, but conflicting with samba-ad-dc, so it is not possible to install one
>>>> together with another.
>>>>
>>>> This approach also has another good side effect, to discourage usage of samba-ad-dc
>>>> as a regular file server.
>>>>
>>>> Or maybe the whole thing is moot now, and we just can provide regular samba built
>>>> against mit-krb5 to work as a good AD-DC?  That would be the best solution IMHO.
>>>
>>> I would be against a blended build against both MIT Kerberos and Heimdal
>>> Kerberos in a distribution. It is not going to bring you anything good,
>>> support wise.
>>>
>>> Andreas and I have submitted a talk to SambaXP about MIT
>>> Kerberos/Heimdal Kerberos-based Samba AD DC configurations, where they
>>> stand against each other and what are perspectives. In short, both have
>>> unique features that do not exist in the other variant and both are
>>> close to being production-ready. We want to change the status for MIT
>>> Kerberos-based build from experimental to production. Effectively,
>>> actual decision for a version shipped in a particular distribution would
>>> need to be made by that distribution, of course.
>>
>> I do not think this is a good idea, Samba should use one or the other,
>> not both. If you do use both, to a certain extent you will nearly double
>> the support required.
>>
>>>
>>> Distributions need to take into account security releases, as Rowland
>>> has pointed out as well. However, from my Fedora and RHEL experience,
>>> this is not a problem with MIT Kerberos -- certainly not more than with
>>> Heimdal. It is pretty much a coordination question and I believe we have
>>> very good coordination on that front with MIT Kerberos and distribution
>>> maintainers.
>>
>> That is strange, from what Andrew wrote, he appears to think the opposite.
>>
>>>
>>> If I was in Samba AD support for production deployments, I'd probably
>>> go with deploying DCs in a containerized image way to isolate completely
>>> from the rest of the OS. There are few images already that provide this
>>> setup: [1] was presented at SambaXP by Michael Adam and other folks now
>>> from IBM Storage, [2] is older and also active one.
>>>
>>> [1] https://github.com/samba-in-kubernetes/samba-container
>>> [2] https://github.com/instantlinux/docker-tools/tree/main/images/samba-dc
>>>
>>
>> I personally have no axe to grind over the matter, I do not care which
>> kdc is used, just as long as it is only one, if only from the support
>> point of view.
>> I also only say that using MIT is experimental because other wiser (at
>> least I hope they are wiser than me) people say it is, if this changes
>> then so be it.
>>
>> I still do not think it is a good idea for a distro to provide two
>> versions of Samba, one using Heimdal and the other using MIT.
> 
> Distros are always going to ship with MIT as that is the default.
> Distros might also have to ship Heimdal but that will double the
> support and maintenance cost
> of Kerberos support at distros.
> Forcing distro to ship Heimdal is not a zero-cost decision.

That isn't what I said, I said that I do not think it is a good idea for 
a distro to ship two versions of Samba.

Rowland



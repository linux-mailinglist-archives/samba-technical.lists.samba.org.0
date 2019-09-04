Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96965A81DB
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 14:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=RQioP5RSxwJ2rCKMJofq9YNq6b1lZRxZKHc4KhVJwow=; b=SS2wBpurTyHLn27xAnVWS2h08w
	iIXWFr1NCSO5zcebUz8956Pcc+bgHvuvv5ZNzWKjR9h6GinTdugHGvhCX4TGSC9rYoyx7qdNktyu0
	y/4z5nqWrDgArEyFcz+eTmOnx06Of4+HLvyTZWZj0QxrRn8FzIUOoLyU3bvbKEgw8rUpTwKFpFRxO
	UZRGnFLxVNBm3BcPzKocdT41O3uVrKIqYNQGruRY1xaZnE+dbAHNlSVgCPtffJML4BQT0ByKFgIwR
	ASDYdq5yffE54FePlCYuZLOfpKQqm882zeZKJLF0PVvf5pYVt7nDmuHy5CK2tlZxuUWFHC/wMjWqG
	BSZ/SavQ==;
Received: from localhost ([::1]:61988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5U4v-003ONu-0X; Wed, 04 Sep 2019 12:08:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23116) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5U4q-003ONn-7Q
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 12:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=RQioP5RSxwJ2rCKMJofq9YNq6b1lZRxZKHc4KhVJwow=; b=mCDaTSA9dc5g0RIlKHtdRaFyO3
 kSPfGyMHAHCbgFHJrj/xMCLer3o5XiOqyQ42QjWB+VpVTS2BZfpH6ag4Y8YQ3u9SV8kw8HHZBrSFv
 IgMt9OwPqyh/owyBzvBmF7pfLLLRq8iS/BMis/u+GG521uIkd9cms6pAbAQjr/cmUCxI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5U4p-0005zO-Lr; Wed, 04 Sep 2019 12:07:55 +0000
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
To: Nico Kadel-Garcia <nkadel@gmail.com>
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
 <CAOCN9rw95H1SAZr+CSGQyuOVBgJAUysGuHazxwWQUN4=kDFfnA@mail.gmail.com>
Message-ID: <19181593-9e9d-2819-62c9-e87b5ab8d6b1@samba.org>
Date: Wed, 4 Sep 2019 13:07:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOCN9rw95H1SAZr+CSGQyuOVBgJAUysGuHazxwWQUN4=kDFfnA@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 04/09/2019 12:50, Nico Kadel-Garcia via samba-technical wrote:
> On Wed, Sep 4, 2019 at 4:24 AM Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org> wrote:
>> It is quite late for Samba 4.11 but I wondered what folks would think
>> of marking 'encrypt passwords' as deprecated so we can consider to
>> remove this code in Samba 4.12 (eg master) later this year?
>>
>> This would dovetail with the SMB1 deprecation effort and I hope also
>> help find users who can't live without this (because SMB2 doesn't have
>> this at all).
> It's a good idea as a behavior. But you're right that it is *really*
> late in the release process. By "depreceate", do you mean deprecate in
> the documentation? Or to change any software behavior?
Deprecate means 'Even though it is still capable of being used, please 
don't use it', it doesn't actually change anything.
>
>> I'm unclear if this even works, given bugs like:
>> https://bugzilla.samba.org/show_bug.cgi?id=9705
>>
>> If this is supported I'll polish up the attached patch and then write a
>> WHATSNEW for 4.11.
>>
>> It doesn't commit us to doing anything in master / 4.12 (and we might
>> want to wait till closer to the end of the year for feedback), but I
>> took a stab at seeing what it might allow us to remove and this was the
>> diffstat (and there is probably more if we tried):
>>
>>   /docs-xml/smbdotconf/security/encryptpasswords.xml  |   43 -
>>   b/docs-xml/smbdotconf/security/encryptpasswords.xml |    4
>>   b/lib/replace/wscript                               |    1
>>   b/source3/auth/auth.c                               |    9
>>   b/source3/auth/pampass.c                            |  132 ---
>>   b/source3/auth/proto.h                              |   14
>>   b/source3/auth/wscript_build                        |    8
>>   b/source3/param/loadparm.c                          |    1
>>   b/source3/smbd/globals.h                            |    1
>>   b/source3/smbd/negprot.c                            |   62 -
>>   b/source3/smbd/reply.c                              |    6
>>   b/source3/smbd/sesssetup.c                          |  104 --
>>   b/source3/utils/testparm.c                          |   26
>>   b/source3/wscript                                   |    1
>>   b/source3/wscript_build                             |    1
>>   b/source4/auth/ntlm/wscript_build                   |    8
>>   b/source4/smb_server/smb/negprot.c                  |   63 -
>>   b/source4/smb_server/smb_server.h                   |    3
>>   lib/replace/crypt.c                                 |  770 --------------------
>>   source3/auth/auth_unix.c                            |  104 --
>>   source3/auth/pass_check.c                           |  294 -------
>>   source4/auth/ntlm/auth_unix.c                       |  769 -------------------
>>   22 files changed, 70 insertions(+), 2354 deletions(-)
>>
>> What do folks think?
>>
>> Andrew Bartlett
> Obviously, Iyou are far more active in the source code than us mere
> mortals. But as an occasional software developer, more than 2000 lines
> of deletion in 22 C files, that hasn't been through *any* of the
> releases QA? That's begging for trouble with an unexpected dependency,
> and it's not a critical feature. I'd push actual deletion back to
> 4.12, and be cautious about even inserting a deprecation warning at
> this late date.

Given that the default in smb.conf for  'encrypt passwords' is 'yes' and 
has been so since (at least) Samba 3.6.x, deprecating it will not change 
anything and removing it, not much more.

In case you haven't guessed by now, I am all for the removal, who thinks 
it is a good idea to send unencrypted passwords over the lan ?

Rowland


>
>> --
>> Andrew Bartlett                       http://samba.org/~abartlet/
>> Authentication Developer, Samba Team  http://samba.org
>> Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba
>>
>>
>>



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5812846375
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 23:33:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3CshrhHi7HWGC/52lU4umlJzHjSFoM07x/CEtO/S+LU=; b=NrXbn524FcTkh4ydP6su/iqT/u
	z7ENsZQCE/Vh5c2t4XEPPWGV6PknCHhUbOKrQStQqvkFcXSIX6aBD2H/7PbPdmBhhSvu5kuHKIOmE
	TFPsPkW3oXOloYGBGDMbiSKjpzlAL9ku5HxHg7ljXKjIM3EgRskSRvSND9/Ho/6Ub/E/teqe8DGPF
	Pjfcz1BRLZQ89QFC5hHVq9fXViMYkNCfbnYDX/GCpJRBg+iuz4fGqLyiJrnlwT8SlnqJh+uoeRx3c
	iqJJcuDHzXNVwoERO6pgeH+bED+Ii3ovhnez4PKfxGEaN5BSyV51hOsqzkP7ZQjdhL8eXz1LyqDNz
	aH4GILWQ==;
Received: from ip6-localhost ([::1]:49992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVfbv-007JVX-Fe; Thu, 01 Feb 2024 22:32:43 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:57706) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVfbr-007JVP-41
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 22:32:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55fcceb5f34so1059846a12.3
 for <samba-technical@lists.samba.org>; Thu, 01 Feb 2024 14:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706826758; x=1707431558; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3CshrhHi7HWGC/52lU4umlJzHjSFoM07x/CEtO/S+LU=;
 b=YDBTja5NvUfuhdj2KovVKCwtkbDHYRkv0PDPNcqxlv8HUuHDenlzMUiwsYZrX8mLfr
 bLZk+L50pIZ+c7nwciSPQZ9SyBoxe24i5b0CJJQqeP3jdZZINwnU287JAeRX8+4UizuE
 1V0pnooMiCE2Z7VxZ/sMGhAY7oG64G1BSOS9dJIS23BoRKOqS1k+tQjdTpl71OeQYfz/
 1wVqZhdxXibDN16QYSpZuUaddDdJf6GupWh8T6WtoVImL7KNhCTsktK1jP/+I0J3sa6a
 DpJbHs9qBjcr46FUZIakHhlJHOG4u9Xt2KqNjK8aofiRA7uAxsUgM15jLSuK1l9L5hZa
 Qjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706826758; x=1707431558;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3CshrhHi7HWGC/52lU4umlJzHjSFoM07x/CEtO/S+LU=;
 b=Fpn8MSWb/ynq+wPtBYJFz1aECVVuvDjLqUb+V0txaq1t01h+3Lwf0ZzrQgdKbtfB84
 qFXI0qP6r5s3/a+Gx7WoqoPd2m/fdjhfJy1NX5MLZMydoAcLyZ1qmrYdW5KUumm+GRWZ
 U38ljm+Aq/1NPgXVCU+8FGGGebJ6jKq7M/BZMhRrBchuoztjbK6VZLFIseuOsxcgiHTD
 mL4Mgn0TbQpaEnxFPBgaUM6Z/mMPUDv6KvsTWPhr33dt/S04QFvVI6aPZSvgy6fPWy0C
 R8C9ULftsFTWKLEtdolrbXhc4QUSPoHk2DEY6YXp4oWqnSiZajc5wIC0S474GvEQ7/Bv
 MHGg==
X-Gm-Message-State: AOJu0Yx9Xd7v+Qd2TjLfW+ADJsk4M4RQXo3dBMxuwjt0vC+QIOlpoHoc
 zrLwRsyVZD9/vLWbm/kQ2ghugjG9QRihtgfgmq0hrmNx/iBT63CpB/c5kBAb
X-Google-Smtp-Source: AGHT+IGArLYz6M/S/piZimKYSrFw7BTx5uhTcbhPAhZESlwl/bC6uqz1VXTp6a6DJMqwsHitKfyEUw==
X-Received: by 2002:a17:906:45:b0:a36:ff9f:4256 with SMTP id
 5-20020a170906004500b00a36ff9f4256mr112961ejg.54.1706826757931; 
 Thu, 01 Feb 2024 14:32:37 -0800 (PST)
Received: from [192.168.10.106] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 ds3-20020a170907724300b00a34a20b247fsm223128ejc.84.2024.02.01.14.32.37
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 14:32:37 -0800 (PST)
Message-ID: <f0ebb138-5ca4-4383-b17d-dd5f80ef1459@gmail.com>
Date: Thu, 1 Feb 2024 23:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question for time based group membership in FL 2016
Content-Language: nl, en-US
To: samba-technical@lists.samba.org
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
 <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
 <20240201214220.525418b1@devstation.samdom.example.com>
In-Reply-To: <20240201214220.525418b1@devstation.samdom.example.com>
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
From: Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Kees van Vloten <keesvanvloten@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 01-02-2024 22:42, Rowland Penny via samba-technical wrote:
> On Thu, 1 Feb 2024 22:16:35 +0100
> Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
> wrote:
>
>> On 01-02-2024 21:38, Douglas Bagnall via samba-technical wrote:
>>> On 2/02/24 07:22, Stefan Kania via samba-technical wrote:
>>>> Hi to all,
>>>>
>>>> I already posted the question in the samba-mailinlist but I think
>>>> it's more a question for developers :-)
>>>>
>>>> I have a question about FL 2016 and if samba supports it. If yes,
>>>> how can I use it without powershell.
>>>>
>>>> In FL 2016 there is the possibility to put a user into a group and
>>>> the membership is time based. So I could put the user Foo into the
>>>> group 'domain admins' for 30 minutes and after 30 minutes the
>>>> system will remove user foo from the group.
>>> That sounds good. We don't do that, and we don't call it part of
>>> "functional level 2016".
>>>
>>> The things that count as "functional level" are listed here:
>>>
>>> https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels
>>>
>>>
>>> They are protocol level things -- supporting FL2016 means you can
>>> properly be a DC in an FL2016 domain.
>>>
>>> Temporary memberships is a useful trick that Windows Server 2016
>>> can do, for which FL2016 is necessary, but not sufficient.
>>>
>>> That's my understanding, at least.
>>>
>>> Douglas
>>>
>>>
>> Still, if you know what this powershell call changes in the LDAP
>> record of the group, the user or elsewhere in LDAP, you can mimic
>> this functionality quite easily with a little cron script on the DC.
>>
>> I have created a kind similar implementation called auto-lock, where
>> (admin-)users that member of the "autolock" group automatically get
>> disabled at midnight every day
>> (https://github.com/kvvloten/samba_integrations/tree/main/domain_controller/manage_scripts#disable-special-users-daily)
>>
>> And another piece of cron-scripting makes "password expired" LDAP
>> searchable (which is not the case with the computed attribute
>> "msDS-User-Account-Control-Computed").
> That attribute is searchable, it is one of the attributes you have to
> explicitly ask for.

We had this discussing before: you can get it returned in an ldap query, 
but you can't use it in an ldap filter. Applications tend to use a 
filter to find find users, so it does not work for my usecase (with 
Privacyidea).

My workaround is to have a cron-script do the check and write the result 
in one of the unused attributes (e.g. the telex number), then the 
application can filter on that. Not the royal solution, but it works...

- Kees.

>
>> With this applications like
>> Privacyidea can disallow MFA for users with an expired domain
>> password.
>>
>> It can't be hard to query some attribute and add or remove a user
>> from a group.
>>
> Would that it was that easy, but as I said on the samba mailing list, I
> am sure the timing is done in code, but I am sure that those wiser than
> myself will know.
>
> Rowland
>
>
>
>
>


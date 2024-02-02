Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06542846ECA
	for <lists+samba-technical@lfdr.de>; Fri,  2 Feb 2024 12:20:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=dPFdsdJLHufSG881b3Lj9oOYeArSvWAzezhAgfv8zqA=; b=qbuDla2vkIXfUzj+JWNOoDUiuQ
	a4thMo95Ry2Kp6m3mtgbIaDaRhOG5cO+gXK6t0Zx4Zqp5f9j+p+/x6Br+sTNdX8UF3veUGXAnP5nm
	xewsZnoNc0oaLYb22srTGr7mjnw2FqkMeL40r2tWvRawGT8xJEsCFdEvsl7/N4MtsjvWqoaiWdjQe
	LQ3ZSPaAWtaA2ST1T1MmW6r2NE/t3eGLR/+o9UHBhcKTEsEWzDXv0WInDcbrmH6tXgHde7zsBMwNY
	KLBAHlDVmQcD1jDL8M2QOlQH7JRIp+geSs8K60Za92o33WFiWWyQ/JXhBTGBQhbeK18EEzBoNi94D
	IFLOh0lw==;
Received: from ip6-localhost ([::1]:19938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVraB-007LfQ-2x; Fri, 02 Feb 2024 11:19:43 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:44052) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVra6-007LfJ-AP
 for samba-technical@lists.samba.org; Fri, 02 Feb 2024 11:19:40 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf591d22dfso22256841fa.0
 for <samba-technical@lists.samba.org>; Fri, 02 Feb 2024 03:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706872777; x=1707477577; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dPFdsdJLHufSG881b3Lj9oOYeArSvWAzezhAgfv8zqA=;
 b=FkICdoIFdEo2FCl8vEdJcPvceg8RriOCIAijBcdXlAaLlhdLj7gxUWvY6U6bCcGf6I
 4wGN5xkSfTznbzQ6UiucJ4fVEr7FFsJWpcKRAKeyec17xlAyVLaBwd9DMWQ6+KzmtGfb
 eBJ3FlxzbrdGyPOngXZ9v8TgnOMFHcsG2XgKY22hjOdH85rKd403FhBxIiA+WYXY8g46
 PS1WZ9BruXiCn4lkG3vB+CaXtSHd989/dRYA5qRxXlWegpdc0dSe8+r2tRHWBeLyYfPH
 yHyGh1yYYsNidgmQC3ppai/ZcsZYUSB2pB1JKCNkhCAOrlYt0VU/FWF3WTnLUCOAAcTd
 h36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706872777; x=1707477577;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dPFdsdJLHufSG881b3Lj9oOYeArSvWAzezhAgfv8zqA=;
 b=DDkN5k5YveqsHJYwoJB4rqhBoTWHbUnp1qBUjNMWaIFbalrBb1wy3v4ZPrh2ZT0BHR
 Tz0O7Ok3WIuIeisbvtVZlXVA8+QlZxy82GNw8JzHrNDZcJLhEEDotWh1wdGGZy/ts/lD
 21PcbI8JzdI0JmJ+hUWetAU3jbhob8lL+q0ej06Fdu0lZwY+xe0uEcwJ1A/yYVXasPr3
 0mAPKgifLcTTWn1V2+VRHFczd1SlaINLZQKlhRDvKr2AqJjqx1XR0GpUoHUTUM9xXurY
 gYs1CIc7bsY1DVjuXhxjwiLNQFHYd29gDhHBXYu0742yHMQc0jrLkK6Faeq//yX6sUcX
 xC4w==
X-Gm-Message-State: AOJu0YyIEXO3cpNCxbE2BcVUUc2A5gKn6WWEcigjpHfG0g1cQsnAohNF
 6FPr0RyMpqNma6tObPaJX0CnkTIDmNEnhtsvan+XnzQhbTj3zMtEUZ50djrZ
X-Google-Smtp-Source: AGHT+IHEOD8JccbG3j+dZrvQoPUGphyavC3dTqLnzCRU/jweQ8Bvnq1T68oSc0OoOobrqcV2JzXVww==
X-Received: by 2002:a2e:978a:0:b0:2cf:4665:a02e with SMTP id
 y10-20020a2e978a000000b002cf4665a02emr5280185lji.51.1706872776648; 
 Fri, 02 Feb 2024 03:19:36 -0800 (PST)
Received: from [192.168.10.106] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 p4-20020aa7c884000000b0055f02661ae2sm699930eds.78.2024.02.02.03.19.36
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 03:19:36 -0800 (PST)
Message-ID: <63d903a2-06c2-40e9-ae1d-9457fbe73107@gmail.com>
Date: Fri, 2 Feb 2024 12:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question for time based group membership in FL 2016
Content-Language: nl, en-US
To: samba-technical@lists.samba.org
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
 <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
 <20240201214220.525418b1@devstation.samdom.example.com>
 <f0ebb138-5ca4-4383-b17d-dd5f80ef1459@gmail.com>
 <20240202102927.7aba3b66@devstation.samdom.example.com>
In-Reply-To: <20240202102927.7aba3b66@devstation.samdom.example.com>
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


On 02-02-2024 11:29, Rowland Penny via samba-technical wrote:
> On Thu, 1 Feb 2024 23:32:37 +0100
> Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
> wrote:
>
>> On 01-02-2024 22:42, Rowland Penny via samba-technical wrote:
>>> On Thu, 1 Feb 2024 22:16:35 +0100
>>> Kees van Vloten via samba-technical
>>> <samba-technical@lists.samba.org> wrote:
>>>
>>>> On 01-02-2024 21:38, Douglas Bagnall via samba-technical wrote:
>>>>> On 2/02/24 07:22, Stefan Kania via samba-technical wrote:
>>>>>> Hi to all,
>>>>>>
>>>>>> I already posted the question in the samba-mailinlist but I think
>>>>>> it's more a question for developers :-)
>>>>>>
>>>>>> I have a question about FL 2016 and if samba supports it. If yes,
>>>>>> how can I use it without powershell.
>>>>>>
>>>>>> In FL 2016 there is the possibility to put a user into a group
>>>>>> and the membership is time based. So I could put the user Foo
>>>>>> into the group 'domain admins' for 30 minutes and after 30
>>>>>> minutes the system will remove user foo from the group.
>>>>> That sounds good. We don't do that, and we don't call it part of
>>>>> "functional level 2016".
>>>>>
>>>>> The things that count as "functional level" are listed here:
>>>>>
>>>>> https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels
>>>>>
>>>>>
>>>>> They are protocol level things -- supporting FL2016 means you can
>>>>> properly be a DC in an FL2016 domain.
>>>>>
>>>>> Temporary memberships is a useful trick that Windows Server 2016
>>>>> can do, for which FL2016 is necessary, but not sufficient.
>>>>>
>>>>> That's my understanding, at least.
>>>>>
>>>>> Douglas
>>>>>
>>>>>
>>>> Still, if you know what this powershell call changes in the LDAP
>>>> record of the group, the user or elsewhere in LDAP, you can mimic
>>>> this functionality quite easily with a little cron script on the
>>>> DC.
>>>>
>>>> I have created a kind similar implementation called auto-lock,
>>>> where (admin-)users that member of the "autolock" group
>>>> automatically get disabled at midnight every day
>>>> (https://github.com/kvvloten/samba_integrations/tree/main/domain_controller/manage_scripts#disable-special-users-daily)
>>>>
>>>> And another piece of cron-scripting makes "password expired" LDAP
>>>> searchable (which is not the case with the computed attribute
>>>> "msDS-User-Account-Control-Computed").
>>> That attribute is searchable, it is one of the attributes you have
>>> to explicitly ask for.
>> We had this discussing before: you can get it returned in an ldap
>> query, but you can't use it in an ldap filter. Applications tend to
>> use a filter to find find users, so it does not work for my usecase
>> (with Privacyidea).
> Fair enough, it isn't that Samba ldap is limited, it is a limitation of
> the tool that you are using.

Sure, but there are not many applications where you can do things with 
retrieved attributes and multiple ldap-searches in the selection of 
users and groups.

Most (nearly all?) applications allow just server settings, bind 
settings, base-dn, a ldap-filter and sometimes attribute mapping. That 
includes big names like Postfix and Dovecot.

I would think this is more a Microsoft limitation than anything else. Or 
perhaps it is even generic for ldap, I have no clue how OpenLdap treats 
computed attributes.

Then again, it does not matter much what the root-cause of the 
limitation is, more important is how to overcome it :-)

>
>> My workaround is to have a cron-script do the check and write the
>> result in one of the unused attributes (e.g. the telex number), then
>> the application can filter on that. Not the royal solution, but it
>> works...
>>
>> - Kees.
>>
>>>> With this applications like
>>>> Privacyidea can disallow MFA for users with an expired domain
>>>> password.
>>>>
>>>> It can't be hard to query some attribute and add or remove a user
>>>> from a group.
>>>>
>>> Would that it was that easy, but as I said on the samba mailing
>>> list, I am sure the timing is done in code, but I am sure that
>>> those wiser than myself will know.
>>>
>>> Rowland
>>>
>>>
>>>
>>>
>>>
> OK, I have been looking into this and from my googling, you need the
> 'Privileged Access Management Optional Feature' , so that means 2016
> functional level (at least), see:
>
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/d079eee8-1bac-4b03-86e4-506a21450905
>
> Samba will also need to implement the
> LDAP_SERVER_LINK_TTL_OID: 1.2.840.113556.1.4.2309
>
> Finally, it seems that Samba will need the code to tie all this together,
> just having the functional level and OID will not be enough.
>
> Not a five minute job by the sound of it.
>
> Rowland
>


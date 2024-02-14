Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D170855378
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 20:51:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=uTSDIYmilrrbk8i6anuMr2yzOu3Z+3ESezoP9Wi5XJc=; b=SFvspTuFUzNWduyIcL4sbmvWpS
	4BFLPb6q5uJtZYVFnecjAfQa90+WC3DMFppdcnDcsj/N9NisS13H9mb3JYkT5OjyRi5HTzyx59xGC
	jPn7WNP7XeIIr7IFr7fWM6El3yw5JO61RyPbxq7YHQnOWtZLJyg647xnwW8uHB6W2sFP+gc3rseRp
	v3SM4FPHhHgewb9taQDGR+E++6c+TjFf04vhWrj8K0EsUiLHmSWDM3iPVi8K12alo3WJPB2PJQuXC
	0EHpNncqcCN6J64b3z2QSd6OE8Ms8yHxW41EsXz6YFsp5MCYxC/ku7jKpWoBlr1IacCqf9nTEaxj5
	q44rINJA==;
Received: from ip6-localhost ([::1]:39624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raLHL-008UjI-70; Wed, 14 Feb 2024 19:50:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:61919) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raLHD-008Uii-NW
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 19:50:44 +0000
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55f0b2c79cdso185846a12.3
 for <samba-technical@lists.samba.org>; Wed, 14 Feb 2024 11:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707940239; x=1708545039; darn=lists.samba.org;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PKY1BK+PpgMChS5Cbb8Hl7td1h5pbfjlV+3ZSx7uS7c=;
 b=clkYfKMQWWpF2qmgsWTHjcKBmsRud+kWubtg5sroHjiQPvV0K5x6Z8YqJBdeiWNkJw
 ZJiQ1PYbf9m0pX5iL5BRylPoFBqIeOdvMvaJkM2H/L0D3CiLKqBfnVpjDOa22ppX4Jc7
 lCJpjiNhnjSz7hqirn5XMH4NHKgScTK0YuwrMMF/VgZErMcd6XUqu4DmPo1VCl+V7VNi
 Ib5WY2G7Nta5ux5vLOwQlWPKN0DfLBV9WbicXgnMvQxNX6TZrNfGg7gMqiWmGsKU1Pav
 RAA5g2j/yrkD4+06DOHtdEMu+IaBDRYk0E16/1lbBN2izba6kb0AXLtPnNvvPUF7L67Y
 +tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707940239; x=1708545039;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PKY1BK+PpgMChS5Cbb8Hl7td1h5pbfjlV+3ZSx7uS7c=;
 b=DR5/Bf4HPzfwuecizHRYEdjFYxltkaxP9yApXTzODPNqlCU/mimMvJ6SKSVfNiZbfv
 ehB/pn1fQEL2ve52lrB/lC4hghMsPM5WmW+0v1LbdFId8PlM+h0XNrv4n1F9xOpx5X2d
 pDb++kKf9/NwrJdzoNZdar+hkQRw02VNUSd5/J0mwvhVal3vVsebIa08OLXreV+duBqA
 uXQXd/A12PIMZuU0MfL0Frf0is7rsHGE5TUGmCSSqLXXey0S7zxySFGFYDbiw3dGOVJk
 Ir4uCpsL3Hndixky+oRaEhrSfdrO4fF9rgcPsvaOQ4xZvuKw27NgHsyClkJgTr0aShk/
 Vucg==
X-Gm-Message-State: AOJu0YyDFYcc7ILFIttp8kMR70vYjKPGa29Rb2RLF4SEaAwi1c5KoGQZ
 ft+zDqYV1eGva8PJprDMiNORMzdhClHz4UKQ72R4Vb4Q7FxHEL3nXUDLPcDj
X-Google-Smtp-Source: AGHT+IFd8nhM466uHvjHfe6nsMDAj79JyG5CjAPYKuFLXhQSCWS1ZO5X3kz0fxN+VH5rEs3b2cfahQ==
X-Received: by 2002:a17:906:7d56:b0:a3d:2caa:37e8 with SMTP id
 l22-20020a1709067d5600b00a3d2caa37e8mr2344341ejp.25.1707940238636; 
 Wed, 14 Feb 2024 11:50:38 -0800 (PST)
Received: from [192.168.10.106] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170906454b00b00a36f9941d6dsm2582782ejq.112.2024.02.14.11.50.38
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 11:50:38 -0800 (PST)
Message-ID: <748b5bba-fab9-4420-90cc-0f8b34e52717@gmail.com>
Date: Wed, 14 Feb 2024 20:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Looking to once again re-bundle LDB
To: samba-technical@lists.samba.org
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
 <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru> <Zcz2oHdkRyYgJK6E@toolbox>
 <dc921798-03f9-4045-957a-dadedc51993f@tls.msk.ru> <Zc0LAN08B3wPY8pr@toolbox>
 <20240214191249.727ce60d@devstation.samdom.example.com>
 <Zc0W3hMABO/gCdvC@toolbox>
Content-Language: nl, en-US
In-Reply-To: <Zc0W3hMABO/gCdvC@toolbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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


On 14-02-2024 20:39, Alexander Bokovoy via samba-technical wrote:
> On Срд, 14 лют 2024, Rowland Penny via samba-technical wrote:
>> On Wed, 14 Feb 2024 20:48:32 +0200
>> Alexander Bokovoy via samba-technical<samba-technical@lists.samba.org>
>> wrote:
>>
>>> On Срд, 14 лют 2024, Michael Tokarev via samba-technical wrote:
>>>> 14.02.2024 20:21, Alexander Bokovoy via samba-technical:
>>>>> On Срд, 14 лют 2024, Michael Tokarev wrote:
>>>>>> 14.02.2024 17:46, Alexander Bokovoy wrote:
>>>>>> ..
>>>>>>> We do rebuilds of the whole stack in Fedora if bots detect
>>>>>>> samba ABI had changed. So for us it is not a problem.
>>>>>> It's easy to do with "current" Fedora release.  It's entirely
>>>>>> different question when you want to provide current samba to a
>>>>>> previous Fedora release.  And that's where the problem is, -
>>>>>> providing "backports" of current samba to previous releases of
>>>>>> distributions.
>>>>> If you are building packages on top of RHEL by replacing existing
>>>>> packages there, you are responsible in fixing all breakage that
>>>>> new packages would introduce. It is maintenance work that one
>>>>> needs to consider when providing alternative builds, regardless
>>>>> of a distribution.
>>>> Exactly.  Ditto for debian. Even debian backports, while being part
>>>> of official debian and using debian infrastructure, needs
>>>> additional work. It is good if a new version does not introduce
>>>> incompatibilities, - this way it can be provided at less work to
>>>> previous releases.
>>>>
>>>> ..
>>>>>> Yeah, it would be best to build samba against mit krb5, if it
>>>>>> were a supported way.
>>>>> It is supported. It just provides a bit different set of features
>>>>> compared to Heimdal-enabled Samba builds. See our talk at
>>>>> SambaXP'23 for details.
>>>> I know it works, and it's kind of supported, with
>>>> --enable-experimental-mitkrb5-kdc or something.
>>>>
>>>> The thing is: personally I don't have resources to support it by my
>>>> own in debian. Everything I do there, I do at my "free from work"
>>>> time, I don't know how all this AD-DC thing work.  After all, my
>>>> only intention when I come here was to fix a bug in samba form
>>>> which I suffered in my work (had to restore lots of user profiles
>>>> lost due to samba data corruption), and am still there because it
>>>> was not "just flip this one bit and it all works" thing :)  So I
>>>> entirely rely on upstream samba for almost all support work.  And
>>>> there, MIT-Krb5 AD-DC is "not supported".  Hence that's what I mean
>>>> above :)
>>> I think that statement of 'not supported' added more damage than
>>> helped. I hope we can move forward from that by acknowledging there
>>> are different use cases for Samba AD that involve configurations
>>> where one or the other Kerberos implementation is better suited. For
>>> example, not everyone needs read-only domain controllers in all
>>> environments. Or not everyone even need to use Windows (shocking,
>>> right?) as domain members. ;)
>>>
>>> There are still issues at how to present two separate builds in a
>>> distribution but that's a different story, not an upstream problem. At
>>> some point we have to bite a bullet and move forward.
>>>
>> Hi Alexander, I have nothing against using MIT on a Samba, in fact I
>> would welcome it, but according to this wiki page:
>>
>> https://wiki.samba.org/index.php/Roadmap_MIT_KDC
>>
>> These are things that Heimdal does but MIT doesn't:
>>
>> Add auth logging support
>> Allow starting the MIT KDC with multiple worker processes
>> Define API for a libkdc in MIT Kerberos
>> Running as a Read only domain controller (RODC)
>> Support for Claims
>>
>> Now the page was last updated on the 18 July 2023, so some of the above
>> may now work.
> Audit logging is possible on MIT Kerberos side for years, it is not
> implemented fully on Samba side. libkdc is needed for RODC support but
> is unlikely to come without a serious investment from a party interested
> in it. Support for claims needs a small fix on MIT side and a minor
> effort on Samba side, it is in our plans.
>
> Overall, it is better to define a focus for the specific use cases and
> admit they are being covered by these different implementations.
>
> Samba AD/MIT Kerberos combination is far from being 'unsupported' and
> being 'experimental'. What was agressively enforced over mailing lists
> as an unsupported claim made more damage than helped, in my opinion.
>
>
>> It is my opinion that Samba has enough on its plate trying to get the
>> Heimdal version to the full 2016 functional level without having to get
>> the MIT version to the same level.
>>
>> If all the work is done to the MIT version and it comes up to the same
>> level as the Heimdal version, will RHEL ship a version of Samba that
>> can be provisioned as an AD DC ? (I think I know the answer to that
>> one) If this answer is no, then what is the point of carrying out any
>> work on the MIT version ?
> In my opinion you are mixing completely different questions (and
> possible answers) together for no good reason. This does not help at
> all.
>
> As an upstream contributor, I do not see a request for RHEL to ship (or
> not) Samba AD as a definitive reason to make (or not) Samba AD/MIT
> Kerberos 'supported' or 'unsupported' upstream. I am together with other
> fellow developers providing this support already: we do support Samba
> AD/MIT Kerberos in Fedora for years. As a major Linux distribution's
> package maintainer, I do have enough data to consider a
> distribution-wide context for this configuration being useful to be
> supported.
>
> Heimdal is missing quite a few other features that make MIT Kerberos
> attractive for a distribution wide integration of Kerberos features in a
> modern world as well. Granted, most of that is not used or cannot
> currently be used directly by Windows and by extension of that might not
> be interested for Samba AD consumers willing to integrated with Windows
> systems directly. However, it does not mean Samba integration is not
> important in a pure Linux world.
>
> Hopefully, I'll be able to show something concrete this year's SambaXP
> as well.

I am quite sure you will be doing just that :-)

After the developments presented at FOSDEM, and seeing what is already 
flowing into 4.20, one can only look forward to the next SambaXP!

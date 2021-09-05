Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3641A400E6E
	for <lists+samba-technical@lfdr.de>; Sun,  5 Sep 2021 08:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Wp/cFYnK685rlH160ns93E/Nex8Xubcfy/Fw9HmCdh0=; b=siilNhcdHNm8biJiQ3trAWHy/m
	LVU+WsSGYSdSxSvirH4aSJED2M13izEk8sovS0Kwh1eVZm54t3MPBfzsq0qErAld27ZYGm9us4Cua
	JPu6e54kIKcxsIXaQ3d/s/+DBiNo1HAsGnEgV/eUcZiePvKwMSDdRBzeXv9IMN38H8tFMafX1PZpW
	S9aYFPaIF8tEHW04pH8w9bwiAhJDPCgV+woWOuWFYT+VfAO+SPXbAaIvUb58HJcqZLSsPZgktwIJ9
	VQvtQvx23Nq0npm5MIZaOfLWOgx1P7bMz6AOGD3AQr2NGzFGf9LEPZX0ZBrQ+Q0Is9YuxHldXAT96
	6ajrGrdg==;
Received: from ip6-localhost ([::1]:24226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMli0-00DN3r-GF; Sun, 05 Sep 2021 06:32:54 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33327) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMlhc-00DN3i-Am
 for samba-technical@lists.samba.org; Sun, 05 Sep 2021 06:32:34 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so1962725pje.0
 for <samba-technical@lists.samba.org>; Sat, 04 Sep 2021 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Wp/cFYnK685rlH160ns93E/Nex8Xubcfy/Fw9HmCdh0=;
 b=P8t5QsIYec+LTnvb+3YjbRPrCFZeCEiS/4ls6eywBSSZ5NyH6A5irRBKHNiIfwEImJ
 h0wH0y4Zf3JntFjJMi1RXbViiy8ifgB1QKRgot+Szr57c71SAf24+Pbcf2T0rR+biRDg
 GpoY3CnNTZlqiYz33oCD6EwdwExVZPu74yeFthPYBcxlvInzQyrXP9aMN2WkCkENE62I
 GfIh8N+S80bJYKl/hAriG9Upy8BCbBtGwpSeyZ6gKofANmeY8TFDevHqB0qygCrKkTj6
 ++rCJ+BY6rzEkrVgnXKFWJvHpBXgpL7o8SA/L6bitCgm514pd+z4sCQVbn6IWdbANqKw
 17gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Wp/cFYnK685rlH160ns93E/Nex8Xubcfy/Fw9HmCdh0=;
 b=nv32WEr/L6N/5bVIXdCHtpOhhVxsdyw6zzO6p/yl2nd36c+zQ2Pgzsox/r/B+cs3HZ
 iSJNZGIbRLA//iuvlUbKCchZhAaY/DiNZGtZa09Dzy/PHiDQJyBq16muXXcbawQRMhXO
 sMiULaRlf+FuBE6P8T+GC+TAyiBz+YVotIwS5tnGcr9xBRN3equEgiGuR4a9MU0rFLjB
 czNN9LeKCfBkDV9QUkKIfV6YNtegJK7K7UqS0FnIka3589bZp7wUBBZrqhdD5DFNlHj9
 cVhyB9Y389vm75vab0d7SUOOk8MUU+RH/SYvLLqrbS3O7YWGZCgAEVPaIsQQI5o/N4Kb
 WQfA==
X-Gm-Message-State: AOAM530w9sPhCSmRCdUPEP0cDnq64UjNKsov1FDBnZpaZ76UuN1Hr9o6
 Au1X65S1vqvYn9s4wYcG4tbnMw==
X-Google-Smtp-Source: ABdhPJxM+wQz8kiCVVAaswbhAcSX2DAAIDwDdifh2HUhb7bfbcwcwfDCWPQbSI520dn3EZTOixH57A==
X-Received: by 2002:a17:90a:5d95:: with SMTP id
 t21mr7644270pji.77.1630823544947; 
 Sat, 04 Sep 2021 23:32:24 -0700 (PDT)
Received: from ?IPv6:2407:7000:96b0:e500:e733:ba37:3588:8ee8?
 ([2407:7000:96b0:e500:e733:ba37:3588:8ee8])
 by smtp.gmail.com with ESMTPSA id n185sm4087668pfn.171.2021.09.04.23.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 23:32:24 -0700 (PDT)
Subject: Re: HEADS UP: The Joys of Logging, or subtle behaviour change of
 logging in the daemons in 4.15
To: Andrew Bartlett <abartlet@samba.org>, Ralph Boehme <slow@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
 <007822c852b35cac5035eb2651380806b306d151.camel@samba.org>
Message-ID: <f0e2bb66-f856-fbc1-e155-6b55ea095f13@mattgrant.net.nz>
Date: Sun, 5 Sep 2021 18:32:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <007822c852b35cac5035eb2651380806b306d151.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Cc: Jule Anger <ja@sernet.de>, Stefan Metzmacher <metze@samba.org>,
 Volker Lendecke <vl@samba.org>,
 =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>, Karolin Seeger <ks@sernet.de>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 4/09/21 7:52 am, Andrew Bartlett via samba-technical wrote:
> On Fri, 2021-09-03 at 18:22 +0200, Ralph Boehme wrote:
>> 1) isn't really problematic, but what shall we do with 2) ? Go for 
>> stderr as implemented in the MR or rollback to logging to stdout as
>> we 
>> did in 4.14?
>>
>> I'd vote for stderr, what do others think ?
>>
>> Please note that the 4.15 release is handing in limbo until this
>> issue 
>> is resolved one way or another. :)
> A major release is the time to get some consistency, we should log to
> stderr, that's where errors should go (compared to stdout).

Here's my 2 cents as a long term Debian Developer, if you don't mind me
chiming in please.


Agree.  In all my experiences with IPSEC and other daemon maintenance in
Debian, pushing all the errors/debug to stderr when not logging or
running under systemd init system makes sense.  Especially with the
prevalence of systemd as the de facto standard Linux init system.


Please ignore the following if you have tons of experience, just trying
to explain for those following this thread.  When going to traditional
daemon mode, there are errors that can happen before logging has been
set up, if for example logging is configured in the config file before
logging is set up.  You then probably want to read the config file
before forking off into the background so if there are any errors there
they are reported instead of being blindly not reported.  There are also
problems with creating PID files that you wan to know about before
forking as well.


Hope I was helpful.


Cheers,


Matt Grant

> Andrew Bartlett
>


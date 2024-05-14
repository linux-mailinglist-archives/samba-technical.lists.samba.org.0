Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B738C57ED
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2024 16:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=yyaZS4w72XRhV8f4rvtlpXPyOwCeeDa4EOljM5n72w0=; b=pAahHQsrR/ZaKPRCawOm93YU9I
	BeFgFoTfZaAcKw2zi91kf4HxayMTEEzx/jkiPDZOXcerDkAAZIXodOa59i7/UvZRafoP9Nvx4HGCx
	wASAp6BB5Ym9Ki6QICxqnptWVaYINm0X6qMAPyh7PgfthFgz8HTbmdsFoZ8RY6i658XzbZEwIVCQJ
	/wRhjUsWDzPw/InWLItSxIuPxvcBTT+6z/RZe+F9ZEggEXCPh4t68Ji4O81Ji3a9JC1E/ricii597
	Qs8YYvqD3LIPadsbkk9Fp5yrsWg+eg6yHztgIMmOnSw5MfPYjurMEjXN+AWVEWNMYvmeP7jwELCZV
	uEWu+fbQ==;
Received: from ip6-localhost ([::1]:46776 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s6t9x-008uH0-Ct; Tue, 14 May 2024 14:29:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43499) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s6t9s-008uGt-SG
 for samba-technical@lists.samba.org; Tue, 14 May 2024 14:29:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a59cdd185b9so46981466b.1
 for <samba-technical@lists.samba.org>; Tue, 14 May 2024 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715696976; x=1716301776; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yyaZS4w72XRhV8f4rvtlpXPyOwCeeDa4EOljM5n72w0=;
 b=ZhM3aH+KWKWGS40rDLYoKwGIfrx4h1IicBsUwMRTR4UhfYQW5RREYeRHqDh7tP4GeX
 xspCmKqKiXmJvP+irmyfAn1TzYav6jBeQWRTcpKeEk/A69iC+Cf6b3Q6ogXmRgaChU2T
 gApx+MRobDaVJQduUcFrHOr+oAUS72wTbfskRCCTy8Rtf1V1knxzstAPB2waUqDEiksv
 c2WPAHfx3I1pEtDl5MOpMoovp/XBiOISfSbcdKupaB0zdgPU05VU8/c6dKrU9zoUeFXb
 WKqsdng/TkWpOoC77vWu3rDYLk5GAnZGIprOihm9LU8Jbltz3j/h2IO2JIiPp6dg88DG
 ERcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715696976; x=1716301776;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yyaZS4w72XRhV8f4rvtlpXPyOwCeeDa4EOljM5n72w0=;
 b=XLyD7Rd4UxnNKOnsZbSy01sL7L7UfMsAQ4+ogYsOHT33hqOw/O7xkCVdIHc5n7Pn23
 gcbnJkOsoQqUHyd8HioPvRqAhKwLrgIh3UBpArnYstsSdi8H+pBeMnIDY3MvWCnbySGl
 rk/5NBocJYgRHj7q0g1Vs5WPuC6l8K4pHB7qg6XugzYyIPFKVINZHh9xpKeszSYDsBHC
 yOJISFCZdRtSOvMpnbHqFHBWkvaao3ObCdc4/cPxdOjxj4ZUPNK2GKmpg9Rkk9RhIjf0
 +vw08jAS3R31Y/Tww5TN9D+4VorJZYwPoUIbPO+arKg9tpl2YKDA0bqPlAm225j2jAC/
 /shw==
X-Gm-Message-State: AOJu0YwGE4TBcdadsI0slYS94LC9Y8TMRnSwcgAhB8BYmQuzSDig4EtD
 H6HjOFnGCY/DE68tWhi/3lPLXrI3wfASSSMYmP+Lfk6WBEkpAuAsRY0WGg==
X-Google-Smtp-Source: AGHT+IG6hZoTcnCs6ucvm7MiPhmF4GwF5x/O1FSwYHD0NuIyI/nhin2qTQ9Jj1vVIfhSS1/ZZLdKZg==
X-Received: by 2002:a17:906:5291:b0:a59:9f88:f1f1 with SMTP id
 a640c23a62f3a-a5a2d1de7b1mr1230860066b.19.1715696975641; 
 Tue, 14 May 2024 07:29:35 -0700 (PDT)
Received: from [192.168.10.106] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1b602b39sm711790566b.50.2024.05.14.07.29.34
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 07:29:35 -0700 (PDT)
Message-ID: <aacf162e-e494-4038-8bf2-795d8008711c@gmail.com>
Date: Tue, 14 May 2024 16:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Openchange and last Samba releases ?
To: samba-technical@lists.samba.org
References: <CAN4xyZOYsusPpMjOyUakgEsdjQQsXZRNTER-Jq4Zis20F6gKWQ@mail.gmail.com>
 <2708725.lGaqSPkdTl@magrathea>
 <20240514081502.0308e259@devstation.samdom.example.com>
Content-Language: nl, en-US
In-Reply-To: <20240514081502.0308e259@devstation.samdom.example.com>
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


On 14-05-2024 09:15, Rowland Penny via samba-technical wrote:
> On Mon, 13 May 2024 19:42:34 +0200
> Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
> wrote:
>
>> On Monday, 13 May 2024 16:38:51 GMT+2 CpServiceSPb via
>> samba-technical wrote:
>>> Was anybody successful in building of Openchange with the latest
>>> Samba versions ?
>>> If yes, was it a git Openchage version or some customized/tuned one
>>> ? And what was the Samba version ?
>> Fedora and CentOS Stream are still building openchange:
>>
>> https://src.fedoraproject.org/rpms/openchange
>>
>>
> I have to ask, why ?
> As far as I can see, the openchange code hasn't been updated for about
> 9 years. the openchange.org webpage is a holding page. To me, this
> means that the openchange project (something that never reached
> production quality) is dead.
>
> If someone wants to pick up the openchange project and revitalise it,
> then great, but it will not be easy, Samba has vastly changed since
> openchange was last updated and I feel that a lot of the openchange
> code will need rewriting to bring it up to date.
>
> Rowland
>   

If you want to use MS protocols such as mapi, it may be a good idea to 
see if Grommunio suits your needs.

It is open source and there is an active development team. And it from 
the docs I understood that it integrates with Samba, but I have not 
tested Grommunio myself yet.

- Kees.



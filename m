Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B0401828
	for <lists+samba-technical@lfdr.de>; Mon,  6 Sep 2021 10:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=leALgyac+qopY3wGLWTT42HkwdnqjaOGGwcxaxiSZSQ=; b=02HT4mlGY6uInl7+wHIXylXugZ
	DOfAKQhoBbP1mDwRdMatrmNrtOwG2AheWWPIDtyGl6SjGk5emjnPVkRP/OAYY4dT0pYsEy71ZUUzi
	cQitWgmv1L54DqHUHFq/Z1/Y4szhURATc/vtafzUdyyK7W1p+HmMH7RFhuTqM4VzdICS8nZ41m0DO
	IG0CpQitKw1bbcCjCpjaJJMd/DnEGDXZQx0jsg8aV9jsTUqYJgMTizeBqGJSnWhHV79GKDzRRh8B7
	NRHjFwYvFw4P49cbnAet5poLH/a1mi8muXn+dJlSk0PZfIMCMSscyyxmLj4dYISFanrHfjM3f6ckv
	bgXvl5Tw==;
Received: from ip6-localhost ([::1]:33014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mNAD4-00DS0p-Gx; Mon, 06 Sep 2021 08:42:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23188) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mNACu-00DS0g-3B
 for samba-technical@lists.samba.org; Mon, 06 Sep 2021 08:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=leALgyac+qopY3wGLWTT42HkwdnqjaOGGwcxaxiSZSQ=; b=ANCbvoEj6BB/jJeVneMM9Ltorg
 A1/gDWAqIv+NfShUBYA1Ka0jbaIc1qzyzXuBJsvjJ0WaFM0ZH80MCFciqsnblvTL6PwApJJacg3Qg
 WR7vDWGaiL+1X0lcdwQMCI4Wjn1+ZiS33/cJDq5Rh5y3l4nAYuXHfzLOPVHmx1gVgf2ZyF9DOuXIp
 lsFw/RcRaYzsgTnWOa0bKTsn9JpmcFAenGc/3mwZKh2I4VPSLLjBRs/etwjrJtFmJneYGJ4uteiYJ
 M95p1gdGFIhYOHRRaQgvVWyI7JbaXL8mLg50YOQIZgqJjQmcOAURRC0x92sm7QF2smB9Z+jxuOMTY
 YuZpVbE++nzAQBWLL7p2z7TC/6srCbp8zXgiiThYGvPWzQp7n6TPFhCsA0HFCHgYW8qhD2rY2WlGL
 bUuMO/9u8vtPkEhDthcxWwBdN4ypOd56iIWHy5FEQBhnYb+mf62rLHJ8Osm5S/BSH2NpvwQV7KYgV
 nTWh8VTbpyVWe0OJzs+qXR3E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mNACr-004s3b-VS; Mon, 06 Sep 2021 08:42:22 +0000
Subject: Re: OSS-fuzz needs some love
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
 <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
 <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
 <f2b1e57143e2fdfc2865de71412399d7c156333a.camel@samba.org>
 <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
 <80f126c8d4b629f8dbf7e1583d6940e31934c458.camel@samba.org>
Message-ID: <6be85ec4-b42a-7e0b-9aa0-1401b1644f27@samba.org>
Date: Mon, 6 Sep 2021 11:42:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <80f126c8d4b629f8dbf7e1583d6940e31934c458.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/6/21 11:33 AM, Andrew Bartlett wrote:
> On Sat, 2021-09-04 at 13:30 +0300, Uri Simchoni via samba-technical
> wrote:
>> What I have so far is in
>> https://gitlab.com/samba-team/samba/-/merge_requests/2152
>>
>> I'll continue this in a few days hopefully.
>>
>> One fuzzer, namely fuzz_parse_lpq_entry, doesn't pass check_build,
>> whereas the others pass the check_build of oss-fuzz (at least in address
>> sanitizer and libfuzzer mode). Our check_build.sh stops as soon as it
>> reaches fuzz_parse_lpq_entry so IDK if it passes the rest (probably yes
>> because of the oss-fuzz result).
>>
>> The issue with fuzz_parse_lpq_entry seems to be that it references
>> libtracker-data.so without RPATH.
> 
> Remember that the way the system copies in the libraries that are
> 'needed' on the target is to use ldd.  If somehow the need for this
> doesn't show up with ldd, it will be missed.
> 
> That might be due to our build rules or due to how libtracker-data.so
> is brought in.  It also doesn't seem likely to be used by
> fuzz_parse_lbq_entry so perhaps either the dependencies could be
> trimmed or for fuzzing tracker support could be omitted (change the
> configure options).
> 
> Thanks so much for giving this a go!
> 
> Andrew Bartlett
> 

I thnk I got it - libtracker-sparkle-2.0.so.0 has a RUNPATH on 
/usr/lib/x86_64-linux-gnu/tracker-2.0 - presumably to ensure it gets the 
libtracker-data from the same build. Removing the RUNPATH (chrpath -d) 
seems to do the trick, but I've yet to verify this full cycle.

Thanks,
Uri.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D8430898C
	for <lists+samba-technical@lfdr.de>; Fri, 29 Jan 2021 15:32:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1OTBhV9MAZVXtyzIWizPrpZo1GbCHxkxM0Ar4XVhiGk=; b=xuL7C2pORxbTUKgI554LDmbK+4
	o2/HURkw9gIHRqZ8NvCBxcqI8gAb7Q5uYOFNPUNUWZClNiWSmj7jBOowzKtMgeKN1saStrigdriTh
	fs+Qw/1wgkoYzJKBI0SGHcdqmEtAV4xDCDQ5G6yLMfKG5V/M6QI7XyvQvQjKoyE5MoNT6rDz8pm+L
	OLe8TVJsfdZoF08S1XBxOstil3zEb6zWqLc6KRxkr+/lEF5GgMclMoIl7qYcyaW/lZy5OlOwVM7Ex
	cwVktmLvbDKr7uXjf9HARr6gAxm/sFKw0IgvonVHM6vA5B1sWs8tFMXU4WwNw2+5k458p78BBNH5Q
	ABX4ypZg==;
Received: from ip6-localhost ([::1]:62128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5Uox-007k6l-D4; Fri, 29 Jan 2021 14:32:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27904) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5Uos-007k6e-A1
 for samba-technical@lists.samba.org; Fri, 29 Jan 2021 14:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=1OTBhV9MAZVXtyzIWizPrpZo1GbCHxkxM0Ar4XVhiGk=; b=PDpjiIufYMfE2Wm2TkBMOm9zEn
 rbZyqUFdb6HU3lP3i2XPDdRurg0GpojA2zcT6C04izRg9bHSUpvaEcd2Q4HWfNrz1dxko5COjJFPw
 N7vqbv4jWVHDxnYfsFzTicxIKEfqyJ5h+KfwJ5KXYldE/044DRUlXmpY72Ez6IOlLut6IAxgyyDaq
 /KILnd0Wryz3Jskq6hQ3r9yLQcY05WXmG0Usk/Em4YkzQ7/y1LqkXiw1SLA+KGpfCz/2Xz1qp9dr0
 3MtuHVz4nveUMXjPaPoppVsnCRgbS/quHRzmDCOTfYFVknETWnqWvVrRrZugdVYsmDBfmjIrnCaJj
 KY2gunwbnivZ1kWpGGkDGFSi+Jup3lxpdSbZ8C1nUmuoTy1qPo85ME1oCOR4/KDzBYVU9sCKgCiBq
 UOb5OlF+1ZVH1Gr/ZWwuOrPAZkDAw0eAjiUcVWVGiodpEcTk+ohsHHkbsyq18k5CuKQ2qCQdGerhE
 3ch0ZcP/69aYALHbWagASfRU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5Uok-0004YX-Qe
 for samba-technical@lists.samba.org; Fri, 29 Jan 2021 14:32:10 +0000
Subject: Re: winbind cache issue for NDR entries
To: samba-technical@lists.samba.org
References: <CAHbM3qh3pAXzSzSRNjE77jL1tmsREuRu9BQOCaPnWBY9dVdNdg@mail.gmail.com>
Message-ID: <4b7c0c30-196f-9e17-c0fc-9eca5a3072c1@samba.org>
Date: Fri, 29 Jan 2021 14:32:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHbM3qh3pAXzSzSRNjE77jL1tmsREuRu9BQOCaPnWBY9dVdNdg@mail.gmail.com>
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

On 29/01/2021 14:09, Shilpa K via samba-technical wrote:
> Hello,
>
> We had a customer report that the users were not able to login for about
> 30minutes and the problem cleared itself in almost about 30minutes. They
> are using Samba as a member server in a domain which has 2 way trust with
> another domain (say ABC.COM). Upon investigation, we found that there was a
> problem with trusted domain DCs for a very short duration as per the event
> log on the DC of the primary domain. This problem seems to have been
> cleared away after a short duration. Around the same time, a user belonging
> to a trusted domain mapped Samba share and encountered a problem. At this
> time, looks like NDR cache entry for trusted domain group "Domain Users"
> was added in winbindd_cache.tdb to indicate that there was a lookup problem
> and the status NT_STATUS_TRUSTED_DOMAIN_FAILURE was stored as part of this
> entry. Once the issue with trusted domain DC was cleared and the domain was
> back online, when users tried to login, PAM_AUTH was successful for the
> users but getpwnam failed while looking up SID for "Domain Users". This
> failure was returned from the entry in the winbindd_cache.tdb as
> wcache_fetch_ndr() succeeded for this entry. Due to this, users belonging
> to the trusted domain were not able to login. Once the cache was expired,
> getpwnam succeeded for trusted domain users and the shares could be mapped.
> In order to resolve this issue, should we not refresh the sequence number
> when the domain goes online? Btw, we are using "winbind cache time = 1800".
>
> Thanks,
> Shilpa

Hi Shilpa, not sure about the NDR part of this but you say that once the 
cache expires, everything works again, but you have problems for about 
30 minutes and that you have 'winbind cache time = 1800' set in 
smb.conf. Are you aware that 1800 / 60 equals '30' ? Try removing that 
line and revert to 5 mins cache, it might just fix your problem 😁

Rowland



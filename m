Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B491433E5
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2020 23:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Tx1m6Zlzz6fyO8X7XoMkqd8tZqzYGFkTCfvmCqa0k8I=; b=T6wPHjlYvtyCNURmU1Aqcu79c7
	jN6pM/qlEkbSQvsZDv+BoG3AfOGe0A71zZsEDYM8bBa4TLYkfo5gmlVWnYYVfx5eVmcvhp2LBpqvh
	9l/KK8+egrDFoPE0qKhOs/JRJ/e+7o0aouZH3VRe1Y49P0eRHg1UuWJ66s0bCa9e557mkxSXqBvfB
	uICoruNFTQ/nLfLZtqGPW0sIJ9b3A/aN64/MaYJ9SE7s2RS+KkX+ogonU075GWdsro+hjhQRYC9f6
	39UWDj6xG2d4ntmzM0czqW9UzTGdp1n41LWOrxBF6N61wtP7coRLIx6Ox46MsEyP2nRfgyVUgaXX+
	HZoaL03A==;
Received: from localhost ([::1]:35568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itfSM-003x2m-GV; Mon, 20 Jan 2020 22:23:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35164) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itfSJ-003x2f-2I
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 22:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Tx1m6Zlzz6fyO8X7XoMkqd8tZqzYGFkTCfvmCqa0k8I=; b=TeaFeA8FNRMH8jzSuPcRNgeUO3
 tVP1560rjuyxZp1I7+Y4t6QWqccp1ta9GdGd+/OuvaiqVcM8Mbo63RiExaHNCnyZIKDB+6AI+Pk/t
 KYad0/EyAyUTh6/g/Zuxs3XLPmJ7q82tw8k4OgBgWggtgLakTclsOFNv5IErA69yIY+x84KJKwVrP
 mzeyzQp/fjkwvmuxFJlXK7C9TrX+Mw1VHIrwTX7n8KDuPy5C7WQO8zyC8wGODuKrsm1cZnn9YYBiX
 EcL5+cgWv6McTFQc9V3Ge4ULZIC7qeDkrA9Z10ZjlPR3Gifla1TvMdk0twekoEZjtuYK+GTX5Nlja
 Y71mPmwsf3AfWd+BRZ7VN3Ued9aUXYOfgbtzMqze3lbnwrSSkQtzkMJKEXWOHH9znQcg5SaflikEk
 5EsdhkJBrVXQEEjaAd4b0rxw5XBmu1CG76Q4G6GO4GeNAzPK9F/djz072s9tbO0BPf3BpEEyk98Tp
 reRa0FG9looIPXogCImK992Z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itfSI-0003GZ-Ik
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 22:23:34 +0000
Subject: Re: fuzzers
To: samba-technical@lists.samba.org
References: <2546695.cijFyKqbAK@magrathea>
 <b653187d77d8af54e240a006fd8467c8400a10de.camel@samba.org>
Message-ID: <5e52f989-7ea2-cd91-d09a-fdd239cce576@samba.org>
Date: Mon, 20 Jan 2020 22:23:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <b653187d77d8af54e240a006fd8467c8400a10de.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 20/01/2020 22:11, Andrew Bartlett via samba-technical wrote:
> On Thu, 2020-01-16 at 10:58 +0100, Andreas Schneider via samba-
> technical wrote:
>> Hello,
>>
>> thanks to all people who worked on fuzzing Samba. This is a great addition.
>>
>> However before we add *more* fuzzers, it might be a good idea to first fix the
>> bugs found by the fuzzers ;-)
>> I will try to look into it again the next days.
> Thanks, and I would encourage anyone else who is:
>   - a member of the Samba Team
>   - has a google account without a + in it
>   - not on this list: https://github.com/google/oss-fuzz/blob/master/projects/samba/project.yaml
>
> To join it.
>
> Andrew Bartlett

I know that I wont be using this, but why are we back on github again ???

Rowland




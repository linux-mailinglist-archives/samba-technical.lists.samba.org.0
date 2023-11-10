Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB07E75C2
	for <lists+samba-technical@lfdr.de>; Fri, 10 Nov 2023 01:14:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PSTOST673n1c2mfOvp8Wq1svElGF2WcvEKifNGGKVac=; b=xxM+Nfc+V7yqQqsdk+x84a/ghP
	D3SZ86cPItS35I01tfcrcrqw9wXBBjDHegmQkQ1p29PCx2m08AQ0dtNRrERdydVHoNB46jmz88ZMu
	GONXWkhWr6aXqTqmeRllTS6m5sjpQYJEK9tT1+72HIM9H4abpLwfmAG+mdN2Dy4vRKWf0oz0Moy1z
	ZvLBreVpGub1XxPSS/C19oaT7HnrLSYCAk2hkSDkbryRKg0FdjM1gKhbAlavnusDF0KRgW4zC16PF
	CyMCp7IZ+Ek+1n3F3oQ3S1LLPrfNeHO1Rok7qUVsN0fpKRNYvsnv7drSH5Jw506ug6qGWHsl2TKsF
	qPtoeywg==;
Received: from ip6-localhost ([::1]:37404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1F9s-007SLN-FF; Fri, 10 Nov 2023 00:14:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1F9m-007SLE-Vk
 for samba-technical@lists.samba.org; Fri, 10 Nov 2023 00:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=PSTOST673n1c2mfOvp8Wq1svElGF2WcvEKifNGGKVac=; b=y/3jcPFxUzRgu/mpE1bgrRwOtG
 ZYNF12xWjtfEhxeh0YcVeg/N3o3la3JHQ5kAkUcfz/cvfcu41/n06B9+ai5FA6cR7suGA4xC6l9F9
 fsTurkhROgh6mxoe2i8fJnq+UcAiqJzHaQHVXldpR8loc/lHnEgysQkFgehNtciliqtI0B6FYVVJi
 m0V4v0HbVbdZtt4nPz4cdSffDRnc/MW0p74G2vn9q+mc54o610wf3DGjWwiL1aXWmlCN21lAPWzhZ
 omS0871FomZWgygDOwbcdBQ0jyHdGuEoaPS66ojmhhk24OybX4NgaKnBkSjzftDqc8sD+S1vq6G7+
 qkiloPYy1wtEXKV5NcBhM5/uqxK2ukyED7F1+kKdCjpHochNpfy/qOOk9LBntdCQRK9SEciWBOZqd
 rMlJxfQgj3lwYt3A+7gB803KqwKbcaRcRdo22OW3XidFUS0DDl9jMYMIObUQmqEm2jTXK9wW6vV36
 R98slmWBkD0byRrewx6tLLVg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r1F9k-005NzL-0c for samba-technical@lists.samba.org;
 Fri, 10 Nov 2023 00:13:52 +0000
Message-ID: <cc12849f-2dd4-4a94-a483-97844e4e4f44@samba.org>
Date: Fri, 10 Nov 2023 13:13:44 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can we move Samba to C99 and past
 -Werror=declaration-after-statement ?
To: samba-technical@lists.samba.org
References: <72d8df3ab0c58d2edf7660ad2af79935cb0a48a1.camel@samba.org>
 <20231110091333.5afa2158@martins.ozlabs.org>
Content-Language: en-GB
In-Reply-To: <20231110091333.5afa2158@martins.ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/11/23 11:13 am, Martin Schwenke via samba-technical wrote:
> On Fri, 10 Nov 2023 10:58:04 +1300, Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
>> Samba chooses to, for it's C style guide, to enforce -
>> Werror=declaration-after-statement
>>
>> I understand that some prefer the style.
>>
>> However C has moved on as a language, and libraries we use (Python 3.12
>> in this case) don't compile with it, and we are having to do quite some
>> contortions in
>> https://gitlab.com/samba-team/samba/-/merge_requests/3373 to build on
>> Fedora 39.
>>
>> See also discussion at https://bugzilla.samba.org/show_bug.cgi?id=15513
>>
>> Can we agree to just remove this requirement?
>>
>> It will allow us to keep variables closer to their use, which is
>> helpful in a lot of ways, particularly in longer functions.
> 
> I think that sounds good.  Yes from me.
> 
> Can we also please declare for loop variable in the loop?
> 
> peace & happiness,
> martin
> 

I am also in favour of removing this restriction. Among other practical 
benefits, being able to assign to and declare variables in one statement 
will make ‘const’ much more useful for guarding against inadvertent 
mutation.

Regards,
Joseph


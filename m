Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 343577E7B11
	for <lists+samba-technical@lfdr.de>; Fri, 10 Nov 2023 10:45:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BSmrHlkbYhJdSs8pA05rVWmP9/9dTRlI99HN8OcsQ6k=; b=QM6ZFVc4VAoTmhdPDkXWQjPc0d
	LlfOrcVaCOe1ffaSFlMi3PaUfe/zFq2eN04EShOded28vhOtTLzFU5SXVOHtuasTY+CCtbavrb70w
	rTWzxG+3d4RLhbuyj+rQc+qolZplXv4affmhUZwhFhoV8f5a3h91zto9i2NKxW2dsVYlVg224KDAm
	pGLhfJAyRooXTv+OV7aiLQOWWz1ovhip9gTqWJ7aBLiCB4tmUZlLfYC1t+dqP7d8fXTSId7mLlCpe
	r4YtitVKfvLDJ5Br9j/HS0bcC4rapihQSjysYRN6MB4AeLG3SFUshzZQJSuWaPkDegAALb8R7u2T9
	M/X8HYOg==;
Received: from ip6-localhost ([::1]:19276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1O3z-007WNZ-Fl; Fri, 10 Nov 2023 09:44:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27382) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1O3t-007WNQ-9A
 for samba-technical@lists.samba.org; Fri, 10 Nov 2023 09:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=BSmrHlkbYhJdSs8pA05rVWmP9/9dTRlI99HN8OcsQ6k=; b=c3ILHj/VvtueLfHlL9a5qvvKgH
 owArWw+tRj66R/3cXsFpxYap18glWfBY6UYOUqlnwu539HKqteyouj0L32Grnl9yg2iVBTMVlOB4m
 F5Sc6DL40NxxH/TyaUjJlr02MtwDMTPmElwHjVk4RmfKcKAiKqS8PXj7VB+tXth152OhkawvXEk0Y
 27IFfkSMwb3RkfNc7NQxJoGvIx3ziUwuAiG/1AKLx7GWYm2HRPBxAN5mvEZiiiwaVHnY2EprsYc94
 Bw9BXwWWLVvE5LD/PDwCV7wrp6TMB/B7qsz/4tAifz6lNvU8r1cQudmdDRitR5RlqV+aeumP3kHzf
 3r8/sTwce32mAE5cNqpR+hEHvRhCHbBJwcbihOFDLNY8hzbpdUVPHA4qTKWJ4VBJHFnJEJQnTt/yz
 X9AgKfXdpzwPrmwD9tvvgOr64tmtBE1J+2q1w+QZ8k7RRdRsuh+i2UICxbkS2Ce4OsEEzFV+LpG2g
 cMXPGIR8N5mVOHxKx6Zzkt7P;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r1O3r-005TrK-2C; Fri, 10 Nov 2023 09:44:23 +0000
Message-ID: <13413c0b-ea94-4cca-9ba8-c431df07517f@samba.org>
Date: Fri, 10 Nov 2023 10:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can we move Samba to C99 and past
 -Werror=declaration-after-statement ?
Content-Language: en-US, de-DE
To: Martin Schwenke <martin@meltin.net>, samba-technical@lists.samba.org
References: <72d8df3ab0c58d2edf7660ad2af79935cb0a48a1.camel@samba.org>
 <20231110091333.5afa2158@martins.ozlabs.org>
In-Reply-To: <20231110091333.5afa2158@martins.ozlabs.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 09.11.23 um 23:13 schrieb Martin Schwenke via samba-technical:
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

I'd like to keep -Werror=declaration-after-statement as long as possible.

Variables appearing in the middle of a function, particularly in longer functions,
are really confusing to me. Thinks like common cleanup via goto would not know of a variable
exists yet...

And every time I saw a patch with the use a declaration in the middle,
I immediately thought this would lead to sloppy coding if we would allow that everywhere.

> Can we also please declare for loop variable in the loop?

These would be very useful and I just checked they also work with /opt/IBM/xlC/16.1.0/bin/xlC on AIX.

metze



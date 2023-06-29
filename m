Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A159474273A
	for <lists+samba-technical@lfdr.de>; Thu, 29 Jun 2023 15:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=AiTiqyUqjq1kHC3uDeDYd2RP46Jc7gJbHzKPygmbO2U=; b=d7m6zOCdCWllZ3geicY+CwO3HT
	zhBtmeFZKqjWsJgmMFiu5PEybV2nfQNSWFBRazI5EjpXrgKDjI/90djeZnGHMTGd+p8cRxHEdW2+c
	oIM+adWgi2O99+BcrfcwBBexFuUDhJ81Umv7PVkerGyg7uK0Nh5NH9emasqsomt5EGjSW76xFI50j
	iXgNAlTJDvzd4R+SVRDc42cL86pcRP6w57OTZz8HXXHs8MsYvH3WdGnFc4cAgB1KoIO99dV71e50F
	RXkfmzs8Q/suFgPs3G2xBJXr53cqwu5mMQE3OXU0FYb++JO5p7R+1U4piBMk7WfhA6wjWY5TR/MW+
	af4YGSvQ==;
Received: from ip6-localhost ([::1]:25410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qEraS-005FZM-8p; Thu, 29 Jun 2023 13:21:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qEraL-005FZD-1f
 for samba-technical@lists.samba.org; Thu, 29 Jun 2023 13:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=AiTiqyUqjq1kHC3uDeDYd2RP46Jc7gJbHzKPygmbO2U=; b=FDZX3h57QDA0GO2OyhLPWQYT3S
 XRdtx+ZrkDY9TeiIHVD50cd3EhxC2Nn5/iR0loxGyAL/8AsMVA3B5bAzNS89rvM1iHm8BM7mSnv4D
 tDanVk3Lin5pLGbQu8Gcp26saws3WuUlP+FEuQRnUWDP+tv92QF4tdRlIBndVOphX9+DBoPcExBvn
 InXDL9eJ/NG9N4ibU6qdy1Ft/hAsOFAAu1M+kfQCWdSIWX9963/wF2fI6C+f16eQdpwt9zVdAU0HS
 z9JUqEY491LhloVOL3jtLJ/omphZQwkCHl6sK7Jp5GsXSAuMAZJNegXBvcsIGIxls5LOK7uEwKtHI
 fxqOV81UQYDv5LtctBvK7DMR8r0ompnLC9Pd/mtjhVxtSQugZU6+uc+z7oCf3jjDHHu0cj4MYC5Nj
 ymDKOXz8gW6FVLyvtimeAoAFRINPN91mGKMNcNLylvQgQ2KlZzua4RAYjh/tMTB1ntziG1DNBql7D
 sWyPGPIQxo21LZ0zy9jPlZVg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qEraJ-005CaX-2g; Thu, 29 Jun 2023 13:21:20 +0000
Message-ID: <956d95b0-224b-86c0-6fec-181b2a7bdf48@samba.org>
Date: Thu, 29 Jun 2023 15:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Replication USN semantics around Azure AD Connect
Content-Language: en-US, de-DE
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <21696bbbc739934d20fd4198682fd44b63b17d46.camel@samba.org>
 <c0d06c41-8513-8592-06dc-a9d7af46a412@samba.org>
 <a3c4ee58797d4348533a6822cf8fe4588cecc0ae.camel@samba.org>
In-Reply-To: <a3c4ee58797d4348533a6822cf8fe4588cecc0ae.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 29.06.23 um 08:19 schrieb Andrew Bartlett:
> On Wed, 2023-06-28 at 10:15 +0200, Stefan Metzmacher wrote:
>> Hi Andrew,
>>> I've been working to make Azure AD connect work with Samba.
>>> This is working for small domains, but for larger domains we hit
>>> aproblem.
>>> Our USN handling in GetNCChanges can sometimes return the
>>> sametmp_hightest_usn, so we have this code:
>>> 			/*			 * We need to make sure
>>> that we never return the			 * same highwatermark
>>> within the same replication			 * cycle more than
>>> once. Otherwise we cannot detect			 * when the
>>> client uses an unexptected highwatermark.			 *		
>>> 	 * This is a HACK which is needed because our			
>>>   * object ordering is wrong and set tmp_highest_usn			
>>>   * to a value that is higher than what we already			
>>>   * sent to the client (destination dsa).			 */		
>>> 	r->out.ctr->ctr6.new_highwatermark.reserved_usn += 1;
>>>
>>> To make a new higher USN for this case.
>>> However, Azure AD connect comes back only with the tmp_highest_usn,
>>> egreserved_usn is always zero.  This means we declare the client-
>>> suppliedhighwatermark as being older, and start replication from
>>> scratch.
>>> Starting from zero then means we give the same data, end in the
>>> sameplace and the client has an infinite loop against us.
>>> Do you have any clues, other than a revamp of our replication
>>> logic, tofix this both sort-term and to remember for the longer
>>> term?
>>> In the meantime I've suggested 'drs max objects sync = 100000' and
>>> 'drsmax link sync = 100000' in the smb.conf to avoid multiple
>>> chunks.
>>> Thanks for any clues,
>>
>> I think I hit some similar when migrating large samba domains
>> toWindows 2008R2. But I don't remember it 100%.
>> Currently we're using these branches to avoid it:
>> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/v4-10-drsuapi
>> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/v4-13-drsuapi
>>
>> They are also in
>> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-drsuapi,as
>> the top 16 commits, but that also contains a lot of unfinished
>> unrelated stuff, e.g. implementing timed group memberships.
> 
> Thanks.  I've taken a look over those, but I don't see how it would
> impact on the USN or the highwatermark.
> Am I missing something in those changes that would help ensure the USN
> keeps moving or could this be a different loop?

I think it was related filtering out nc head objects of child partitions.
(or maybe the reverse)

metze




Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A87EE742769
	for <lists+samba-technical@lfdr.de>; Thu, 29 Jun 2023 15:31:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=oPwOFU+j2qKYCaHQU+8Z9sAmWFT+THM16vPrAMeMG2A=; b=5RElszlieInIlPFXuUz5AmqZ0e
	D3B3b8DHtu7FIPRjafc9LrQ3U6PaDMZQHIHnQJ+QUBw1gkVLb9/lonhGnmo2movDNzXM/NFSrG4n2
	UVIC0l0uRefURuiuJfEFum8R7PG1Sj2lFZYif5OyQy/O134qSDj3Urlqf+rHwJfCeGbTHXVH6Uac5
	KyvJdL/4tnT+WfoouapAAlx/G8zmzw9LPmJwcLDPPj+LU/Ezxo8WsDr06NJy0vxfmpeA0HsPXkmC1
	isGYzgTk070cE23WQgUQWz+4PnCF/WGABDICfZWGzu5qmJDy+n7E6oJT2iPrtKloDpyorRB1eYgAy
	PchDpTwg==;
Received: from ip6-localhost ([::1]:50448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qErkR-005Frk-FE; Thu, 29 Jun 2023 13:31:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qErkL-005Frb-7S
 for samba-technical@lists.samba.org; Thu, 29 Jun 2023 13:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=oPwOFU+j2qKYCaHQU+8Z9sAmWFT+THM16vPrAMeMG2A=; b=mABXxg7YOwcla/2dJeQLCbkb/F
 WhN7zJiXslP0x8VlIVRvI4YEE8SghImrXQXfWJz2NtMyw9+d0Tva5yaCv2PsV+J9sV8SklpGVVRBb
 wzBduaRe1yF9AQqP2MVSQnqiQqobDj3GwStSlPEAEGUFRMYSmhWPqr6kdafqc6sy402RNyzhlh8jw
 YLTzpuMnLocZLFBLw5dCNh+NF9xuDOPHILj0NkqoKnkyPL7X2G3oNZbAqWv29t33jRTKuzEhfZ5c1
 Sl0a06RvaEXiFOU5sYSOVf5+YHnleQEBlBAg6VTy9JMRm1eQFXpithULP83/Lqg44aC2FSdHZKCIX
 DD0o6YRCcgmSqUqv1nLK6PECsu9laSZM/7BxR/3v5mOoAbkf4V/ncMRfbR+06KRaGmqNyUoRw7pfZ
 oKZMjob9KNPfuYFqozFl9vvIZuQzw9xvSA6I1ul9C+4dLdRJiPVwtQC/4L4eKg5ZoQ4BOVRHtNBc3
 nc/KujCaLZ2Y4WfEy2L5vDcI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qErkG-005Cg6-0b; Thu, 29 Jun 2023 13:31:36 +0000
Message-ID: <b7288b47-05de-2296-acfb-a4b4c5183246@samba.org>
Date: Thu, 29 Jun 2023 15:31:35 +0200
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
 <956d95b0-224b-86c0-6fec-181b2a7bdf48@samba.org>
In-Reply-To: <956d95b0-224b-86c0-6fec-181b2a7bdf48@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 29.06.23 um 15:21 schrieb Stefan Metzmacher:
> Am 29.06.23 um 08:19 schrieb Andrew Bartlett:
>> On Wed, 2023-06-28 at 10:15 +0200, Stefan Metzmacher wrote:
>>> Hi Andrew,
>>>> I've been working to make Azure AD connect work with Samba.
>>>> This is working for small domains, but for larger domains we hit
>>>> aproblem.
>>>> Our USN handling in GetNCChanges can sometimes return the
>>>> sametmp_hightest_usn, so we have this code:
>>>>             /*             * We need to make sure
>>>> that we never return the             * same highwatermark
>>>> within the same replication             * cycle more than
>>>> once. Otherwise we cannot detect             * when the
>>>> client uses an unexptected highwatermark.             *
>>>>      * This is a HACK which is needed because our
>>>>   * object ordering is wrong and set tmp_highest_usn
>>>>   * to a value that is higher than what we already
>>>>   * sent to the client (destination dsa).             */
>>>>     r->out.ctr->ctr6.new_highwatermark.reserved_usn += 1;
>>>>
>>>> To make a new higher USN for this case.
>>>> However, Azure AD connect comes back only with the tmp_highest_usn,
>>>> egreserved_usn is always zero.  This means we declare the client-
>>>> suppliedhighwatermark as being older, and start replication from
>>>> scratch.
>>>> Starting from zero then means we give the same data, end in the
>>>> sameplace and the client has an infinite loop against us.
>>>> Do you have any clues, other than a revamp of our replication
>>>> logic, tofix this both sort-term and to remember for the longer
>>>> term?
>>>> In the meantime I've suggested 'drs max objects sync = 100000' and
>>>> 'drsmax link sync = 100000' in the smb.conf to avoid multiple
>>>> chunks.
>>>> Thanks for any clues,
>>>
>>> I think I hit some similar when migrating large samba domains
>>> toWindows 2008R2. But I don't remember it 100%.
>>> Currently we're using these branches to avoid it:
>>> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/v4-10-drsuapi
>>> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/v4-13-drsuapi
>>>
>>> They are also in
>>> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-drsuapi,as
>>> the top 16 commits, but that also contains a lot of unfinished
>>> unrelated stuff, e.g. implementing timed group memberships.
>>
>> Thanks.  I've taken a look over those, but I don't see how it would
>> impact on the USN or the highwatermark.
>> Am I missing something in those changes that would help ensure the USN
>> keeps moving or could this be a different loop?
> 
> I think it was related filtering out nc head objects of child partitions.
> (or maybe the reverse)

Looking at the code I guess it was the reverse, so we need to
include nc heads of direct children, instead of generating a referral.

Also the clearing/including of parentGUID in ldap and parent_object_guid
drsuapi_DsReplicaObjectListItemEx was important.

metze


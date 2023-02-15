Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D78FA697811
	for <lists+samba-technical@lfdr.de>; Wed, 15 Feb 2023 09:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ipDRey4DbBfYUPZ6vwV0TusQPMQWsPu7d5Pe2FP9dJ0=; b=2XA4CLFXukjsbuyvonFDFeVf3+
	jFmK5jceyV/ABiP3L7V8sZD8MbrX4CD3sA6oDZf+H8srnPl9N7Tnu25aXkrHhWJj/xnd7OAyyDeb8
	EQDjgxQcA7fWoWGBA93afy76SXUslHqs07Vbwqj4TAu8D+Rh1bHvQy0bW1QqZkpqwY/BiZnJD2PZx
	LZu8djmxErmyxZ0SBCj+2DF86AWmbNjYkKmW/ZVoinhUJzLyT1012V0RdkKPqWjbdT0uo1hACiN2R
	0Jgj7IXdMRc5VRaxnwbUbZ5zdd6POpW3WFpD3QqKFkPHYfuWiKhpAY9GPzJtDWkzXMH/ybw5PanAU
	B7buSPsQ==;
Received: from ip6-localhost ([::1]:54602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pSD4f-00CJ0b-Sz; Wed, 15 Feb 2023 08:23:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21258) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pSD4a-00CJ0R-Au
 for samba-technical@lists.samba.org; Wed, 15 Feb 2023 08:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ipDRey4DbBfYUPZ6vwV0TusQPMQWsPu7d5Pe2FP9dJ0=; b=qbkF7yijPi9zadXSAYGwiAnZ1x
 lhA0MM4knQ7de9ZJko6T8x8+3iE01Rw6VKAofbTJ/l+TciMvwFlwOMzYthelq5xwxzKlS4JXtpGHy
 iT/rOnMXAs4+bqh9qssnHGgWDB6YuWFPEmukE80RJ3n0RbgIznSPlF+9u6+96XppbCOBwjGCOpIP2
 XWCwGoEB4AMah7ZoO10vnsquV3NyE3ASAtxLJ8J0ATbceaI1HKq7x3XVT9Fj/4t0PpHZ9p9OFYHlW
 FUnOGVKoQmCWL84HhX25jSWQcuEWVyyxIRLosJy1l9S1NNK5poWO64mFv/DwTKZB92pTgBX21bLmI
 GlMy7XMM2nfP2cBF3tSDf6CJvZNwp5vwh5S3DAJ1VU8PH51sKtS1WH+11Us4RIq5tCrC4yiB7ib7o
 FwUnQqrVfqh9q8/cwDKWIeQz7NR+cMZbwyFMm4F2oX5/F9XEtvVOVfuqJaeqmzo96uQYdhr2B3Ldz
 P1P4GTTdPicAh7gkHbO58z63;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pSD4Z-00Dobi-Ec
 for samba-technical@lists.samba.org; Wed, 15 Feb 2023 08:23:27 +0000
Message-ID: <58e01336-4026-e5ce-1e4a-d69ba21505d4@samba.org>
Date: Wed, 15 Feb 2023 08:23:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: samba-tool domain backup with lmdb on btrfs fails
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <1944992.usQuhbGJ8B@magrathea> <12155582.O9o76ZdvQC@magrathea>
 <Y+w68GDJqgXRTnKU@jeremy-acer> <2672310.mvXUDI8C0e@magrathea>
In-Reply-To: <2672310.mvXUDI8C0e@magrathea>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 15/02/2023 08:14, Andreas Schneider via samba-technical wrote:
> On Wednesday, 15 February 2023 02:52:48 CET Jeremy Allison wrote:
>> On Tue, Feb 14, 2023 at 09:13:51PM +0100, Andreas Schneider via samba-
> technical wrote:
>>> I think I found it:
>>>
>>> The issue is the lmdb mdb_copy command on btrfs
>>>
>>>      def offline_mdb_copy(self, path):
>>> +        mdb_chksum = create_file_checksum(path)
>>>
>>>          mdb_copy(path, path + self.backup_ext)
>>>
>>> +        mdb_copy_chksum = create_file_checksum(path + self.backup_ext)
>>> +        if mdb_chksum != mdb_copy_chksum:
>>> +            raise CommandError("FATAL: MDB checksums don't match!")
>>>
>>>
>>> This triggers on btrfs and works on ext4!
>>>
>>>
>>> I will prepare a reproducer tomorrow.
>>
>> Fantasic debugging Andreas ! That narrows it down perfectly.
> 
> I've created
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2169947
> 
> 
> 

Why ?
This looks to me like a Samba bug, so why not open a Samba bug report ?

Rowland


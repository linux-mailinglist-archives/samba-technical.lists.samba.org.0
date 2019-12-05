Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A573113FFA
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 12:15:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=s8FEunp3+9SEei4c04ZMNgLlQ1Ylo59JMBdEr/AxiZ0=; b=UOQn+OBGBhnvMNgB8F/mMEtkEg
	hZRX9ymZY+pNdE0HXCpi3Sr5Q/tvZa1xpIXSs2VEiEAaoElW3smzHnRFdYS1LCTogTgsW1ce9kv93
	Wm055P8Ti/IXwa2guO2AdImT/xaThuS9k+apvwtMQcJ51NUbxr0G0RMX/ftjG2L6e725dLkaiAaC/
	Cv/MRdJZDhVQPgBLt8a9iEvBO8G/pBhj8Po9E3rV11sl/PRs2JNcU13Apd63yJ6wu9YcPkJTvg6Qb
	skTbZWeTWkKhmH9B3XnSNR8LEQ0UR2hho/WmnBI6y8sFGL8ekcN9cML56Wqtad3GlUN3M+komv8qF
	1G7CbTOQ==;
Received: from localhost ([::1]:39810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icp5o-006BIh-KA; Thu, 05 Dec 2019 11:14:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18358) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1icp5j-006BIa-PL
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 11:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=s8FEunp3+9SEei4c04ZMNgLlQ1Ylo59JMBdEr/AxiZ0=; b=iNhmkd4mf9tjkXn3ng0aAKKre5
 V6FlbnGJmsdaGhzhUI8SJi5wEocaRZhllg3/yCaA0o7oLe3qEz3KWzcqBqQYxJe8HHdPZgmXoJ15j
 XBkURraeI/8X7cQhdlFPl1SIjWu1NEpMETwDl796wwdWgwHV2ykDyhuwwjwUV5I6KkkRsGft/XSM9
 yTTHrijVVMHZpBD+PdvIXIWMtinkolCpnLVEPwsJ3o1v5VZotKhoAECp50DWmLW0Ch6eLjc3NhtOf
 7maOiKzFzCAwNSvFrIN734dMkqOPs7dUUz6PcBbR+/7QLZxuYKlPGuo996pT75O/SZUQHnZJ27evR
 UEaDF5hBXUhAVZU0moX1wYCyd9s9CxrtLu8qwHJi27h4NaGHXXre+Tz6/OkVtLOpLZcaegzgPLcKs
 UDG/pI8XZdyTixlVLItBOabu71uma4mtaqhnl8lYxml0XBN7GdbRoeGUqGJqe48BWGekENKf1VCJM
 Ss2CH+163FPCxc7RXVOj8r0m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1icp5i-0002V0-9b; Thu, 05 Dec 2019 11:14:38 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: Noel Power <NoPower@suse.com>, npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
 <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
 <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
 <361f5a38-66fb-e18c-7858-c5db6e93424e@samba.org>
 <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
 <c25ed441eedb2a864429c0154859f2afe95f38cb.camel@samba.org>
 <f3fcbb1f-a25c-f7cb-4023-fdef68e208a8@suse.com>
 <a146e395-f9ca-12d0-2cab-ca52e8209706@suse.com>
 <f7229830-b844-a509-ed31-9707e0101666@suse.com>
 <e09044be-713a-f074-ed2f-e41168646d81@samba.org>
 <7a86b0cd-9eea-d077-69ac-9077d0cc12c8@suse.com>
 <70b3cc00-1f71-4f17-f9c4-8fd72b41543f@suse.de>
 <150ed4fe-84d7-f1b4-18aa-5443e063a355@samba.org>
 <16a391a4-c82b-5809-94b1-f4eb8fd8efb0@suse.com>
Message-ID: <a3b0521b-735d-f539-014d-0f4a62208a46@samba.org>
Date: Thu, 5 Dec 2019 12:14:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <16a391a4-c82b-5809-94b1-f4eb8fd8efb0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Noel,

On 12/4/19 10:38 AM, Noel Power wrote:
> On 03/12/2019 15:18, Ralph Boehme wrote:
>> Many, many torture test really could be run only against one env instead
>> of ad_dc and nt4_dc, eg
>>
>> samba3.base -> fileserver (and then fileserver_smb1)
>> samba3.raw -> dito
>>
>> But that is probably a lot of work only saving one smb1 env.
> 
> so just to be clear, for example samba3.base .* tests run generally in
> one or more of three environments (ad_dc, fileserver, nt4_dc) either
> fileserver *or* both (ad_dc & nt4_dc) so you propose as a general rule
> we run all these tests now in fileserver ? (realising of course there
> may be some tests that for some reason really do need to run in ad_dc or
> nt4_dc but not both)
> 
> and same proposal for samba3.raw (which uses ad_dc, nt4_dc or
> *simpleserver*) so again run all in fileserver ?

Yes, for the basic SMB tests. For more complex stuff like RPC or auth we
may want to keep the coverage.

The duplication with all started with
6d87df2ac3c00215a5cf23c8d452239124ac8358.

Note that I'm not saying it's required to roll back now as part of the
smb1 endevaour. We can keep the duplication as it only costs us one
additional smb1 env (nt4_dc_smb1).

> I know these are probably boring questions but currently while I
> understand a bit about the mechanics of how the test system works I
> don't really have any knowledge about the environments and what they
> target, when you should use one instead of another etc. So... hopefully
> you will understand why I currently look for specific (and probably
> obvious to everyone else) details

Not obvious to me as well, I ressort to git blame and git log FILE for
this stuff. :)

Fwiw, feel free to call my anytime!

> [...]
>>> & >= SMB2 the following environments are affected
>>> e.g. The following are just a few examples of legitimate tests (that
>>> don't need porting) that currently would fail if run against
>>> environments that cannot negotiate SMB1
>>>
>>> samba3.blackbox.acl_xattr.NT1\(fileserver\)
>> remove this one, only run the SMB3 variant.
>>
>>> samba3.blackbox.inherit_owner.default.NT1\(fileserver\)
>> dito. Also likely true for all the other blackbox tests that run NT1 and
>> SMB3. BUt again please make micro commits so we can review and test
>> individually.
>>
>>> samba3.blackbox.smbclient_basic.NT1\(nt4_dc_schannel\)
>> remove it.
>>
>>> samba3.blackbox.smbclient_large_file -mNT1 -e NTLM\(nt4_dc:local\)
>> remove it.
> I thought from previous conversations that there was a requirement to
> leave all SMB1 tests intact and running until the SMB1 code is removed?

Yes.

> Is this no longer a requirement or is there a special rule to use when
> wielding the ax (just to be clear I am not opposed to remove SMB1 tests
> :-) I just want to understand to understand the ambiguity (or realise if
> I misunderstood)

Well, generally we should keep the tests, yes, if posssible. Sorry, this
part of the swapfile was on a bad disk sector. :)

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


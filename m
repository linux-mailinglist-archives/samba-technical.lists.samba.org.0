Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EA5BCAF
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2019 15:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=DhnjctWpej9yShrak89KYrRGlfzkXDt6gOzqqTZmiFo=; b=ZM76AbGAvMrChkVQhXs1Cuisr6
	0CJWGOtVIb6ZRU3fafaCZvI8KdRp2U5p6WAib7Ij5n8YEX9tFKJKPIL0elQRHFE4luoGLW3T0ov7K
	O+ffpwA6X3kw/tgumwaVz9GwB1LdCw27RHZ0fSG/nPkfT7mcsRLxFFwM5RNMC7fWnRNIkfJ+G+WVY
	d+fVVO0onGph4rDl5lP1m5mit6IuJer7lNJFa6m098OiBnZsdY/Wam33mYAcjA1wVN7s11p4srtZW
	z8gGKOQSKqRGRMthLmHc7oiBbVbN/TSC8V56e4s4ZJ/+De6BMLHYwDDujbNiyd0KkZrMUJe9pKqIq
	5wgYx4Pw==;
Received: from localhost ([::1]:23380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hhw97-004Iyz-N3; Mon, 01 Jul 2019 13:15:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25422) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hhw92-004Iyr-IJ
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 13:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:Cc:From:To;
 bh=DhnjctWpej9yShrak89KYrRGlfzkXDt6gOzqqTZmiFo=; b=mK8s7ewry0BdJW484z3brGQmAn
 1KMgx7CMsLD5a1EBnfHgTcuwWM2gUJRULTOwai27a7kSvHE7BSI3gSu68Q+y4vzQHcK0cSqV9075J
 l3qGT54tU+rfiKLZ6lSrMnnJArRQXV4sblsG8z69Vq9mIAssovYDXKTymqqZJ56mhDJ4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hhw91-0000SJ-Ul; Mon, 01 Jul 2019 13:14:56 +0000
Subject: Re: [PATCH] zfsacl: Fix ACL behavior issues with vfs_zfsacl
To: Andrew Walker <awalker@ixsystems.com>
References: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
 <20190517054426.aoyovsk4cwsse2li@inti>
 <CAB5c7xofY0NQMrf_UX36JHDucoN5f-N-HdPvXis3PXMRbSEQpw@mail.gmail.com>
 <764e0998-97b3-c47d-bbc7-73c8f748d58d@samba.org>
 <20190529170249.GA12186@samba.org>
 <CAB5c7xojRQCRR3S9WSGa1LiWSPAvbnS2kQLhkaka_sE5=CXSqQ@mail.gmail.com>
Message-ID: <342a9190-658c-ab7d-aed0-456a72e051aa@samba.org>
Date: Mon, 1 Jul 2019 15:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAB5c7xojRQCRR3S9WSGa1LiWSPAvbnS2kQLhkaka_sE5=CXSqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

thanks a lot for the updated patch.

May I ask if you would be interested in submitting the patch via our
gitlab CI [1]? If you have a gitlab account, let me know so I can add
you to the project on gitlab.

I can of course run CI for you, but you wouldn't wanna miss the fun,
would you?

Thanks!
-slow


[1]
<https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Other_Samba_developers>


On 7/1/19 1:59 PM, Andrew Walker via samba-technical wrote:
> Per Ralph's request, I am breaking the issues into separate patches. This
> is the first patch. It sets SEC_DESC_DACL_PROTECTED if the ZFS ACL lacks
> any entries with the INHERITED flag set. ZFS has the PROTECTED ACL flag,
> but mapping inside zfsacl is not possible because the flag in solaris /
> illumos is not exposed by the acl() syscall (although it is used by the
> kernel SMB server). In FreeBSD, the ACL flags are not mapped at all. I have
> a WIP patch for freebsd to expose them via acl_get_file() and
> acl_set_file(). This means that eventually I will submit a freebsd-specific
> vfs module to do this properly.
> 
> This behavior (being able to map SEC_DESC_DACL_PROTECTED to something)
> appears to be required for proper Windows client behavior when trying to
> alter an existing ACL. Windows Explorer will simply not allow users to edit
> an ACL if inheritance is not disabled. Unfortunately, it does not appear to
> evaluate the actual ACE inheritance flags to see if they are inherited, but
> rather at the security descriptor type bits. The end result is that it is
> impossible to use Windows explorer to edit the ACL of files in a Samba
> share with zfsacl unless this parameter is set.
> 
> Andrew
> 
> On Wed, May 29, 2019 at 1:02 PM Christof Schmitt <cs@samba.org> wrote:
> 
>> On Mon, May 27, 2019 at 11:34:17AM +0200, Ralph Boehme wrote:
>>> Hi Andrew,
>>>
>>> On 5/20/19 1:00 PM, Andrew Walker via samba-technical wrote:
>>>  > Thanks for the feedback and suggestions. I'll try to get this done
>> this
>>>> week or next week. You are correct that ZFS has the  NFSv4.1 ACL
>> flags, but
>>>> FreeBSD does not currently implement NFSv4.1 ACL inheritance. The
>>>> suggestion of just mapping what we receive over the wire is a good
>> one. I
>>>> could probably do this for the case of Solaris and Illumos.
>>>>
>>>> One possible alternative is that I could move this logic/lies to
>> libsunacl
>>>> (the library that maps ZFS ACLs to FreeBSD ACLs) so that there won't
>> be a
>>>> FreeBSD-specific parameter for vfs_zfsacl. In this case the only thing
>> I
>>>> would need to add to fix disabling inheritance in samba is mapping the
>>>> NFSv4.1 ACL flags to control flags like gpfs does.
>>>>
>>>> Let me know if you prefer the second approach.
>>>
>>> Not sure if I like either of both. :)
>>>
>>> Iirc the protected flag only comes to play client side, when Windows
>>> Explorer performs tree inheritance for new created ACEs. My NT ACL mind
>>> model is currently swapped out and not fully swapped back in, so I might
>>> be missing something. Jeremy?
>>>
>>> So basically the only thing you need to implement this in the filesystem
>>> is storing the flag, no need to attach any semantics to it in the
>>> filesystem. The chmod command could be updated to honor the flag when
>>> appyling ACL changes in directory tree mode, not sure if how GPFS
>>> handles this.
>>>
>>> Christof do you know? I guess chmod on GPFS will ignore the protected
>> flag.
>>
>> Is that the SEC_DESC_DACL_PROTECTED flag? For GPFS, gets mapped to
>> the ACL flag and stored in the file system ACL. There is no behavior
>> attached to that flag.
>>
>> chmod in vfs_gpfs does not check the PROTECTED flag. We probably could
>> add additional logic if necessary.
>>
>> Christof
>>


-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


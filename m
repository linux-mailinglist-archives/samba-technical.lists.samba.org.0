Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBAB470C3D
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 22:06:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=y8axYVmoOOBFNCX45QS0cpgAUtnHT+8llVm5W1rn7Yc=; b=gUFMJGtVPJRepkE37meJIg8iD2
	xfWI0EiWdg5SSTDaov1SCuQQLjquxxqaJWBceL1jADipCj8gTwbRMYHjoklmxFbGZsCe0AIMHKFXH
	IjTj18svJrA12ilD/4b5OGsq4hSMZcC9nPDiHBpzmIoEibnpjDDjBazTzeMk88jpdFLr+vqODwu1t
	4cUOhgZtLKZvZiP4bhqiJU11PAlEt2Nbctz4o6ZQnIMOrP/eqDj2pJe4ggfi0tZtxyKAaNE0Ip8P3
	VvY92Ie5SHAr/Nc9yiUQ4iiFgwVPqbWxT9M3aSzaMARXlSdjqa3aaB1mNg1KwNWiSlyo4iaktOVSE
	MWjaa2Lg==;
Received: from ip6-localhost ([::1]:49752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvn6E-0056bY-T7; Fri, 10 Dec 2021 21:06:38 +0000
Received: from p3plsmtpa09-06.prod.phx3.secureserver.net
 ([173.201.193.235]:54074) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mvn65-0056bO-OF
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 21:06:35 +0000
Received: from [192.168.0.100] ([98.118.115.249]) by :SMTPAUTH: with ESMTPSA
 id vn3pmgMtIDmxfvn3pmmgeO; Fri, 10 Dec 2021 14:04:10 -0700
X-CMAE-Analysis: v=2.4 cv=cbsXElPM c=1 sm=1 tr=0 ts=61b3c0ca
 a=T+zzzuy42cdAS+8Djmhmkg==:117 a=T+zzzuy42cdAS+8Djmhmkg==:17
 a=IkcTkHD0fZMA:10 a=hGzw-44bAAAA:8 a=ac0Z_fNiEn2viTdyHQ8A:9 a=QEXdDO2ut3YA:10
 a=HvKuF1_PTVFglORKqfwH:22
X-SECURESERVER-ACCT: tom@talpey.com
Message-ID: <a58df604-6341-5a18-377f-8ff204ab53da@talpey.com>
Date: Fri, 10 Dec 2021 16:04:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Christof Schmitt <cs@samba.org>, Jeremy Allison <jra@samba.org>
References: <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer> <YbOlvjkCcbp41r0e@samba.org>
In-Reply-To: <YbOlvjkCcbp41r0e@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH/42gI5+YJT8ldhCcjKf5lCun3e9XQHhtq0Y7avKOQMNacLngslRDUBgrukYqdgtmoIMYnhLGQJ1/5w1VJz8ovXRu+Stp4DXFVXaIFW6mugrQ5BFDu1
 usaJA2JD/Yx0HRZJtBDDaGg0ZdN+Hjs/IvG8uAf7tnIlOVHc5qZapDQuxa+FKeKMDh+ox7Rpc6DTFB3oEPJZ/K4Oag8EbRQsSQFx3DX/dzZC5rTcz1OyfNFO
 x1tSe9oDiy6qPZ0lYyLcmVZTXsojdZnYkHH7zp1Djx6oi6K/AN2qT4Y9SnCkdBceojx6VQQdP6bkh6VmR2VeHQ==
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: Andrew Walker <awalker@ixsystems.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 12/10/2021 2:08 PM, Christof Schmitt wrote:
> On Fri, Dec 10, 2021 at 09:57:07AM -0800, Jeremy Allison via samba-technical wrote:
>> On Fri, Dec 10, 2021 at 06:06:56PM +0100, Ralph Boehme via samba-technical wrote:
>>> On 12/10/21 17:56, Andrew Walker wrote:
>>>> That's a good point, but if MacOS SMB client is faking up an inode
>>>> number based on a hash of the filename in the zero-id case, isn't it
>>>> even more likely to yield a collision at some point?
>>>
>>> well, it's somehash(name) combined with the parent-inode number. I know,
>>> it's not ideal.
>>>
>>> But going back to inode numbers brings us back to:
>>>
>>> https://bugzilla.samba.org/show_bug.cgi?id=12715
>>>
>>> *scratches head*
>>
>> OK, seems to me that we need inode numbers by default,
>> as that's what works with both Windows an Linux clients.
>>
>> If Mac's need special handling here, then we have the
>> capability to detect them and switch out the inode
>> numbers for Mac clients (fruit... :-) :-).
> 
> Not every Samba server where Mac clients connect has vfs_fruit enabled.
> And requiring vfs_fruit to prevent data corruption seems like a big
> step. The requirement for Mac clients is the same, no matter whether
> the fileid is generated in vfs_default or vfs_fruit.
> 
> The initial problem is fairly easy to recreate: Use a Samba version that
> reports inode numbers as file ids, create 100 different files with
> different data from MacOS. Now go to the file system, delete those files
> and create files with the same name and different data. Then read those
> files on the Mac client. Chances are that the Mac client will now show
> the data from the old files (due to the fileid based caching. If a new
> file got the same inode, it has the same fileid).
> 
> As this thread shows, timestamps are not a universal solution.
> In vfs_gpfs, we are able to retrieve the inode number and the inode
> generation and use that to generate unique ids. That seems to work
> reasonably well. But even the standard Linux statx() call does not
> return the generation number. So that would only be solution for file
> systems that that provide an interface to query the generation number.

I believe the EXT, BTRFS, XFS and a few other Linux filesystems support
retrieving the generation number via ioctl(FS_IOC_GETVERSION). But I'm
not certain how universal this is. There being hundreds of file systems
in Linux...

Could Samba perhaps insert a kernel module, or use the SMB client kmod,
to fetch this? It'd be ugly and will have security implications, so I
would not go into it lightly.

> For additional fun, the spec says:
> 
>      2.1.9 64-bit file ID
> ...
>     The identifier SHOULD<10> be unique to the volume and stable until the
>     file is deleted.
> ...

Yeah, that SHOULD is confusing (and technically a doc bug). It is not
making any reliable normative statement. We could toss that to dochelp.

> So technically the Mac is wrong to expect identifiers to be unique
> across file deletions. I assume this comes from the old MacOS file
> systems that have a CNID that is only increasing.
> 
> I am not sure how to solve this for the general case...

I think the exception for deletion is stemming from the possibility of
oplocks or leases, which will provide a callback that the client will
use to flush its cache. But these are optional, and aren't completely
reliable, in the face of network partitioning. It gets particularly
messy when the server supports durable, resilient or persistent handles.

Ralph, did you try returning FFFF instead of zero for the DiskFileId in
vfs_fruit? As in, cannot be provided for just that file? Perhaps MacOS
does something different in that case.

Sorry, no brilliant nuggets of wisdom from me at this point either.

Tom.


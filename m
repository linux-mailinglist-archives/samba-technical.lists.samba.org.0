Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0D470CB5
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 22:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=I3zZ7n/ykpQNizIW7n0uHppsmQn3Ntavq388l+haRag=; b=ZbsyGUFh5VZr2uHYPi2G689wCZ
	benSh8RVFCdd4k/Mffnr/+o7+SDpCH4Q0tvmVF/cDUlgjuK5TmyH/pYCxE56KeiLi0+I/pJLmHH+V
	9rICY+TKHWs6YgMOE2mq9R07h/Pl/M2xzmwxjZHbNNBDp1RItYZbHTdBIIZFz4bBlsPChuuPvDSXg
	ndaiuNKUkeIrkQ46ZgQapghwY4lkHlVNkR8neuRvLxj8n/nIrzTneDc9QG4k4l4vzzy8n+SJJxgWq
	u00KGg9YqrayoMwpJ4ahR4ULtse4I1zdsuecyM9N0PnVv/W6bvqyeD9Kd6yCqTOPcC50gaZveobrw
	G4c+Wg2Q==;
Received: from ip6-localhost ([::1]:51778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvncM-0057Vd-L2; Fri, 10 Dec 2021 21:39:50 +0000
Received: from p3plsmtpa09-08.prod.phx3.secureserver.net
 ([173.201.193.237]:56115) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mvncG-0057VU-7A
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 21:39:47 +0000
Received: from [192.168.0.100] ([98.118.115.249]) by :SMTPAUTH: with ESMTPSA
 id vna0ml7lIO8D4vna0m8m0w; Fri, 10 Dec 2021 14:37:25 -0700
X-CMAE-Analysis: v=2.4 cv=KIGfsHJo c=1 sm=1 tr=0 ts=61b3c895
 a=T+zzzuy42cdAS+8Djmhmkg==:117 a=T+zzzuy42cdAS+8Djmhmkg==:17
 a=IkcTkHD0fZMA:10 a=Ln9Q5E6V_nxf8ydlOE4A:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: tom@talpey.com
Message-ID: <9da525cd-3e76-ba44-8da4-c2d69425fb3a@talpey.com>
Date: Fri, 10 Dec 2021 16:37:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Christof Schmitt <cs@samba.org>
References: <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer> <YbOlvjkCcbp41r0e@samba.org>
 <a58df604-6341-5a18-377f-8ff204ab53da@talpey.com>
 <YbPFaoMg4CUEkf0o@samba.org>
In-Reply-To: <YbPFaoMg4CUEkf0o@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJjcdqMBkxthJ1jeuH22Bs4jt+bGX7Nv+XxQ/jFkqSQp0oFUeqmr2RUjsbhedFufe+BlUXACMfQVF6eIk3HChFqdCuBzcvnwVARW1Ukezgs/A5nVvKN0
 ek+yo5Vw9KPbHiD1JWlNrFDlI0iTnay/7/oA+BMHBpvZ/i0b9UnQREQ0nD1PpIqH+GelEXm4/WPSwa/pem3L4Lrt0pp5nEqLawysnT/3HTHGLKEJK/ugsnof
 POmQdUv4LbBVD3sBOCvB64diIigtFEkpNqDr5QQxoyk=
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Andrew Walker <awalker@ixsystems.com>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 12/10/2021 4:23 PM, Christof Schmitt wrote:
> On Fri, Dec 10, 2021 at 04:04:09PM -0500, Tom Talpey via samba-technical wrote:
>> I believe the EXT, BTRFS, XFS and a few other Linux filesystems support
>> retrieving the generation number via ioctl(FS_IOC_GETVERSION). But I'm
>> not certain how universal this is. There being hundreds of file systems
>> in Linux...
>>
>> Could Samba perhaps insert a kernel module, or use the SMB client kmod,
>> to fetch this? It'd be ugly and will have security implications, so I
>> would not go into it lightly.
> 
> I missed FS_IOC_GETVERSION. That might be an option, since that is at
> least supported on the most commonly used file systems (ext4, xfs,
> btrfs). And if the call fails, we could log a warning, that this setup
> might be unreliable for MacOS clients.

Looks like ZFS has its own idea, ZFS_IOC_OBJ_TO_STATS. But we could
cover the basics with a handful of tries.

What about packing the dev_t, ino_t and generation number all into
64 bits, without risking a collision? I think the dev_t is needed
unless the Samba server can guarantee the share always maps to
exactly the same one, which seems problematic.

Tom.


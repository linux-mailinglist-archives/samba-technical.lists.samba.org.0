Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A07032D5FC
	for <lists+samba-technical@lfdr.de>; Thu,  4 Mar 2021 16:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=a8la+Bes6sOWztPpIbx4nliDBw5n7xhkMEw+0yj8iyM=; b=syXbHxolJqxdnyVX0ZtA+0S0vW
	SpnwF9yqMIxWw7OYVs7RFSIdkuKPkA7lgYfRZSYZLjgDioaqkPhse66C5dX0Lzs5OxOiff6gDdmGz
	tgZur7wSVMH2qa6bnL3roLL4K6dUm8Fb7MAppJsqtwdJcIOY4iKBL0pu+YLG4lMaHCPqu2WN1rw/M
	Y0Zi9m5fIIwHLSYS2sifEsbWFdrJpjiCoPnYCJyf+MQkIyNQ0RpZwPoynpd+yJYmbWd0zHiDAeqe1
	+98gFkhg7y8pRWuHCnE8EVPZXzitFZbIZ9T92qAHzwvNRv+V/oQSxzJMYGgzHwiCAgAeV8DLwjKRQ
	3t10vR2g==;
Received: from ip6-localhost ([::1]:28974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lHpa9-0049tk-E1; Thu, 04 Mar 2021 15:08:05 +0000
Received: from p3plsmtpa08-06.prod.phx3.secureserver.net
 ([173.201.193.107]:33230) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lHpa4-0049td-6e
 for samba-technical@lists.samba.org; Thu, 04 Mar 2021 15:08:02 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id HpXolIVXoptLUHpXpl6JpA; Thu, 04 Mar 2021 08:05:41 -0700
X-CMAE-Analysis: v=2.4 cv=KN+fsHJo c=1 sm=1 tr=0 ts=6040f745
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=hGzw-44bAAAA:8 a=DsloTXpuAAAA:20 a=pKQGl_nEQggt8llYIiUA:9
 a=QEXdDO2ut3YA:10 a=ahtzkqAwBOYA:10 a=HvKuF1_PTVFglORKqfwH:22
 a=BPzZvq435JnGatEyYwdK:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: TimeMachine support for Big Sur - missing F_FULLFSYNC?
To: Andrew Walker <awalker@ixsystems.com>
References: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
 <3868fb70-aba6-bb75-f831-7bff958d0ebc@samba.org>
 <4b9a8546-4be1-edb9-afc4-84798b20fba1@talpey.com>
 <b40f0b6a-4c33-f9c6-8cf3-6124e952467f@talpey.com>
 <CAB5c7xr4Kr3f7v7rxP14La3QS7SL8FK_SyovqeMcevhssgjXsQ@mail.gmail.com>
Message-ID: <407eb1b6-d840-d21a-0b03-0d9b1c82a045@talpey.com>
Date: Thu, 4 Mar 2021 10:05:41 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAB5c7xr4Kr3f7v7rxP14La3QS7SL8FK_SyovqeMcevhssgjXsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMFWf2JXEhBlDGld9hufeIe28/UbjXobA604e9NAgbwv29tEiWOXQpzukcr12a/35dK4PpzWoZgf1Lab/MuqrIRgck0u9mhmkuRQz/RbdF8ZbV9FryEI
 Jp6lmd4qMT4WD3pnhG7yH5qJAnWhzYPCZbHXhs1Q3YchEaED0sWga24CAOGGKvVNdhROVn5rBqW6AOIiRwinyc/tw6F5y7ksqjX5GdNsATAPMm5Q8/2nS2Xx
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 3/4/2021 9:44 AM, Andrew Walker wrote:
> 
> 
> On Thu, Mar 4, 2021 at 9:21 AM Tom Talpey via samba-technical 
> <samba-technical@lists.samba.org 
> <mailto:samba-technical@lists.samba.org>> wrote:
> 
>     Just a quick update to say that after an upgrade to Samba 4.11,
>     as expected Time Machine is working fine from Big Sur. It's
>     quite simple to configure, in fact - most everything flows
>     from minimal added settings in smb.conf:
> 
>        [global]
>          ...
>          vfs objects = fruit streams_xattr
> 
>        [TimeMachine]
>          ...
>          fruit:time machine = yes
> 
>     mDNS doesn't appear to be functioning for some reason, so
>     I've hotwired avahi-daemon to advertise the share.
> 
>     There are some quirks due to my use of a ZFS backend, and
>     the usual set of Ubuntu package mix-and-match differences,
>     which is why I'm only on 4.11 for now. I'm sorting out the
>     fruit:metadata, fruit:resource and fruit:nfs_aces options
>     relative to ZFS, but Time Machine appears to be not so
>     sensitive to these. One thing at a time.
> 
>     I'll try to add something useful to the wiki later.
> 
>     Tom.
> 
>     On 3/2/2021 8:14 AM, Tom Talpey via samba-technical wrote:
>      > On 3/2/2021 1:56 AM, Ralph Boehme wrote:
>      >> Hi Tom!
>      >>
>      >> Am 3/2/21 um 4:51 AM schrieb Tom Talpey via samba-technical:
>      >>> Does the 4.7.6 version of vfs_fruit support F_FULLFSYNC
>     advertisement?
>      >>> I find some mentions of earlier versions supporting F_FULLSYNC
>     (no extra
>      >>> "F"!), but zero mention of either fullsync or fullfsync in
>     release notes
>      >>> for any Samba/vfs_fruit version. Is that just a typo, in which
>     case, why
>      >>> is Big Sur complaining?
>      >>
>      >> You need at least 4.8 for this.
>      >
>      > Hi Ralph! I guess I figured Ubuntu would be off-by-one. :)
>      > I'll upgrade, had hoped to avoid a full network forklift but
>      > it's perhaps due.
>      >
>      > I think it would be good to refresh the wiki regarding this.
>      > I did find
>      >
>      >
>     https://wiki.samba.org/index.php/Configure_Samba_to_Work_Better_with_Mac_OS_X
>      >
>      > which does in fact state the 4.8 requirement in rather fine
>      > print, but the page says things like "here are suggestions"
>      > to "improve operability with Mac OS X", and "as far as I know".
>      > I'll see if I can help improve it after I muddle through the
>      > situation.
>      >
>      > Tom.
> 
> ZFS in general doesn't have an upper-limit on size of xattrs that can be 
> written, but Linux kernel puts cap at 64 KiB for max xattr size.
> ZFS on FreeBSD allows xattrs up to size_t bytes, but due to API 
> limitations (no pwrite for xattrs) you don't really want to go too 
> crazy. I once tried to write a 30 GiB alternate datastream to a samba 
> share on FreeBSD and was not satisfied with the result.
> Most of stuff written about NFSv4 ACLs on ZFS don't apply to general 
> Linux case (acltype is POSIX there).
> One ZFS dataset property that is particularly useful for Samba shares 
> performance-wise (for reading / writing xattrs) is xattr=sa. This 
> attribute is available in Linux, the FreeBSD port of zfs on linux, and 
> base FreeBSD IIRC in 13.

My datasets have the default xattr=on. If I change that to xattr=sa,
does that orphan the existing xattrs, I assume?

   https://github.com/openzfs/zfs/issues/443

Since I've only used the share for TM so far, it's not a huge big deal 
to wipe and redo, but it's not ideal. I'm not certain what important
stuff TM shoves into them, in any case. Maybe I'll give it a shot and
see what breaks!

Thanks for the idea, in any case.

Tom.


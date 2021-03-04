Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC932D52A
	for <lists+samba-technical@lfdr.de>; Thu,  4 Mar 2021 15:21:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nwf3qOJFjUCrIUC8UFBV/yqlMpVh/Sq5PodVt+Bmv0I=; b=dFOgsgmqNFxC5WJWKGts/jpj6n
	5FLVzheI8Py/547BnVs07kw6OylhM+6lGSWsPYUJG7KwEb6kVq8223IVpf/MrLi2A6/M4lP+liZ6H
	PsNX2ZR2ek+Fmbw7mRLD7mnk2thJr9W6uoMnnTvc6G51NeYHh206zaZYI1F0TpZY4cAPKlWBomiE4
	NJn3TnC0uwmS8uFyXqwcQxkGQivg2/hfnIXDMcNbRxWa7kAILJRQmsK8k60HU7yAjxFV+WD4025PR
	09n16ItPCSlN6DebDcMUAdJSkEs+QpLX6ZY76BDTdYOhds/mbu6lQrwxDLG9qwHMCJfFirW24D7uz
	Duk9AoRQ==;
Received: from ip6-localhost ([::1]:27454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lHoqO-0049cr-QH; Thu, 04 Mar 2021 14:20:48 +0000
Received: from p3plsmtpa08-09.prod.phx3.secureserver.net
 ([173.201.193.110]:40037) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lHoqK-0049ck-AV
 for samba-technical@lists.samba.org; Thu, 04 Mar 2021 14:20:46 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id Hoo4lNhaCAxvlHoo4lj10d; Thu, 04 Mar 2021 07:18:25 -0700
X-CMAE-Analysis: v=2.4 cv=SvpVVNC0 c=1 sm=1 tr=0 ts=6040ec31
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=hGzw-44bAAAA:8 a=j3TkjiYd9PVE2qGUEOoA:9 a=QEXdDO2ut3YA:10
 a=ahtzkqAwBOYA:10 a=HvKuF1_PTVFglORKqfwH:22 a=BPzZvq435JnGatEyYwdK:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: TimeMachine support for Big Sur - missing F_FULLFSYNC?
To: samba-technical@lists.samba.org
References: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
 <3868fb70-aba6-bb75-f831-7bff958d0ebc@samba.org>
 <4b9a8546-4be1-edb9-afc4-84798b20fba1@talpey.com>
Message-ID: <b40f0b6a-4c33-f9c6-8cf3-6124e952467f@talpey.com>
Date: Thu, 4 Mar 2021 09:18:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <4b9a8546-4be1-edb9-afc4-84798b20fba1@talpey.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM8YvXiDqaOywF0Fg76nVtT1FFu160KckJ5utVY4ucZPwvWfeUVdgE3tpEWMIqp2Irm+2P/xAEyHYNJq3Zv9uH66Li+t0y4RbVa4wz7ePvmNCxjOAHDG
 zAoFdEy8vN/KI/xrZwEtuZ/H2sj1PqfZq4Fh8Gf1+eaAsm2Rpr3713RPZLJV8I9medqg+3QO9onk8DKaHWVoCud4yuap4gNdOXE=
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just a quick update to say that after an upgrade to Samba 4.11,
as expected Time Machine is working fine from Big Sur. It's
quite simple to configure, in fact - most everything flows
from minimal added settings in smb.conf:

  [global]
    ...
    vfs objects = fruit streams_xattr

  [TimeMachine]
    ...
    fruit:time machine = yes

mDNS doesn't appear to be functioning for some reason, so
I've hotwired avahi-daemon to advertise the share.

There are some quirks due to my use of a ZFS backend, and
the usual set of Ubuntu package mix-and-match differences,
which is why I'm only on 4.11 for now. I'm sorting out the
fruit:metadata, fruit:resource and fruit:nfs_aces options
relative to ZFS, but Time Machine appears to be not so
sensitive to these. One thing at a time.

I'll try to add something useful to the wiki later.

Tom.

On 3/2/2021 8:14 AM, Tom Talpey via samba-technical wrote:
> On 3/2/2021 1:56 AM, Ralph Boehme wrote:
>> Hi Tom!
>>
>> Am 3/2/21 um 4:51 AM schrieb Tom Talpey via samba-technical:
>>> Does the 4.7.6 version of vfs_fruit support F_FULLFSYNC advertisement?
>>> I find some mentions of earlier versions supporting F_FULLSYNC (no extra
>>> "F"!), but zero mention of either fullsync or fullfsync in release notes
>>> for any Samba/vfs_fruit version. Is that just a typo, in which case, why
>>> is Big Sur complaining?
>>
>> You need at least 4.8 for this.
> 
> Hi Ralph! I guess I figured Ubuntu would be off-by-one. :)
> I'll upgrade, had hoped to avoid a full network forklift but
> it's perhaps due.
> 
> I think it would be good to refresh the wiki regarding this.
> I did find
> 
>      https://wiki.samba.org/index.php/Configure_Samba_to_Work_Better_with_Mac_OS_X
> 
> which does in fact state the 4.8 requirement in rather fine
> print, but the page says things like "here are suggestions"
> to "improve operability with Mac OS X", and "as far as I know".
> I'll see if I can help improve it after I muddle through the
> situation.
> 
> Tom.
> 
> 


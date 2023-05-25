Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BC711809
	for <lists+samba-technical@lfdr.de>; Thu, 25 May 2023 22:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=J5YQuBSYJ+Gmm+1sncCCJWxeublLtyJCgvShhMLeZQ8=; b=n3q1NqEOPMLcmeDDnT4u9LzWY4
	73FEeKHNv4CS1npISmF1vtV6u4SN7uK1j20cTduGH51IvqU9oh0keCp9DqGk81fBJFcBL/juQ4PPi
	AJX6W55uFNB/j/j9Y3tqrckjNfhFI2S7m8dE6/T3S0zd1OCJdGjJ/3RGTdResjqAJ+rz82s8+tZmq
	ivTDAhgUQufhWd+1JlvQihhCT6jzlSk+yr3UyD3AGkbbn3V9vISoiyDr2ZOJOfSgQQEd/H1GIw9s6
	daq1EiwlK9bBXBaGnLHSp3WRXCT83qSP8evwHLuHeKwg5pxVH5ZLX/tQ5HKU3scz/tF6ssZY6isY+
	CwcyuuVQ==;
Received: from ip6-localhost ([::1]:29512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2HTT-00CJuI-Ny; Thu, 25 May 2023 20:22:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2HTO-00CJu9-6y
 for samba-technical@lists.samba.org; Thu, 25 May 2023 20:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=J5YQuBSYJ+Gmm+1sncCCJWxeublLtyJCgvShhMLeZQ8=; b=PukFwWrgaBc5X/SC+g8I8RKpFY
 xQ3ZLKWtO1NegV2D5D3XRESVApGMsmEmtCNLj0ASZvAkzpLjYF6wA6Z7Xi4DWt/eIS8nesGvt8/ld
 MrNnRryJtVRxZj+ptcqN68brSf61AubXm8LRMAPcXb2A53tvKH6/B+/iKubRUJNZCu+sxDUQ7dHTG
 +YgPDFUzfj9dAWPIwDHfe0djx31m92FfoIsfh7910SanGIVz/sZR47XyGYHr4TDTsdusw6o/xwolD
 zGNQ1KPJS7WyPASaOKY9bX2gnyXPQ+f2FI3gyedWl8EANJFPE1+B9eQvQ+ZsqToRkbucdN6DYGTgD
 sEPTnRsTzz26zKeB/icG1W50CmZCvlws8SWuz3mn2b4Hau967jn+xVlgAFlkXrCIrOLY94ALVLf5P
 WwXBcsePWzK0vmXZHRVDGB1jGhXimBs7kj/fFiv3F2aXQggyLxaRJrJZyDK4ltM/jIGVIL1+9uddY
 b1HtLL4iD+cxQiYwMVvxrNYd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q2HTN-00CCha-0F; Thu, 25 May 2023 20:22:09 +0000
Date: Thu, 25 May 2023 13:22:02 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: Displaying streams as xattrs
Message-ID: <ZG/DajG6spMO6A7v@jeremy-rocky-laptop>
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <20230525093900.GA261009@sernet.de>
 <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
 <ZG+LOKTr8B+zjQsC@jeremy-rocky-laptop>
 <CAH2r5mv7aZ8nm30oKyYpa-bd8-MqA13EcEmQWV4mOyrV-rj8Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2r5mv7aZ8nm30oKyYpa-bd8-MqA13EcEmQWV4mOyrV-rj8Ug@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@sernet.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 25, 2023 at 03:11:13PM -0500, Steve French wrote:
>On Thu, May 25, 2023 at 11:22 AM Jeremy Allison <jra@samba.org> wrote:
>>
>> On Thu, May 25, 2023 at 08:49:47PM +1000, ronnie sahlberg wrote:
>> >>
>> >> just took a look at how the ntfs-3g module is handling this. It was an option
>> >> streams_interface=value, which allows "windows", which means that the
>> >> alternative data streams are accessable as-is like in Windows, with ":" being
>> >> the separator. This might be a nice option for cifsfs also. That option would
>> >> just be usable if no posix extensions are enabled of course.
>
>You can already open alternate data streams remotely (from cifs.ko on Linux
>as you can from Windows and Macs etc. just open "file:streamname"), but on
>Linux you have to disable the reserved character mapping ("nomapposix")
>otherwise ":" would get remapped on open in the Unicode conversion.
>
>There may be a better way to list streams in the future (e.g. to help
>backup applications
>that need to be able to save files created by Macs or Windows that need these
>e.g. Virus checkers etc. use ADS, and looking at my Windows machines, PDFs
>can have small "Zone Identifiers" saved in streams), but you can
>already list them
>with "smbinfo filestreaminfo <filename>"
>
>I was thinking mainly about backup scenarios whether this came up as
>listing them
>also via a pseudo-xattr (IIRC Macs do something similar).

I think cifsfs providing access to ADS remotely on Windows
and Samba shares is fine.

What I'm scared of is adding ADS as a generic "feature" to
the Linux VFS and other filesystems :-).


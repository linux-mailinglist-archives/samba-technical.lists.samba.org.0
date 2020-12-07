Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3DC2D1A76
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 21:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=HA65bipwo+71FnqG6BdgK6gtTsOxn5ZSX3P4+Rf84nQ=; b=Aw28O224sSHmaWqPFQcBKDhJzX
	iq0fAjRV2L1gvnDGMbKcLc1RKwqkj9RcvZNNiz8J5MKrCQmfLetWibjOwLqkFSFf/k4QTlib0TAXj
	oVb1Yj3392FdOpHRaKaOvrNmdu1Izc4/KOZYub4D/87noVWATYtQ2MJklZmabzcvZdy055pXf6sok
	sZ/lcBN5834M+QzskDDFKct4tS+YuYltUQKblL7pioKn+TlsO/i9cP6LDghCmQr25K7G7HrYEoHRs
	r4TNPN8XsWLFYuS7Qbk6O7XNN0ZKPgEw2MuhXPURSRQjxKTAtuwayQr3GGw94n5R3X1LkxCLkG8LO
	CGu1us3w==;
Received: from ip6-localhost ([::1]:52902 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmN3o-00076L-8l; Mon, 07 Dec 2020 20:24:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62862) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmN3j-00076E-My
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 20:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=HA65bipwo+71FnqG6BdgK6gtTsOxn5ZSX3P4+Rf84nQ=; b=cBNgxeW3GjH0n8ryQhJF+LyeC5
 h+9ryyoiFo6mOZfWyh1cigMlEBGntQnsX3tqRH7zXfg8D114XMStCv0QQp98utgiCo0vlsBUXLyIo
 6xFRUnyxI3MX8vz0ENBdpUaPzbxA/VTK8dMmeGzsN61uh0OEUHfrzlDsdrbIyqCvV+e9IOkXuOUt/
 tVwi2WxPGZr8eOcNDU7gvkqRDpYSyeo4LoTPjMUlsM6CTx5OV4yU0d9rOH7cThKtqUMDNSCCdhlRX
 vE2+KdykMeYBsWciz2U/UgnPASbVl39XUqjGGn2IZR9bWrsE4zvg0sqB26UxxojOU+Q7NtDJuyo5N
 /mpjy4JZDm0cqUG01f4RXAJVfPptt3ufPq+Ca+YVKHguFoyLTmGey1jHD0XOq8QOp5ISX1dyosSoP
 kMWAlgltrIYSbnL7ZpSzp5E5k6arj7BKXkLcF4Fpjv8BB/UtOZoZEtwDPFGi7pWTZVWYeNNTldA7T
 JhL1bbwYEwdnW2pJFs5u24mM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmN3i-0000zx-GE; Mon, 07 Dec 2020 20:24:34 +0000
Date: Mon, 7 Dec 2020 12:24:31 -0800
To: Joseph <j@gget.it>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-ID: <20201207202431.GB1800173@jeremy-acer>
References: <81fae2f8-970f-44a4-bb46-fb5237715070@mtasv.net>
 <20201207180509.GD1730617@jeremy-acer>
 <43ab09f9-db7b-4d48-a037-2ef5220432f9@mtasv.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <43ab09f9-db7b-4d48-a037-2ef5220432f9@mtasv.net>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Dec 07, 2020 at 03:07:55PM -0500, Joseph wrote:
>Thank you for your response Jeremy.
>Good news: if I still write *from Windows*, but from a Python script like
>this:
>
>    import os
>    with open(r'\\RASPBERRYPI\public\test\hello.txt', 'wb') as f:
>        for i in range(100):
>            f.write(os.urandom(10*1000*1000))  # 10 MB blocks
>
>then the problem does not happen: each 10MB block is appended one after
>another, and there is no "preallocation".
>This seems totally logical, but happy to see it working: so writing from
>Windows to a remote Linux+Samba+exFAT computer in itself is working fine!
>(if the client is *not* Window Explorer, but another file-copying process,
>such as the Python script here)
>
>Now the only problem is the Windows Explorer file copy which probably does
>this EOF fileseek to be sure there's no ENOSPC error.
>
>Is there a full verbosity logging in Samba server that would allow me to
>see exactly which open(), write(), seek() are sent by the Windows Explorer
>Samba client to the Samba server? Can we log so precisely all IO calls? I'm
>curious to see what Windows Explorer is sending exactly.

Sure, just enable the vfs_full_audit module and do the copy from Windows Explorer.

Warning you'll want to disable afterwards as it's very verbose.

>Since millions of people use exFAT in the NAS context (especially in the
>RaspPi world and also people who use media players / TV which don't support
>ext4 but only NTFS or exFAT), it would be great to see if a fix could be
>possible :)
>I've literally seen dozens of forum posts about nearly exactly this issue
>(NAS-related / RaspPi / media-players-related forums, ec.).
>
>I would be happy to analyze precisely what the Explorer does to see if a
>trick could solve this.
>
>PS: perhaps just *not* doing a flush() after the "seek EOF" would be enough.
>Indeed I noticed that, on the Linux computer, with Python:
>
>    with open('/mnt/exfat/test.bin', 'wb') as f:
>        f.seek(1000*1000*1000)  # move 1 GB forward, no delay!
>        f.write(b'END')                  # no delay!
>        f.seek(0)                           # go to the beginning to
>actually write the file content, no delay!
>        f.write(...)                          # write the actual file
>content
>
>all the first lines happen without any delay. There is a delay if and only
>if we flush() after the seek() or write(b'END'), but we could easily bypass
>this.
>With this method, the 1GB is written only once on disk, and not two times.

This is controlled in Samba via: "strict sync". By default this is set
to "yes".

Try setting to "no" (this is not recommended, you can lose data
this way if the server crashes) to see if this fixes the problem
for exFAT.


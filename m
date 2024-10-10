Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3337C998152
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2024 11:02:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4b0asucFOXHHvZdPwPE+HsFzmz6nT3xckFJUYZM6Qbs=; b=ltLkiDt+2zenNkNJ9JwJCeunk0
	vWxfZkfPdbkJBc2G+ezyK8gtuU1/JzsKIxF6JIXwrTe3OcHZqR3hWLi52AmTDDPTm6nacWaHtrtAv
	Gr0x3sBGS6n9v2QmsZfSOSc+ZQu6lqkVtLRWNP52isXWW8ErqCCNpsIHCfccA+7SUg+Ub9LfdwINJ
	PlmSsP8rWzsUZoD2qFpxc8frjdMKQ4FYbC3GtHxhW1KBfFGvO8agR4hKFiXwxbJddOiGKAh30kAnd
	wNFt/rWX+DSnQp6rXyxJkirqB1f1/IXKuh0ih8GM2xzwD/a/upg+vUkBt8p3O7Iclo7YM2K0rPnBN
	XbY1OzJw==;
Received: from ip6-localhost ([::1]:26596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1syp3S-003Rt0-Gh; Thu, 10 Oct 2024 09:01:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59554) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1syp3O-003Rss-17
 for samba-technical@lists.samba.org; Thu, 10 Oct 2024 09:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=4b0asucFOXHHvZdPwPE+HsFzmz6nT3xckFJUYZM6Qbs=; b=cOrnUERf9NPBvKP4wtSX3a9DtY
 +RUkUA187+RZmIcSRdcFpetSwASWFu7dDj2RInSHkH9R/Vfqb6CAncVH94uF+ooces9sGOrTCkAO2
 taDBc/KcSMbI15XYHyRP5vkAWrAE0T9um6ogmPaqO1ECAcW00jvomwJV8V+8e6SJ0UYB5/654RnmB
 SDCXS+ZsRimHIsSkuRJm7wPvjG43Ex10CB/zQADQ5yXhgysaIPWY30nlydZ79ujgze7+T45D0XSdm
 OvrvmWirE7rspNIymzmOL853PqTKrjXfSxuTyGU1l+SsvR+YuXuFXndd/pkIFMx3VCZqeNnkaLgDX
 ma+wdGkFZESe9Sk6xX4HAHs3l9L8goAMU6UldbttQsziFcg/PYh6UtFhikfepVZvnNUV0J0LrMLoe
 QGM7UyDkb+plRNHofC7rSKgOATRgz9y8ppXQjMP3zeFRnbOEj0XDxNJzFqCYzR6YKtknr3KNnDDXo
 1LJ6P7+9zBmKBGgh/Fq/kKu2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1syp3N-004Avj-0D; Thu, 10 Oct 2024 09:01:49 +0000
Message-ID: <7980bb29-e434-487f-b70d-aa9d29156f00@samba.org>
Date: Thu, 10 Oct 2024 11:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Jeremy Allison <jra@samba.org>, Ralph Boehme <slow@samba.org>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
 <b84b2bb0-0afe-4f9e-9553-1a0201ed92d3@samba.org>
 <ZwblLYrVQM92eFl8@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <ZwblLYrVQM92eFl8@jeremy-HP-Z840-Workstation>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 09.10.24 um 22:18 schrieb Jeremy Allison via samba-technical:
> On Wed, Oct 09, 2024 at 10:00:01PM +0200, Ralph Boehme via samba-technical wrote:
>>
>> Hm, interesting find
>>
>> But I guess this won't help as with POSIX you can open() a file with O_APPEND but then still call pread/pwrite on the resulting fd.
> 
> Is that true ?
> 
> The open(2) man page only says:
> 
>         O_APPEND
>                The file is opened in append mode.  Before each write(2), the file offset is positioned at the end of
>                the file, as if with lseek(2).  The modification of the file offset and the write operation are  per‐
>                formed as a single atomic step.
> 
> Aha ! It's not true (at least on Linux :-).
> 
> The pwrite(2) man page says:
> 
> BUGS
>         POSIX requires that opening a file with the O_APPEND flag should have no effect on  the  location  at  which
>         pwrite()  writes  data.   However, on Linux, if a file is opened with O_APPEND, pwrite() appends data to the
>         end of the file, regardless of the value of offset.
> 
> So FILE_APPEND_DATA|SYNCHRONIZE == O_APPEND, on Linux at least.
> 
> 

MS-FSA 2.1.5.4 Server Requests a Write has this:

If ByteOffset equals -2, then set ByteOffset to Open.CurrentByteOffset.

So I think if a file is opened with O_APPEND (on the client), a write() syscall without explicit
offset (so no pwrite), could be mapped to an SMB2 write with offset -2.
But I fear the linux vfs layer already replaces offset before cifs_file_write_iter() and friends
are called... But I guess the per operation IOCB_APPEND flag can be used in order to decide
if offset -2 should be used. On the server we could map that to pwritev2(RWF_APPEND).
So O_APPEND could be a client only thing...

metze


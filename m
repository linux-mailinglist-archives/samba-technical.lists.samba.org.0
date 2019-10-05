Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 725A9CCCE5
	for <lists+samba-technical@lfdr.de>; Sat,  5 Oct 2019 23:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=h3prknZ+klYwef4I7JISuZcMw8dJfjybNrICBbMrE3o=; b=cNSEZ0n5nwcOV1TRuJV1f835c3
	diGMhwrwBnih0S8iIpo7u0wCVmkN4XygOSyTKJNP7ofQOgkVDRLWzvk1Q3+DOpnoyVYWj8NlUW5gM
	Ys+L4CkV7/zGohD5es6nLDOePpdjfG1IowmfwmbAaRBhV56Fofva++r3xQTmtNw9d1ZbOcRApmKhu
	5tBraJreoIIBx0r0pu0Yt1goLnHgfAeYFM0Vny0It8/kbD1Z/CxJeYZCnkeOJinC0SZGlx1K4ZWSP
	4JzaOouoGrLK+mTS8LrbksRf8N+mjL9hxZ9LHzIys7lYRZcyKaeQfozQdBRbEvGYCyhxz4P9rOOxx
	euGSHn/A==;
Received: from localhost ([::1]:40696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGrwG-001Uo2-MI; Sat, 05 Oct 2019 21:50:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37722) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGrwB-001Unv-ND
 for samba-technical@lists.samba.org; Sat, 05 Oct 2019 21:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=h3prknZ+klYwef4I7JISuZcMw8dJfjybNrICBbMrE3o=; b=qrSwPpk5zs4MViGtxABpfbDrQo
 Xw5KANkEFZ7xJxvlO3/BEhbgh/n3bdxqtOylsOlTiZ2h8+Nmu6yOGG9/K+metiEPv9Fa7PI7LaiPo
 xdta9f15dRMDIKm4O7itNNoL9reXNvIJ/6iRDoUFNXh3ok38Akb09L08TdcTNe0Qas4w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGrwB-0001SF-6r
 for samba-technical@lists.samba.org; Sat, 05 Oct 2019 21:50:03 +0000
Subject: Re: How to turn on SMB3 POSIX extensions in Samba server?
To: samba-technical@lists.samba.org
References: <CADvhK2uJgKcNsxJwT4eGHV=4pH_qJZm0u_GkFMAwQ87vBsSpMw@mail.gmail.com>
 <20191005212851.GA8068@jeremy-acer>
Message-ID: <942a44f9-a3bf-f5ec-0444-04a65c3e6138@samba.org>
Date: Sat, 5 Oct 2019 22:49:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191005212851.GA8068@jeremy-acer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 05/10/2019 22:28, Jeremy Allison via samba-technical wrote:
> On Sat, Oct 05, 2019 at 11:02:21PM +0800, Chris Han via samba-technical wrote:
>> Hi, I want to use the SMB3 POSIX extensions in the latest Samba (with
>> SMB3.1.1, vers=3.1.1). By following the user manual, I have added the
>> "posix" mount option when mounting, but it shows the following error
>> messages.
>>
>> Error messages:
>> [xxxxx] CIFS VFS: Server does not support mounting with posix SMB3.11
>> extensions.
>> [xxxxx] CIFS VFS: cifs_mount failed w/return code = -95
>>
>> Mount option:
>> https://www.mankier.com/8/mount.cifs#posix%7Cunix%7Clinux
>> https://wiki.samba.org/index.php/SMB3-Linux
>>
>> Mount commands:
>> mount –t cifs -o username=<user>,vers=3.1.1,posix //<address>/share
>> /mnt/share
>> mount –t cifs -o username=<user>,vers=3.1.1,posix,mfsymlinks
>> //<address>/share /mnt/share
>>
>> Software and kernel version:
>> 1. Ubuntu 19.04, Kernel 5.0, Samba 4.10
>> 2. Ubuntu 18.04.3, Kernel 5.0, Samba 4.7
>>
>> Example of using the "vers=3.1.1,posix" mount option: (Page 46)
>> https://www.snia.org/sites/default/files/SDC/2018/presentations/SMB/Steve_French_SMB311.pdf
>>
>> How to turn on SMB3 POSIX extensions in Samba server?
> There is no officially released version of Samba that
> implements the SMB3 POSIX extensions yet. The code still
> lives in an experimental branch that hasn't yet been
> merged with mainline.
>
> The plan is to finish the VFS refactoring, which will
> bring the internals of Samba closer to the modern OpenGroup
> handle-based VFS interface, then merge the extensions code
> into mainline after that. The released code will be in
> the next supported Samba version after the VFS refactoring
> is done. Realistically, this will be sometime in 2020 unless
> someone else wants to help me with the code :-).
>
> Jeremy.
>
Hi Jeremy, I advised the OP over on the samba mailing that unix 
extensions for SMBv3 do not exist yet, but he seems to think that 
something similar should work with mount.cifs and the kernel.

Rowland




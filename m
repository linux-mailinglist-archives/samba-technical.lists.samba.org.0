Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3773C0D36B
	for <lists+samba-technical@lfdr.de>; Mon, 27 Oct 2025 12:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PJOO4AfyANZURNRp0pRyu9q8wMl4Gg6I4kzg/98CFbI=; b=QzR6sGsiAocddl8R0BKRfq7llP
	TlV0qgjRhPSfMLH1RnMsP3NM9tikCgrvH0h4CCb8j4WWshqK0v9Ke97WdIL4lyXNpelAaw2I5Iu5+
	wJaIXHX1LlCbPFNKT44+ukJiNFsySnac9PsQkI+Hv1nbupSthg1EBGqUYzgNZnjm9+hFpJI9yGa+N
	/iamlSgV4+IalSZqtlisbjQk20mv3pAS9MGlpM9DwEgmP2GVzr7GSTDAzn6XJ6nNKXyE5m/DjPZo3
	+RU9ul8QbEj7nBgfi7doF1pSrISGrOoK7AlBVJf6IqnnMocDMwcT5P32Y1gjqMLESdrhJlDF04ygP
	gpsQAe9A==;
Received: from ip6-localhost ([::1]:31646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vDLdy-008twh-Lg; Mon, 27 Oct 2025 11:44:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33206) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vDLdu-008twa-2U
 for samba-technical@lists.samba.org; Mon, 27 Oct 2025 11:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=PJOO4AfyANZURNRp0pRyu9q8wMl4Gg6I4kzg/98CFbI=; b=IbjXk5Mw65IxY1BbtR94uT2l2q
 hKpYKkralcZqjUtHl7P8ekQHQElqqZmkmqs8BmH4OecpD1/Ir+A75XmYlUkGxPUz3HJpbVCDV/hD7
 pTM3fhdWOfw+wuMd2QZzL6aRDA7HAE7e7zVtWNM2PnYfVTdOe6CEa4RQ7z5bWroAR6cNe+q/2PvQ9
 26gr3X5UWVXwVmFi8uceISIu9W4/cZ5ZvRMuSI9wIKG+LW5lopXrKaW17txUfHnr3UgAir+uG9Ab4
 FM40ODNkix5NXXFQIvO21aH8kFc5JdNPc0t9QIAIHCZoShCtl40ZKgMHE09NHlQgrrKICr2xZdhu2
 G/HNz1lK2ZppenwBJSvR9UoZclPgfyoQ/ZzcuXw3vHBhKNY1jmL79pfsKR7BRsNKZs/WKaZOoJb9/
 HnEYmB+2/+lXRxyxXyQeLBmFUGGH0POL7lRVma8JfJPgSD3ToW2wMS/QkE9TNK4wv2Fem2gjtj5A4
 facRcZeAHefmngsrVrfE4KYO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vDLdt-00BFWZ-0m; Mon, 27 Oct 2025 11:44:05 +0000
Message-ID: <fface8b7-9500-40c4-a4f4-c56b35179cd1@samba.org>
Date: Mon, 27 Oct 2025 12:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba 4.22++ - RENAME_NOREPLACE w/o fallback?
To: Heiner Lesaar <heiner.lesaar@googlemail.com>,
 samba-technical@lists.samba.org
References: <CAHCztZtZZGnEUS11oDhmSdZ1er-4sXEAtb6mb+hcBYPXn4X0Dg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHCztZtZZGnEUS11oDhmSdZ1er-4sXEAtb6mb+hcBYPXn4X0Dg@mail.gmail.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Heiner,

> we noticed after upgrading from Samba 4.20 to 4.22.3 (and later), that
> directory creation on MacOS causes a weird folder creation "loop" when
> creating a new folder in MacOS Finder. Finder basically forever keeps
> creating new directories.
> 
> This is only when the underlying filesystem is BeeGFS, a parallel
> filesystem which does not support RENAME_NOREPLACE.
> 
> My question: Is there a mechanism to tell Samba to revert to previous
> behaviour of not using RENAME_NOREPLACE if the underlying filesystem does
> not support it?
> 
> I´ll copy their analysis here, running strace on the smbd process:
> 
> The problem seems to be at the end of this folder creation sequence:
> 
> 268306 10:18:32.645081 mkdirat(27,
> ".::TMPNAME:D:268306%13947819943702811000:untitled folder 3", 0775) = 0
> <0.000574>
> 268306 10:18:32.645728 openat(27,
> ".::TMPNAME:D:268306%13947819943702811000:untitled folder 3",
> O_RDONLY|O_NOFOLLOW|O_PATH|O_DIRECTORY) = 31 <0.000026>
> 268306 10:18:32.645805 fstat(31, {st_mode=S_IFDIR|S_ISGID|0775, st_size=0,
> ...}) = 0 <0.000034>
> 268306 10:18:32.645899 fstat(31, {st_mode=S_IFDIR|S_ISGID|0775, st_size=0,
> ...}) = 0 <0.000022>
> 268306 10:18:32.645974 getxattr("/proc/self/fd/31",
> "system.posix_acl_access", 0x7ffe67cad620, 132) = -1 EOPNOTSUPP (Operation
> not supported) <0.000038>
> 268306 10:18:32.646082 setxattr("/proc/self/fd/31", "user.DOSATTRIB",
> "\0\0\5\0\5\0\0\0\21\0\0\0\20\0\0\0\0\274(w\2769\334\1", 24, 0) = 0
> <0.000199>
> 268306 10:18:32.646423 renameat2(27,
> ".::TMPNAME:D:268306%13947819943702811000:untitled folder 3", 27, "untitled
> folder 3", RENAME_NOREPLACE) = -1 EINVAL (Invalid argument) <0.000167>
> 268306 10:18:32.646656 mkdirat(27, "untitled folder 3", 000) = 0 <0.000637>
> 268306 10:18:32.647406 renameat(27,
> ".::TMPNAME:D:268306%13947819943702811000:untitled folder 3", 27, "untitled
> folder 3") = -1 EEXIST (File exists) <0.000211>
> 
> Samba prepares the new directory in a temporary location that is probably
> hidden from the user to make the actual directory creation look atomic by
> renaming the temporary directory to the actual one in the end.
> There is an error with that renameat() which fails with EINVAL because
> RENAME_NOREPLACE is not supported in BeeGFS. This error is not communicated
> to the SMB client though.


You can use "vfs mkdir use tmp name = no".

I hope that helps!

metze


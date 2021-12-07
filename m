Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6216A46C859
	for <lists+samba-technical@lfdr.de>; Wed,  8 Dec 2021 00:43:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=P+cQM7QBEBe+wOXlOOUAAm4La+DvcvRf8HnlPD0GWD4=; b=lMj68+3gunneVqxd3aSVGn9/wd
	P9YcFbQL25z//3w20vLX1F7FAwbHCJeMbxqFUa0z0OW3iUcDSLFEUfGzFEJUvUY5tr/FVX/98YoWt
	uI8IPGxKC+MTI4HiK+F722zqPNN8JWHuXShdoubUK2R3V0Mwiy/j52GsAfr3FRunCTFD7bv4EPHpa
	G4uEZhvcS2xDnef3lxyalPcJUPm4CKAYGuTB487Nz8xlMV+Pd82PTAzLEI/yagXowpZKpP+1BoW+x
	PAyQK6WS8GBisO2zuikx/V7GbLYmF7Q/KGEULT8ZxIJu+j6VMRXuIFaXEe1g7+1ozZmJgcVI6Q6b1
	U13UIO8w==;
Received: from ip6-localhost ([::1]:32868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1muk6w-003xwW-Jw; Tue, 07 Dec 2021 23:43:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54310) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1muk6r-003xwN-8G
 for samba-technical@lists.samba.org; Tue, 07 Dec 2021 23:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=P+cQM7QBEBe+wOXlOOUAAm4La+DvcvRf8HnlPD0GWD4=; b=Up2u3VJZTOP4aSJelOKXs8QpLE
 vizqdUIJjZAWVBVJWubnqkUi/UQ9sAxGx1p7qKyVfh3AesOIhtM67rXA4C3iSNcCyCvCN+QPscfMU
 zGPhU+dIT53F9HPHucLBkJ47ZpxY0327kD+IPF1sSVNqXJiX+90NUmP5dqJamZCB9S90dIqpHQK4/
 mp6KEaXqztg/d0nVZAix6BEqVZuQam5Fs0ZZLum91OJ8DbnwU97eHQZVzPCTze+OZl0HFeLnkL1gB
 AgEtnSOt69xCpX23AToRG9Z4CJFRj3Eyg6tHRG4bXgY7Tfrz0xjHW9BzpkVoUUOZKBKznVS4atE9e
 J4tjCyuypyXhr8gstmtqE5ruLVEQUkRTlmJPKdyRhnZJqilq2JugVo3O4A/H0OmI8APpRDkDBcbsq
 rmbdhG+PDyuItCxyVLnIZx140vwmkvENRHgfQ4iCgZCppZuZvOmDsIZfWQe25xbPelP1Tc2JAcZkf
 q93tp7DyS2rdhxVnbyfwP1sf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1muk6n-001f5W-Gc; Tue, 07 Dec 2021 23:42:53 +0000
Date: Tue, 7 Dec 2021 15:42:50 -0800
To: Steven Engelhardt <steven.engelhardt@relativity.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Message-ID: <Ya/xevFuEmiugek+@jeremy-acer>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Dec 07, 2021 at 11:18:40PM +0000, Steven Engelhardt via samba-technical wrote:
>Samba Team,
>
>While trying to roll out recent versions of Samba, we believe we have discovered a bug in Samba related to SMB file id generation which can lead to Windows SMB clients to observe wrong data.
>
>Samba version 4.11.1 changed how it generates SMB file ids to be instantiation time-based. This change introduced a bug in that it made it possible for two different files on the same volume to have the same file id, in volation of the SMB spec.  This appears to lead to cache poisoning in the Windows SMB client-side cache, in which two different files share a common cache key, which can cause Windows SMB clients to observe wrong data (e.g. the length of a file is reported incorrectly).
>
>We first noticed this with a C# client program on Windows which created 10,000 files in parallel, each of a different file size (e.g. the first file has size 1 byte, the second has size 2 bytes, etc.), and then checked the file sizes of each of the files one-by-one using Directory.EnumerateFiles() and FileInfo.Length, noting any time that a file does not have the correct expected size.
>
>This bug is particularly easy to trigger on Ubuntu 18.04 in WSL2 on Windows 10, as it appears to have an effective itime clock resolution (based on observing returned st_ctime and st_mtime from `stat(2)` system calls) of 10ms.  In other words, if you can create two files on a WSL2 machine within 10ms of each other, its exceptionally likely that they will be assigned the same itime and hence have the same SMB file id.  However, we have also observed this bug in the wild on Ubuntu 16.04 VMs and Ubuntu 18.04 VMs running in Azure.  Obviously, the better resolution of the clock from stat(2), the less likely this bug is to trigger.
>
>We tested a number of different Samba versions and observed the following:
>| Samba Version | Date Tested | Status |
>| ------------- | ----------- | ------ |
>| 4.10.18       | 2021-11-26  | Good   |
>| 4.11.0        | 2021-11-26  | Good   |
>| 4.11.1        | 2021-11-26  | Bad    |
>| 4.11.3        | 2021-11-26  | Bad    |
>| 4.11.7        | 2021-11-26  | Bad    |
>| 4.11.17       | 2021-11-26  | Bad    |
>| 4.13.10       | 2021-11-26  | Bad    |
>| 4.13.11       | 2021-11-26  | Bad    |
>| 4.13.14       | 2021-11-26  | Bad    |
>| 4.14.10       | 2021-11-26  | Bad    |
>| 4.15.2        | 2021-11-26  | Bad    |
>
>Using git bisect, we traced the bug to the commit 459acf2728aa0c3bc935227998cdc59ead5a2e7c.
>
>We can also deliberately trigger the bug by creating multiple files in a directory with identical itimes by manually setting the user.DOSATTRIB xattr, and observe that these files are served with duplicate SMB file_ids, in violation of the SMB protocol.
>
>We wrote a simple patch to temporarily remove itime-based file id generation which has resolved this bug for us:
>
>diff --color -Naur samba-4.13.11.orig/source3/modules/vfs_default.c samba-4.13.11/source3/modules/vfs_default.c
>--- samba-4.13.11.orig/source3/modules/vfs_default.c	2021-08-09 02:20:55.000000000 -0500
>+++ samba-4.13.11/source3/modules/vfs_default.c	2021-11-30 15:40:00.089302200 -0600
>@@ -3003,10 +3003,6 @@
> {
> 	uint64_t file_id;
>
>-	if (!(psbuf->st_ex_iflags & ST_EX_IFLAG_CALCULATED_FILE_ID)) {
>-		return psbuf->st_ex_file_id;
>-	}
>-
> 	if (handle->conn->base_share_dev == psbuf->st_ex_dev) {
> 		return (uint64_t)psbuf->st_ex_ino;
> 	}
>
>We would appreciate any guidance on the correct long-term resolution of this issue.

Thanks Steven,

I created https://bugzilla.samba.org/show_bug.cgi?id=14928
and assigned it to Ralph as he created 459acf2728aa0c3bc935227998cdc59ead5a2e7c.

Unfortunately I reviewed that change, so I'm also responsible :-(.

If you create a Samba bugzilla account you can add yourself
to the bug to follow along.

Could you share any test code/scripts you have for this
so we can ensure we have a good regression test for this
when we fix it ?

The code you have for:

"deliberately trigger the bug by creating multiple files in a
directory with identical itimes by manually setting the user.DOSATTRIB
xattr, and observe that these files are served with duplicate SMB file_ids,
in violation of the SMB protocol."

would be really useful in creating a regression test for this !

Thanks,

Jeremy.
>


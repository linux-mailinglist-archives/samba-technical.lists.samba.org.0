Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B971F11E007
	for <lists+samba-technical@lfdr.de>; Fri, 13 Dec 2019 09:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Bb3GDU+1K6FSgfxU9SPcA0kFFPiLNdSiB0fjbtWkNJk=; b=yzYRndni8yYkmBjcIr2Aka/QaX
	VFOetNsBsZnHKKtnfE0bsa5nMq1eTxTsdpv1fF98PGazChS2IedM6q5WeKeD183YtzjUFdfbEefos
	B5wtgZH4URIFZOSE53RMyke1558FIQNnzEsQeVv83vTsWHQqMsvO0EAnz9OLIODmD+mMf7T+GL3jn
	At9y8i1zspVFyvaqgZIWiG7mwXm6jgsN7RhbHUHsG4ksVBbTSwUMJ1V6D3Slgw+dxy7wTbOziQZ8a
	Cup2jFTZD9iNi2SqFri0P/QYayf2LdRkmWKgbvB4ikTOKilzmPsc8YozPs4GyZdBSW7tKua/c+QTc
	W4ETU/cw==;
Received: from localhost ([::1]:44554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ifgmi-0078io-0H; Fri, 13 Dec 2019 08:58:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54850) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifgmc-0078ih-Cs
 for samba-technical@lists.samba.org; Fri, 13 Dec 2019 08:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=Bb3GDU+1K6FSgfxU9SPcA0kFFPiLNdSiB0fjbtWkNJk=; b=LoqUjELR11rtWNfeFqXKaTJbgz
 Q/frLnPVvVzxU0d6hmUr293hYAVY12HNmSjkIWJvpqlYQmmV5xUmDyzcJZljPoQOIUbJAD2G6SYkC
 amrMl52uoJ7fZGoVIuFU8epsMZ6dI5AHt44IoUrFsZUyKN8radX6tewOuOlsV+AY7XwlMpgUnr16X
 ojUXzE6E+pvh1zuZcR7fpDhArEurwz2LUwubBaxIs240gGYdFvY5uQJXsObPQetODmJWFu5ckuxEW
 9xeRber4B7BqBHYwLPXNCcL4kUQnJLppPOiMI80qryB2Q0Omtr8cN4cAI86U+iATF99Cm6ab6NF6y
 culsRNyPNiEsbll7VeHFg91Kl2xU0oYdXOSj0eafiwCIR+6D98p8xczqksjXDYF/m9Q1vZQTAPYUd
 tBD+FOHV8M8BYs9kHskX6nMHwR2OAJQBVlcImz0XMMnMlAbkLWqr9NA7RLDluNSkYBsM9bmBTeLmD
 mPxp1Eh8YQg4w5beQJ8xWFJP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifgmb-00018n-T3; Fri, 13 Dec 2019 08:58:46 +0000
Subject: Re: parse_dos_attribute_blob() inconsistent file_id through
 make_file_id_from_itime()
To: Krasimir Ganchev <ganchev@fixity.net>
References: <BYAPR08MB4872E120915FF5A02939D29CC8550@BYAPR08MB4872.namprd08.prod.outlook.com>
Message-ID: <117698c8-f1a1-5c0d-8fa5-8a0afb4745b1@samba.org>
Date: Fri, 13 Dec 2019 09:58:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <BYAPR08MB4872E120915FF5A02939D29CC8550@BYAPR08MB4872.namprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 12/12/19 um 11:26 PM schrieb Krasimir Ganchev via samba-technical:
> I have recently experienced some strange behavior while browsing folders with clients that respect SMB fileid e.g. most recent Windows 10, Windows 2019 Server, MacOS Catalina. On folders with multiple image files, on Windows there would be repeated thumbnails among files and on MacOS thumbnails for certain files would not be showed at all. This behavior could not be reproduced with older version of the mentioned OSes without fileid support in the SMB implementation.
> 
> Tracking down the issue I noticed that copying files with multiple threads will often produce the same change timestamp for different batches of files even though we have granularity information from the underlying file system (e.g. we have proper nsec information).
> 
> This is an issue because parse_dos_attribute_blob() is presented the same fileid for different files through make_file_id_from_itime(). The same method of getting fileid is also used in open_file_ntcreate().
> 
> Looking at make_file_id_from_itime() I noticed that when ST_EX_IFLAG_CALCULATED_ITIME flag is unset this will return a fileid based of the invented time only which in the aforementioned case is producing the same fileid for files that have the same change timestamp in the underlying fs.
> 
> Based on MS-SMB specification fileid must be unique for a file on a given object store and must persist for the lifetime of the file. It also should not be changed when a file is renamed.
> 
> I am about to open a bug report and I would like to suggest a patch, but for the sakes of implementing the patch in a proper way I would like to ask if there is a particular reason why fileid is based only on itime in make_file_id_from_itime() when ST_EX_IFLAG_CALCULATED_ITIME is unset?

this is a recent Samba change to overcome the problematic use of inode
numbers for the file-ids. The assumption was that with nsec filesystem
timestamp granularity, the itime, which stands for invented time and is
basically an immutable birthtime, will alway be unique.

Can you share a network trace of a minimal reproducer?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


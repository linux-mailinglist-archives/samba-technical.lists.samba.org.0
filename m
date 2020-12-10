Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A02D4F90
	for <lists+samba-technical@lfdr.de>; Thu, 10 Dec 2020 01:38:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=x32/kRrR97eqn1YknRNWgEKjWzRIHshXaYiLycAifN4=; b=WqA5XT+xSCnAYDKQAw/6cZrsJx
	Xnk3Pi3gK8jTAWTEARs56fUFzcffmQgm0I+NMXyZzs7EnU+FNmPvtFjo2h+7so70mg0CD4E1cobbH
	XcZfNDXMTjN6VLs0JgEyzl/g0WTJ2QLI3Pzm+RX3coU1SZRAXAdGVVL2mFWrFlb2zuIWvhWNWGIbC
	iUs/PZMr2PwkkB81KHpIlKXfhafO0iK1FjH5L3hNB7G0YSK2+7VugdX7kEATcgnOL1MF70n4BgFiy
	5ddWQF5ieDTjk6gPn24qh3Sb+NSYcJXPL+UIfiHJ2oYsbCcS2aHIfPrEWqmRb+UKhk1OCF9JFFqr7
	qaqfmb7A==;
Received: from ip6-localhost ([::1]:27370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kn9yC-000MRx-Ke; Thu, 10 Dec 2020 00:38:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17222) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kn9y8-000MRq-I8
 for samba-technical@lists.samba.org; Thu, 10 Dec 2020 00:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=x32/kRrR97eqn1YknRNWgEKjWzRIHshXaYiLycAifN4=; b=FPxQxcLklsYAa2y9q4JUQow5st
 b3rRQIgL+VBxxkOpEQGWy292S/36OYJhlnBtQ/tFc3ir5K/EnTqWjukzHSReKKwJsKf10MdQrDVRd
 Rd3wXq/W0CcEwwck+kdI/F29V1ntjY9jLMMldsOH4otTBaiBn/DfRmHu8aZ1HmtccVBm4IUqsj3Jl
 B2g5XUuRq+aG1zXJnZG8Yd3iPNC6H9Z89AkP3E3xMXBzpTAINYqgQiWvoY5TFXMZbq5j508rBVP3y
 l4izPmCIk4YJh668ZX03YyEID9BajAZ0aiF+jeUDrFiZ8qO0ER5TpstarumeaxVIy2Qc/ObGGrsdw
 bUL33HjoEcrnZjcsPQz5Ja1LyB/JOG5e+PnMDtBu0aZyzgG4MblL2erWl6RcdhyW6u1DLZpeJDBQG
 vsYxyw3C+gBEmZ7TR61OeMNyTHE4Kw08U85GdRNel2gvGh4A9OSpPbstAR+hiNPVjR5Fi3z306a2U
 jP5+JcwfCW6dzMubukILy/Lz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kn9y4-00054V-8D; Thu, 10 Dec 2020 00:38:00 +0000
Date: Wed, 9 Dec 2020 16:37:57 -0800
To: Joseph <j@gget.it>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-ID: <20201210003757.GA2150508@jeremy-acer>
References: <CGME20201208011550epcas1p26cebc8a4d2812fca862990739a059d43@epcas1p2.samsung.com>
 <007f01d6ccff$aad6f7f0$0084e7d0$@samsung.com>
 <008101d6cd05$0faa5500$2efeff00$@samsung.com>
 <CACyXjPwvNSfw9PLtUBxQQF4ysedpOE_TriTuX-JajRmFAHhQMQ@mail.gmail.com>
 <008201d6cd10$d5187910$7f496b30$@samsung.com>
 <20201208042132.GB1875689@jeremy-acer>
 <fc04e216-71c8-4efa-b34e-f118ea12f67e@mtasv.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fc04e216-71c8-4efa-b34e-f118ea12f67e@mtasv.net>
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
Cc: Namjae Jeon <namjae.jeon@samsung.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Dec 09, 2020 at 08:50:49AM -0500, Joseph via samba-technical wrote:
>> FileEndOfFileInformation == ftruncate();
>> FileAllocationInformation == fallocate(.., FALLOC_FL_KEEP_SIZE, offset,
>len)
>
>Jeremy, by ftruncate() do you mean "immediate writing of null bytes"?

No, ftruncate sets the length (EOF) of the file.

Whether it fills the intermediate areas with zero
bytes is a driver/filesystem dependent issue.

If it sets the length greater than the current file
then the POSIX requirement is that when an application
reads between the old EOF and the new (extended) EOF
then zero bytes must be returned.

Whether they are stored on disk or the file is marked
sparse and they are added on read is filesystem dependent.

Samba doesn't know or care about the filesystem layout
(not strictly true for some advanced filesystems, but
in general this is the case).

>I've analyzed syscall logs to see how some programs on Windows do, which
>1) create a file on exFAT partition
>2) immediately set 1 GB file size *without* any delay; it's instantaneously
>reported as 1GB in the Explorer; also, there is no 1GB null-bytes writing

So the Windows driver is setting EOF without writing
zeros.

>3) then write the actual file content
>It goes like this:
>t=0.000s: CreateFile
>t=0.000s: SetFileInformationByHandle with FILE_END_OF_FILE_INFO,
>EndOfFile=1073741824
>t=0.000s: SetFileInformationByHandle
>with FILE_ALLOCATION_INFO, AllocationSize=1073741824
>t=0.001s WriteFile     (here the real data writing begins)
>...
>t~44sec  WriteFile   (last block written)
>
>So this confirms that, with the Windows native exFAT driver, neither
>"FileEndOfFileInformation" nor "FileAllocationInformation" triggers an
>immediate truncate() or writing of null bytes for an opened file handle.
>This "writing of null bytes" only happens when the file is closed for the
>"remaining unwritten blocks", that's the trick. Example:
>    CreateFile, SetEndOfFileInfo+SetAllocationInfo 1GB, Close  => then 1GB
>of null bytes written
>    CreateFile, SetEndOfFileInfo+SetAllocationInfo 1GB, Write 100MB, Close
>=> then only 900 MB of null bytes written
>    CreateFile, SetEndOfFileInfo+SetAllocationInfo 1GB, Write 500MB, Close
>=> then only 500 MB of null bytes written
>    CreateFile, SetEndOfFileInfo+SetAllocationInfo 1GB, Write 1000MB,
>Close  => then 0 MB of null bytes written ! <-----
>
>Namjae, do you think this should be done directly at the Linux exFAT driver
>layer?

This has to be done in the exFAT driver code. Samba as a userspace
program can't know if setting EOF writes out zero bytes or merely
sets an sparse extent. Reading just returns zero bytes for us
whichever the filesystem driver choses.

>I'm not sure if the modification should be at the Linux exFAT driver layer,
>or in Samba?
>
>If the latter, in Samba, would it be possible to avoid that
>SetFileEndOfFileInformation == ftruncate()  == immediate writing of null
>bytes?

The only way to do that is as I said to have a customer VFS
module that lies to the upper layers about file length. This
is a somewhat complex bit of code as it has to catch and lie
to the smbd code for all possible accesses of the filename/handle
for all stat() calls.

>TL;DR: with Windows' native exFAT driver, SetAllocation+SetEndOfFileInfo
>does not write any null bytes now, if the file handle is still open. It
>will only write null bytes, on file close, on the *remaining* space that
>has not been written before. If all the preallocated blocks are already
>written, there is no null-bytes writing.

That's a driver decision.


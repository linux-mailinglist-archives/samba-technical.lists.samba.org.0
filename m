Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB61C1D81
	for <lists+samba-technical@lfdr.de>; Fri,  1 May 2020 21:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RK6ijGZlCJhM+ylBFp432X06tjUf+CmYdvi4Lerj30E=; b=5HfX3qw7nrf04/A/GTDV64YCFI
	pilc10z30Ls9EcUprkLoDixM4SQ8N5QDH7NLLuIKHLmODZdDvZfVsnirUFsesF3wmuJ7mDHz+l1q6
	o4VGqi7UA7AuM1a9jTK3ToSt6CNnpI0FsEHva/TO/zBi5Qf440prYXouHxyjgatrKQHiNzPsJhYlc
	XiU6FQQERWma8OZxVIag8vbnMTpVfvJTsm3ztgXvT5OXUNzZ8mwOgIUBB+bsKbV0otYU+fVGxYvCQ
	YuR7v7tJ0Cs5H5VVmmhu6i6zTyFIrZwl+oLH3r9I9hZ8c96DIaRew5C7ePsvn7f+HXvYjVT+ytqlv
	q3hqwaBQ==;
Received: from localhost ([::1]:25892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jUauN-002DtN-Cx; Fri, 01 May 2020 19:01:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44836) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUauG-002DtG-Jz
 for samba-technical@lists.samba.org; Fri, 01 May 2020 19:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=RK6ijGZlCJhM+ylBFp432X06tjUf+CmYdvi4Lerj30E=; b=dSskMFjbQdPeseOeLXfP3yASNn
 EZwjFdRFp33nAnoTXbVs563Byf0rATdXlHp5+Rx8M5ukhg1GbXv+kug1e9l3oMNmLEyWLrN77ec4F
 VwMoUKmTQS7cwL7/7ia2jXpOCHIb+VlCXb90hvm/PORI7KzzG7qCMAEi3WxBq06fr2d3q5dXLHLPE
 SRd8gZP1H/OikgqT9W1xgpvJ96dXxcQs/TOUcUYDf4k0UMmtWJDAfPelDjs47RhaFSp2xhY9GHWrF
 pO1Vph5OnIx/iFrJHmXmHfUdTnv8Fbtm9Jmu5T5WT6agumcim6NVRvuwtDkmzo8H5Ji0vMzXyzw8y
 9ahgP2qY8nNnlxYKED/1T8t2RWYOUG2IyxiUqoZn+Hi5y5roUGIUy8X0fZO3mqVitjf9N3LrH3kgM
 mcGYV1mEGp48iYUMCm0NYrc+5KIivBh/rByr/QIAlf2tELH5500DVL/COXL4FS0KakjDVzStMRqSv
 +ym3LqGHrfd2MkYat/lNPqiJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUauF-0003zi-IQ; Fri, 01 May 2020 19:01:03 +0000
Date: Fri, 1 May 2020 12:00:57 -0700
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Subject: Re: [EXTERNAL] Re: Windows 10 client opens a folder as a file and
 asks for SMB2 GetInfo SMB2_FILE_STREAM_INFO
Message-ID: <20200501190057.GF29166@jeremy-acer>
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501175828.GC29166@jeremy-acer>
 <20200501180218.GD29166@jeremy-acer>
 <BN7PR07MB44024B8600FDF859C55E405FCFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN7PR07MB44024B8600FDF859C55E405FCFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 01, 2020 at 06:30:48PM +0000, Ashok Ramakrishnan wrote:
> Thanks Jeremy for the tip. Our customer is able to reproduce this readily. So, I can try potential patches. One interesting observation I have since you pointed out the Reparse Point bit... The previous getinfo command was file network open info. And we (samba) responding with this for the folder...
> 
> SMB2_FILE_NETWORK_OPEN_INFO
>     Created: Nov  6, 2015 20:22:26.658586900 Eastern Standard Time
>     Last Access: Nov  6, 2015 20:22:26.659295100 Eastern Standard Time
>     Last Write: Nov  6, 2015 20:22:36.530589900 Eastern Standard Time
>     Change: Nov  6, 2015 20:22:36.530589900 Eastern Standard Time
>     Allocation Size: 0
>     End Of File: 0
>     File Attributes: 0x00000010
>         .... .... .... .... .... .... .... ...0 = Read Only: NOT read only
>         .... .... .... .... .... .... .... ..0. = Hidden: NOT hidden
>         .... .... .... .... .... .... .... .0.. = System: NOT a system file/dir
>         .... .... .... .... .... .... .... 0... = Volume ID: NOT a volume ID
>         .... .... .... .... .... .... ...1 .... = Directory: DIRECTORY
>         .... .... .... .... .... .... ..0. .... = Archive: Has NOT been modified since last archive
>         .... .... .... .... .... .... .0.. .... = Device: NOT a device
>         .... .... .... .... .... .... 0... .... = Normal: Has some attribute set
>         .... .... .... .... .... ...0 .... .... = Temporary: NOT a temporary file
>         .... .... .... .... .... ..0. .... .... = Sparse: NOT a sparse file
>         .... .... .... .... .... .0.. .... .... = Reparse Point: Does NOT have an associated reparse point
>         .... .... .... .... .... 0... .... .... = Compressed: Uncompressed
>         .... .... .... .... ...0 .... .... .... = Offline: Online
>         .... .... .... .... ..0. .... .... .... = Content Indexed: NOT content indexed
>         .... .... .... .... .0.. .... .... .... = Encrypted: This is NOT an encrypted file
>     Reserved: 00000000
> 
> We specifically said that it IS a Directory and NOT a reparse point. But the client still decided to send us a 0x00200020 in the subsequent open of the file. I can play with the response and see if I can get the client to behave differently...

Yeah, I just checked with test code against Windows10
and the server just ignores a request to open a reparse
point if the object is just a regular file/directory.

So this may be a red herring. Would be interesting
to see a trace of this application at the same point
against a Windows server.


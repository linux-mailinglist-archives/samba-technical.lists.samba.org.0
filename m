Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515A1F99E
	for <lists+samba-technical@lfdr.de>; Wed, 15 May 2019 19:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=nsu3xpkGEt3bf/QsYEiMfczVK4oqzNfTHO4dgOs5758=; b=RvlxLHl7MfIV6t5A03l+a+kuJB
	YoHupw14W50ZVJVaH7gbPpYKscpUWJU1bY6kIRmmUHYyOBAeCEr+kDNBd1m3fHli572P0G+b42fk5
	rDt54Vq70tNMQeo1ojjBAcNKM5QwGnRQM5J3hTa04kK473eOAsHMnWDlXMI/XKGRRBaQOXdogtZ2W
	XSpQ2P/Bvn6osXspcjqUT23zOt1S6PMw8jg9/euDCZDoyjIxz5yLmWhm7cvcQDoy6I7JLhdzwG/h+
	c5h1UqO2lwk080POIdQeiTowW+K3qTe7zcJo1HAaLwOhRT+nqrqN4Igp3uCU/EbO8eKU+E/MjMrwl
	qBUo/ayQ==;
Received: from localhost ([::1]:64334 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQy4r-003pEl-Hf; Wed, 15 May 2019 17:52:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:24750) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQy4n-003pEe-8v
 for samba-technical@lists.samba.org; Wed, 15 May 2019 17:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=nsu3xpkGEt3bf/QsYEiMfczVK4oqzNfTHO4dgOs5758=; b=PCxBSF2Byid343XBrLdH5n3X5I
 5M5k+pJao+eimsh6S5v1bHrXUqb8rsMluOurTlrzG8GhoFOXk98VVcq22Xq2kPu6BR+mEKiXCflHo
 xUaN+8U8mjjqT9MLaBeCuvyvPq+4MDA3RBvMv3V1EbzeBQ15c4O0NBsyBNAgSZSw/hFI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hQy4m-0004K3-8J; Wed, 15 May 2019 17:52:24 +0000
Date: Wed, 15 May 2019 10:52:21 -0700
To: Shyam Rathi <shyam.rathi@nutanix.com>
Subject: Re: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at
 multibyte boundary
Message-ID: <20190515175221.GB253468@jra4>
References: <B15C9E07-0E0B-49CD-BDD8-0CD236C4F777@nutanix.com>
 <C15B0D71-E5FD-4071-8FCC-E63EBFC3003E@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C15B0D71-E5FD-4071-8FCC-E63EBFC3003E@nutanix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Tue, May 14, 2019 at 06:26:07PM +0000, Shyam Rathi via samba-technical wrote:
> https://bugzilla.samba.org/show_bug.cgi?id=13947
> 
> 
> To reproduce, create a share with a name where 32nd byte is not the first byte of a mutlibyte character. Using CJK characters (3 bytes each) is a possible approach. For example, creating a share with name 에이에프에스삼점오생성 and trying to open a txt file in Notepad gives the following error:
> 
>   Invalid character. For multibyte character sets, only the leading byte is
>   included without the trailing byte. For Unicode character sets, include
>   the characters 0xFFFF and 0xFFFE.
> 
> Looking at wireshark capture, the following is seen as source of this issue:
> 
>   GetInfo Request FS_INFO/FileFsVolumeInformation File: Rathi9\???????????
>   GetInfo Response, Error: STATUS_ILLEGAL_CHARACTER
> 
> Proposed solution is to truncate the label name at the end of a multibyte character before the 32nd byte.
> 
> Please review and suggest changes, improvements and other approaches.
> 
> Regards,
> -Shyamsunder Rathi (mailto:shyam.rathi@nutanix.com)

Thanks - Shyamsunder, I'll try and get this reviewed asap !

Cheers,

	Jeremy.

> From: Shyam Rathi <shyam.rathi@nutanix.com>
> Date: Tuesday, May 14, 2019 at 10:52 AM
> To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
> Subject: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at multibyte boundary
> 
> For FS_VOLUME_INFO/FS_INFO operation, a maximum of 32 characters are
> sent back. However, since Samba chops off any share name with >32
> bytes at 32, it is possible that a multi-byte share name can get chopped
> off between a full character. This causes the string decoding for unicode
> failure which sends back NT_STATUS_ILLEGAL_CHARACTER (EILSEQ) to the client
> applications.
> 
> On Windows, Notepad doesn't like it, and refuses to open a file in this
> case and fails with the following error:
> 
>   Invalid character. For multibyte character sets, only the leading byte is
>   included without the trailing byte. For Unicode character sets, include
>   the characters 0xFFFF and 0xFFFE.
> 
> Proposed fix:
> - Find the last starting point of a multibyte codepoint if the character
>   at 32nd byte is a subsequent byte of a MB codepoint.
> 
> Reviewed-by: Hemanth Thummala <mailto:hemanth.thummala@nutanix.com>
> Signed-off-by: Shyamsunder Rathi <mailto:shyam.rathi@nutanix.com>
> 
> 
> Regards,
> 
> -Shyamsunder Rathi (mailto:shyam.rathi@nutanix.com)
> 
> 
> 




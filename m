Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB2CCCDD
	for <lists+samba-technical@lfdr.de>; Sat,  5 Oct 2019 23:30:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BofuRMyIyobXaWwsnGEsNyD3LeH809Nej/EPxrrZ37w=; b=gIsVKDwgn53t8kMbW2EV8lu5M4
	IAjLLkQBRglR35DuoF8YVb+PYwsSqyY+Ia2YCDGpZJ2lUyBUM6xVM2sUhorGvhUH1aE9PdjjXqo9L
	C+PnM450LmKJiiehadfquzy0rbQE/t9LIKHMzRhIVMhzkSABYLTc6A6Uk/dcmPh7SVq6IV3bOh+8k
	k7cXb0kF/JKOkodJTD/L2RN1aSQ/slaR1gXsbHkVag/BXFoN6nGB3cwJbNLB4LbNBHUAM2sdlmhiU
	Tle2HfZS0k6OjtD1mz8Na/6iNA4x27RhaUOEO23Sds6GL2pTzayBqz1nUbrXn/UQ5n/ibwaULROIH
	RJjzpawA==;
Received: from localhost ([::1]:39864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGrbq-001Ua0-OK; Sat, 05 Oct 2019 21:29:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32444) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGrbm-001UZr-77
 for samba-technical@lists.samba.org; Sat, 05 Oct 2019 21:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=BofuRMyIyobXaWwsnGEsNyD3LeH809Nej/EPxrrZ37w=; b=PYCuVcmuehtoHxvu+gt7K85+pR
 IkISMQNTHsWhFhvB1tDpYAPYUTaGRfAD4lpWm1914MdkndyRl6sW9X5xF5cvKV66mIEcT3SWcqXek
 TAgIox47VFvlLlnguusXdATcqyo6j6Hgo/ggQJs3s/7MrJSbBw30FgPKLl1yDnOYJ78M=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGrbk-0001LX-Cg; Sat, 05 Oct 2019 21:28:56 +0000
Date: Sat, 5 Oct 2019 14:28:51 -0700
To: Chris Han <chrishan308@gmail.com>
Subject: Re: How to turn on SMB3 POSIX extensions in Samba server?
Message-ID: <20191005212851.GA8068@jeremy-acer>
References: <CADvhK2uJgKcNsxJwT4eGHV=4pH_qJZm0u_GkFMAwQ87vBsSpMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvhK2uJgKcNsxJwT4eGHV=4pH_qJZm0u_GkFMAwQ87vBsSpMw@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Oct 05, 2019 at 11:02:21PM +0800, Chris Han via samba-technical wrote:
> Hi, I want to use the SMB3 POSIX extensions in the latest Samba (with
> SMB3.1.1, vers=3.1.1). By following the user manual, I have added the
> "posix" mount option when mounting, but it shows the following error
> messages.
> 
> Error messages:
> [xxxxx] CIFS VFS: Server does not support mounting with posix SMB3.11
> extensions.
> [xxxxx] CIFS VFS: cifs_mount failed w/return code = -95
> 
> Mount option:
> https://www.mankier.com/8/mount.cifs#posix%7Cunix%7Clinux
> https://wiki.samba.org/index.php/SMB3-Linux
> 
> Mount commands:
> mount –t cifs -o username=<user>,vers=3.1.1,posix //<address>/share
> /mnt/share
> mount –t cifs -o username=<user>,vers=3.1.1,posix,mfsymlinks
> //<address>/share /mnt/share
> 
> Software and kernel version:
> 1. Ubuntu 19.04, Kernel 5.0, Samba 4.10
> 2. Ubuntu 18.04.3, Kernel 5.0, Samba 4.7
> 
> Example of using the "vers=3.1.1,posix" mount option: (Page 46)
> https://www.snia.org/sites/default/files/SDC/2018/presentations/SMB/Steve_French_SMB311.pdf
> 
> How to turn on SMB3 POSIX extensions in Samba server?

There is no officially released version of Samba that
implements the SMB3 POSIX extensions yet. The code still
lives in an experimental branch that hasn't yet been
merged with mainline.

The plan is to finish the VFS refactoring, which will
bring the internals of Samba closer to the modern OpenGroup
handle-based VFS interface, then merge the extensions code
into mainline after that. The released code will be in
the next supported Samba version after the VFS refactoring
is done. Realistically, this will be sometime in 2020 unless
someone else wants to help me with the code :-).

Jeremy.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 265376E863
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jul 2019 18:04:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hQ7pqURBh344Vk73S4eSwekv2N2BgwsPz4jxQW7++j8=; b=KmsMhIJAT7/pwIIeBpNt6c2g9S
	UezI2lKA3VjroDIvxQX8RsBnMSbkCRyMzGBzeEjadupmT36V3peAU/AmwjwM0p45G8uRwgklixnwt
	0B9ULa4yRk46u/qT57My2MhkZTj4hXh6+e2/YJE2nubgq7nxpLJvtDbjSAMK5XaVDATkZYI2OpZg7
	7K5/aTIm7RHD+VLGjdQnegK1BsMkEvcWVZ4FWkRxenxTnz8zqLY7kRM3x4kALl6bZiw0w1H7ptIB6
	I2zI+MXNn9D60E9Eyy02Lui7C3ydUzSS3cbX5r3qGi9lCzsFgoAlpiwOaKfdtQ3KU3rGJ6JNXS6x6
	qpODmr6g==;
Received: from localhost ([::1]:24964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hoVLr-001BGg-5j; Fri, 19 Jul 2019 16:03:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25462) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoVLl-001BGF-V8; Fri, 19 Jul 2019 16:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=hQ7pqURBh344Vk73S4eSwekv2N2BgwsPz4jxQW7++j8=; b=gjG3U9qmnmDlRMjOpWkdY6PHVd
 1uK58QZc6Tu5ObBOn+TeZ1B6Sr4bjJGTBuf5jIjeTcBOFBsZZsjy8mNWZgYZy+HcAT/V0i9zjdepG
 7lcKCx8kOsfRC1VrrLVjqhb+m7MTBQz597JlT/1kQX4vFZjUdvrdYL2zKTBTifPbSMhg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoVLi-0003yU-0n; Fri, 19 Jul 2019 16:03:10 +0000
Date: Fri, 19 Jul 2019 09:02:54 -0700
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: Turning off SMB1 make slashdot and theregister !
Message-ID: <20190719160254.GA28960@jeremy-acer>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
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
Cc: samba@lists.samba.org,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jul 19, 2019 at 08:37:40PM +1000, ronnie sahlberg wrote:
> Good stuff.
> 
> Next step will be to delete the entire smb1 codebase for the next major version.

That's going to take a little while, there are still many major
vendors (small routers mostly) who depend on this. Still it'll
be easier to remove the server code than the client.

My idea is when the last line of SMB1 and previous protocol
code is removed from the server we rename the tree Samba5 :-).

Makes for a good marketing pitch anyway :-).

But first we have to finish the VFS modernization / rewrite
to move to the XXXXat() syscalls (now standardized in the
OpenGroup thank goodness :-) and merge in the SMB3+posix
extensions code.

This is a boatload of work. Engineers welcome to help :-).

Jeremy.


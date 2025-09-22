Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17752B91BED
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 16:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oXK1MJCQ4lMNwfpSbAHI98C6i/h6o7PhoBquE2wHadQ=; b=zU9CLsUE18auFfaXq4R7N3AEFg
	+Gqz2MYjSpLJpjAfouNNebFFCJ3l9KG3hw+eMQhL/nZ2VK8oFn3r92nXb4Q1Hm2c/nBCVRSrtKlU9
	676ryUQwZ8kEpEITvQcu6+7k21VBy3gnakRjtyScwlagNLz4Eu9QHCXMMfezXoh6IIn0CIWOpuCsD
	ewmWC8ON+ke3Oqux0znafbiVBvN+Wi3Zx8d+Z+D4+t6+YzP1DKzvzuhTBhbmenSUs+FjQKP6pAnMU
	rlpHOtt83E5Hic3QTFluvDIJAxGD6/ZnUd3QBOZQZO1XWws16XItDidoW9bYZz9/Hi28eksLl/C0N
	OFdp/g/A==;
Received: from ip6-localhost ([::1]:28392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0hcE-004Y4y-11; Mon, 22 Sep 2025 14:34:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38258) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0hcA-004Y4r-Cw
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 14:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=oXK1MJCQ4lMNwfpSbAHI98C6i/h6o7PhoBquE2wHadQ=; b=PnOPOspFbtcDsvf79i0E3TTBN6
 KnhTbEHqFFLIrWNvfj7xU2sueRFP8ctXU6eNw9dKNyhrUm0NAOnnO7HWv6uS53pkJAGErCO+OY9mU
 tRg133Pz48zpw93vwlj9MHox8zEOJBqW+qnA3UAMFteSs5riDg4J75/5vAq4xyHCQofH0GOMPdhTb
 rg5M5oENa8LgEDEa/14DLYo7hCMa1okdl+bct2FL1OzhQbUVv8msJWkyIh0pOZkIUlDH8iA735icW
 48crPVB0axmDVJ5mHa64GHbdAqeWl85I1FJmkvdgxx6gyuLPuEyCp4DYdHhqrc4R7S0o0tc30BM+b
 QShyBLIyNGquIlHjg+paiNdZ2cLxF1UHF1257ylmZjWGoZmsAWt032CqBGJyYAU+ZgAGmjANX35Zj
 r7grbg6WChS5Yf2F8vcZPLNuMbqYRKtKj6J0avDGR46UoFKNtM0+dCOwyqZNtATkfjEEjj+HngLdO
 5a6Rhei+dABWXlxRfZ+V/BU1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0hc8-005P8Y-3C; Mon, 22 Sep 2025 14:34:01 +0000
Date: Mon, 22 Sep 2025 07:33:58 -0700
To: David Howells <dhowells@redhat.com>
Subject: Re: How to cause a multipart SMB1 Trans2 PDU to occur
Message-ID: <aNFeVoo2r5yj2LQH@jeremy-HP-Z840-Workstation>
References: <aNCOOS9GArQyf6Kb@jeremy-HP-Z840-Workstation>
 <12788.1758471560@warthog.procyon.org.uk>
 <80395.1758522267@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <80395.1758522267@warthog.procyon.org.uk>
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
Cc: Steve French <sfrench@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 22, 2025 at 07:24:27AM +0100, David Howells via samba-technical wrote:
>Jeremy Allison <jra@samba.org> wrote:
>
>> Samba client code smb1cli_trans_format() will do this.
>>
>> You can get to this via:
>>
>> cli_trans_send() called by many functions inside source3/libsmb/clifile.c.
>>
>> You might have to tweak the sent state->param or state->data sizes
>> to cause it to generate the multipart SMB1trans2s call, but it's capable of
>> doing so.
>
>That's the client side, though, isn't it?  I was hoping to get the server to
>respond with a multipart Trans2 response.

Well that's what I thought you were asking for. You weren't exactly
clear.

Server is easier, you can just hack the max allowed value internally so
that the amount returned is bigger than the max allowed. That
should cause it to split into one SMBtrans2 reply followed by
multiple SMBtranss2..SMBtranss2 nreplies.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF34B1654
	for <lists+samba-technical@lfdr.de>; Thu, 10 Feb 2022 20:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NgxX3byAAdJ7/srT54ld0W/6fENoboLSDQwWBsXICsQ=; b=jd1xjuCrPGv2A1CKzKGX32Ze/v
	8XnVGUo329pJuqrzNXQkzPU4P2xY2Y30Ngvq6+2Ukmf5DwInf1ybU3iG8UQ74EwSfbst+djqkCfM1
	F14qF21Ktn0tkI4P9XFOhqangqJ1838Rz2Z6lovcvPMf219nuZzsDIFS6HoqNr8vU+WQNVZYMFe3J
	BmPfacpq3XJaJk9LTL2h0e2yufxMpjb4Zk5UAEGhHrFMwDAKsHQFmsaABSsTgGI2c30Y4kCbkjxhD
	DcyKIYggDITlkMqcwGexkis9fVeq8pa2xEB6sSCiQumJRg5PvgWLFWdUtaFZ+c2H1ffevGPbUpxIO
	PfytoPNQ==;
Received: from ip6-localhost ([::1]:65422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nIF9l-006OBC-R6; Thu, 10 Feb 2022 19:31:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48852) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nIF9f-006OB3-RN
 for samba-technical@lists.samba.org; Thu, 10 Feb 2022 19:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NgxX3byAAdJ7/srT54ld0W/6fENoboLSDQwWBsXICsQ=; b=3X5TBQin7MfSoQUobdBqK17h42
 ReZXy85zcSRRaaZuiiSeVzF3feQ/fy7TWB7M4/qTW9ebOG4Ls9TEOr9MYljJvg4+p8cS3YKVo/08o
 qhnfkVDy2eiqXrv772WZ+FISK6saRDIhn0NIKt4FTEPTY21pIm12x1DKWvXuIeaFdolMzzmHeO7jS
 TisgSFAaKtZnr52pEhjCSRFbZr44GzMcJ+BRZjNiqJ5Ls8L/33jwlcO0SoRssLP+2jI7DKJ0TRjqW
 FvP7MRohn03PX6mPjYiH467yHJyTLI2pjtgpOz087iU7tMfGCWKYLhB791o4dQKLbk5g/uHy5g35b
 L2YIlkb+bdB94byckOq/qkclSkm3givYRqxSkHv4r1SkFNe5v6Tbz6OkZj6nQ0pbgpXdSymtaa1h+
 wvKfLoTT04UnzWPLmtgePAK18ag/40RpTnhOvtXxSKV3j7DmSj0e+Chl8GgJlJ6LNQaqsJBFg2lEM
 U7nU1SZfN/cf9P5MWuShZ/2L;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nIF9e-0039Jz-Ri; Thu, 10 Feb 2022 19:30:59 +0000
Date: Thu, 10 Feb 2022 11:30:54 -0800
To: Andreas Schneider <asn@samba.org>
Subject: Re: Shell script indentation
Message-ID: <YgVn7pYRJJf+ZKpy@jeremy-acer>
References: <5431405.rdbgypaU67@krikkit>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5431405.rdbgypaU67@krikkit>
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

On Thu, Feb 10, 2022 at 08:27:30PM +0100, Andreas Schneider via samba-technical wrote:
>Hello,
>
>our shell scripts are a mess and we should try to fix this. So the first
>questions is what do we want to use for indentation.
>
>Most of the Samba scripts use 4 spaces.
>CTDB uses tabs (tabwidth: 8).
>
>We need to settle on one. Should we first collect arguments or directly start
>a vote?
>
>4 spaces or tabs (tw: 8)

Oh, so you want a religious war huh :-) :-) ? Personally,
I won't chose as I want to remain agnostic. The only thing
I'd like to do is to have a git-hook that will refuse to
push changes to scripts that don't match whatever is
decided upon so we maintain consistency.


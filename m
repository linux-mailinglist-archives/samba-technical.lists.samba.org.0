Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCD1178C78
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 09:18:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1Svd1KZPmntsmWRBa/qIKs3Dek1tiBSH5t7prJu/bCI=; b=A0m4t3rYVShxA+912KYHx0wufn
	z8z60wtyxbHgPk7LuaCROJS1Gn0yF89iNK9ox4lmHordhyzu5f5EdgPheYPTZE5EY6C2JQUykLsBU
	dAQImZJswy9qJ7s3G6V6NAYsAq+9zNYeotdkdFLEiJa6yEq3awmyf1GjmTW5EYH2rktgMD9S4mdKL
	wk+MHMnDyoCHnt8yLAIiIHdzKlmaWDJv8uZZIMQlhGm8kbnU+iN54qdv4fQjdYHEkDpcB/ib2UwCY
	FYszNcaof7QEDehoXbfKy6LqA/13zfBx+xW4+9rn7MnItEWRMgmgszo+0LtbSfYSZhJKgLkWi7Axd
	KHkbuVLA==;
Received: from localhost ([::1]:26332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9PEk-00EtAE-34; Wed, 04 Mar 2020 08:18:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64252) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9PEf-00EtA6-Mp
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 08:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=1Svd1KZPmntsmWRBa/qIKs3Dek1tiBSH5t7prJu/bCI=; b=uTTHFrOeaRpzu/EVGtWiK6iZgW
 aF2WRPX3x09ftS7pIGSIzFlThFYIdPIVqGp/7FEdJUDkS/4PwPEh+LCIBKAMP3m0eoyiJ9hg1IxaG
 dxpa0pkzD8YE6t8SwYipZYLoKgaZnqyBpcU0val8Svjfy0PPI2Ovpklzrvt1YhLIUaRjiBeZDJ9sH
 LaaFKo0Hq0yCxzR5penT6ntYMUgV69lJb00D5FZLrVGpTWGHvnyUIlRUYKWWDPjGZR2uxhoWCNzzW
 FTdvNyEDaKBFz6XQh9afLAGd5noN5am0QH1eBedEU53AkdgSGJGcqtT5AjdaAg2as89t+cbt7S+QN
 hZFvxVI3RnBIa7HW4aaBJ8Rdm8+asdcUck13RO1+Dv/fQugClNIYrblO+3XIPEp+yPOvyt6aOvCG/
 /Jr5MWLnzu0pfzQhViIF/nbGxLHIhmomAMXAzZC/0BAlIHWX0GgT/okLsH0PTCBz9In1fxR9mA0oM
 Y4lB2IzdXJ7WNG3dWlKSkGLg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9PEe-0005pd-FI; Wed, 04 Mar 2020 08:18:32 +0000
To: gary@samba.org, samba-technical@lists.samba.org
Subject: Re: Getting seeds into oss-fuzz
Date: Wed, 04 Mar 2020 09:18:31 +0100
Message-ID: <1687004.OyDMVEAEud@magrathea>
In-Reply-To: <49d4d99c814983f7f075a8d70c5030350bf30810.camel@samba.org>
References: <49d4d99c814983f7f075a8d70c5030350bf30810.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 27 February 2020 03:11:42 CET Andrew Bartlett via samba-technical 
wrote:
> G'Day Gary,
> 
> We discussed in person a long-delayed task for the fuzzing effort,
> which is to provide oss-fuzz with good seeds for each of our fuzz
> targets.  It would be awesome if you can slow-burn at this when you get
> some cycles.

Thank you for working on fuzzing, but I get a mail every two days from oss-
fuzz:

samba: Coverage build failure
Friendly reminder that the the build is still failing.


Maybe fix oss-fuzz first before extending it. I've sent a patch proposal 
earlier form a very quick look.


I can look into it again, but not before next week.



	Andreas



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




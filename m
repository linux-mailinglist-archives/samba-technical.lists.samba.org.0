Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B6D7EB0A5
	for <lists+samba-technical@lfdr.de>; Tue, 14 Nov 2023 14:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5g1XjnbegEHArtZ3ItMCIJS3T9svKb4Ql/sLaRhAXA4=; b=zb5wkmKGENYgUdKudYgey86PCB
	YHAJvIAL8tH5uoCE991VZ8MU4KqT66ZkPzCrBR3qnHx5+dDj8ZQdHbJG5nCvfkMA+TKdNXUMLfBBq
	T1umQMqoqa6eonLqpGIOen/4O4+HkT8cMUIasLakD6zWIBfidtkwEWdu7p6qzVQA1+zpOjKQRFbsf
	UkNBZ0iv8gEN7kwkhsWaYb0j+CQZvqBCKYvJnucEC+fDpnKxKKe6toZFNtSurOuE7u8MPxIxbMZ8H
	avzjgWaxgLdW86oQZZmDoh2qHvJoZIVD4+LOeWHdkBfl3Kpa7KydXz5sXLcyDEZSibQlj2xucgLF5
	Uy0kfdow==;
Received: from ip6-localhost ([::1]:50712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2tEP-008GJO-E6; Tue, 14 Nov 2023 13:13:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12150) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2tEK-008GJF-J0
 for samba-technical@lists.samba.org; Tue, 14 Nov 2023 13:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=5g1XjnbegEHArtZ3ItMCIJS3T9svKb4Ql/sLaRhAXA4=; b=Myktl9z5Q75zlSWTB9So+Hn0Zg
 0AUF8tb7tk4gK8t+nSQ2mg879nvBjsBQjQUtI9VHF6rFGZnAaprMEFEU1Hs7k2f3DDtL2SiN8BrVg
 72OO80T96aZZPI7hp9xlNHYFcqocU0WxNa4pHkbwFqVynhi8onXn+e0TDcRnNp/q7GoCWYGI4Wdci
 fFpo1QwzhCOWxfXYDEvhLF+4hyxtbmTihDvzKN3O4OjBpxEgrMiYyzjEqFsXz9SWxe8JsWXhhYayu
 zBslW65fF40KSEJ8vC6Z7Ji9uqlxhAH8coMgAx25xf2kf2oThHwfkDt1bZrtfSkNh9q0K93D0PtuM
 XMMNaPOuTlfvNTwFw7AW6toCowNYnDDuqxSTJgXAeaj+qI4Q/OvS0aURtEueNNn3XqJzIoJcrlBfP
 gvVbWbogwkmhaW6snOzpse+bmL3L4eOowEjbheQN3j4VyN9lhcQ7jtBZWhU2XbQb4bIbFNEJWdc6X
 J+B2OzG3YGmx6J1i/lte24Gi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2tEE-0067HJ-0h; Tue, 14 Nov 2023 13:13:18 +0000
To: Martin Schwenke <martin@meltin.net>, samba-technical@lists.samba.org
Subject: Re: Can we move Samba to C99 and past
 -Werror=declaration-after-statement ?
Date: Tue, 14 Nov 2023 14:13:17 +0100
Message-ID: <5741361.DvuYhMxLoT@magrathea>
In-Reply-To: <13413c0b-ea94-4cca-9ba8-c431df07517f@samba.org>
References: <72d8df3ab0c58d2edf7660ad2af79935cb0a48a1.camel@samba.org>
 <20231110091333.5afa2158@martins.ozlabs.org>
 <13413c0b-ea94-4cca-9ba8-c431df07517f@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 10 November 2023 10:44:23 CET Stefan Metzmacher via samba-technical 
wrote:
> Am 09.11.23 um 23:13 schrieb Martin Schwenke via samba-technical:
> > On Fri, 10 Nov 2023 10:58:04 +1300, Andrew Bartlett via samba-technical
> > 
> > <samba-technical@lists.samba.org> wrote:
> >> Samba chooses to, for it's C style guide, to enforce -
> >> Werror=declaration-after-statement
> >> 
> >> I understand that some prefer the style.
> >> 
> >> However C has moved on as a language, and libraries we use (Python 3.12
> >> in this case) don't compile with it, and we are having to do quite some
> >> contortions in
> >> https://gitlab.com/samba-team/samba/-/merge_requests/3373 to build on
> >> Fedora 39.
> >> 
> >> See also discussion at https://bugzilla.samba.org/show_bug.cgi?id=15513
> >> 
> >> Can we agree to just remove this requirement?
> >> 
> >> It will allow us to keep variables closer to their use, which is
> >> helpful in a lot of ways, particularly in longer functions.
> > 
> > I think that sounds good.  Yes from me.
> 
> I'd like to keep -Werror=declaration-after-statement as long as possible.
> 
> Variables appearing in the middle of a function, particularly in longer
> functions, are really confusing to me. Thinks like common cleanup via goto
> would not know of a variable exists yet...

I'm also in favor of having all the variable declarations in one place. We 
have LSP in the meantime and it is easy to figure out the type of variables.
 
> And every time I saw a patch with the use a declaration in the middle,
> I immediately thought this would lead to sloppy coding if we would allow
> that everywhere.

I just checked, at least clangd creates an error for this in neovim:

clang: Variable 'wurst' is used uninitialized whenever 'if' condition is true 
(fix available)

gcc didn't complain.

> > Can we also please declare for loop variable in the loop?
> 
> These would be very useful and I just checked they also work with
> /opt/IBM/xlC/16.1.0/bin/xlC on AIX.
> 
> metze


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




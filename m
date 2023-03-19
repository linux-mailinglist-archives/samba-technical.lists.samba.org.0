Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2155D6C0451
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 20:20:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=NbeIJh/pS3nPKIVrGxkYwRAvTKnQHgioQRN+v3NIO7g=; b=49mPCwIDGEtnJ27rKcjdPo3hc7
	8B8sygQSBrjhbPgihaTI2lhsEVLR8ILEJlcGZgQS2p6qvKQy0EU2c0Yly+Db7amkwhGd3iyzG2l49
	TdodZ/UJV89v3ZmRsVcr4dAIcYwGb/ODqVkbTHANWZKwm1OyJSpgBf+AAhg0cCrL2A3wGyQjjBR9V
	NCy5mRp2+olLPzm2DRiB6WfOsDl02XlIl7W4WXWXPeHQ/Eg3EIh1dW4dhdvaBUbAUxEBoQHBLyug6
	1J8buDE19C5KjilVnXZQrGLPUlDYkqNFGQyQD4fB/ej6XP/9VBznMIdC4BxjivZ0SmzmtzlmKO5EM
	lOjE0hJA==;
Received: from ip6-localhost ([::1]:43696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdyZV-003SI0-5Q; Sun, 19 Mar 2023 19:20:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43712) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdyZQ-003SHr-Sa
 for samba-technical@lists.samba.org; Sun, 19 Mar 2023 19:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NbeIJh/pS3nPKIVrGxkYwRAvTKnQHgioQRN+v3NIO7g=; b=wM4dP7VDmn/UDafvCUf4HA0VJQ
 /4FJmXhwv1PPnH3UuiiDUIqrASXKNDwYhNyO9DxAQN37bI5o2KdsGeqGpomjyy3J2yFlESZRXpKZP
 TzLEjkJiF2UfKN5DdNlAaxwzJ5zX1/47Cwudop6H3UXDnmNPf4+dpoaIpOQU4dRScEl8xqJhwI4XY
 VsqXeYehE7n+WT6Te/ZLi1MyHPuRDz1uxncngnCDl+yydhkA57kg0vPmyVTMEbhoha9YJ3hijeRLc
 OhPLm4B+9agAjz7oHx94s7V8Vnq8gJSbzmxdzgUzhhvJwCT3yxYPLqhvw88imkB3T6eP0KbaeE1A8
 IKtUvoM7nBJAsbDR/v8WJ+e/Ot0SlBeyRnDk5pYu+80UkgjslDBiYSZKJKYVnTUgxeK06TGmJutkA
 s0SSvT4cE8QEcCt372BNKi2Xyitsi9tOVBn9ZK5dBwQRG2LSEZPJcrokJX4eGpUlvtSW/Jw5Ve4fk
 OkwTMdYr5wUw+cxsLOAJvaFO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pdyZP-004Elp-5i; Sun, 19 Mar 2023 19:19:55 +0000
Date: Sun, 19 Mar 2023 12:19:52 -0700
To: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Subject: Re: mit-krb5 and heimdal binaries
Message-ID: <ZBdgWLxO/f0nts7I@jeremy-acer>
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <31194bd0-05a5-9549-5b6c-ef37bd5d5c17@samba.org>
 <ZBbC2rDQ5eMwkBVO@pinega.vda.li>
 <fc2818e4-cf75-1252-4d8d-8965ab2e6039@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fc2818e4-cf75-1252-4d8d-8965ab2e6039@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Mar 19, 2023 at 08:56:52AM +0000, Rowland Penny via samba-technical wrote:
>
>Alexander, as I said, I do not have an axe to grind in this, if Samba 
>decides to move to MIT, then so be it. You however, do have  an axe to 
>grind, you work for red-hat, who are on record as saying that there 
>will never be an AD DC on RHEL. Are you now saying that, if Samba 
>moves to MIT, there will be ?

These are not productive comments. Please don't attack Alexander
or other Red Hat engineers who are working on Samba.

It's also not reasonable to try and force Alexander or any other
Red Hat engineer to make "official" policy statements on behalf
of Red Hat that they're simply not allowed to make. That would
be very damaging to their career, and isn't the way the corporate
Open Source world works.

Please step back and try to be kinder to your fellow engineers,
and always assume good faith from your Team mates, as they do
to you.

Jeremy.


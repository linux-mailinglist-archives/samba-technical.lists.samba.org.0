Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0176C6BE3FC
	for <lists+samba-technical@lfdr.de>; Fri, 17 Mar 2023 09:40:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cD5u72BqdIiPitanrTeKluMNzcrvKYAYVdmOM5ZWEbc=; b=ZGDRZsG+4CyS/73LSBmPS0FWz6
	nKZD1YKkLv7dbiZIkAmKFXabDtxIJWS9CkHN7ONHPJipg7WRhpikeOwRvb6JT/lfvewXAMM4zyXo5
	hCe5ez/hpCmjMqCaGcVAley9tWAKQenCoOXFPCWza2vYc97L63Iu+oSDvjwjWkdTqCrs55SRwaTUl
	aXJoGHZdj3zkdmKg+hlTzYJBi0OAkQFmc5pT1eKnL776dRxDrlvkdskQQcvMKuWVDBbCEtfBLPm6i
	WYDQX8+57M1/H4/1TDfo3fZFfD3BnA7mDQnA365g/4pb+2ftqwezphY89EktgN9FWE8EegXVREJGS
	fYB6BLyA==;
Received: from ip6-localhost ([::1]:50918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pd5cd-002wnI-Sg; Fri, 17 Mar 2023 08:39:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20358) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pd5cX-002wn9-F7
 for samba-technical@lists.samba.org; Fri, 17 Mar 2023 08:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=cD5u72BqdIiPitanrTeKluMNzcrvKYAYVdmOM5ZWEbc=; b=QrbqikJsL0rcHZK/031LgycIGT
 +EbtgF7HRJyhTOXPHW5RUsDl2uJe3ajxafSK8P0b/WBbD7zTUKizLkH/bBx6vGKtP5RRXzHdJA5tv
 YawsGJ6WqqVa7BhIUDIf8ur2Og+ohg6hauhenSzwxKmssgLbqIiTmw/cq9QmPmOKD7Jqx4Fq+RDRG
 6QlUI5n79XgFZKKWu6qau5I53/eKonbjCa6ZcpbxFIoysR6bgcP475M08mMo8ZV7MlKXzUrpOOB91
 iuMae6dRwo58EGPXWmwMFo604coS4NAD92w6rV3fcdPhyqvJSWBBpMs5vI7wgACAUgq2drjaDfPdZ
 hqy/wpOoCX0igD/UXpNDDRxe6xePKHVuO2aatb7NJt4GwMYRKFdgEjAEjMFtUU0IhMPiqHTicq6uw
 i6xVP/zsXN6RuL+azxao5cW/zxei3f5EDw+yo0+aKoY5+URtVP6oYjZ+XwfwFcj2hIB7pwK+VABMY
 haTIhU58L7wIwC4bcdq9acOA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pd5cW-003ng7-32; Fri, 17 Mar 2023 08:39:28 +0000
To: Pavel =?ISO-8859-1?Q?Filipensk=FD?= <pfilipensky@samba.org>,
 samba-technical@lists.samba.org
Subject: Re: Nesting of local groups (SID_NAME_ALIAS)
Date: Fri, 17 Mar 2023 09:39:27 +0100
Message-ID: <2877278.e9J7NaK4W3@magrathea>
In-Reply-To: <88ecdb4e-ed80-889a-dafc-b939ee0cf181@samba.org>
References: <c730b289-ff34-aef0-be61-ebd5973ccb03@samba.org>
 <88ecdb4e-ed80-889a-dafc-b939ee0cf181@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 16 March 2023 20:34:15 CET Stefan Metzmacher via samba-technical 
wrote:
> Hi Pavel,
> 
> > windbind does not correctly display members for e.g. BUILTIN/users. It
> > shows nothing:
> > 
> > ./bin/wbinfo --group-info BUILTIN/users
> 
> > BUILTIN/users:x:100001:
> This is good as default and should remain being the default,
> as "winbind expand groups = 0" is the default.
> 
> Maybe "winbind nested groups = yes" is also relevant here, but I'm not sure.
> > Given that "BUILTIN\Users" has 1 member "ADDOMAIN\Domain Users", it should
> > instead show:
> > 
> > ./bin/wbinfo --group-info "ADDOMAIN/domain users"
> > ADDOMAIN/domain
> > users:x:100006:ADDOMAIN/joe,ADDOMAIN/jane,ADDOMAIN/samba2008r2$,ADDOMAIN/
> > samba2003$,ADDOMAIN/administrator,ADDOMAIN/krbtgt,ADDOMAIN/testallowed
> > account,ADDOMAIN/testupnspn,ADDOMAIN/testdenied,ADDOMAIN/alice,ADDOMAIN/s
> > rv_account,ADDOMAIN/bob
> Is this really required? in a huge domain this will likely never finish. and
> it's also imposible to get right, as members might be located in a
> different domain/forest.
> 
> So I'm not sure how useful this is.

Only your own domain is added here, I'm not sure if windows even allows adding 
more. And yes, it should be turned off with 'winbind expand groups = 0'.

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




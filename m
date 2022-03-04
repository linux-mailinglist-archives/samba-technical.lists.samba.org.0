Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E616B4CDD54
	for <lists+samba-technical@lfdr.de>; Fri,  4 Mar 2022 20:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=FFCRIhdyMggGxggFpWXznCTlYuGztYmEHjwu93O0lk4=; b=LrvggE9qszaEAAvsCNom0TFph6
	s2i70PdoMZFzpgcqidIPgpZCz/KVJcoSLghJ3pkQ/JNumPw6902KPoTr2tVCAv8/E/8fzIlJsHdwn
	rI64Xpcom15PG2koz75qNm5YIZ0TfNnBdN2JlyGXB7jHLr9vJHvmCzMz6ba7A98A1xYFQexezH/Q+
	cjaZkMxRUBsRLT42AcwVLi+YU5mE/egsk2l6XltS2plC+/4lav+a+/ItlR8FdFAXEKenDpk6aRSXc
	EWBx+tEeP557Vf8DmCKp4MOGAFN08w5EtXNgwJam7RS5DDhxj2AxEmCG+08HBV1Vr6FYjTiXMlH99
	rGSgz6HQ==;
Received: from ip6-localhost ([::1]:44216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQDcA-00Fv94-9I; Fri, 04 Mar 2022 19:29:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49428) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nQDc5-00Fv8u-Nr
 for samba-technical@lists.samba.org; Fri, 04 Mar 2022 19:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=FFCRIhdyMggGxggFpWXznCTlYuGztYmEHjwu93O0lk4=; b=XqWv0ODi64Urc5iUdjZvhaiuoW
 kGNkylXlw0/nCD5Tnb21FBxXLfNZCco8v9eECbe4tykuv3DrqOlcT52gaN4ZVh4BKIwLLYjjxRYjM
 3tEEDhqOOA6HEpoVhqRaim1caSl6TF//Y4tURTQQaAQa35mx9t1shQiZ1OngHTcAWqfyaw7O+HQT0
 4ZeBG6bQGg6J+tp3MmEBXXZke509pmCs4oM2RXIP6YbvxIlMlgtvbrqDy9dOKQA7e36jWs6WXQKUc
 jH5tpWGuIfxJL74JX8wi6fLmROt9HpdagVggFBNsZndBzGwk6GR+V56B6Xr1BnSdAdypEmHfeq0sw
 tw8ZM9JTh9c75PjAMSEBjrYfNg3/gORVZ0DdA1nfsQocYX3pE9iRrssulaImfjGaGERd4eLbeNx22
 7RhC8DYF3DNDuoJL6yxiVugGU03IE1OOKQwQq1C0kPXNMTg45D/35hiE7W4GRQx0t2A8wtiKEHbI6
 OmwYMpnUHNIBgFkOBwTr52NL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nQDc4-006jdl-Mm; Fri, 04 Mar 2022 19:29:17 +0000
Date: Fri, 4 Mar 2022 11:29:14 -0800
To: Tim Rice <tim@multitalents.net>
Subject: Re: issues with 4.10.16 UnixWare port
Message-ID: <YiJoiir6B1brZBvm@jeremy-acer>
References: <alpine.UW2.2.11.2203040933550.4550@server01.int.multitalents.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <alpine.UW2.2.11.2203040933550.4550@server01.int.multitalents.net>
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

On Fri, Mar 04, 2022 at 10:04:53AM -0800, Tim Rice via samba-technical wrote:
>
>I am attempting to do some initial tests on my UnixWare port
>of samba-4.10.16. (4.15.3 required symlinkat, readlinkat, etc. UW
>does not have)

Just an FYI. Without the XXXXat() system calls Samba
will never be safe against symlink attacks on this
platform (neither will any other user-space code,
so I don't feel particulary picked on here :-).

Please explain this to any users of your port,
so they only expose files over SMB2+ (which renders
them safe vs. SMB symlink attacks, but not local
ones).


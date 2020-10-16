Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7B290CCB
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 22:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VXX0eZNgp+rW8hV361dvbb3zrSI79QUGKI/DD3PS6aU=; b=z9m44yflmojqM0DoXkBuvy/J0D
	iFt2uEUabCdP/wnPFoIoC65lRDqyEZLevVWuWyTnxQC2bnHnCmcXKpovK2CtV50hMqLGyjuDSVejf
	+kysoZA3nhOK3UcA8zEnQsjrRoRbJB8C6cgeyrdIJmNCDRIWVxSIjajVofXM5jnYOKaV/ahHV2MNg
	mOGgya6mSb4bWnn7TDqWX7w++uE4YkEcfWFf56Ea/Vf1uTfvIEcLmqDLGa7PKWZDDOo9rLX8p224O
	vkR8SuWwBCWbJB6LieHggUE5cgDCLKZwbHjAmB+7aaw/GINGHw5uGiCJjRNYjCOmpOX+AAMxVthaL
	JIc7n5Vg==;
Received: from ip6-localhost ([::1]:19822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTWTX-00CSrj-2m; Fri, 16 Oct 2020 20:37:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTWTR-00CSrb-F1
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 20:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=VXX0eZNgp+rW8hV361dvbb3zrSI79QUGKI/DD3PS6aU=; b=N/OrAN+jb+VYzqIF4gL7VrJJDx
 u9O8wrnntuavP3iJ/ZW7o3UpR3igDeAZyJVK2YvE0AuqnawY6Je5C6rrpW8DWw6S5hZ8L0UU2VOOP
 k45lLBKcJDCd4YeDofOPfzKfRqSiiuAf27+MezjRKzqikvnnJrPZ+clMuFzg4O9Y6JMln61OCwfWt
 enI7N6wqYmgUpp7LAtsty1oBjnYe1fWBAnGRkOMtJm1h1A1/8dqY3wgnleHalShvOIYlqJWaDqUHn
 B9xeQf2kDvkD5v935FmLyTdjbWCVf2fwd9DR9xuLgYgNoW5p/Y+ONiR4YdPZFiI6ZMontEEF2zOw9
 a2ojVcPg7BZpKgaoGkKWl2SlCdesWdxotPGJttJmE3XgBZuoD+qY7oMr3UhPCrQPRF8PIty+E4TCl
 ixHx/ZkN6JCQUewS7YN+zOd1fHAF9eaFsXgsQjy/iusb2tw3iSHF31lse9S9/grik8BT57aB3e4TK
 84ieMV868irKB6x6fwrrxrYT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTWTP-0006Sh-0Q; Fri, 16 Oct 2020 20:37:11 +0000
Message-ID: <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
Subject: Re: dns.keytab file
To: Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
Date: Sat, 17 Oct 2020 09:37:04 +1300
In-Reply-To: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
References: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-10-16 at 21:42 +0200, Stefan Kania via samba-technical
wrote:
> Hello,
> 
> is there a reason why there is no /var/lib/samba/bind-dns/dns.keytab
> on
> any other then the first DC in a domain? The first DC has two
> dns.keytab
> files (/var/lib/samba/private/dns.keytab) and
> (/var/lib/samba/bind-dns/dns.keytab). All the following DCs have only
> the on in /var/lib/samba/private, also the file-permissions for the
> bind9 are wrong on any other then the first DC. Up to this point I
> copied the file and changed the permission manually, but now I try to
> setup all DC via Ansible and I have to create more tasks depending if
> it's the first or second ... DC.
> 
> So is it a bug or a feature

I just saw this with a customer yesterday.

Bug.  Clearly the first and subsequent DCs should be as similar as
possible.  

It seems the move to bind-dns was not complete.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





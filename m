Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F471FBE55
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 20:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=dOT2eHtbsnMWjPPo0yEigcFhtYMKjBjbHkOTcHo8Tts=; b=bARKz4hsL9XA+tSSFMA07Ztuyn
	2GcvWKKHa36wZaxpouJiCqduCpMhCjenQZ+T3uPIW7GiKLz+8B50XrZjg6DYD9ygxIHfaL50gmZaa
	5KYi6FDHa7d58iQxGcSpAQOIwfFQe2RARRnhZQVfejJ6uoX612l1ioudxJNLppQGQIjTIqJfujW4V
	Lck5DV+3Sumh/+AE6+PgfeKV2A5AL8TPYP5bj+kppSjIqCuCUuej1vJO7uebOm0cLJ6MklWs1xqTJ
	cywWD5Uvw2RF7HRCTXw5Vn9IUmwJ2VU7OySe8FE36Ae8WtEavSHy4kWG8k4DLQ3fCJN08OI+YcwFi
	T5guWmWQ==;
Received: from localhost ([::1]:18732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlGXx-000kQU-PI; Tue, 16 Jun 2020 18:42:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43438) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlGXr-000kQN-GO
 for samba-technical@lists.samba.org; Tue, 16 Jun 2020 18:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=dOT2eHtbsnMWjPPo0yEigcFhtYMKjBjbHkOTcHo8Tts=; b=ufFRl1DhBv1pj2IObsOuByr/Kv
 Cm1nFIElGpNUodU18kNH2nyD6diHAdJec7dlKrTbztUG0WIpP1/2PSnxhcfOS0seo1KF+12JUmyzB
 ozhac5B/I4/zJIYUKQtZo5C+opvvFWM/jHYIBB9ws+M1Oxpf8yhycinJ0RYKJ8IGnAEIZ90VQohQS
 PTv5BDLlgUaRRHFlV+w6BjwEDb3Cwj1hOTxVWROcQ4lu+f/CbJ8qm0oe1X9UME8h9yLS6uFeYDtxd
 1qI9Lw6vtRFaNHTea82Y4Hb/xsxB1OWwC+tRkYWAvu82wvSU//YIagc3eXkUvzTHIspPDaubNG6S4
 7GfAOjb0Oc5Nuaa8smGTmHQNQqSIdPLshx+GUadt3UOKmCNyA7o7XTXC1UN7mFuB1B6SaT58B1jbT
 JmjXRFP0MqGC5OivnzBwwXCNlf++bVtbsRc68EXR5IyFPv+0xyCuNIpddc+VX4KZDy55/JJVTDQoL
 uuiiGlr9hqNQ0rMLmYWm2Ycs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlGXp-0001Ak-Pw; Tue, 16 Jun 2020 18:42:49 +0000
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
To: Jeremy Allison <jra@samba.org>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
 <20200616082636.GD3036357@onega.vda.li>
 <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
 <20200616095350.GE3036357@onega.vda.li> <20200616172929.GD11432@jeremy-acer>
Message-ID: <44df6f8d-fb66-4bba-3722-860c61946918@samba.org>
Date: Tue, 16 Jun 2020 21:42:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616172929.GD11432@jeremy-acer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: Alexander Bokovoy <ab@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/16/20 8:29 PM, Jeremy Allison via samba-technical wrote:

> Well that's good to know. But if Synology and QNAP need
> this also, then if would be good to hear from them directly
> on what their usage requirements are.
> 
> Cheers,
> 
> 	Jeremy.
> 

Maybe there are file-server installations hooked to LDAP directories (in
non-Windows orgs - universities and such or Windows-dislking enterprises
 - one name comes to mind).

Kind of reminds me of our attempt to remove the "list all users"
functionality from winbindd because it's fundamentally, ah, imperfect,
in more than one respect - turned out it was perfect for some users who
depended on it. Deprecation is nicer than immediate removal but at the
end of the day, if there's no alternative, the user ends up in the same
place.

Thanks,
Uri.


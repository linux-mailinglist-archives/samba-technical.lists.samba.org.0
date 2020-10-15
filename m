Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85228F9C7
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=vdk9naCaz5A81jsNKoQ0FOLWbhrIQ6Jghm6lFKv2vkA=; b=YnLK9BYOSFn7O2lMV04dXpqrQr
	2TlafQX2GxwfG0QtwuZBiGm9AsBOCdGhaCGcp8GJrrbfnhvVxLebSDSesqPpYq/FfHYzXrkrjMnRz
	S/dJM2u4NhZnWgMn5iPg9cWZwrBOg0lPQXerH5bIB0jmzsjffRs8WreXaNvFysQtfXhcCJz4BMHNh
	wCCbOT4V30PRS4gQ+/apgyB10vND19gAmPai53tw5knw+0wjZpqFa6vvYEEoEBh2XjIHwhuHvqzQe
	Pjnkdvb2JuadfENmfSjMo5O9fM8b9XmA2ZkLtbvARrP6ttJO8i8L/sfUYol8Zn6UYAcehVweqxtBs
	Id8bnrJA==;
Received: from ip6-localhost ([::1]:18482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT9Lj-00CK7P-Tv; Thu, 15 Oct 2020 19:55:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57866) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9Le-00CK7I-DJ
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=vdk9naCaz5A81jsNKoQ0FOLWbhrIQ6Jghm6lFKv2vkA=; b=Bgz4r7R0wFd+kznIjtM4HSCpZH
 P11BtTYBhZ+xjoED7ofzquvebkmguWN6nItTfy/ehyYFpJtKk0vVtSa/74S8YBrhU/nTvHv79HaM9
 KDQVeL0xCE0+hB1glZSmv5Lc6KN3TPts1V+xqWbcuHlRqGyKt9WapB9M9WqCiU41XPmfz1QDlQS2V
 kFyX3/9VBZJ9jFPLMnGhWQ3fC5T9MBSe/xq3U/KNsindH9OfuhzzepgYNAPoJL5KSX/0/ngfKfzFp
 reBen48Sw+sZPSCJ9s43V1vDTN75XvDu2KDJUXkFv0fQ1Mkp4wWZSYYdSkwRWAElzLAfxzHV4z/lk
 y77bi5PfMHRlARnyGQ6+h047oo+0aoa5E5wYf9ASteyM582x7xj3B52YbiceBJy4gtlli+I2XJUc9
 vFRJZpquce2Qq5JOSoaVQ9EDeShBYqeMx+xWxhqLfFOwUCrpbyH75I1L4Wrlia32drXMWYNf/x5Kj
 oCPhmDRMJbUCAtyJFWcoNtD1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9Ld-0003x0-5y; Thu, 15 Oct 2020 19:55:37 +0000
Date: Thu, 15 Oct 2020 12:55:34 -0700
To: Simo Sorce <idra@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201015195534.GM3840862@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
 <20201015192330.GI3840862@jeremy-acer>
 <09b466404b11983f992ac2f89c369b33d3a1a135.camel@samba.org>
 <20201015193751.GJ3840862@jeremy-acer>
 <d6681d5c508524dd97b093f332e8cea818cf1a3c.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6681d5c508524dd97b093f332e8cea818cf1a3c.camel@samba.org>
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

On Thu, Oct 15, 2020 at 03:45:22PM -0400, Simo Sorce via samba-technical wrote:
> 
> > Personally I think we should just add the CC-By-SA
> > attribution and be done with it.
> 
> I'll let you argue with our counsel on that :-)

Fair enough - we should always do "What The Lawyers Say" (tm) :-).

I don't want to change the text though, just the name
if we have to.

How about:

Samba Developer's Declaration of Origin

"Declaration of Origin" is IMHO more descriptive
of what the person is doing, as they're just
providing a declaration here.

Thoughts ?


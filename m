Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567B28F9AB
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:45:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Cc:Subject:to;
	bh=yfrH251u5qw3QGMGgf+NZj3qWSblmypAerigqXV5+M4=; b=1DmPDNa3ilsZQKMmMnGhBWiI9e
	TYysiEdav55rF8FQtjvr82XMbnFoIb7utbE0kjKeJLysseUKl33CZSghlb5ildPjM9sZk1EvW9qFC
	pJK2PZyaKEAmYfsop9UCZd+6Jvkp2tVTlfxOCVtTS8TunGfPfIviyioJtk1fd2j8WpHBmLYYvnPah
	qnoYmV14IY0Lv6TE/RWd/uK0Dopl3WaZMyWa0C5TM3SxAFIjspkMrIQKcTmuxT+9ckTuE/pHJF3jK
	shT6Ia0EcSYRWCW+8BVvQqcuPEn5N/Jr4AOgbKtjmsWecPVAhSIf411hco0F3QS/Zyf1f7ju3zC8J
	Y6rpX4Bg==;
Received: from ip6-localhost ([::1]:64918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT9CF-00CJxu-BI; Thu, 15 Oct 2020 19:45:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55118) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9C8-00CJwj-Hq
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=yfrH251u5qw3QGMGgf+NZj3qWSblmypAerigqXV5+M4=; b=1YZyd+35HT4IKWca7RXy6cEQYe
 9qGqxfWeXmJxKjYreCXzC3berEyDU2+YG0jcjHhj3e/jpaC0g9vAXuiSeteV3ljOaBgFfv8UzdfWS
 saW1OANn0BF/0xZYvIeytjSCpi4ctsv3Vnucj9Jzudb/yy5BKlvXcvvdMLuwEGK+q47rjyx+5FvKB
 O0+u+aQAOOHjq2GCwdbNPEPUZyFNefR2exbxI/HWMFmuCINuAqJPJasck56NYY4UwiKS8Fn6RxDOq
 jMhfoy8/9lO/p9Z0XwR5zhm4mlwVNQK/dmWveSMluCjIKFvTvackB6Ho5NqMiA2FUlP0QhPEXaYtR
 /FiDrdW6K6fCgM9Plwntf6n7i/g3olg+u9PIC/Zw6787Xg2tgACZc0hHKSpabGxZeTRhxzaYv9Gn0
 8zQOgAa8uQHakmx8Wkt1pnFprQbNRx0Ezof8yVcvkeDWUsle1ulspjykP3uVg9PHw7Y7CBTV/d9R/
 7wa4aAbmEdwmeVC9a8uUbz5Y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9C8-0003sR-5T
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:45:48 +0000
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Cc: samba-technical@lists.samba.org
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
 <f488fa4d-4b8f-3323-ec1b-d3cf54819fac@samba.org>
 <20201015193048.GA61199@ebb.org>
Message-ID: <9832dbee-bb11-175a-df04-adadff338fa6@samba.org>
Date: Thu, 15 Oct 2020 20:45:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201015193048.GA61199@ebb.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/10/2020 20:30, Bradley M. Kuhn wrote:
> Rowland penny via samba-technical wrote:
>>> https://web.archive.org/web/20060524185355/http://www.osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.htm
>> I will accept your non working link
> I *think* you have to hit archive.org links for non-HTTPS archives with their
> version of non-HTTPS as well.  This link *does* work but takes a bit to load
> (presumably while archive.org figures out why you're hitting an http://
> link):
>    http://web.archive.org/web/20070306195036/http://osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.html
>
> That clearly states the the copyrights in question are all licensed CC-BY-SA.
> As discussed elsewhere in this thread, some changes are needed for proper
> compliance with that copyright license, and why I just separated these
> changes out into a different merge request:
>
> https://gitlab.com/bkuhn/samba/-/commit/8f0c8ee5fd6a91dc113e876dd98e29c1b3549c00
> https://gitlab.com/samba-team/samba/-/merge_requests/1610
>
> That fully fixes the problem of copyright license compliance with regard to
> the text; the name change is a different issue of course that still seems to
> need more discussion.
>
>> and raise you a working one: [OTHER_LINK]
> The other link that you provided really is moot; Samba did *not* base its DCO
> off of the contents of that other link.  Indeed, Samba's DCO was already published
> before that new link even existed.  (i.e., The copyrighted text of the DCO was
> changed from a Free license to a proprietary one after Samba's DCO was published,
> but that wouldn't matter any way, as CC-BY-SA, like all copyleft licenses, is
> irrevocable.  IANAL and TINLA.)
> --
> Bradley M. Kuhn - he/him
> Policy Fellow & Hacker-in-Residence at Software Freedom Conservancy
> ========================================================================
> Become a Conservancy Supporter today: https://sfconservancy.org/supporter

I am not saying that we shouldn't fix the compliance problems, of course 
we should, I am just objecting to changing the name for, what I can see, 
no good reason. I do not know who came up with the name in the first 
place, but whether they like it or not, it now appears to be the 
standard name for such things.

I also find it funny that we are arguing about the name for an 
opensource document, I thought the whole idea behind opensource was that 
you could use opensource code in any way you liked, as long as you 
didn't claim ownership and published your code, or did I miss something ?

Rowland



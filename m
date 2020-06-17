Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE961FD60C
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jun 2020 22:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=JEGlDK+X0IHisf+RO0xk7QxEU9hZaWn8yqr16K+OqQg=; b=sMjr7hXKAhBI4m2szqdqRvUxSm
	Bvs6InjYnVrCkCrYroEQfyQCGkU6PN6kPlTUSHAcCpyaXEuYQwZl3bBAxbPlpt2LfhQNm0H5TJvmL
	vdcUYFukW4TZywEQXDAQThtxQwJgjoMXRwmk/jY0YQf6iS1R9Zsed042su8yz8vstrzmlDslWbl1u
	+RXlsDxrayotU/Cb83d0rX3ouudfkae3WKi4+sKZIH+Wf/Am/dT+DivBeJKgWgsJDb07EkoftSurd
	Qpmi24GavQAZ4CNreRZS6K8SFKwnkw6yaoZOyWtbzHTaSSyrMHibzS+rctg0z1qbzBzd2T26YXBkn
	70YCeJYw==;
Received: from localhost ([::1]:65328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlefO-0014HI-2S; Wed, 17 Jun 2020 20:28:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlefH-0014HB-Pg
 for samba-technical@lists.samba.org; Wed, 17 Jun 2020 20:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=JEGlDK+X0IHisf+RO0xk7QxEU9hZaWn8yqr16K+OqQg=; b=Zs7AJonpu3imfG+yziJFF/L8EV
 Kt0kNJBiB1hOhiawxY5B+s1tSTwbpZp9RQzEgVZS7w7AlVB1lTG3LKN0CBRly8MwSBjAhrNMpxrJj
 vLxZCRUDct9dTEuJoRrxLPS7CZLTHiNMWoNeyA14NDtWam1bunxs9d1USYilWrg6BWrZQ4N4ylxmr
 HmzC8yztlV9ZFZ2bjXvLr+7QOTCBsNuGRLpoLyXwZ7vla4+qeBQfQnJLd08Cjv5Ow/KSx6iyNq+eA
 ZsRj6g+HwlpCo14skc/Di2jk4a3kXBSYRwl/j+DItlZmBvHDpQWlvz6G6ZFS1ypOw3o4Pizab0MdU
 uiUmW12MQpNeP0o9PmSrsNP4WByIMLln7LQIRzgei1ut1estRT4eQVcJeqGDs+k4dHUeAvLq5uq4F
 83IW/sHkZtp06MmthDSYNMLTpTDkh8ln3lHOo85jINYuRUppmos9z5Va+pksIF5o5gmhh1M74hUXa
 lQLxq+8Riquw562D7ijiST7I;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlefG-0007Ng-9d; Wed, 17 Jun 2020 20:28:06 +0000
Date: Wed, 17 Jun 2020 13:28:00 -0700
To: Alexander Bokovoy <ab@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
Message-ID: <20200617202800.GI3710@jeremy-acer>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
 <20200616082636.GD3036357@onega.vda.li>
 <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
 <20200616095350.GE3036357@onega.vda.li>
 <20200616172929.GD11432@jeremy-acer>
 <20200617053530.GF3036357@onega.vda.li>
 <20200617171931.GE3710@jeremy-acer>
 <20200617192336.GJ3036357@onega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617192336.GJ3036357@onega.vda.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 17, 2020 at 10:23:36PM +0300, Alexander Bokovoy wrote:
> 
> I demonstrated it in my first response in the thread already, full with
> a gdb session output showing the stacktrace and where the problem is. I
> didn't file a bug, though, due to a lot of activity at the $DAYJOB.

https://bugzilla.samba.org/show_bug.cgi?id=14413

Thanks Alexander !


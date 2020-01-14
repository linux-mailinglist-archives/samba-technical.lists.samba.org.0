Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 872BA13B448
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 22:28:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=OqGbyXC4wPZV9NvzwEwxAZ3M8jkfsQKC9sXrKCG36xg=; b=FCo9rsX2USXZCI3Wn14LaWk9Hi
	oQMZTuJEEwC5i0Ji9fmdacHNO2fTFZAbG+tjHdcJwivkGMtF6P7CEvtDp/J4gMb7Ntlwb5GBjvpLG
	OV+kyZjdBXPFVyXOpmU4lexdNMfahOeDls2U94ghUZNvmqEwpy3jyFPfSKwXyxj6T3MsuMsrZLp9s
	SQLx4IB8fis9z+NlMDuo1BRWq+VxcuW5zRnFIY5O6FXicdr7IuMT9Nd9+Ikmwj6gDpT03Wbq40WpD
	yf77RkPJN3/oolc7ZtK1/UGHUT9YfDXsBczuqmqENdeeLloG0nCRRp0qxmOQJGx5ZiGUiYXCHuhQt
	LtYN4T/A==;
Received: from localhost ([::1]:64612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irTjz-003Rbq-Ni; Tue, 14 Jan 2020 21:28:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56028) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irTjs-003Rbf-W4; Tue, 14 Jan 2020 21:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=OqGbyXC4wPZV9NvzwEwxAZ3M8jkfsQKC9sXrKCG36xg=; b=0ByOdyK5T8xApO/RTPnig/yDx8
 KonZKB5YJhgGoeRwPJPPotwTuo1U2ZQ1AcbVo2hAOp2Dy66K/gcfjSFUt0JHMUxBwz07boeJYY/H7
 7BPQ6HJyC3YeKaIYq1xgDGPwueD8qGl3ZFQaA+QcMCMTdn6j+TnCVAVPhvuda8MvQZgHT43KPUgcq
 sP1Vq/6S/cvVIFVvNCdV15XnFa0GsbLznfkFdvEPIBktPUdsn0Pf/gqNL+ti/ZAe53RO/fySqAfPO
 gz4o7msc5PWiP5Kqok55l5Q9vS6TLCCshElC5Kjvg7iK3XbUd3GAHhTCy8j6jEeGNzYj9KsmdIKoc
 9/FiDg7BbR0+GQeoTtrTKw3zMtiLIIuFfPzNe4Fvn8yxjhjvhg/ugC/qosBeICZHsphse4J/vQq0V
 WPvGnNGsdyZT9q5fM3D5G28jwuXuip5anA0+KptONBVzZ9PD17Ny4qA/kxW1rw7LEElkqxTScsvpC
 pQBZr1MHxtz+ipxEsyv2Ux5R;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irTjr-0006fu-Ma; Tue, 14 Jan 2020 21:28:40 +0000
Date: Tue, 14 Jan 2020 13:28:36 -0800
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Samba at linux.conf.au 2020:  Why are we still in the 1980s for
 authentication?
Message-ID: <20200114212836.GC217935@jra4>
References: <6467e06e362311231f9bf51490f1439c9f0b5ebb.camel@samba.org>
 <20200114203458.GA217935@jra4>
 <522f151ee69bccc69cd7d609e1d34b70fc5de9b3.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <522f151ee69bccc69cd7d609e1d34b70fc5de9b3.camel@samba.org>
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 15, 2020 at 07:20:54AM +1000, Andrew Bartlett wrote:
> On Tue, 2020-01-14 at 12:34 -0800, Jeremy Allison wrote:
> > On Tue, Jan 14, 2020 at 08:56:27PM +1000, Andrew Bartlett via samba-technical wrote:
> > > My presentation video at linux.conf.au is now available:
> > > 
> > > https://www.youtube.com/watch?v=D5hl0fqA0Bc
> > > 
> > > https://sysadmin.miniconf.org/presentations20.html#140
> > > 
> > > https://sysadmin.miniconf.org/2020/lca2020-andrew_bartlett-samba_2020_why_are_we_still_in_the_1980s_for_auth.pdf
> > > 
> > > https://twitter.com/NextDayVideo/status/1216938358779203584
> > 
> > Great talk Andrew ! Congratulations, and well done !
> > 
> Thanks Jeremy!
> 
> BTW, for those in the Samba community at linux.conf.au please so find
> me for a chat.  I love talking to Samba users in person.  I brought a
> weeks's supply of Red Catalyst and blue 'Canberra' Hawaiian shirts so I
> should be easy to find.

OK, I did see you in the Red Catalyst shirt in the youtube video
of the talk, but I need to see pictures of you in a 'Canberra' Hawaiian shirt :-) :-).

Somehow I can't imagine that :-).

> Finally, I did finish that talk with a plug for the Software Freedom
> Conservancy.  If you can support the organisation that provides Samba a
> solid legal home, then please join me in doing so: 
> https://sfconservancy.org/supporter/

Thanks for the Conservancy plug. Support always welcome !


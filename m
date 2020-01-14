Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D713B3B8
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 21:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WMYBxhyQD6tcUffkbq6VKPPmtisRh+iZjXbDIGAhSgo=; b=hPHX+JRKkph2dT/XNgmCS0fXOM
	vNvm6LiASMQ1hZt7AYkvXure1wQB2ZCIbmol6q2tlIFwICzYblwLtpbof/z71Pg7uzClCAh2gRgla
	jfFr0CtM5iyVxnTxBPGd2Slx8E8dUQz6ecyEz4e7aFEpteAtKtKtNLXWIYMhrlnVp0Hi6zJcIbM8x
	MfcjpHQEVSxVSjAmHRPDzwwbmx5fgFFZ2g9VAQtytqPAegznQnCWOslKZmLaqStZaoJU/9jfRXsDz
	O4JRtNU1KVsj/qnfEJkpAHO1NMPCiWJXXruNnRh76SJceIUP57CVo01o16t7FubVkr928rFW9o9AD
	OGzcz0RA==;
Received: from localhost ([::1]:58156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irSu4-003Qge-Lx; Tue, 14 Jan 2020 20:35:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41508) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irStz-003QgT-9i; Tue, 14 Jan 2020 20:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=WMYBxhyQD6tcUffkbq6VKPPmtisRh+iZjXbDIGAhSgo=; b=U8/jmp/Z6UW5fCRUlU9G/HqhMS
 lDT/735a4Kn1mhRMB1EaXQSI0IM2Oqx/vSFa4LD39p2RvKzxHyNOS5ObITCaWrQkl7ZZu1ROQClFw
 /QKeyRtOhdzB+17VBscsKqWTXblAVKxdkbFzVb+nidGVaoJahqfKKIIKRcN/i2XcXh7TuOP7fVgb8
 zwt1XHnQzcnXP6+cvMhzvaCTPdLrZyVJFXvmaRNi3r6eeSZcrJqSCJoLlds5OuADoti9v+TQCSPEY
 x3NSO0mnbpigrjVxreINKxFB3WimcuKuU4QwytvNdS/Iu47+R6ge6e4OIHUz+TSrzKpETLdRSXj3K
 WXVVjjJzP4SBV+6BNR+Eag/X4n73NXKfZLyNS4Dfc5oVKasVjNNHlALXct3WtIZzKpUNt+gP4V0Vf
 izEBmvBQ/heuDic9osT1UkITaplIraHVLZtUGigomJGeZ931uIzGrm3tWd4zdIN4O64XWaR47AnJ5
 tGFnXwz954/BHYIoDn2SFKpO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irStx-00069i-Vg; Tue, 14 Jan 2020 20:35:02 +0000
Date: Tue, 14 Jan 2020 12:34:58 -0800
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Samba at linux.conf.au 2020:  Why are we still in the 1980s for
 authentication?
Message-ID: <20200114203458.GA217935@jra4>
References: <6467e06e362311231f9bf51490f1439c9f0b5ebb.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6467e06e362311231f9bf51490f1439c9f0b5ebb.camel@samba.org>
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

On Tue, Jan 14, 2020 at 08:56:27PM +1000, Andrew Bartlett via samba-technical wrote:
> My presentation video at linux.conf.au is now available:
> 
> https://www.youtube.com/watch?v=D5hl0fqA0Bc
> 
> https://sysadmin.miniconf.org/presentations20.html#140
> 
> https://sysadmin.miniconf.org/2020/lca2020-andrew_bartlett-samba_2020_why_are_we_still_in_the_1980s_for_auth.pdf
> 
> https://twitter.com/NextDayVideo/status/1216938358779203584

Great talk Andrew ! Congratulations, and well done !

Jeremy.

